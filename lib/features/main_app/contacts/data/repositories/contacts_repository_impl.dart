import 'dart:convert';
import 'dart:isolate';

import 'package:contacts/core/database/database_service.dart';
import 'package:contacts/core/database/schema/contacts_schema.dart';
import 'package:contacts/core/image_storage/image_storage_service.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/duplicate_cache_datasource.dart';
import 'package:contacts/features/main_app/contacts/data/mappers/duplicate_cache_mapper.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/duplicate_thresholds.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:contacts/features/main_app/contacts/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final DatabaseService _database;
  final ImageStorageService _imageStorage;

  ContactsRepositoryImpl({
    required DatabaseService database,
    required ImageStorageService imageStorage,
  })  : _database = database,
        _imageStorage = imageStorage,
        _duplicateCacheDataSource = DuplicateCacheDataSource(database);

  final DuplicateCacheDataSource _duplicateCacheDataSource;
  final DuplicateCacheMapper _duplicateCacheMapper = const DuplicateCacheMapper();

  @override
  Future<List<Contact>> getAll() async {
    final rows = await _database.getAllContacts();
    return rows.map(_rowToContact).toList();
  }

  @override
  Future<Contact?> getById(String id) async {
    final row = await _database.getContactById(id);
    if (row == null) return null;
    return _rowToContact(row);
  }

  @override
  Future<void> save(Contact contact) async {
    final row = _contactToRow(contact);
    await _database.insertContact(row);
  }

  @override
  Future<void> saveMerged(
    Contact mergedContact, {
    required List<String> deleteIds,
  }) async {
    final dedupDeleteIds = deleteIds.where((id) => id != mergedContact.id).toSet();
    final imageCleanupIds = <String>[];
    for (final id in dedupDeleteIds) {
      final existing = await getById(id);
      if (existing?.imageFilename != null) {
        imageCleanupIds.add(id);
      }
    }

    await _database.replaceContactsForMerge(
      mergedContact: _contactToRow(mergedContact),
      deleteIds: dedupDeleteIds.toList(),
    );

    for (final id in imageCleanupIds) {
      await _imageStorage.deleteContactImages(id);
    }
  }

  @override
  Future<({int imported, int skipped})> batchImport(List<Contact> contacts) async {
    if (contacts.isEmpty) return (imported: 0, skipped: 0);

    final existing = await getAll();
    final seenIdentityKeys = existing.map(_contactIdentityKey).toSet();
    final toInsert = <Contact>[];
    var skipped = 0;

    for (final contact in contacts) {
      final identityKey = _contactIdentityKey(contact);
      if (seenIdentityKeys.contains(identityKey)) {
        skipped++;
        if (contact.imageFilename != null) {
          await _imageStorage.deleteContactImages(contact.id);
        }
        continue;
      }
      seenIdentityKeys.add(identityKey);
      toInsert.add(contact);
    }

    if (toInsert.isNotEmpty) {
      final rows = toInsert.map(_contactToRow).toList();
      await _database.batchInsertContacts(rows);
    }
    return (imported: toInsert.length, skipped: skipped);
  }

  @override
  Future<void> delete(String id) async {
    final existing = await getById(id);
    if (existing?.imageFilename != null) {
      await _imageStorage.deleteContactImages(id);
    }
    await _database.deleteContact(id);
  }

  @override
  Future<List<Contact>> search(String query) async {
    final rows = await _database.searchContacts(query);
    return rows.map(_rowToContact).toList();
  }

  @override
  Future<int> getCount() async {
    return await _database.getContactCount();
  }

  @override
  Future<List<DuplicateGroup>> getDuplicateGroups() async {
    final revision = await _duplicateCacheDataSource.getContactsRevision();
    final contacts = await getAll();
    final byId = {for (final c in contacts) c.id: c};
    final cached = await _duplicateCacheDataSource.read(
      contactsRevision: revision,
      policyVersion: DuplicateThresholds.policyVersion,
      threshold: DuplicateThresholds.groupingThreshold,
    );
    if (cached != null) {
      return _duplicateCacheMapper.toDomain(cached, byId);
    }

    final groups = await Isolate.run(
      () => _buildDuplicateGroupsInWorker(
        contacts,
        threshold: DuplicateThresholds.groupingThreshold,
      ),
    );

    final payload = _duplicateCacheMapper.toPayload(
      groups: groups,
      contactsRevision: revision,
    );
    await _duplicateCacheDataSource.replace(payload);
    return groups;
  }

  Contact _rowToContact(Map<String, dynamic> row) {
    return Contact(
      id: row[ContactsSchema.columnId] as String,
      prefix: row[ContactsSchema.columnPrefix] as String? ?? '',
      firstName: row[ContactsSchema.columnFirstName] as String? ?? '',
      middleName: row[ContactsSchema.columnMiddleName] as String? ?? '',
      lastName: row[ContactsSchema.columnLastName] as String? ?? '',
      suffix: row[ContactsSchema.columnSuffix] as String? ?? '',
      nickname: row[ContactsSchema.columnNickname] as String? ?? '',
      company: row[ContactsSchema.columnCompany] as String? ?? '',
      department: row[ContactsSchema.columnDepartment] as String? ?? '',
      jobTitle: row[ContactsSchema.columnJobTitle] as String? ?? '',
      phones: _decodePhones(row[ContactsSchema.columnPhones] as String?),
      emails: _decodeEmails(row[ContactsSchema.columnEmails] as String?),
      addresses: _decodeAddresses(row[ContactsSchema.columnAddresses] as String?),
      links: _decodeLinks(row[ContactsSchema.columnLinks] as String?),
      dates: _decodeDates(row[ContactsSchema.columnDates] as String?),
      note: row[ContactsSchema.columnNote] as String? ?? '',
      imageFilename: row[ContactsSchema.columnImageFilename] as String?,
    );
  }

  Map<String, dynamic> _contactToRow(Contact contact) {
    return {
      ContactsSchema.columnId: contact.id,
      ContactsSchema.columnPrefix: contact.prefix,
      ContactsSchema.columnFirstName: contact.firstName,
      ContactsSchema.columnMiddleName: contact.middleName,
      ContactsSchema.columnLastName: contact.lastName,
      ContactsSchema.columnSuffix: contact.suffix,
      ContactsSchema.columnNickname: contact.nickname,
      ContactsSchema.columnCompany: contact.company,
      ContactsSchema.columnDepartment: contact.department,
      ContactsSchema.columnJobTitle: contact.jobTitle,
      ContactsSchema.columnPhones: _encodePhones(contact.phones),
      ContactsSchema.columnEmails: _encodeEmails(contact.emails),
      ContactsSchema.columnAddresses: _encodeAddresses(contact.addresses),
      ContactsSchema.columnLinks: _encodeLinks(contact.links),
      ContactsSchema.columnDates: _encodeDates(contact.dates),
      ContactsSchema.columnNote: contact.note,
      ContactsSchema.columnImageFilename: contact.imageFilename,
    };
  }

  List<Phone> _decodePhones(String? json) {
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => Phone.fromJson(e as Map<String, dynamic>)).toList();
  }

  String _encodePhones(List<Phone> phones) {
    if (phones.isEmpty) return '';
    return jsonEncode(phones.map((e) => e.toJson()).toList());
  }

  List<Email> _decodeEmails(String? json) {
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => Email.fromJson(e as Map<String, dynamic>)).toList();
  }

  String _encodeEmails(List<Email> emails) {
    if (emails.isEmpty) return '';
    return jsonEncode(emails.map((e) => e.toJson()).toList());
  }

  List<Address> _decodeAddresses(String? json) {
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List;
    return list
        .map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  String _encodeAddresses(List<Address> addresses) {
    if (addresses.isEmpty) return '';
    return jsonEncode(addresses.map((e) => e.toJson()).toList());
  }

  List<Link> _decodeLinks(String? json) {
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => Link.fromJson(e as Map<String, dynamic>)).toList();
  }

  String _encodeLinks(List<Link> links) {
    if (links.isEmpty) return '';
    return jsonEncode(links.map((e) => e.toJson()).toList());
  }

  List<Date> _decodeDates(String? json) {
    if (json == null || json.isEmpty) return [];
    final list = jsonDecode(json) as List;
    return list.map((e) => Date.fromJson(e as Map<String, dynamic>)).toList();
  }

  String _encodeDates(List<Date> dates) {
    if (dates.isEmpty) return '';
    return jsonEncode(dates.map((e) => e.toJson()).toList());
  }

  String _contactIdentityKey(Contact contact) {
    String canonicalizeEntries(List<Map<String, Object?>> entries) {
      final encoded = entries.map(jsonEncode).toList()..sort();
      return jsonEncode(encoded);
    }

    return jsonEncode({
      'prefix': contact.prefix,
      'firstName': contact.firstName,
      'middleName': contact.middleName,
      'lastName': contact.lastName,
      'suffix': contact.suffix,
      'nickname': contact.nickname,
      'company': contact.company,
      'department': contact.department,
      'jobTitle': contact.jobTitle,
      'note': contact.note,
      'phones': canonicalizeEntries(
        contact.phones
            .map(
              (phone) => {
                'label': phone.label,
                'number': phone.number,
              },
            )
            .toList(),
      ),
      'emails': canonicalizeEntries(
        contact.emails
            .map(
              (email) => {
                'label': email.label,
                'address': email.address,
              },
            )
            .toList(),
      ),
      'addresses': canonicalizeEntries(
        contact.addresses
            .map(
              (address) => {
                'label': address.label,
                'address': address.address,
              },
            )
            .toList(),
      ),
      'links': canonicalizeEntries(
        contact.links
            .map(
              (link) => {
                'label': link.label,
                'url': link.url,
              },
            )
            .toList(),
      ),
      'dates': canonicalizeEntries(
        contact.dates
            .map(
              (date) => {
                'label': date.label,
                'date': date.date.toIso8601String(),
              },
            )
            .toList(),
      ),
    });
  }
}

List<DuplicateGroup> _buildDuplicateGroupsInWorker(
  List<Contact> contacts, {
  required double threshold,
}) {
  const analyzer = ContactDuplicateAnalyzer();
  return analyzer.buildGroups(contacts, threshold: threshold);
}

// features/main_app/contacts/data/datasources/device_contacts_datasource_impl.dart

import 'package:contacts/core/utils/phone_formatter.dart';
import 'package:contacts/features/main_app/contacts/data/datasources/device_contacts_datasource.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as fc;
import 'package:uuid/uuid.dart';

/// Implementation of device contacts data source using flutter_contacts package
class DeviceContactsDataSourceImpl implements DeviceContactsDataSource {
  final _uuid = const Uuid();

  @override
  Future<bool> requestPermission() async {
    return await fc.FlutterContacts.requestPermission(readonly: true);
  }

  @override
  Future<List<Contact>> fetchContacts() async {
    final entries = await fetchContactsWithPhotos();
    return entries.map((e) => e.contact).toList();
  }

  @override
  Future<List<ContactWithPhoto>> fetchContactsWithPhotos() async {
    final hasPermission = await fc.FlutterContacts.requestPermission(
      readonly: true,
    );

    if (!hasPermission) {
      return [];
    }

    final deviceContacts = await fc.FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: true,
    );

    return deviceContacts.map((dc) {
      final contact = _convertToContact(dc);
      final photo = dc.photo ?? dc.thumbnail;
      return ContactWithPhoto(contact: contact, photoBytes: photo);
    }).toList();
  }

  Contact _convertToContact(fc.Contact deviceContact) {
    return Contact(
      id: _uuid.v4(),
      prefix: deviceContact.name.prefix,
      firstName: deviceContact.name.first,
      middleName: deviceContact.name.middle,
      lastName: deviceContact.name.last,
      suffix: deviceContact.name.suffix,
      nickname: deviceContact.name.nickname,
      company: deviceContact.organizations.isNotEmpty
          ? deviceContact.organizations.first.company
          : '',
      department: deviceContact.organizations.isNotEmpty
          ? deviceContact.organizations.first.department
          : '',
      jobTitle: deviceContact.organizations.isNotEmpty
          ? deviceContact.organizations.first.title
          : '',
      phones: deviceContact.phones
          .map((p) => Phone(
                label: _mapPhoneLabel(p.label),
                number: PhoneFormatter.format(p.number),
              ))
          .toList(),
      emails: deviceContact.emails
          .map((e) => Email(label: _mapEmailLabel(e.label), address: e.address))
          .toList(),
      addresses: deviceContact.addresses
          .map(
            (a) => Address(
              label: _mapAddressLabel(a.label),
              address: _formatAddress(a),
            ),
          )
          .toList(),
      links: deviceContact.websites
          .map((w) => Link(label: _mapWebsiteLabel(w.label), url: w.url))
          .toList(),
      dates: deviceContact.events
          .where((e) => e.year != null)
          .map((e) {
            try {
              return Date(
                label: _mapEventLabel(e.label),
                date: DateTime(e.year!, e.month, e.day),
              );
            } catch (_) {
              return null;
            }
          })
          .whereType<Date>()
          .toList(),
      note: deviceContact.notes.isNotEmpty
          ? deviceContact.notes.first.note
          : '',
    );
  }

  String _mapPhoneLabel(fc.PhoneLabel label) {
    return switch (label) {
      fc.PhoneLabel.mobile => 'Mobile',
      fc.PhoneLabel.work => 'Work',
      fc.PhoneLabel.home => 'Home',
      fc.PhoneLabel.main => 'Main',
      fc.PhoneLabel.workMobile => 'Work Mobile',
      fc.PhoneLabel.faxWork => 'Work Fax',
      fc.PhoneLabel.faxHome => 'Home Fax',
      fc.PhoneLabel.pager => 'Pager',
      fc.PhoneLabel.other => 'Other',
      fc.PhoneLabel.custom => 'Custom',
      _ => 'Other',
    };
  }

  String _mapEmailLabel(fc.EmailLabel label) {
    return switch (label) {
      fc.EmailLabel.home => 'Home',
      fc.EmailLabel.work => 'Work',
      fc.EmailLabel.mobile => 'Mobile',
      fc.EmailLabel.other => 'Other',
      fc.EmailLabel.custom => 'Custom',
      _ => 'Other',
    };
  }

  String _mapAddressLabel(fc.AddressLabel label) {
    return switch (label) {
      fc.AddressLabel.home => 'Home',
      fc.AddressLabel.work => 'Work',
      fc.AddressLabel.other => 'Other',
      fc.AddressLabel.custom => 'Custom',
      _ => 'Other',
    };
  }

  String _mapWebsiteLabel(fc.WebsiteLabel label) {
    return switch (label) {
      fc.WebsiteLabel.homepage => 'Homepage',
      fc.WebsiteLabel.blog => 'Blog',
      fc.WebsiteLabel.profile => 'Profile',
      fc.WebsiteLabel.home => 'Home',
      fc.WebsiteLabel.work => 'Work',
      fc.WebsiteLabel.other => 'Other',
      fc.WebsiteLabel.ftp => 'FTP',
      fc.WebsiteLabel.custom => 'Custom',
      _ => 'Other',
    };
  }

  String _mapEventLabel(fc.EventLabel label) {
    return switch (label) {
      fc.EventLabel.birthday => 'Birthday',
      fc.EventLabel.anniversary => 'Anniversary',
      fc.EventLabel.other => 'Other',
      fc.EventLabel.custom => 'Custom',
      // ignore: unreachable_switch_case
      _ => 'Other',
    };
  }

  String _formatAddress(fc.Address address) {
    final parts = [
      address.street,
      address.city,
      address.state,
      address.postalCode,
      address.country,
    ].where((s) => s.isNotEmpty).toList();

    return parts.join(', ');
  }
}

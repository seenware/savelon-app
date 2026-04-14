import 'dart:convert';
import 'dart:io';

import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:contacts/features/main_app/contacts/domain/repositories/contacts_repository.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Migrates contact data from the legacy AES-GCM encrypted file storage to
/// the new SQLCipher database.
///
/// ## Legacy format
/// All contacts were stored as a single AES-256-GCM encrypted file at:
///   `<applicationSupportDir>/encrypted_storage.dat`
///
/// The file blob layout:
///   version(1 byte) | salt(32) | nonce(12) | ciphertext | mac(16)
///
/// The decryption key was derived via PBKDF2-HMAC-SHA256:
///   key = PBKDF2("$password:$secretKey" | secretKey, salt, 310,000 iters)
///
/// The plaintext is a JSON-encoded `Map<String, String>`.  The entry at key
/// `"contacts"` holds a JSON array of contact objects.
///
/// ## Migration flow
/// 1. [checkNeedsMigration] — returns `true` if the legacy file exists.
/// 2. [requiresLegacyPassword] — returns `true` if the legacy vault was
///    password-protected.  In that case the caller must obtain the old
///    password from the user before calling [run].
/// 3. [run] — decrypts the legacy file, parses contacts, batch-inserts them
///    into the new database, then deletes the legacy file and its secure
///    storage entries.
class MigrationService {
  // ── Legacy secure-storage key names ──────────────────────────────────────
  static const _legacyKeySecretKey = 'encrypted_contacts_secret_key';
  static const _legacyKeySalt = 'encrypted_contacts_salt';
  static const _legacyKeyInitialized = 'encrypted_contacts_initialized';
  static const _legacyKeyPasswordProtected =
      'encrypted_contacts_password_protected';

  static const _legacyFileName = 'encrypted_storage.dat';
  static const _legacyContactsKey = 'contacts';

  // ── PBKDF2 / AES-GCM constants (must match legacy values) ────────────────
  static const int _pbkdf2Iterations = 310000;
  static const int _saltLength = 32;
  static const int _nonceLength = 12;
  static const int _macLength = 16;
  static const int _aesKeyBits = 256;

  final SecureStorageService _storage;

  /// May be `null` when only [checkNeedsMigration], [requiresLegacyPassword],
  /// or [verifyLegacyPassword] will be called (i.e. no data import needed).
  final ContactsRepository? _contactsRepository;

  MigrationService({
    required SecureStorageService storage,
    required ContactsRepository? contactsRepository,
  }) : _storage = storage,
       _contactsRepository = contactsRepository;

  // ── Public API ────────────────────────────────────────────────────────────

  /// Returns `true` when the legacy encrypted file is present on disk.
  Future<bool> checkNeedsMigration() async {
    final file = await _legacyFile();
    return file.existsSync();
  }

  /// Returns `true` when the legacy vault was password-protected, meaning the
  /// caller must present the old password to [run].
  Future<bool> requiresLegacyPassword() async {
    final value = await _storage.read(_legacyKeyPasswordProtected);
    return value == 'true';
  }

  /// Tries to decrypt the legacy vault with [legacyPassword] without committing
  /// any changes.
  ///
  /// Returns `true` when decryption succeeds (password is correct or no
  /// password is needed and [legacyPassword] is null).
  /// Returns `false` when decryption fails (wrong password) or no legacy data
  /// is present.
  Future<bool> verifyLegacyPassword({String? legacyPassword}) async {
    final file = await _legacyFile();
    if (!file.existsSync()) return false;

    final secretKey = await _storage.read(_legacyKeySecretKey);
    final saltString = await _storage.read(_legacyKeySalt);
    if (secretKey == null || saltString == null) return false;

    final salt = saltString.split(',').map(int.parse).toList();
    try {
      final key = await _deriveLegacyKey(
        secretKey: secretKey,
        salt: salt,
        password: legacyPassword,
      );
      final blob = await file.readAsBytes();
      await _decryptBlob(blob: blob, key: key);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Runs the migration.
  ///
  /// [legacyPassword] must be provided when [requiresLegacyPassword] returns
  /// `true`.
  ///
  /// Throws on decryption failure (wrong password or corrupted file).
  Future<void> run({String? legacyPassword}) async {
    final file = await _legacyFile();
    if (!file.existsSync()) {
      return;
    }

    // 1. Read legacy key material from secure storage.
    final secretKey = await _storage.read(_legacyKeySecretKey);
    final saltString = await _storage.read(_legacyKeySalt);

    if (secretKey == null || saltString == null) {
      // Key material is missing – the legacy file cannot be decrypted.
      // Delete the corrupted remnants and bail out.
      await _cleanupLegacy(file);
      return;
    }

    final salt = saltString.split(',').map(int.parse).toList();

    // 2. Derive the legacy decryption key.
    final key = await _deriveLegacyKey(
      secretKey: secretKey,
      salt: salt,
      password: legacyPassword,
    );

    // 3. Read and decrypt the legacy file.
    final blob = await file.readAsBytes();
    final plaintext = await _decryptBlob(blob: blob, key: key);

    // 4. Parse contacts JSON.
    final contactsJson = plaintext[_legacyContactsKey];
    if (contactsJson == null || contactsJson.isEmpty) {
      await _cleanupLegacy(file);
      return;
    }

    final contacts = _parseContacts(contactsJson);

    // 5. Batch-insert into new database.
    if (contacts.isNotEmpty) {
      assert(
        _contactsRepository != null,
        'MigrationService.run() requires a non-null contactsRepository',
      );
      await _contactsRepository!.batchImport(contacts);
    }

    // 6. Delete legacy file and secure storage entries.
    await _cleanupLegacy(file);
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  Future<File> _legacyFile() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_legacyFileName');
  }

  Future<SecretKey> _deriveLegacyKey({
    required String secretKey,
    required List<int> salt,
    String? password,
  }) async {
    final combinedInput = (password != null && password.isNotEmpty)
        ? '$password:$secretKey'
        : secretKey;
    final inputBytes = utf8.encode(combinedInput);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _pbkdf2Iterations,
      bits: _aesKeyBits,
    );

    return await pbkdf2.deriveKey(
      secretKey: SecretKey(inputBytes),
      nonce: salt,
    );
  }

  Future<Map<String, String>> _decryptBlob({
    required Uint8List blob,
    required SecretKey key,
  }) async {
    // Blob layout: version(1) | salt(32) | nonce(12) | ciphertext | mac(16)
    int offset = 1; // skip version byte

    offset += _saltLength; // salt is already read separately

    final nonce = blob.sublist(offset, offset + _nonceLength);
    offset += _nonceLength;

    final mac = blob.sublist(blob.length - _macLength, blob.length);
    final ciphertext = blob.sublist(offset, blob.length - _macLength);

    final algorithm = AesGcm.with256bits();
    final secretBox = SecretBox(ciphertext, nonce: nonce, mac: Mac(mac));
    final plainBytes = await algorithm.decrypt(secretBox, secretKey: key);

    final jsonString = utf8.decode(plainBytes);
    final decoded = jsonDecode(jsonString);
    return Map<String, String>.from(decoded as Map);
  }

  List<Contact> _parseContacts(String contactsJson) {
    final list = jsonDecode(contactsJson) as List;
    final contacts = <Contact>[];

    for (final raw in list) {
      if (raw is! Map) continue;
      try {
        final json = Map<String, dynamic>.from(raw);

        if (json['id'] == null) continue;

        // Skip empty contacts
        final firstName = json['firstName'] as String? ?? '';
        final lastName = json['lastName'] as String? ?? '';
        final company = json['company'] as String? ?? '';
        if (firstName.isEmpty && lastName.isEmpty && company.isEmpty) continue;

        contacts.add(
          Contact(
            id: json['id'] as String,
            prefix: json['prefix'] as String? ?? '',
            firstName: firstName,
            middleName: json['middleName'] as String? ?? '',
            lastName: lastName,
            suffix: json['suffix'] as String? ?? '',
            nickname: json['nickname'] as String? ?? '',
            company: company,
            department: json['department'] as String? ?? '',
            jobTitle: json['jobTitle'] as String? ?? '',
            note: json['note'] as String? ?? '',
            phones: _parsePhones(json['phones']),
            emails: _parseEmails(json['emails']),
            addresses: _parseAddresses(json['addresses']),
            links: _parseLinks(json['links']),
            dates: _parseDates(json['dates']),
            // Legacy contacts had no stored image filename.
            imageFilename: null,
          ),
        );
      } catch (_) {}
    }

    return contacts;
  }

  List<Phone> _parsePhones(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .whereType<Map>()
        .map(
          (p) => Phone(
            label: p['label'] as String? ?? '',
            number: p['number'] as String? ?? '',
          ),
        )
        .toList();
  }

  List<Email> _parseEmails(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .whereType<Map>()
        .map(
          (e) => Email(
            label: e['label'] as String? ?? '',
            address: e['address'] as String? ?? '',
          ),
        )
        .toList();
  }

  List<Address> _parseAddresses(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .whereType<Map>()
        .map(
          (a) => Address(
            label: a['label'] as String? ?? '',
            address: a['address'] as String? ?? '',
          ),
        )
        .toList();
  }

  List<Link> _parseLinks(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .whereType<Map>()
        .map(
          (l) => Link(
            label: l['label'] as String? ?? '',
            url: l['url'] as String? ?? '',
          ),
        )
        .toList();
  }

  List<Date> _parseDates(dynamic raw) {
    if (raw is! List) return [];
    final results = <Date>[];
    for (final d in raw.whereType<Map>()) {
      final raw = d['date'];
      if (raw is! String) continue;
      DateTime? parsed;
      try {
        parsed = DateTime.parse(raw);
      } catch (_) {
        continue;
      }
      results.add(Date(label: d['label'] as String? ?? '', date: parsed));
    }
    return results;
  }

  Future<void> _cleanupLegacy(File file) async {
    // Delete the encrypted file (and temp file if present).
    if (file.existsSync()) {
      await file.delete();
    }
    final tempFile = File('${file.path}.tmp');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }

    // Remove legacy secure storage entries.
    await _storage.delete(_legacyKeySecretKey);
    await _storage.delete(_legacyKeySalt);
    await _storage.delete(_legacyKeyInitialized);
    await _storage.delete(_legacyKeyPasswordProtected);

  }
}

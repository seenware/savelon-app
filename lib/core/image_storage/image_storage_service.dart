// lib/core/image_storage/image_storage_service.dart

import 'dart:io';

import 'package:contacts/core/storage/private_storage_migration.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/foundation.dart';

/// Stores contact images as AES-encrypted files.
///
/// Layout: applicationSupport/contact_images/contactId/hash.enc
/// The IV is prepended to the ciphertext (first 16 bytes).
class ImageStorageService {
  final Uint8List _encryptionKey;

  ImageStorageService({required Uint8List encryptionKey})
    : _encryptionKey = encryptionKey;

  // ==================== Public API ====================

  /// Encrypt and persist [imageBytes].
  ///
  /// Returns the filename (e.g. `"abc123def.enc"`) to be stored in the DB.
  Future<String> saveImage(String contactId, Uint8List imageBytes) async {
    final hash = _hashBytes(imageBytes);
    final filename = '$hash.enc';
    final file = await _fileFor(contactId, filename);

    final encrypted = _encrypt(imageBytes);
    await file.writeAsBytes(encrypted, flush: true);

    return filename;
  }

  /// Decrypt and return image bytes, or `null` if the file is missing.
  Future<Uint8List?> loadImage(String contactId, String filename) async {
    final file = await _fileFor(contactId, filename);
    if (!await file.exists()) {
      return null;
    }

    final raw = await file.readAsBytes();
    return _decrypt(raw);
  }

  /// Delete a single image file.
  Future<void> deleteImage(String contactId, String filename) async {
    final file = await _fileFor(contactId, filename);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Delete all image files for a contact (entire sub-directory).
  Future<void> deleteContactImages(String contactId) async {
    final dir = await _dirFor(contactId);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  // ==================== Crypto ====================

  Uint8List _encrypt(Uint8List plaintext) {
    final key = enc.Key(_encryptionKey.sublist(0, 32));
    final iv = enc.IV.fromSecureRandom(16);
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));

    final encrypted = encrypter.encryptBytes(plaintext, iv: iv);

    // Prepend IV so we can recover it on decryption
    final result = Uint8List(16 + encrypted.bytes.length);
    result.setRange(0, 16, iv.bytes);
    result.setRange(16, result.length, encrypted.bytes);
    return result;
  }

  Uint8List _decrypt(Uint8List raw) {
    final key = enc.Key(_encryptionKey.sublist(0, 32));
    final iv = enc.IV(raw.sublist(0, 16));
    final ciphertext = enc.Encrypted(raw.sublist(16));
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));

    return Uint8List.fromList(encrypter.decryptBytes(ciphertext, iv: iv));
  }

  // ==================== Helpers ====================

  String _hashBytes(Uint8List bytes) {
    return sha256.convert(bytes).toString().substring(0, 16);
  }

  Future<Directory> _dirFor(String contactId) async {
    final root = await PrivateStoragePaths.contactImagesRoot();
    final dir = Directory('${root.path}/$contactId');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<File> _fileFor(String contactId, String filename) async {
    final dir = await _dirFor(contactId);
    return File('${dir.path}/$filename');
  }
}

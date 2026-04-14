// lib/core/crypto/contact_encryption_service.dart

import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'crypto_constants.dart';

/// Handles per-contact encryption using AES-GCM.
///
/// Each contact is encrypted with a unique key derived from
/// contact_master_key + contact_id using HKDF.
class ContactEncryptionService {
  final AesGcm _algorithm = AesGcm.with256bits();

  /// Encrypt contact data
  ///
  /// Returns: nonce (12 bytes) + ciphertext + mac (16 bytes)
  Future<Uint8List> encrypt({
    required Map<String, dynamic> contactData,
    required Uint8List encryptionKey,
  }) async {
    // Convert contact data to JSON
    final jsonString = json.encode(contactData);
    final plaintext = utf8.encode(jsonString);

    // Generate random nonce (96 bits)
    final nonce = _algorithm.newNonce();

    // Create secret key
    final secretKey = SecretKey(encryptionKey);

    // Encrypt
    final secretBox = await _algorithm.encrypt(
      plaintext,
      secretKey: secretKey,
      nonce: nonce,
    );

    // Format: nonce + ciphertext + mac
    final output = BytesBuilder();
    output.add(secretBox.nonce);
    output.add(secretBox.cipherText);
    output.add(secretBox.mac.bytes);

    return output.toBytes();
  }

  /// Decrypt contact data
  ///
  /// Input format: nonce (12 bytes) + ciphertext + mac (16 bytes)
  Future<Map<String, dynamic>> decrypt({
    required Uint8List encryptedData,
    required Uint8List encryptionKey,
  }) async {
    if (encryptedData.length <
        CryptoConstants.nonceBytes + CryptoConstants.tagBytes) {
      throw ArgumentError(
        'Encrypted data too short. Expected at least ${CryptoConstants.nonceBytes + CryptoConstants.tagBytes} bytes',
      );
    }

    // Extract components
    final nonce = encryptedData.sublist(0, CryptoConstants.nonceBytes);
    final macStart = encryptedData.length - CryptoConstants.tagBytes;
    final ciphertext = encryptedData.sublist(
      CryptoConstants.nonceBytes,
      macStart,
    );
    final mac = encryptedData.sublist(macStart);

    // Create SecretBox
    final secretBox = SecretBox(ciphertext, nonce: nonce, mac: Mac(mac));

    // Create secret key
    final secretKey = SecretKey(encryptionKey);

    // Decrypt
    final plaintext = await _algorithm.decrypt(secretBox, secretKey: secretKey);

    // Convert back to JSON
    final jsonString = utf8.decode(plaintext);
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  /// Encrypt just the image/thumbnail blobs separately
  Future<Uint8List?> encryptBlob({
    required Uint8List? blobData,
    required Uint8List encryptionKey,
  }) async {
    if (blobData == null || blobData.isEmpty) {
      return null;
    }

    final nonce = _algorithm.newNonce();
    final secretKey = SecretKey(encryptionKey);

    final secretBox = await _algorithm.encrypt(
      blobData,
      secretKey: secretKey,
      nonce: nonce,
    );

    final output = BytesBuilder();
    output.add(secretBox.nonce);
    output.add(secretBox.cipherText);
    output.add(secretBox.mac.bytes);

    return output.toBytes();
  }

  /// Decrypt image/thumbnail blobs
  Future<Uint8List?> decryptBlob({
    required Uint8List? encryptedBlob,
    required Uint8List encryptionKey,
  }) async {
    if (encryptedBlob == null || encryptedBlob.isEmpty) {
      return null;
    }

    if (encryptedBlob.length <
        CryptoConstants.nonceBytes + CryptoConstants.tagBytes) {
      throw ArgumentError('Encrypted blob too short');
    }

    final nonce = encryptedBlob.sublist(0, CryptoConstants.nonceBytes);
    final macStart = encryptedBlob.length - CryptoConstants.tagBytes;
    final ciphertext = encryptedBlob.sublist(
      CryptoConstants.nonceBytes,
      macStart,
    );
    final mac = encryptedBlob.sublist(macStart);

    final secretBox = SecretBox(ciphertext, nonce: nonce, mac: Mac(mac));

    final secretKey = SecretKey(encryptionKey);

    return Uint8List.fromList(
      await _algorithm.decrypt(secretBox, secretKey: secretKey),
    );
  }
}

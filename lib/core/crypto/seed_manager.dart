// lib/core/crypto/seed_manager.dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:cryptography/cryptography.dart';

import 'crypto_constants.dart';

/// Manages BIP39 seed phrase generation, storage, and retrieval.
///
/// Handles optional password strengthening via PBKDF2.
class SeedManager {
  final SecureStorageService _storage;

  SeedManager(this._storage);

  /// Generate a new 12-word BIP39 mnemonic and store it securely
  Future<String> generateAndStoreSeed({bool enablePassword = false}) async {
    final mnemonic = bip39.generateMnemonic(
      strength: CryptoConstants.entropyBits,
    );

    await _storage.write(CryptoConstants.secureStorageKeySeed, mnemonic);

    await _storage.write(
      CryptoConstants.secureStorageKeyPasswordEnabled,
      enablePassword.toString(),
    );

    return mnemonic;
  }

  /// Check if a seed exists in secure storage
  Future<bool> hasSeed() async {
    return await _storage.containsKey(CryptoConstants.secureStorageKeySeed);
  }

  /// Retrieve the stored seed phrase
  Future<String?> getSeed() async {
    return await _storage.read(CryptoConstants.secureStorageKeySeed);
  }

  /// Check if password protection is enabled
  Future<bool> isPasswordEnabled() async {
    final value = await _storage.read(
      CryptoConstants.secureStorageKeyPasswordEnabled,
    );
    return value == 'true';
  }

  /// Validate a mnemonic phrase
  bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic);
  }

  /// Derive master seed from mnemonic (64 bytes)
  ///
  /// WITHOUT password: mnemonic → BIP39 PBKDF2 → master_seed
  ///
  /// WITH password:
  /// mnemonic → BIP39 PBKDF2 → master_seed
  /// master_seed + user_password → PBKDF2 → strengthened_seed
  Future<Uint8List> deriveMasterSeed(
    String mnemonic, {
    String? password,
  }) async {
    if (!validateMnemonic(mnemonic)) {
      throw ArgumentError('Invalid BIP39 mnemonic');
    }

    // Step 1: BIP39 mnemonic → master seed (64 bytes)
    final bip39Seed = bip39.mnemonicToSeed(mnemonic);

    // Step 2: Optional password strengthening
    if (password != null && password.isNotEmpty) {
      return await _strengthenWithPassword(bip39Seed, password);
    }

    return Uint8List.fromList(bip39Seed);
  }

  /// Strengthen master seed with user password using PBKDF2
  Future<Uint8List> _strengthenWithPassword(
    List<int> masterSeed,
    String password,
  ) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha512(),
      iterations: CryptoConstants.pbkdf2Iterations,
      bits: CryptoConstants.pbkdf2OutputBytes * 8,
    );

    final passwordBytes = utf8.encode(password);
    final derivedKey = await pbkdf2.deriveKey(
      secretKey: SecretKey(passwordBytes),
      nonce: masterSeed,
    );

    final bytes = await derivedKey.extractBytes();
    return Uint8List.fromList(bytes);
  }

  /// Update the password-enabled flag without changing the seed.
  Future<void> updatePasswordEnabled(bool enabled) async {
    await _storage.write(
      CryptoConstants.secureStorageKeyPasswordEnabled,
      enabled.toString(),
    );
  }

  /// Delete stored seed (use with caution)
  Future<void> deleteSeed() async {
    await _storage.delete(CryptoConstants.secureStorageKeySeed);
    await _storage.delete(CryptoConstants.secureStorageKeyPasswordEnabled);
    await _storage.delete(CryptoConstants.secureStorageKeyPublicKey);
  }

  /// Store user's public key for server registration
  Future<void> storePublicKey(Uint8List publicKey) async {
    final base64Key = base64Encode(publicKey);
    await _storage.write(CryptoConstants.secureStorageKeyPublicKey, base64Key);
  }

  /// Retrieve stored public key
  Future<Uint8List?> getPublicKey() async {
    final base64Key = await _storage.read(
      CryptoConstants.secureStorageKeyPublicKey,
    );
    if (base64Key == null) return null;
    return base64Decode(base64Key);
  }
}

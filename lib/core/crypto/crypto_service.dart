// lib/core/crypto/crypto_service.dart

import 'dart:typed_data';

import 'package:contacts/core/auth/password_flow_argument_messages.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:cryptography/cryptography.dart';

import 'contact_encryption_service.dart';
import 'key_derivation_service.dart';
import 'seed_manager.dart';

/// Main cryptography service orchestrating all crypto operations.
class CryptoService {
  final SeedManager _seedManager;
  final KeyDerivationService _keyDerivation;
  final ContactEncryptionService _contactEncryption;

  DerivedKeys? _derivedKeys;

  CryptoService({required SecureStorageService storage})
    : _seedManager = SeedManager(storage),
      _keyDerivation = KeyDerivationService(),
      _contactEncryption = ContactEncryptionService();

  /// Check if crypto is initialized
  bool get isInitialized => _derivedKeys != null;

  /// Check if a seed exists in storage
  Future<bool> hasSeed() => _seedManager.hasSeed();

  /// Check if password is enabled
  Future<bool> isPasswordEnabled() => _seedManager.isPasswordEnabled();

  /// Generate new seed and derive keys
  Future<String> generateNewSeed({
    bool enablePassword = false,
    String? password,
  }) async {
    if (enablePassword && (password == null || password.isEmpty)) {
      throw ArgumentError(
        PasswordFlowArgumentMessages.passwordRequiredWhenEnablePassword,
      );
    }

    final mnemonic = await _seedManager.generateAndStoreSeed(
      enablePassword: enablePassword,
    );

    await _initializeFromMnemonic(mnemonic, password: password);

    return mnemonic;
  }

  /// Initialize crypto from stored seed
  Future<void> initialize({String? password}) async {
    final mnemonic = await _seedManager.getSeed();
    if (mnemonic == null) {
      throw StateError('No seed found. Generate a new seed first.');
    }

    final isPasswordEnabled = await _seedManager.isPasswordEnabled();
    if (isPasswordEnabled && (password == null || password.isEmpty)) {
      throw ArgumentError(PasswordFlowArgumentMessages.passwordRequiredForAccount);
    }

    await _initializeFromMnemonic(mnemonic, password: password);
  }

  /// Initialize from mnemonic and derive all keys
  Future<void> _initializeFromMnemonic(
    String mnemonic, {
    String? password,
  }) async {
    final masterSeed = await _seedManager.deriveMasterSeed(
      mnemonic,
      password: password,
    );

    _derivedKeys = await _keyDerivation.deriveKeys(masterSeed);

    // Store public key for future server registration
    final publicKeyBytes = await _derivedKeys!.getPublicKeyBytes();
    await _seedManager.storePublicKey(publicKeyBytes);
  }

  /// Get local database encryption key
  Uint8List get localDbKey {
    _ensureInitialized();
    return _derivedKeys!.localDbKey;
  }

  /// Get contact master key
  Uint8List get contactMasterKey {
    _ensureInitialized();
    return _derivedKeys!.contactMasterKey;
  }

  /// Get device Ed25519 keypair
  SimpleKeyPair get deviceKeyPair {
    _ensureInitialized();
    return _derivedKeys!.deviceKeyPair;
  }

  /// Get public key bytes
  Future<Uint8List> getPublicKeyBytes() async {
    _ensureInitialized();
    return await _derivedKeys!.getPublicKeyBytes();
  }

  // ==================== Contact Encryption ====================

  /// Encrypt contact data for storage
  Future<Uint8List> encryptContact({
    required String contactId,
    required Map<String, dynamic> contactData,
  }) async {
    _ensureInitialized();

    // Derive per-contact key
    final contactKey = await _keyDerivation.deriveContactKey(
      _derivedKeys!.contactMasterKey,
      contactId,
    );

    // Encrypt
    return await _contactEncryption.encrypt(
      contactData: contactData,
      encryptionKey: contactKey,
    );
  }

  /// Decrypt contact data from storage
  Future<Map<String, dynamic>> decryptContact({
    required String contactId,
    required Uint8List encryptedData,
  }) async {
    _ensureInitialized();

    // Derive per-contact key
    final contactKey = await _keyDerivation.deriveContactKey(
      _derivedKeys!.contactMasterKey,
      contactId,
    );

    // Decrypt
    return await _contactEncryption.decrypt(
      encryptedData: encryptedData,
      encryptionKey: contactKey,
    );
  }

  /// Encrypt contact image/thumbnail
  Future<Uint8List?> encryptBlob({
    required String contactId,
    required Uint8List? blobData,
  }) async {
    _ensureInitialized();

    final contactKey = await _keyDerivation.deriveContactKey(
      _derivedKeys!.contactMasterKey,
      contactId,
    );

    return await _contactEncryption.encryptBlob(
      blobData: blobData,
      encryptionKey: contactKey,
    );
  }

  /// Decrypt contact image/thumbnail
  Future<Uint8List?> decryptBlob({
    required String contactId,
    required Uint8List? encryptedBlob,
  }) async {
    _ensureInitialized();

    final contactKey = await _keyDerivation.deriveContactKey(
      _derivedKeys!.contactMasterKey,
      contactId,
    );

    return await _contactEncryption.decryptBlob(
      encryptedBlob: encryptedBlob,
      encryptionKey: contactKey,
    );
  }

  // ==================== Signing ====================

  /// Sign data with device private key
  Future<Uint8List> signData(List<int> data) async {
    _ensureInitialized();
    final algorithm = Ed25519();
    final signature = await algorithm.sign(
      data,
      keyPair: _derivedKeys!.deviceKeyPair,
    );
    return Uint8List.fromList(signature.bytes);
  }

  /// Verify signature with device public key
  Future<bool> verifySignature({
    required List<int> data,
    required List<int> signature,
  }) async {
    _ensureInitialized();
    final algorithm = Ed25519();
    final publicKey = await _derivedKeys!.deviceKeyPair.extractPublicKey();
    return await algorithm.verify(
      data,
      signature: Signature(signature, publicKey: publicKey),
    );
  }

  /// Exposes the seed manager so auth layer can derive alternative keys.
  SeedManager get seedManager => _seedManager;

  /// Return the stored BIP39 mnemonic (needed for key re-derivation on
  /// password change).  Returns null if no seed exists.
  Future<String?> getSeedMnemonic() => _seedManager.getSeed();

  /// Update the password-enabled flag in secure storage without touching the
  /// derived keys (keys are updated by the caller via [initialize]).
  Future<void> updatePasswordEnabled(bool enabled) async {
    await _seedManager.updatePasswordEnabled(enabled);
  }

  /// Clear derived keys without touching secure storage.
  ///
  /// Used after a failed authentication attempt so the service is no longer
  /// in a falsely-initialised state with keys derived from a wrong password.
  void reset() {
    _derivedKeys = null;
  }

  /// Delete all cryptographic material
  Future<void> deleteSeed() async {
    await _seedManager.deleteSeed();
    _derivedKeys = null;
  }

  void _ensureInitialized() {
    if (!isInitialized) {
      throw StateError(
        'CryptoService not initialized. Call initialize() first.',
      );
    }
  }
}

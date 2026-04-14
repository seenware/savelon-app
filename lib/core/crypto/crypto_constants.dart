// lib/core/crypto/crypto_constants.dart

/// Cryptographic constants for encrypted contacts.
///
/// Uses HKDF with domain-separated info parameters to ensure
/// keys cannot be misused across different contexts.
class CryptoConstants {
  CryptoConstants._();

  static const String appDomain = 'savelon.com';
  static const String keyVersion = 'v1';

  // HKDF info parameters
  static String _hkdfInfo(String purpose) =>
      'encrypted-contacts-$appDomain-$keyVersion-$purpose';

  static String get hkdfInfoLocalDb => _hkdfInfo('local-db-key');
  static String get hkdfInfoContactMaster => _hkdfInfo('contact-master-key');
  static String get hkdfInfoDeviceKey => _hkdfInfo('device-key');

  // Key sizes (bytes)
  static const int aesKeyBytes = 32; // 256 bits
  static const int ed25519KeyBytes = 32;
  static const int masterSeedBytes = 64; // BIP39 PBKDF2 output
  static const int hkdfOutputBytes = 32;

  // AES-GCM parameters (NIST SP 800-38D)
  static const int nonceBytes = 12; // 96 bits
  static const int tagBytes = 16; // 128 bits

  // BIP39 seed phrase
  static const int seedWordCount = 12;
  static const int entropyBits = 128;

  // PBKDF2 for optional password strengthening
  static const int pbkdf2Iterations = 100000;
  static const int pbkdf2OutputBytes = masterSeedBytes;

  // Secure storage keys
  static const String secureStorageKeySeed = 'encrypted_contacts_seed_v1';
  static const String secureStorageKeyPasswordEnabled =
      'encrypted_contacts_password_enabled_v1';
  static const String secureStorageKeyPublicKey =
      'encrypted_contacts_pubkey_v1';
}

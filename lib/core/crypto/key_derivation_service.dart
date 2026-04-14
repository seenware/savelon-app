// lib/core/crypto/key_derivation_service.dart

import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import 'crypto_constants.dart';

/// Derives cryptographic keys from master seed using HKDF.
///
/// All keys are derived deterministically, allowing multi-device sync
/// with the same seed phrase across devices.
class KeyDerivationService {
  /// Derive all keys from master seed
  Future<DerivedKeys> deriveKeys(Uint8List masterSeed) async {
    if (masterSeed.length != CryptoConstants.masterSeedBytes) {
      throw ArgumentError(
        'Master seed must be ${CryptoConstants.masterSeedBytes} bytes',
      );
    }

    final secretKey = SecretKey(masterSeed);

    // Derive local database encryption key
    final localDbKey = await _deriveKey(
      secretKey: secretKey,
      info: CryptoConstants.hkdfInfoLocalDb,
      outputLength: CryptoConstants.aesKeyBytes,
    );

    // Derive contact master key (used for per-contact key generation)
    final contactMasterKey = await _deriveKey(
      secretKey: secretKey,
      info: CryptoConstants.hkdfInfoContactMaster,
      outputLength: CryptoConstants.aesKeyBytes,
    );

    // Derive Ed25519 device key seed
    final deviceKeySeed = await _deriveKey(
      secretKey: secretKey,
      info: CryptoConstants.hkdfInfoDeviceKey,
      outputLength: CryptoConstants.ed25519KeyBytes,
    );

    // Generate Ed25519 keypair from derived seed
    final deviceKeyPair = await _deriveEd25519KeyPair(deviceKeySeed);

    return DerivedKeys(
      localDbKey: localDbKey,
      contactMasterKey: contactMasterKey,
      deviceKeyPair: deviceKeyPair,
    );
  }

  /// Derive a key using HKDF
  Future<Uint8List> _deriveKey({
    required SecretKey secretKey,
    required String info,
    required int outputLength,
  }) async {
    final hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: outputLength);

    final derivedKey = await hkdf.deriveKey(
      secretKey: secretKey,
      info: info.codeUnits,
      nonce: [],
    );

    final bytes = await derivedKey.extractBytes();
    return Uint8List.fromList(bytes);
  }

  /// Derive Ed25519 keypair from seed
  Future<SimpleKeyPair> _deriveEd25519KeyPair(Uint8List seed) async {
    final algorithm = Ed25519();
    // newKeyPairFromSeed expects List<int>, not SecretKey
    return await algorithm.newKeyPairFromSeed(seed);
  }

  /// Derive per-contact encryption key from contact master key
  Future<Uint8List> deriveContactKey(
    Uint8List contactMasterKey,
    String contactId,
  ) async {
    final hkdf = Hkdf(
      hmac: Hmac.sha256(),
      outputLength: CryptoConstants.aesKeyBytes,
    );

    final derivedKey = await hkdf.deriveKey(
      secretKey: SecretKey(contactMasterKey),
      info: contactId.codeUnits,
      nonce: [],
    );

    final bytes = await derivedKey.extractBytes();
    return Uint8List.fromList(bytes);
  }
}

/// Container for all derived cryptographic keys
class DerivedKeys {
  /// Key for encrypting local SQLCipher database
  final Uint8List localDbKey;

  /// Master key for deriving per-contact encryption keys
  final Uint8List contactMasterKey;

  /// Ed25519 keypair for device signing and server registration
  final SimpleKeyPair deviceKeyPair;

  const DerivedKeys({
    required this.localDbKey,
    required this.contactMasterKey,
    required this.deviceKeyPair,
  });

  /// Extract public key bytes for server registration
  Future<Uint8List> getPublicKeyBytes() async {
    final publicKey = await deviceKeyPair.extractPublicKey();
    return Uint8List.fromList(publicKey.bytes);
  }
}

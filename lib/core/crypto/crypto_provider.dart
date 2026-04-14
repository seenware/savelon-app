// lib/core/crypto/crypto_provider.dart

/*
// Example: First-time setup
final cryptoService = ref.read(cryptoServiceProvider);

// Generate seed with optional password
final mnemonic = await cryptoService.generateNewSeed(
  enablePassword: true,
  password: 'user_password_123',
);

print('Save these 12 words: $mnemonic');

// On subsequent app launches
await cryptoService.initialize(password: 'user_password_123');

// Access derived keys
final dbKey = cryptoService.localDbKey;
final contactKey = await cryptoService.deriveContactKey('contact-uuid-123');
final publicKey = await cryptoService.getPublicKeyBytes();

// Sign data for server authentication
final signature = await cryptoService.signData([1, 2, 3, 4]);
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/secure_storage_service.dart';
import 'crypto_service.dart';

final cryptoServiceProvider = Provider<CryptoService>((ref) {
  return CryptoService(storage: SecureStorageService.instance);
});

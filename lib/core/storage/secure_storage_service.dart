// lib/core/storage/secure_storage_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service for storing sensitive data in platform-specific secure storage.
///
/// - iOS/macOS: Keychain with kSecAttrAccessibleAfterFirstUnlock
/// - Android: EncryptedSharedPreferences backed by Keystore
/// - Windows: DPAPI (Data Protection API)
/// - Linux: libsecret
class SecureStorageService {
  SecureStorageService._();

  static final SecureStorageService instance = SecureStorageService._();

  late final FlutterSecureStorage _storage;

  /// Initialize storage with platform-specific security options
  void init() {
    _storage = FlutterSecureStorage(
      iOptions: _getAppleOptions(),
      aOptions: _getAndroidOptions(),
      wOptions: _getWindowsOptions(),
      lOptions: _getLinuxOptions(),
    );
  }

  IOSOptions _getAppleOptions() {
    return const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
      synchronizable: false, // Prevents iCloud Keychain sync
    );
  }

  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(encryptedSharedPreferences: true);
  }

  WindowsOptions _getWindowsOptions() {
    return const WindowsOptions(useBackwardCompatibility: false);
  }

  LinuxOptions _getLinuxOptions() {
    return const LinuxOptions();
  }

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        iOptions: _getAppleOptions(),
        aOptions: _getAndroidOptions(),
        wOptions: _getWindowsOptions(),
        lOptions: _getLinuxOptions(),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _storage.read(
        key: key,
        iOptions: _getAppleOptions(),
        aOptions: _getAndroidOptions(),
        wOptions: _getWindowsOptions(),
        lOptions: _getLinuxOptions(),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(
        key: key,
        iOptions: _getAppleOptions(),
        aOptions: _getAndroidOptions(),
        wOptions: _getWindowsOptions(),
        lOptions: _getLinuxOptions(),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(
        key: key,
        iOptions: _getAppleOptions(),
        aOptions: _getAndroidOptions(),
        wOptions: _getWindowsOptions(),
        lOptions: _getLinuxOptions(),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll(
        iOptions: _getAppleOptions(),
        aOptions: _getAndroidOptions(),
        wOptions: _getWindowsOptions(),
        lOptions: _getLinuxOptions(),
      );
    } catch (_) {
      rethrow;
    }
  }
}

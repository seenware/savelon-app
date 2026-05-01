import 'package:contacts/core/profile/profile_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists whether the user wants an OS-level biometric prompt when the app
/// returns to the foreground. Does not store secrets or affect SQLCipher.
class AppBiometricLockStorage {
  Future<bool> readEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(ProfileConstants.storageKeyAppBiometricLock) ?? false;
  }

  Future<void> writeEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ProfileConstants.storageKeyAppBiometricLock, value);
  }
}

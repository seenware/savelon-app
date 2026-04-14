// lib/main.dart

import 'package:contacts/core/crypto/crypto_constants.dart';
import 'package:contacts/core/locale/locale_provider.dart';
import 'package:contacts/core/locale/locale_storage.dart';
import 'package:contacts/core/purchases/purchases_config.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/device_orientation_config.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Preserve splash screen until we're ready to navigate
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize secure storage
  SecureStorageService.instance.init();

  // Detect reinstall: SharedPreferences is cleared on uninstall; Keychain is not.
  // If the sentinel is absent, this is either a first install or a reinstall
  // after deletion — wipe stale crypto keys only, leaving subscription/paywall
  // data intact so early adopters and active subscribers are unaffected.
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('app_installed')) {
    final storage = SecureStorageService.instance;
    await storage.delete(CryptoConstants.secureStorageKeySeed);
    await storage.delete(CryptoConstants.secureStorageKeyPasswordEnabled);
    await storage.delete(CryptoConstants.secureStorageKeyPublicKey);
    await prefs.setBool('app_installed', true);
  }

  // Initialize RevenueCat with the platform-appropriate key.
  await PurchasesConfig.configure();

  await DeviceOrientationConfig.configureOrientation();

  final bootstrapLocale = const LocaleStorage().readOverrideFromPrefs(prefs);

  runApp(
    ProviderScope(
      overrides: [localeBootstrapProvider.overrideWithValue(bootstrapLocale)],
      child: const EncryptedContactsApp(),
    ),
  );
}

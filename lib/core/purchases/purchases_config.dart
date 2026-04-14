import 'dart:io';

import 'package:purchases_flutter/purchases_flutter.dart';

/// Purchase-related configuration and SDK bootstrap (e.g. RevenueCat keys).
class PurchasesConfig {
  PurchasesConfig._();

  static const String _rcAppleKey = 'appl_kAThuOQOAzDpEvgmMSkbgTjFuuZ';
  static const String _rcGoogleKey = 'goog_lUhhvwrhcOKEVnJkiGuAmFeFZEr';
  static const String _rcTestKey = 'test_GxHKbIIvHFkccLphnjqIXxiMaDf';

  /// RevenueCat API key for the current platform.
  static String revenueCatKeyForCurrentPlatform() {
    if (Platform.isIOS || Platform.isMacOS) return _rcAppleKey;
    if (Platform.isAndroid) return _rcGoogleKey;
    return _rcTestKey;
  }

  /// Configure the RevenueCat SDK with the appropriate key for this platform.
  static Future<void> configure() async {
    final rcKey = revenueCatKeyForCurrentPlatform();
    await Purchases.configure(PurchasesConfiguration(rcKey));
  }
}

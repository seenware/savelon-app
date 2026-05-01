// lib/app/app.dart

import 'dart:io';

import 'package:contacts/app/app_biometric_resume_lock.dart';
import 'package:contacts/app/router.dart';
import 'package:contacts/core/locale/locale_provider.dart';
import 'package:contacts/core/locale/locale_resolution.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

SystemUiOverlayStyle _systemUiOverlayForBrightness(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
  );
}

class EncryptedContactsApp extends ConsumerWidget {
  const EncryptedContactsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final localeOverride = ref.watch(localeNotifierProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) =>
          AppLocalizations.of(context)?.encryptedContactsTitle ??
          'Encrypted Contacts',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: localeOverride,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeListResolutionCallback: (locales, supported) =>
          resolveAppLocale(locales, supported),
      builder: (context, child) {
        if (Platform.isAndroid) {
          final shortestSide = MediaQuery.of(context).size.shortestSide;
          if (shortestSide < 600) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
          }
        }
        final brightness = Theme.of(context).brightness;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _systemUiOverlayForBrightness(brightness),
          child: AppBiometricResumeLock(child: child!),
        );
      },
    );
  }
}

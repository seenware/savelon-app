import 'package:contacts/core/locale/locale_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeStorageProvider = Provider<LocaleStorage>(
  (ref) => const LocaleStorage(),
);

/// Overridden in [main] with the locale read from [SharedPreferences] (may be null).
final localeBootstrapProvider = Provider<Locale?>((ref) => null);

/// `null` = follow system locale.
final localeNotifierProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);

class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() => ref.read(localeBootstrapProvider);

  Future<void> setLocale(Locale? locale) async {
    state = locale;
    await ref.read(localeStorageProvider).writeOverride(locale);
  }

  Future<void> useSystemLocale() => setLocale(null);
}

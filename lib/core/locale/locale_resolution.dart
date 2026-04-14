import 'package:flutter/material.dart';

/// Picks the closest [supported] locale for [deviceLocales], falling back to English.
Locale? resolveAppLocale(
  List<Locale>? deviceLocales,
  Iterable<Locale> supported,
) {
  if (deviceLocales == null || deviceLocales.isEmpty) {
    return const Locale('en');
  }
  final supportedList = supported.toList();
  for (final device in deviceLocales) {
    for (final s in supportedList) {
      if (s.languageCode != device.languageCode) continue;
      final countryMatch =
          s.countryCode == null ||
          device.countryCode == null ||
          s.countryCode == device.countryCode;
      final scriptMatch =
          s.scriptCode == null ||
          device.scriptCode == null ||
          s.scriptCode == device.scriptCode;
      if (countryMatch && scriptMatch) return s;
    }
  }
  for (final device in deviceLocales) {
    for (final s in supportedList) {
      if (s.languageCode == device.languageCode) return s;
    }
  }
  return const Locale('en');
}

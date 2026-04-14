import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists optional app locale override. `null` means follow system locale.
class LocaleStorage {
  static const _keyLanguage = 'app_locale_language';
  static const _keyCountry = 'app_locale_country';
  static const _keyScript = 'app_locale_script';

  const LocaleStorage();

  /// Sync read when [SharedPreferences] is already available (e.g. in `main`).
  Locale? readOverrideFromPrefs(SharedPreferences prefs) {
    final language = prefs.getString(_keyLanguage);
    if (language == null || language.isEmpty) return null;
    final country = prefs.getString(_keyCountry);
    final script = prefs.getString(_keyScript);
    if (script != null && script.isNotEmpty) {
      return Locale.fromSubtags(
        languageCode: language,
        scriptCode: script,
        countryCode: (country != null && country.isNotEmpty) ? country : null,
      );
    }
    if (country != null && country.isNotEmpty) {
      return Locale(language, country);
    }
    return Locale(language);
  }

  Future<Locale?> readOverride() async {
    final prefs = await SharedPreferences.getInstance();
    return readOverrideFromPrefs(prefs);
  }

  Future<void> writeOverride(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_keyLanguage);
      await prefs.remove(_keyCountry);
      await prefs.remove(_keyScript);
      return;
    }
    await prefs.setString(_keyLanguage, locale.languageCode);
    if (locale.countryCode != null && locale.countryCode!.isNotEmpty) {
      await prefs.setString(_keyCountry, locale.countryCode!);
    } else {
      await prefs.remove(_keyCountry);
    }
    if (locale.scriptCode != null && locale.scriptCode!.isNotEmpty) {
      await prefs.setString(_keyScript, locale.scriptCode!);
    } else {
      await prefs.remove(_keyScript);
    }
  }
}

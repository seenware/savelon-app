import 'package:flutter/material.dart';

/// Native names for each app locale (not translated — standard practice).
const kLanguageNativeNames = <String, String>{
  'en': 'English',
  'es': 'Español',
  'zh': '中文',
  'zh_CN': '简体中文',
  'hi': 'हिन्दी',
  'ar': 'العربية',
  'pt': 'Português',
  'pt_BR': 'Português (Brasil)',
  'fr': 'Français',
  'de': 'Deutsch',
  'ja': '日本語',
  'ko': '한국어',
  'ru': 'Русский',
  'id': 'Bahasa Indonesia',
  'tr': 'Türkçe',
  'it': 'Italiano',
  'vi': 'Tiếng Việt',
  'th': 'ไทย',
  'pl': 'Polski',
  'nl': 'Nederlands',
  'fa': 'فارسی',
  'bn': 'বাংলা',
};

String tagForLocale(Locale locale) {
  final c = locale.countryCode;
  final s = locale.scriptCode;
  if (s != null && s.isNotEmpty) {
    return '${locale.languageCode}_${s}_${c ?? ''}';
  }
  if (c != null && c.isNotEmpty) {
    return '${locale.languageCode}_$c';
  }
  return locale.languageCode;
}

String labelForLocale(Locale locale) {
  final tag = tagForLocale(locale);
  return kLanguageNativeNames[tag] ??
      kLanguageNativeNames[locale.languageCode] ??
      tag;
}

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

enum ImportContactsSource { deviceContacts, fromFile }

bool get supportsDeviceContacts {
  if (kIsWeb) return false;
  return defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

bool get supportsFileImport {
  return defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      kIsWeb;
}

List<ImportContactsSource> get availableImportSources {
  final sources = <ImportContactsSource>[];
  if (supportsDeviceContacts) {
    sources.add(ImportContactsSource.deviceContacts);
  }
  if (supportsFileImport) {
    sources.add(ImportContactsSource.fromFile);
  }
  return sources;
}

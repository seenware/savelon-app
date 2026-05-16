import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SkippedDuplicateGroupsStore {
  Future<Set<String>> read();
  Future<void> write(Set<String> ids);
}

class SharedPrefsSkippedDuplicateGroupsStore
    implements SkippedDuplicateGroupsStore {
  static const String _storageKey = 'duplicates_skipped_duplicate_group_ids';
  static const String _legacyStorageKey =
      'organize_skipped_duplicate_group_ids';

  const SharedPrefsSkippedDuplicateGroupsStore();

  @override
  Future<Set<String>> read() async {
    final prefs = await SharedPreferences.getInstance();
    final values = prefs.getStringList(_storageKey);
    if (values != null) return values.toSet();

    final legacyValues =
        prefs.getStringList(_legacyStorageKey) ?? const <String>[];
    if (legacyValues.isNotEmpty) {
      await prefs.setStringList(_storageKey, legacyValues);
      await prefs.remove(_legacyStorageKey);
    }
    return legacyValues.toSet();
  }

  @override
  Future<void> write(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_storageKey, ids.toList()..sort());
    await prefs.remove(_legacyStorageKey);
  }
}

final skippedDuplicateGroupsStoreProvider = Provider<SkippedDuplicateGroupsStore>(
  (ref) => const SharedPrefsSkippedDuplicateGroupsStore(),
);

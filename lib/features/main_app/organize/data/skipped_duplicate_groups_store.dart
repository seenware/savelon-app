import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SkippedDuplicateGroupsStore {
  Future<Set<String>> read();
  Future<void> write(Set<String> ids);
}

class SharedPrefsSkippedDuplicateGroupsStore
    implements SkippedDuplicateGroupsStore {
  static const String _storageKey = 'organize_skipped_duplicate_group_ids';

  const SharedPrefsSkippedDuplicateGroupsStore();

  @override
  Future<Set<String>> read() async {
    final prefs = await SharedPreferences.getInstance();
    final values = prefs.getStringList(_storageKey) ?? const <String>[];
    return values.toSet();
  }

  @override
  Future<void> write(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_storageKey, ids.toList()..sort());
  }
}

final skippedDuplicateGroupsStoreProvider = Provider<SkippedDuplicateGroupsStore>(
  (ref) => const SharedPrefsSkippedDuplicateGroupsStore(),
);

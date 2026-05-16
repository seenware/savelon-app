import 'dart:async';

import 'package:contacts/features/main_app/duplicates/data/skipped_duplicate_groups_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';

class SkippedDuplicateGroupIdsNotifier extends AsyncNotifier<Set<String>> {
  Future<void>? _initialLoad;

  @override
  Future<Set<String>> build() async {
    final store = ref.read(skippedDuplicateGroupsStoreProvider);
    return await store.read();
  }

  Future<void> _ensureLoaded() async {
    final inflight = _initialLoad;
    if (inflight != null) {
      await inflight;
      return;
    }
    if (state.hasValue) return;
    final load = future.then((_) {});
    _initialLoad = load;
    await load;
    _initialLoad = null;
  }

  Future<void> skip(String groupId) async {
    await _ensureLoaded();
    final current = state.asData?.value ?? <String>{};
    final next = {...current, groupId};
    state = AsyncValue.data(next);
    final store = ref.read(skippedDuplicateGroupsStoreProvider);
    await store.write(next);
  }

  Future<void> clearAll() async {
    await _ensureLoaded();
    const next = <String>{};
    state = const AsyncValue.data(next);
    final store = ref.read(skippedDuplicateGroupsStoreProvider);
    await store.write(next);
  }
}

final skippedDuplicateGroupIdsProvider =
    AsyncNotifierProvider<SkippedDuplicateGroupIdsNotifier, Set<String>>(
      SkippedDuplicateGroupIdsNotifier.new,
    );

class LastKnownDuplicatesCountNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void setValue(int value) {
    state = value;
  }
}

final lastKnownDuplicatesCountProvider =
    NotifierProvider<LastKnownDuplicatesCountNotifier, int?>(
      LastKnownDuplicatesCountNotifier.new,
    );

class DuplicateGroupsRefreshNotifier extends Notifier<int> {
  Timer? _debounceTimer;

  @override
  int build() {
    ref.onDispose(() => _debounceTimer?.cancel());
    return 0;
  }

  void schedule({Duration delay = const Duration(milliseconds: 700)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, () {
      ref.invalidate(duplicateGroupsProvider);
      state++;
    });
  }
}

final duplicateGroupsRefreshProvider =
    NotifierProvider<DuplicateGroupsRefreshNotifier, int>(
      DuplicateGroupsRefreshNotifier.new,
    );

class DuplicateGroupsCacheNotifier extends Notifier<List<DuplicateGroup>> {
  @override
  List<DuplicateGroup> build() => const <DuplicateGroup>[];

  void setGroups(List<DuplicateGroup> groups) {
    state = groups;
  }
}

final duplicateGroupsCacheProvider =
    NotifierProvider<DuplicateGroupsCacheNotifier, List<DuplicateGroup>>(
      DuplicateGroupsCacheNotifier.new,
    );

final duplicateGroupsProvider = FutureProvider<List<DuplicateGroup>>((ref) async {
  final repository = ref.read(contactsRepositoryProvider);
  final groups = await repository?.getDuplicateGroups() ?? <DuplicateGroup>[];
  ref.read(duplicateGroupsCacheProvider.notifier).setGroups(groups);
  return groups;
});

/// Keeps duplicate cache warm in the background even when Duplicates is not open.
final duplicateGroupsBackgroundSyncProvider = Provider<void>((ref) {
  ref.watch(duplicateGroupsRefreshProvider);
  final repository = ref.watch(contactsRepositoryProvider);
  if (repository == null) return;
  unawaited(() async {
    final groups = await repository.getDuplicateGroups();
    ref.read(duplicateGroupsCacheProvider.notifier).setGroups(groups);
    final skippedIds = await ref.read(skippedDuplicateGroupIdsProvider.future);
    final visibleCount =
        groups.where((group) => !skippedIds.contains(group.id)).length;
    ref.read(lastKnownDuplicatesCountProvider.notifier).setValue(visibleCount);
  }());
});

final visibleDuplicateGroupsProvider = Provider<AsyncValue<List<DuplicateGroup>>>((ref) {
  final groupsAsync = ref.watch(duplicateGroupsProvider);
  final cachedGroups = ref.watch(duplicateGroupsCacheProvider);
  final skipped = ref.watch(skippedDuplicateGroupIdsProvider);
  if (groupsAsync.isLoading && skipped.isLoading && cachedGroups.isEmpty) {
    return const AsyncValue.loading();
  }
  if (groupsAsync.hasError) {
    return AsyncValue.error(groupsAsync.error!, groupsAsync.stackTrace!);
  }
  if (skipped.hasError) {
    return AsyncValue.error(skipped.error!, skipped.stackTrace!);
  }
  // Avoid showing stale previous AsyncData while a fresh load is in-flight.
  final groups = groupsAsync.isLoading
      ? cachedGroups
      : (groupsAsync.asData?.value ?? cachedGroups);
  final skippedIds = skipped.asData?.value ?? const <String>{};
  return AsyncValue.data(
    groups.where((group) => !skippedIds.contains(group.id)).toList(),
  );
});

final duplicatesCountProvider = Provider<AsyncValue<int>>((ref) {
  final groupsAsync = ref.watch(visibleDuplicateGroupsProvider);
  return groupsAsync.whenData((groups) => groups.length);
});

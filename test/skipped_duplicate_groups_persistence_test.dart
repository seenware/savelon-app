import 'package:contacts/features/main_app/duplicates/data/skipped_duplicate_groups_store.dart';
import 'package:contacts/features/main_app/duplicates/presentation/providers/duplicates_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _MemorySkippedStore implements SkippedDuplicateGroupsStore {
  Set<String> _ids;

  _MemorySkippedStore([Set<String>? initial]) : _ids = initial ?? <String>{};

  @override
  Future<Set<String>> read() async => _ids;

  @override
  Future<void> write(Set<String> ids) async {
    _ids = {...ids};
  }
}

void main() {
  test('skip persists across new provider container, clearAll resets it', () async {
    final store = _MemorySkippedStore();

    final first = ProviderContainer(
      overrides: [
        skippedDuplicateGroupsStoreProvider.overrideWithValue(store),
      ],
    );
    addTearDown(first.dispose);

    await first.read(skippedDuplicateGroupIdsProvider.future);
    await first.read(skippedDuplicateGroupIdsProvider.notifier).skip('group-1');
    expect(first.read(skippedDuplicateGroupIdsProvider).value, {'group-1'});

    final second = ProviderContainer(
      overrides: [
        skippedDuplicateGroupsStoreProvider.overrideWithValue(store),
      ],
    );
    addTearDown(second.dispose);

    final restored = await second.read(skippedDuplicateGroupIdsProvider.future);
    expect(restored, {'group-1'});

    await second.read(skippedDuplicateGroupIdsProvider.notifier).clearAll();
    expect(second.read(skippedDuplicateGroupIdsProvider).value, isEmpty);

    final third = ProviderContainer(
      overrides: [
        skippedDuplicateGroupsStoreProvider.overrideWithValue(store),
      ],
    );
    addTearDown(third.dispose);

    final cleared = await third.read(skippedDuplicateGroupIdsProvider.future);
    expect(cleared, isEmpty);
  });
}

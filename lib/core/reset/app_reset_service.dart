import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/database/database_provider.dart';
import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_view_providers.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_provider.dart';
import 'package:contacts/features/main_app/duplicates/presentation/providers/duplicates_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Orchestrates a full factory reset of the app.
///
/// Wipes the SQLCipher database, secure storage seed, and all Riverpod
/// provider state, then transitions to [AuthStateNeedsOnboarding].
class AppResetService {
  AppResetService();

  /// Performs a complete app reset. Throws on error.
  Future<void> performReset(WidgetRef ref) async {
    final authNotifier = ref.read(authProvider.notifier);
    await authNotifier.factoryReset();

    // 2. Invalidate all related providers.
    ref.invalidate(databaseProvider);
    ref.invalidate(imageStorageProvider);
    ref.invalidate(authProvider);
    ref.invalidate(contactsRepositoryProvider);
    ref.invalidate(contactsProvider);
    ref.invalidate(contactByIdProvider);
    ref.invalidate(searchContactsProvider);
    ref.invalidate(groupedContactsProvider);
    ref.invalidate(importContactsStateProvider);
    ref.invalidate(duplicateGroupsRefreshProvider);
    ref.invalidate(duplicateGroupsProvider);
    ref.invalidate(duplicateGroupsCacheProvider);
    ref.invalidate(lastKnownDuplicatesCountProvider);
    ref.invalidate(visibleDuplicateGroupsProvider);
    ref.invalidate(duplicatesCountProvider);
    ref.invalidate(skippedDuplicateGroupIdsProvider);
    ref.invalidate(duplicateGroupsBackgroundSyncProvider);
  }
}

final appResetProvider = Provider<AppResetService>((ref) => AppResetService());

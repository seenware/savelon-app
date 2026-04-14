import 'package:contacts/core/database/database_provider.dart';
import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/features/main_app/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/repositories/contacts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [ContactsRepository], or `null` when the database is not yet
/// initialised (before authentication completes).
final contactsRepositoryProvider = Provider<ContactsRepository?>((ref) {
  final db = ref.watch(databaseProvider);
  final imageStorage = ref.watch(imageStorageProvider);
  if (db == null || imageStorage == null) return null;
  return ContactsRepositoryImpl(database: db, imageStorage: imageStorage);
});

/// Reactive list of all contacts.  Automatically re-fetches whenever the
/// underlying database changes.
final contactsProvider = FutureProvider<List<Contact>>((ref) async {
  final repository = ref.watch(contactsRepositoryProvider);
  return await repository?.getAll() ?? [];
});

/// Reactive total contacts count derived from [contactsProvider].
final contactsCountProvider = Provider<AsyncValue<int>>((ref) {
  final contactsAsync = ref.watch(contactsProvider);
  return contactsAsync.whenData((contacts) => contacts.length);
});

/// Single contact look-up by ID.  Refreshes whenever [contactsProvider]
/// refreshes.
final contactByIdProvider = FutureProvider.family<Contact?, String>((
  ref,
  contactId,
) async {
  final contacts = await ref.watch(contactsProvider.future);
  try {
    return contacts.firstWhere((c) => c.id == contactId);
  } catch (_) {
    return null;
  }
});

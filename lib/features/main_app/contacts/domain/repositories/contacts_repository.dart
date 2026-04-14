import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';

abstract class ContactsRepository {
  /// Get all contacts
  Future<List<Contact>> getAll();

  /// Get contact by ID
  Future<Contact?> getById(String id);

  /// Save contact (insert or update)
  Future<void> save(Contact contact);

  /// Batch import contacts
  Future<({int imported, int skipped})> batchImport(List<Contact> contacts);

  /// Delete contact permanently
  Future<void> delete(String id);

  /// Search contacts
  Future<List<Contact>> search(String query);

  /// Get contact count
  Future<int> getCount();

  /// Get duplicate groups from cache or recompute.
  Future<List<DuplicateGroup>> getDuplicateGroups();

  /// Save merged contact and remove replaced contacts.
  Future<void> saveMerged(Contact mergedContact, {required List<String> deleteIds});
}

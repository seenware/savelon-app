import 'package:contacts/core/utils/contact_search.dart';
import 'package:contacts/features/main_app/contacts/domain/contact_sectioning.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contacts_provider.dart';

/// Filters contacts using smart multi-field search via [ContactSearch].
///
/// Supports multi-word AND logic, phone digit-only matching, initials,
/// combined name lookup, and fuzzy 1-edit-distance typo tolerance.
final searchContactsProvider = Provider.family<List<Contact>, String>((
  ref,
  searchQuery,
) {
  final contactsAsync = ref.watch(contactsProvider);

  return contactsAsync.when(
    data: (contacts) {
      if (searchQuery.isEmpty) return contacts;
      return contacts
          .where((c) => ContactSearch.matches(c, searchQuery))
          .toList();
    },
    loading: () => [],
    error: (_, _) => [],
  );
});

/// Groups contacts by first letter, optionally pre-filtered by [searchQuery].
final groupedContactsProvider =
    Provider.family<Map<String, List<Contact>>, String>((ref, searchQuery) {
      final filteredContacts = ref.watch(searchContactsProvider(searchQuery));

      final grouped = <String, List<Contact>>{};
      for (final contact in filteredContacts) {
        final letter = ContactSectioning.sectionKeyForContact(contact);
        grouped.putIfAbsent(letter, () => []).add(contact);
      }

      for (final key in grouped.keys) {
        grouped[key]!.sort((a, b) => a.sortKey.compareTo(b.sortKey));
      }

      return grouped;
    });

/// Returns section keys sorted by fixed script order:
/// Latin -> Cyrillic -> Greek -> Other letters -> #.
final sortedContactSectionKeysProvider =
    Provider.family<List<String>, String>((ref, searchQuery) {
      final groupedContacts = ref.watch(groupedContactsProvider(searchQuery));
      final sortedKeys = groupedContacts.keys.toList()
        ..sort(ContactSectioning.compareSectionKeys);
      return sortedKeys;
    });

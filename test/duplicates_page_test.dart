import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart' as cdate;
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:contacts/core/theme/app_spacings.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:contacts/features/main_app/contacts/domain/repositories/contacts_repository.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/duplicates/data/skipped_duplicate_groups_store.dart';
import 'package:contacts/features/main_app/duplicates/presentation/pages/duplicates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Contact _contact({
  required String id,
  required String firstName,
  required String lastName,
  required String email,
}) {
  return Contact(
    id: id,
    prefix: '',
    firstName: firstName,
    middleName: '',
    lastName: lastName,
    suffix: '',
    nickname: '',
    company: '',
    department: '',
    jobTitle: '',
    phones: const <Phone>[],
    emails: [Email(label: 'work', address: email)],
    addresses: const <Address>[],
    links: const <Link>[],
    dates: const <cdate.Date>[],
    note: '',
  );
}

void main() {
  testWidgets('shows, skips, and restores a duplicate group on refresh', (tester) async {
    final contacts = [
      _contact(id: '1', firstName: 'John', lastName: 'Doe', email: 'john@x.com'),
      _contact(id: '2', firstName: 'John', lastName: 'Doe', email: 'john@x.com'),
    ];
    final repository = _TestContactsRepository(contacts);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          contactsRepositoryProvider.overrideWithValue(repository),
          skippedDuplicateGroupsStoreProvider.overrideWithValue(
            _MemorySkippedStore(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(extensions: const [AppSpacings.mobile]),
          home: const DuplicatesPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('2 duplicates'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.text('No potential duplicates found'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pumpAndSettle();

    expect(find.textContaining('2 duplicates'), findsOneWidget);
  });
}

class _MemorySkippedStore implements SkippedDuplicateGroupsStore {
  Set<String> _ids = <String>{};

  @override
  Future<Set<String>> read() async => _ids;

  @override
  Future<void> write(Set<String> ids) async {
    _ids = {...ids};
  }
}

class _TestContactsRepository implements ContactsRepository {
  final List<Contact> _contacts;
  final ContactDuplicateAnalyzer _analyzer = const ContactDuplicateAnalyzer();

  _TestContactsRepository(this._contacts);

  @override
  Future<({int imported, int skipped})> batchImport(List<Contact> contacts) async {
    return (imported: contacts.length, skipped: 0);
  }

  @override
  Future<void> delete(String id) async {}

  @override
  Future<List<Contact>> getAll() async => _contacts;

  @override
  Future<Contact?> getById(String id) async {
    try {
      return _contacts.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<int> getCount() async => _contacts.length;

  @override
  Future<List<DuplicateGroup>> getDuplicateGroups() async => _analyzer.buildGroups(_contacts);

  @override
  Future<void> save(Contact contact) async {}

  @override
  Future<void> saveMerged(Contact mergedContact, {required List<String> deleteIds}) async {}

  @override
  Future<List<Contact>> search(String query) async => _contacts;
}

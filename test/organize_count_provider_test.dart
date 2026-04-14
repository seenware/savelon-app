import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart' as cdate;
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/organize/presentation/providers/organize_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Contact _contact(String id, String firstName) {
  return Contact(
    id: id,
    prefix: '',
    firstName: firstName,
    middleName: '',
    lastName: 'Doe',
    suffix: '',
    nickname: '',
    company: '',
    department: '',
    jobTitle: '',
    phones: const <Phone>[],
    emails: const <Email>[],
    addresses: const <Address>[],
    links: const <Link>[],
    dates: const <cdate.Date>[],
    note: '',
  );
}

void main() {
  test('organizeCountProvider returns visible groups count', () {
    final groups = <DuplicateGroup>[
      DuplicateGroup(
        id: 'g1',
        contacts: [_contact('1', 'A'), _contact('2', 'B')],
        topScore: 0.8,
        pairs: const [],
      ),
      DuplicateGroup(
        id: 'g2',
        contacts: [_contact('3', 'C'), _contact('4', 'D')],
        topScore: 0.7,
        pairs: const [],
      ),
    ];

    final container = ProviderContainer(
      overrides: [
        visibleDuplicateGroupsProvider.overrideWith((ref) => AsyncData(groups)),
      ],
    );
    addTearDown(container.dispose);

    final countAsync = container.read(organizeCountProvider);
    expect(countAsync.value, 2);
  });
}

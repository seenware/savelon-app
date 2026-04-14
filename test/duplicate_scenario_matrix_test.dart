import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart' as cdate;
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:flutter_test/flutter_test.dart';

Contact _contact({
  required String id,
  String firstName = '',
  String middleName = '',
  String lastName = '',
  String nickname = '',
  String note = '',
  List<Phone> phones = const [],
  List<Email> emails = const [],
  List<Link> links = const [],
}) {
  return Contact(
    id: id,
    prefix: '',
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    suffix: '',
    nickname: nickname,
    company: '',
    department: '',
    jobTitle: '',
    phones: phones,
    emails: emails,
    addresses: const <Address>[],
    links: links,
    dates: const <cdate.Date>[],
    note: note,
  );
}

class _Scenario {
  final String name;
  final Contact left;
  final Contact right;
  final bool shouldGroup;
  final List<String> expectedSignals;

  const _Scenario({
    required this.name,
    required this.left,
    required this.right,
    required this.shouldGroup,
    this.expectedSignals = const [],
  });
}

void main() {
  group('Duplicate scenario matrix', () {
    const analyzer = ContactDuplicateAnalyzer();
    const threshold = 0.42;

    final cases = <_Scenario>[
      _Scenario(
        name: 'name parts moved to nickname',
        left: _contact(id: '1', firstName: 'abc', lastName: 'def'),
        right: _contact(id: '2', nickname: 'def abc'),
        shouldGroup: true,
        expectedSignals: ['name_profile_match'],
      ),
      _Scenario(
        name: 'typo in phone with name support',
        left: _contact(
          id: '1',
          firstName: 'Mila',
          lastName: 'Stone',
          phones: const [Phone(label: 'mobile', number: '+14155550001')],
        ),
        right: _contact(
          id: '2',
          firstName: 'Mila',
          lastName: 'Stone',
          phones: const [Phone(label: 'home', number: '+14155550002')],
        ),
        shouldGroup: true,
        expectedSignals: ['phone_near_digits'],
      ),
      _Scenario(
        name: 'identifier hidden in notes',
        left: _contact(
          id: '1',
          note: 'legacy notes: owner@contoso.com and +44 20 1234 5678',
        ),
        right: _contact(
          id: '2',
          note: 'imported: owner@contoso.com, 442012345678',
        ),
        shouldGroup: true,
        expectedSignals: ['note_email_overlap', 'note_phone_overlap'],
      ),
      _Scenario(
        name: 'profile link canonicalization',
        left: _contact(
          id: '1',
          links: const [Link(label: 'x', url: 'https://www.linkedin.com/in/john-doe/')],
        ),
        right: _contact(
          id: '2',
          links: const [Link(label: 'x', url: 'linkedin.com/in/john-doe')],
        ),
        shouldGroup: true,
        expectedSignals: ['profile_identifier_overlap'],
      ),
      _Scenario(
        name: 'cyrillic latin transliteration',
        left: _contact(id: '1', firstName: 'Влад', lastName: 'Олексенко'),
        right: _contact(id: '2', firstName: 'Vlad', lastName: 'Oleksenko'),
        shouldGroup: true,
      ),
      _Scenario(
        name: 'generic noise text should not group',
        left: _contact(id: '1', note: 'met at conference and chatted'),
        right: _contact(id: '2', note: 'met at conference and chatted'),
        shouldGroup: false,
      ),
      _Scenario(
        name: 'rich but unrelated contacts should not group',
        left: _contact(
          id: '1',
          firstName: 'Alice',
          lastName: 'Rivera',
          phones: const [Phone(label: 'mobile', number: '+14150001111')],
          emails: const [Email(label: 'work', address: 'alice@a.com')],
          links: const [Link(label: 'site', url: 'github.com/alice')],
        ),
        right: _contact(
          id: '2',
          firstName: 'Bob',
          lastName: 'Carter',
          phones: const [Phone(label: 'mobile', number: '+14159992222')],
          emails: const [Email(label: 'work', address: 'bob@b.com')],
          links: const [Link(label: 'site', url: 'github.com/bob')],
        ),
        shouldGroup: false,
      ),
    ];

    for (final scenario in cases) {
      test(scenario.name, () {
        final confidence = analyzer.scorePair(scenario.left, scenario.right);
        final groups = analyzer.buildGroups(
          [scenario.left, scenario.right],
          threshold: threshold,
        );

        expect(groups.isNotEmpty, scenario.shouldGroup);
        for (final signal in scenario.expectedSignals) {
          expect(confidence.signals, contains(signal));
        }
      });
    }
  });
}

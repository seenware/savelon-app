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
  String prefix = '',
  String firstName = '',
  String middleName = '',
  String lastName = '',
  String suffix = '',
  String nickname = '',
  String company = '',
  List<Phone> phones = const [],
  List<Email> emails = const [],
  List<Link> links = const [],
  String note = '',
}) {
  return Contact(
    id: id,
    prefix: prefix,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    suffix: suffix,
    nickname: nickname,
    company: company,
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

void main() {
  group('ContactDuplicateAnalyzer', () {
    const analyzer = ContactDuplicateAnalyzer();

    test('scores identical names and phone overlap as strong confidence', () {
      final left = _contact(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        phones: const [Phone(label: 'mobile', number: '+1 555 123')],
      );
      final right = _contact(
        id: '2',
        firstName: 'John',
        lastName: 'Doe',
        phones: const [Phone(label: 'home', number: '1555123')],
      );

      final confidence = analyzer.scorePair(left, right);

      expect(confidence.score, greaterThanOrEqualTo(0.8));
      expect(confidence.signals, contains('name_exact_full'));
      expect(confidence.signals, contains('phone_exact_digits'));
    });

    test('builds a single group for connected duplicate graph', () {
      final a = _contact(
        id: 'a',
        firstName: 'Mia',
        lastName: 'Stone',
        company: 'Co',
        emails: const [Email(label: 'work', address: 'mia@co.com')],
      );
      final b = _contact(
        id: 'b',
        firstName: 'Mia',
        lastName: 'Stone',
        company: 'Co',
        phones: const [Phone(label: 'mobile', number: '555111')],
      );
      final c = _contact(
        id: 'c',
        firstName: 'Mia',
        lastName: 'Stone',
        company: 'Co',
        emails: const [Email(label: 'home', address: 'mia@co.com')],
      );

      final groups = analyzer.buildGroups([a, b, c], threshold: 0.42);

      expect(groups, hasLength(1));
      expect(groups.first.contacts.map((e) => e.id).toSet(), {'a', 'b', 'c'});
    });

    test('treats same short phone with dissimilar names as duplicate', () {
      final left = _contact(
        id: '1',
        firstName: 'Alice',
        lastName: 'Zhang',
        phones: const [Phone(label: 'mobile', number: '13')],
      );
      final right = _contact(
        id: '2',
        firstName: 'Robert',
        lastName: 'Carter',
        phones: const [Phone(label: 'work', number: '13')],
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.68));
      expect(confidence.signals, contains('phone_exact_digits'));
      expect(confidence.signals, contains('phone_strong_identifier'));
      expect(groups, hasLength(1));
    });

    test('treats same email with dissimilar names as duplicate', () {
      final left = _contact(
        id: '1',
        firstName: 'Alice',
        lastName: 'Zhang',
        emails: const [Email(label: 'work', address: 'shared@domain.com')],
      );
      final right = _contact(
        id: '2',
        firstName: 'Robert',
        lastName: 'Carter',
        emails: const [Email(label: 'home', address: 'SHARED@domain.com')],
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.68));
      expect(confidence.signals, contains('email_overlap'));
      expect(confidence.signals, contains('email_strong_identifier'));
      expect(groups, hasLength(1));
    });

    test('matches historical overlap across multi-value identifiers', () {
      final left = _contact(
        id: '1',
        firstName: 'Alice',
        lastName: 'Taylor',
        phones: const [
          Phone(label: 'old', number: '13'),
          Phone(label: 'new', number: '+1 415 555 1212'),
        ],
        emails: const [
          Email(label: 'old', address: 'alice.old@x.com'),
          Email(label: 'new', address: 'alice.new@x.com'),
        ],
      );
      final right = _contact(
        id: '2',
        firstName: 'A.',
        lastName: 'T',
        phones: const [Phone(label: 'legacy', number: '13')],
        emails: const [Email(label: 'legacy', address: 'alice.old@x.com')],
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.68));
      expect(confidence.signals, contains('phone_exact_digits'));
      expect(confidence.signals, contains('email_overlap'));
      expect(groups, hasLength(1));
    });

    test('treats exact first-name-only records as duplicate baseline', () {
      final left = _contact(id: '1', firstName: 'Uniquefirst');
      final right = _contact(id: '2', firstName: 'Uniquefirst');

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(confidence.signals, contains('name_exact_full'));
      expect(confidence.signals, contains('name_exact_duplicate_baseline'));
      expect(groups, hasLength(1));
    });

    test('treats reordered full-name tokens as duplicate', () {
      final left = _contact(id: '1', firstName: 'John', lastName: 'Doe');
      final right = _contact(id: '2', firstName: 'Doe', lastName: 'John');

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(confidence.signals, contains('name_token_set_exact'));
      expect(groups, hasLength(1));
    });

    test('matches gmail aliases with dot and plus variants', () {
      final left = _contact(
        id: '1',
        emails: const [Email(label: 'work', address: 'john.doe+sales@gmail.com')],
      );
      final right = _contact(
        id: '2',
        emails: const [Email(label: 'home', address: 'johndoe@googlemail.com')],
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.68));
      expect(confidence.signals, contains('email_overlap'));
      expect(confidence.signals, contains('email_strong_identifier'));
      expect(groups, hasLength(1));
    });

    test('matches reordered full-name and nickname profile', () {
      final left = _contact(
        id: '1',
        firstName: 'abc',
        lastName: 'def',
      );
      final right = _contact(
        id: '2',
        nickname: 'def abc',
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(confidence.signals, contains('name_profile_match'));
      expect(groups, hasLength(1));
    });

    test('matches nickname-only reordered tokens on both contacts', () {
      final left = _contact(id: '1', nickname: 'john doe');
      final right = _contact(id: '2', nickname: 'doe john');

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(confidence.signals, contains('name_profile_match'));
      expect(groups, hasLength(1));
    });

    test('matches cyrillic and latin forms when identifiers are absent', () {
      final left = _contact(id: '1', firstName: 'Влад', lastName: 'Олексенко');
      final right = _contact(id: '2', firstName: 'Vlad', lastName: 'Oleksenko');

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(groups, hasLength(1));
    });

    test('matches phone and email extracted from notes', () {
      final left = _contact(
        id: '1',
        firstName: 'Legacy',
        note: 'Old profile. Reach at +1 (415) 555-9999 and user@mail.com',
      );
      final right = _contact(
        id: '2',
        firstName: 'New',
        note: 'Contact: 14155559999, USER@mail.com',
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.signals, contains('note_phone_overlap'));
      expect(confidence.signals, contains('note_email_overlap'));
      expect(confidence.score, greaterThanOrEqualTo(0.42));
      expect(groups, hasLength(1));
    });

    test('does not match generic note text alone', () {
      final left = _contact(
        id: '1',
        firstName: 'Alice',
        note: 'Met at conference. Follow up next month.',
      );
      final right = _contact(
        id: '2',
        firstName: 'Bob',
        note: 'Met at conference. Follow up next month.',
      );

      final confidence = analyzer.scorePair(left, right);
      final groups = analyzer.buildGroups([left, right], threshold: 0.42);

      expect(confidence.score, lessThan(0.42));
      expect(groups, isEmpty);
    });
  });
}

import 'package:contacts/features/main_app/contacts/domain/contact_duplicates.dart';
import 'package:contacts/features/main_app/contacts/domain/duplicate_thresholds.dart';
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
  String lastName = '',
  String company = '',
  List<Phone> phones = const [],
  List<Email> emails = const [],
}) {
  return Contact(
    id: id,
    prefix: '',
    firstName: firstName,
    middleName: '',
    lastName: lastName,
    suffix: '',
    nickname: '',
    company: company,
    department: '',
    jobTitle: '',
    phones: phones,
    emails: emails,
    addresses: const <Address>[],
    links: const <Link>[],
    dates: const <cdate.Date>[],
    note: '',
  );
}

void main() {
  group('Duplicate confidence calibration', () {
    const analyzer = ContactDuplicateAnalyzer();

    test('confidence rises when additional fields match', () {
      final baseA = _contact(id: 'a', firstName: 'Jon', lastName: 'Doe');
      final baseB = _contact(id: 'b', firstName: 'John', lastName: 'Doe');
      final withPhoneA = baseA.copyWith(
        phones: const [Phone(label: 'mobile', number: '+14155551212')],
      );
      final withPhoneB = baseB.copyWith(
        phones: const [Phone(label: 'home', number: '4155551212')],
      );
      final withEmailA = withPhoneA.copyWith(
        emails: const [Email(label: 'work', address: 'jon@x.com')],
      );
      final withEmailB = withPhoneB.copyWith(
        emails: const [Email(label: 'home', address: 'jon@x.com')],
      );

      final low = analyzer.scorePair(baseA, baseB).score;
      final mid = analyzer.scorePair(withPhoneA, withPhoneB).score;
      final high = analyzer.scorePair(withEmailA, withEmailB).score;

      expect(mid, greaterThan(low));
      expect(high, greaterThan(mid));
    });

    test('exact phone or email alone reaches strong confidence threshold', () {
      final phoneA = _contact(
        id: 'a',
        firstName: 'Alice',
        lastName: 'Zhang',
        phones: const [Phone(label: 'mobile', number: '13')],
      );
      final phoneB = _contact(
        id: 'b',
        firstName: 'Robert',
        lastName: 'Carter',
        phones: const [Phone(label: 'home', number: '13')],
      );
      final emailA = _contact(
        id: 'c',
        firstName: 'Alice',
        lastName: 'Zhang',
        emails: const [Email(label: 'work', address: 'same@x.com')],
      );
      final emailB = _contact(
        id: 'd',
        firstName: 'Robert',
        lastName: 'Carter',
        emails: const [Email(label: 'home', address: 'same@x.com')],
      );

      final phoneScore = analyzer.scorePair(phoneA, phoneB).score;
      final emailScore = analyzer.scorePair(emailA, emailB).score;

      expect(phoneScore, greaterThanOrEqualTo(DuplicateThresholds.strongEdgeThreshold));
      expect(emailScore, greaterThanOrEqualTo(DuplicateThresholds.strongEdgeThreshold));
    });
  });
}

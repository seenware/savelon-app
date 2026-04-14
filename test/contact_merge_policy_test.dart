import 'package:contacts/features/main_app/contacts/domain/contact_merge_policy.dart';
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
  String company = '',
  String note = '',
  List<Phone> phones = const [],
  List<Email> emails = const [],
}) {
  return Contact(
    id: id,
    prefix: '',
    firstName: firstName,
    middleName: '',
    lastName: '',
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
    note: note,
  );
}

void main() {
  group('ContactMergePolicy', () {
    const policy = ContactMergePolicy();

    test('prefers more complete contact first', () {
      final rich = _contact(
        id: 'rich',
        firstName: 'Alice',
        company: 'ACME',
        note: 'main',
        phones: const [Phone(label: 'mobile', number: '111')],
        emails: const [Email(label: 'work', address: 'alice@acme.com')],
      );
      final sparse = _contact(id: 'sparse', firstName: 'A.');

      final merged = policy.mergeAsDraft([sparse, rich]);

      expect(merged.firstName, 'Alice (A.)');
      expect(merged.company, 'ACME');
    });

    test('deduplicates list records by normalized values', () {
      final a = _contact(
        id: 'a',
        phones: const [Phone(label: 'mobile', number: '+1 (555) 222')],
        emails: const [Email(label: 'home', address: 'A@x.com')],
      );
      final b = _contact(
        id: 'b',
        phones: const [Phone(label: 'work', number: '1555222')],
        emails: const [Email(label: 'work', address: 'a@x.com')],
      );

      final merged = policy.mergeAsDraft([a, b]);

      expect(merged.phones, hasLength(1));
      expect(merged.emails, hasLength(1));
    });
  });
}

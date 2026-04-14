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
  required String firstName,
  required String lastName,
  required String phone,
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
    phones: [Phone(label: 'mobile', number: phone)],
    emails: [Email(label: 'work', address: email)],
    addresses: const <Address>[],
    links: const <Link>[],
    dates: const <cdate.Date>[],
    note: '',
  );
}

void main() {
  group('Duplicate grouping', () {
    const analyzer = ContactDuplicateAnalyzer();

    test('groups ten similar contacts into one component', () {
      final contacts = List<Contact>.generate(10, (index) {
        return _contact(
          id: '$index',
          firstName: 'Jon',
          lastName: 'Doe',
          phone: '+1 415 555 12${index.toString().padLeft(2, '0')}',
          email: 'jon.doe+$index@example.com',
        );
      });

      final anchored = contacts
          .map(
            (c) => c.copyWith(
              phones: [
                const Phone(label: 'mobile', number: '+1 415 555 1212'),
                ...c.phones,
              ],
            ),
          )
          .toList();

      final groups = analyzer.buildGroups(anchored, threshold: 0.48);

      expect(groups, hasLength(1));
      expect(groups.first.contacts, hasLength(10));
      expect(groups.first.pairs.any((pair) => pair.isStrongEdge), isTrue);
    });

    test('builds stable group IDs regardless of input order', () {
      final a = _contact(
        id: 'a',
        firstName: 'Jon',
        lastName: 'Doe',
        phone: '+1 415 555 1200',
        email: 'jon.a@example.com',
      );
      final b = _contact(
        id: 'b',
        firstName: 'John',
        lastName: 'Doe',
        phone: '+1 415 555 1200',
        email: 'john.b@example.com',
      );
      final c = _contact(
        id: 'c',
        firstName: 'J.',
        lastName: 'Doe',
        phone: '+1 415 555 1200',
        email: 'j.c@example.com',
      );

      final groups1 = analyzer.buildGroups([a, b, c], threshold: 0.42);
      final groups2 = analyzer.buildGroups([c, a, b], threshold: 0.42);

      expect(groups1, hasLength(1));
      expect(groups2, hasLength(1));
      expect(groups1.first.id, groups2.first.id);
    });
  });
}

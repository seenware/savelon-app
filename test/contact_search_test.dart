import 'package:contacts/core/utils/contact_search.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContactSearch matching', () {
    test('digit query matches one-digit-off phone', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [Phone(label: 'mobile', number: '+491516734')],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      expect(ContactSearch.matches(contact, '491516744'), isTrue);
    });

    test('plus-prefixed query does not disable distance-1 matching', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [Phone(label: 'mobile', number: '+491516734')],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      expect(ContactSearch.matches(contact, '+491516744'), isTrue);
    });

    test('very short queries are exact-only', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [Phone(label: 'mobile', number: '+123456')],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // Query differs by 1 digit, but length < 7 => allowed edits = 0.
      expect(ContactSearch.matches(contact, '123457'), isFalse);
    });

    test('10-digit queries allow distance 2', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [Phone(label: 'mobile', number: '+1234567890')],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // Differs by 2 substitutions in the last 2 digits.
      expect(ContactSearch.matches(contact, '1234567801'), isTrue);
    });

    test('10-digit queries do not allow distance 3', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [Phone(label: 'mobile', number: '+1234567890')],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // Differs by 3 substitutions in the last 3 digits.
      expect(ContactSearch.matches(contact, '1234567002'), isFalse);
    });

    test('name typo matching still allows distance 1', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: 'Smith',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // "Smoth" vs "Smith" is a typical 1-edit typo for this fuzzy matcher.
      expect(ContactSearch.matches(contact, 'Smoth'), isTrue);
    });

    test('name fuzzy matching allows distance 2 for longer tokens', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: 'Alexander',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // "Alexamber" differs from "Alexander" by two substitutions.
      expect(ContactSearch.matches(contact, 'Alexamber'), isTrue);
    });

    test('name fuzzy matching does not allow distance 2 for short tokens', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: 'Smith',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // Query length < 7 => allowed edits = 1.
      // "Smiht" is a common 2-edit typo for "Smith".
      expect(ContactSearch.matches(contact, 'Smiht'), isFalse);
    });

    test('fuzzy matching works for company names', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: 'Samsung',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // "Samdung" differs by one substitution from "Samsung".
      expect(ContactSearch.matches(contact, 'Samdung'), isTrue);
    });

    test('fuzzy matching works for email tokens', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [Email(label: 'work', address: 'john@gmail.com')],
        addresses: [],
        links: [],
        dates: [],
        note: '',
      );

      // "gmaill" is a common typo for "gmail".
      expect(ContactSearch.matches(contact, 'gmaill'), isTrue);
    });

    test('fuzzy matching works for free-form notes', () {
      const contact = Contact(
        id: 'c1',
        prefix: '',
        firstName: '',
        middleName: '',
        lastName: '',
        suffix: '',
        nickname: '',
        company: '',
        department: '',
        jobTitle: '',
        phones: [],
        emails: [],
        addresses: [],
        links: [],
        dates: [],
        note: 'Project Apollo',
      );

      expect(ContactSearch.matches(contact, 'Apoloo'), isTrue);
    });
  });
}


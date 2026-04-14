import 'package:contacts/features/main_app/contacts/domain/contact_sectioning.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/address.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/date.dart' as cdate;
import 'package:contacts/features/main_app/contacts/domain/entities/email.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/link.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/phone.dart';
import 'package:flutter_test/flutter_test.dart';

Contact _contactWithSortKey(String value) {
  return Contact(
    id: 'id-$value',
    prefix: '',
    firstName: value,
    middleName: '',
    lastName: '',
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
  group('ContactSectioning.sectionKeyForContact', () {
    test('returns uppercase Latin and keeps accented Latin letters', () {
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('alice')),
        'A',
      );
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('özil')),
        'Ö',
      );
    });

    test('returns Cyrillic and Greek first letters as section keys', () {
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('борис')),
        'Б',
      );
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('γιάννης')),
        'Γ',
      );
    });

    test('returns # for digits, symbols, and empty keys', () {
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('1alpha')),
        nonLetterSectionKey,
      );
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('@alpha')),
        nonLetterSectionKey,
      );
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('')),
        nonLetterSectionKey,
      );
    });

    test('returns non-Latin letter scripts as own keys', () {
      expect(
        ContactSectioning.sectionKeyForContact(_contactWithSortKey('中村')),
        '中',
      );
    });
  });

  group('ContactSectioning.compareSectionKeys', () {
    test('sorts by fixed script order with # always last', () {
      final keys = <String>['#', 'Б', 'A', 'Γ', '中'];
      keys.sort(ContactSectioning.compareSectionKeys);

      expect(keys, <String>['A', 'Б', 'Γ', '中', '#']);
    });
  });
}

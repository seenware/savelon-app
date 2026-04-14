import 'package:contacts/l10n/app_localizations.dart';

enum FieldKind { phone, email, address, link, date }

/// Maps persisted type strings (see [ContactFieldTypes]) to localized labels.
String localizedFieldType(
  AppLocalizations l10n,
  String stored,
  FieldKind kind,
) {
  switch (stored) {
    case 'mobile':
      return l10n.phoneTypeMobile;
    case 'home':
      return l10n.phoneTypeHome;
    case 'work':
      return switch (kind) {
        FieldKind.phone => l10n.phoneTypeWork,
        FieldKind.email => l10n.emailTypeWork,
        _ => stored,
      };
    case 'school':
      return switch (kind) {
        FieldKind.phone => l10n.phoneTypeSchool,
        FieldKind.email => l10n.emailTypeSchool,
        _ => stored,
      };
    case 'other':
      return switch (kind) {
        FieldKind.phone => l10n.phoneTypeOther,
        FieldKind.email => l10n.emailTypeOther,
        FieldKind.link => l10n.linkTypeOther,
        FieldKind.date => l10n.dateTypeOther,
        _ => stored,
      };
    case 'Other':
      return switch (kind) {
        FieldKind.link => l10n.linkTypeOther,
        FieldKind.date => l10n.dateTypeOther,
        _ => stored,
      };
    case 'personal':
      return l10n.emailTypePersonal;
    case 'Website':
      return l10n.linkTypeWebsite;
    case 'LinkedIn':
      return l10n.linkTypeLinkedIn;
    case 'X':
      return l10n.linkTypeX;
    case 'Facebook':
      return l10n.linkTypeFacebook;
    case 'Instagram':
      return l10n.linkTypeInstagram;
    case 'Home':
      return l10n.addressTypeHome;
    case 'Work':
      return l10n.addressTypeWork;
    case 'School':
      return l10n.addressTypeSchool;
    case 'Birth':
      return l10n.addressTypeBirth;
    case 'Created':
      return l10n.dateTypeCreated;
    case 'Birthday':
      return l10n.dateTypeBirthday;
    case 'Met':
      return l10n.dateTypeMet;
    case 'Graduation':
      return l10n.dateTypeGraduation;
    case 'Marriage':
      return l10n.dateTypeMarriage;
    default:
      return stored;
  }
}

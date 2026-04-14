// lib/features/main_app/contacts/presentation/contact_details/utils/contact_display_helpers.dart

import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';

class ContactDisplayHelpers {
  ContactDisplayHelpers._();

  static String getFullName(Contact contact) {
    final parts = [
      if (contact.prefix.isNotEmpty) contact.prefix,
      if (contact.firstName.isNotEmpty) contact.firstName,
      if (contact.middleName.isNotEmpty) contact.middleName,
      if (contact.lastName.isNotEmpty) contact.lastName,
      if (contact.suffix.isNotEmpty) contact.suffix,
    ];
    return parts.join(' ').trim();
  }

  static String getInitials(Contact contact) {
    String initials = '';

    if (contact.firstName.isNotEmpty) {
      initials += contact.firstName[0].toUpperCase();
    }

    if (contact.lastName.isNotEmpty) {
      initials += contact.lastName[0].toUpperCase();
    }

    if (initials.isEmpty && contact.nickname.isNotEmpty) {
      initials = contact.nickname[0].toUpperCase();
    }

    if (initials.isEmpty && contact.company.isNotEmpty) {
      initials = contact.company[0].toUpperCase();
    }

    return initials.isEmpty ? '?' : initials;
  }
}

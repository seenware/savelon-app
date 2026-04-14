// lib/features/main_app/contacts/presentation/contact_form/hooks/use_form_initialization.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:contacts/features/main_app/contacts/domain/entities/contact.dart';
import '../../../domain/constants/field_types.dart';
import '../controllers/records_controller.dart';
import '../utils/date_field_helper.dart';
import 'use_contact_form_state.dart';

void useFormInitialization({
  required BuildContext context,
  required Contact? contact,
  required bool isEditing,
  required RecordsController phoneController,
  required RecordsController emailController,
  required RecordsController addressController,
  required RecordsController linkController,
  required RecordsController dateController,
  required ContactFormState formState,
}) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isEditing) {
        _initializeEditMode(
          context,
          contact!,
          phoneController,
          emailController,
          addressController,
          linkController,
          dateController,
        );
      } else {
        _initializeCreateMode(context, phoneController, dateController);
      }

      // Capture initial state AFTER initialization
      WidgetsBinding.instance.addPostFrameCallback((_) {
        formState.captureInitialState();
      });
    });

    return null;
  }, [context]);
}

void _initializeEditMode(
  BuildContext context,
  Contact contact,
  RecordsController phoneController,
  RecordsController emailController,
  RecordsController addressController,
  RecordsController linkController,
  RecordsController dateController,
) {
  // Phones
  if (contact.phones.isNotEmpty) {
    for (final phone in contact.phones) {
      phoneController.addWithData(
        initialText: phone.number,
        initialType: phone.label,
      );
    }
  } else {
    phoneController.add();
  }

  // Emails
  if (contact.emails.isNotEmpty) {
    for (final email in contact.emails) {
      emailController.addWithData(
        initialText: email.address,
        initialType: email.label,
      );
    }
  }

  // Addresses
  if (contact.addresses.isNotEmpty) {
    for (final address in contact.addresses) {
      addressController.addWithData(
        initialText: address.address,
        initialType: address.label,
      );
    }
  }

  // Links
  if (contact.links.isNotEmpty) {
    for (final link in contact.links) {
      linkController.addWithData(
        initialText: link.url,
        initialType: link.label,
      );
    }
  }

  // Dates
  final localeName = Localizations.localeOf(context).toString();
  final dateFmt = DateFormat(DateFieldHelper.dateFormat, localeName);
  if (contact.dates.isNotEmpty) {
    for (final date in contact.dates) {
      dateController.addWithData(
        initialText: dateFmt.format(date.date),
        initialType: date.label,
      );
    }
  }
}

void _initializeCreateMode(
  BuildContext context,
  RecordsController phoneController,
  RecordsController dateController,
) {
  final localeName = Localizations.localeOf(context).toString();
  final dateFmt = DateFormat(DateFieldHelper.dateFormat, localeName);
  // Create mode: one empty phone
  phoneController.add();

  // Add today's date with "created" label
  dateController.addWithData(
    initialText: dateFmt.format(DateTime.now()),
    initialType: ContactFieldTypes.date[0],
  );
}

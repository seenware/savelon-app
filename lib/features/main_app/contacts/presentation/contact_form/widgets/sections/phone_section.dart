// lib/features/main_app/contacts/presentation/contact_form/widgets/sections/phone_section.dart

import 'package:contacts/core/utils/phone_formatter.dart';
import 'package:contacts/features/main_app/contacts/domain/constants/field_types.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class PhoneSection extends StatelessWidget {
  const PhoneSection({super.key, required this.controller});

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomField(
      recordsController: controller,
      addButtonLabel: l10n.formAddPhone,
      hintText: l10n.formHintPhoneNumber,
      types: ContactFieldTypes.phone,
      fieldKind: FieldKind.phone,
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [PhoneInputFormatter()],
    );
  }
}

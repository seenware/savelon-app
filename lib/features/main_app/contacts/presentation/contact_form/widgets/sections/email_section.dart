import 'package:contacts/features/main_app/contacts/domain/constants/field_types.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class EmailSection extends StatelessWidget {
  final dynamic controller;

  const EmailSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomField(
      recordsController: controller,
      addButtonLabel: l10n.formAddEmail,
      hintText: l10n.formHintEmail,
      types: ContactFieldTypes.email,
      fieldKind: FieldKind.email,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
    );
  }
}

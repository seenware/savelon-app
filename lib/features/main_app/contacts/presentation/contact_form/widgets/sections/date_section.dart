import 'package:contacts/features/main_app/contacts/domain/constants/field_types.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class DateSection extends StatelessWidget {
  final dynamic controller;

  const DateSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomField(
      isDate: true,
      recordsController: controller,
      addButtonLabel: l10n.formAddDate,
      hintText: l10n.formHintSelectDate,
      types: ContactFieldTypes.date,
      fieldKind: FieldKind.date,
    );
  }
}

// lib/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/records_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'add_field_button.dart';

class CustomField extends HookWidget {
  final RecordsController recordsController;
  final String addButtonLabel;
  final String hintText;
  final List<String> types;
  final bool isDate;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FieldKind fieldKind;

  const CustomField({
    super.key,
    required this.recordsController,
    required this.addButtonLabel,
    required this.hintText,
    required this.types,
    required this.fieldKind,
    this.isDate = false,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final records = useListenable(recordsController.records);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // Animated List with MediaQuery padding removed
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: AnimatedList(
                    key: recordsController.listKey,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    initialItemCount: records.value.length,
                    itemBuilder: (context, index, animation) {
                      if (index >= records.value.length) {
                        return const SizedBox.shrink();
                      }
                      return CustomFieldItem(
                        recordsController: recordsController,
                        index: index,
                        totalItems: records.value.length,
                        animation: animation,
                        hintText: hintText,
                        types: types,
                        fieldKind: fieldKind,
                        isDate: isDate,
                        keyboardType: keyboardType,
                        textCapitalization: textCapitalization,
                        inputFormatters: inputFormatters,
                      );
                    },
                  ),
                ),

                if (records.value.isNotEmpty) const SizedBox(height: 8),
                AddFieldButton(
                  onPressed: recordsController.add,
                  label: addButtonLabel,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

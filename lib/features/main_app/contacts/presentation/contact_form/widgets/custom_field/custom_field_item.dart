// lib/features/main_app/contacts/presentation/contact_form/widgets/custom_field/custom_field_item.dart

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/records_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/utils/field_type_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/date_input_field.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/remove_button.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/custom_field/type_selector.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFieldItem extends StatelessWidget {
  final RecordsController recordsController;
  final int index;
  final int totalItems;
  final Animation<double> animation;
  final String hintText;
  final List<String> types;
  final FieldKind fieldKind;
  final bool isDate;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const CustomFieldItem({
    super.key,
    required this.recordsController,
    required this.index,
    required this.totalItems,
    required this.animation,
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
    final record = recordsController.records.value[index];
    final isLastItem = index == totalItems - 1;

    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(0, -0.3),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Remove button on the left
                  RemoveButton(
                    onPressed: () => recordsController.remove(index),
                  ),
                  const SizedBox(width: 12),

                  // Type selector
                  TypeSelector(
                    types: types,
                    fieldKind: fieldKind,
                    onSelected: (String type) {
                      recordsController.updateType(index, type);
                    },
                    selectedType: record.type,
                  ),
                  const SizedBox(width: 12),

                  // Input field
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: _buildInputField(),
                    ),
                  ),
                ],
              ),

              // Divider with left padding - hide for last item
              if (!isLastItem)
                Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    final controller =
        recordsController.records.value[index].textEditingController;

    if (isDate) {
      return DateInputField(controller: controller, hintText: hintText);
    }

    return Input(
      controller: controller,
      hintText: hintText,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: inputFormatters,
    );
  }
}

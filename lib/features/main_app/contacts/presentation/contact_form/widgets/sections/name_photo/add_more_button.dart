import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';
import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/sections/name_photo/other_fields_dialog.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddMoreButton extends HookWidget {
  final NameFieldsController nameFieldsController;

  final void Function(Set<NameFieldType> removedFields)? onFieldsHidden;

  const AddMoreButton({
    super.key,
    required this.nameFieldsController,
    this.onFieldsHidden,
  });

  void _handleFieldSelection(BuildContext context) async {
    final previousVisible = nameFieldsController.visibleNameFields.value;

    final result = await showOtherFieldsDialog(
      context,
      previousVisible,
    );

    if (result != null) {
      final removedFields = previousVisible.difference(result);
      nameFieldsController.setVisibleNameFields(result);

      if (removedFields.isNotEmpty) {
        onFieldsHidden?.call(removedFields);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextButton.icon(
      onPressed: () => _handleFieldSelection(context),
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      icon: const Icon(Icons.add_rounded),
      label: Text(l10n.addMore),
    );
  }
}

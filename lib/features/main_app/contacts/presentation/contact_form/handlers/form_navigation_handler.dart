import 'package:contacts/features/main_app/contacts/presentation/contact_form/widgets/unsaved_changes_dialog.dart';
import 'package:flutter/material.dart';

class FormNavigationHandler {
  final ValueNotifier<bool> hasUnsavedChanges;

  FormNavigationHandler({required this.hasUnsavedChanges});

  Future<void> handleClose(BuildContext context) async {
    if (hasUnsavedChanges.value) {
      final shouldDiscard = await showUnsavedChangesDialog(context);
      if (shouldDiscard == true && context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> handlePopWithUnsavedChanges(BuildContext context) async {
    final shouldDiscard = await showUnsavedChangesDialog(context);
    if (shouldDiscard == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

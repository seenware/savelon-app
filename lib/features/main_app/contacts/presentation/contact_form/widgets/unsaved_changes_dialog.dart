import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

/// Shows a confirmation dialog when user tries to close the form with unsaved changes
Future<bool?> showUnsavedChangesDialog(BuildContext context) {
  final l10n = context.l10n;
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(l10n.discardChangesTitle),
        content: Text(l10n.discardChangesBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.commonDiscard),
          ),
        ],
      );
    },
  );
}

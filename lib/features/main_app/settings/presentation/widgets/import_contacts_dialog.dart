// features/main_app/settings/presentation/widgets/import_contacts_dialog.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class ImportContactsDialog extends StatelessWidget {
  final int contactCount;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ImportContactsDialog({
    super.key,
    required this.contactCount,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.importDialogTitle),
      content: Text(
        l10n.importContactsConfirmBody(contactCount),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(onPressed: onCancel, child: Text(l10n.commonNo)),
        FilledButton(onPressed: onConfirm, child: Text(l10n.commonYes)),
      ],
    );
  }

  static Future<bool?> show(BuildContext context, int contactCount) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ImportContactsDialog(
        contactCount: contactCount,
        onConfirm: () => Navigator.of(context).pop(true),
        onCancel: () => Navigator.of(context).pop(false),
      ),
    );
  }
}

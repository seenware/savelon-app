import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

Future<bool?> showNoNameDialog(BuildContext context) {
  final l10n = context.l10n;
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(l10n.noNameTitle),
        content: Text(l10n.noNameBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.commonSave),
          ),
        ],
      );
    },
  );
}

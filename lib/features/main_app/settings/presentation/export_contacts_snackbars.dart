// lib/features/main_app/settings/presentation/export_contacts_snackbars.dart

import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_messages.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_provider.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

/// Shows export errors after [ExportContactsState] changes.
/// [showErrorSnackBar] can filter out errors already shown inline (e.g. password fields).
void scheduleExportContactsSnackBars(
  BuildContext context,
  ExportContactsState? previous,
  ExportContactsState next, {
  bool Function(ExportContactsError error)? showErrorSnackBar,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;

    if (exportContactsErrorIsNew(previous, next)) {
      final kind = next.error!;
      final allow = showErrorSnackBar?.call(kind) ?? true;
      if (allow) {
        final l10n = context.l10n;
        final msg = kind.localizedMessage(
          l10n,
          next.exportFailureDetail,
        );
        if (msg.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg),
              backgroundColor: Theme.of(context).colorScheme.error,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    }

  });
}

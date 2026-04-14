// lib/features/main_app/settings/presentation/widgets/export_contacts_tile.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExportContactsTile extends StatelessWidget {
  const ExportContactsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.file_upload_outlined,
        size: 20,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(context.l10n.exportContacts),
      onTap: () => context.push('/main_app/settings/export-contacts'),
    );
  }
}

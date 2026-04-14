import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_capabilities.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';

class ImportSourceDialog extends StatelessWidget {
  final List<ImportContactsSource> sources;

  const ImportSourceDialog({super.key, required this.sources});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SimpleDialog(
      title: Text(l10n.importSourceTitle),
      clipBehavior: Clip.antiAlias,
      children: sources
          .map(
            (source) => SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(source),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                children: [
                  Icon(
                    source == ImportContactsSource.deviceContacts
                        ? Icons.person
                        : Icons.description_outlined,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    source == ImportContactsSource.deviceContacts
                        ? l10n.importFromDeviceContacts
                        : l10n.importFromFileVcfZip,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  static Future<ImportContactsSource?> show(
    BuildContext context, {
    required List<ImportContactsSource> sources,
  }) {
    if (sources.isEmpty) return Future.value(null);
    if (sources.length == 1) return Future.value(sources.first);
    return showDialog<ImportContactsSource>(
      context: context,
      builder: (_) => ImportSourceDialog(sources: sources),
    );
  }
}

import 'package:contacts/features/main_app/contacts/presentation/contact_form/controllers/name_fields_controller.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OtherFieldsDialog extends StatefulWidget {
  final Set<NameFieldType> currentlyVisible;

  const OtherFieldsDialog({super.key, required this.currentlyVisible});

  @override
  State<OtherFieldsDialog> createState() => _OtherFieldsDialogState();
}

class _OtherFieldsDialogState extends State<OtherFieldsDialog> {
  late Set<NameFieldType> selectedFields;

  @override
  void initState() {
    super.initState();
    selectedFields = Set.from(widget.currentlyVisible);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final availableFields = [
      (NameFieldType.prefix, l10n.formPrefix, Icons.person_outline_rounded),
      (NameFieldType.middleName, l10n.formMiddleName, Icons.person_rounded),
      (NameFieldType.suffix, l10n.formSuffix, Icons.person_outline_rounded),
      (NameFieldType.nickname, l10n.formNickname, Icons.badge_rounded),
    ];

    return AlertDialog(
      title: Text(l10n.addNameFieldsTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: availableFields.map((field) {
            final (type, label, icon) = field;
            return CheckboxListTile(
              value: selectedFields.contains(type),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedFields.add(type);
                  } else {
                    selectedFields.remove(type);
                  }
                });
              },
              title: Row(
                children: [
                  Icon(icon, size: 20),
                  const SizedBox(width: 12),
                  Text(label),
                ],
              ),
              contentPadding: EdgeInsets.zero,
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop(selectedFields);
          },
          child: Text(l10n.commonApply),
        ),
      ],
    );
  }
}

Future<Set<NameFieldType>?> showOtherFieldsDialog(
  BuildContext context,
  Set<NameFieldType> currentlyVisible,
) {
  return showDialog<Set<NameFieldType>>(
    context: context,
    builder: (context) => OtherFieldsDialog(currentlyVisible: currentlyVisible),
  );
}

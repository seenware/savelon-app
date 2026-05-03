// lib/features/startup/setup/presentation/widgets/confirmation_checkbox.dart

import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ConfirmationCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ConfirmationCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CheckboxListTile(
      value: value,
      onChanged: (newValue) => onChanged(newValue ?? false),
      title: Text(
        l10n.setupSavedSecretKeyCheckbox,
        style: const TextStyle(fontSize: 14),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}

// lib/features/startup/setup/presentation/widgets/confirmation_checkbox.dart

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
    return CheckboxListTile(
      value: value,
      onChanged: (newValue) => onChanged(newValue ?? false),
      title: const Text(
        'I saved my secret key safely',
        style: TextStyle(fontSize: 14),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}

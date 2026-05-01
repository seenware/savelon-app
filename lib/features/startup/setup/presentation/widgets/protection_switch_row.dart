import 'package:flutter/material.dart';

class ProtectionSwitchRow extends StatelessWidget {
  const ProtectionSwitchRow({
    super.key,
    required this.label,
    required this.enabled,
    required this.value,
    this.onChanged,
  });

  final String label;
  final bool enabled;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: SwitchListTile(
        value: value,
        onChanged: enabled ? onChanged : null,
        title: Text(label, style: const TextStyle(fontSize: 20)),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProtectionSwitchRow extends StatelessWidget {
  const ProtectionSwitchRow({
    super.key,
    required this.label,
    required this.enabled,
    required this.value,
    this.optionalSuffix,
    this.onChanged,
  });

  final String label;
  final bool enabled;
  final bool value;
  final String? optionalSuffix;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: SwitchListTile(
        value: value,
        onChanged: enabled ? onChanged : null,
        title: optionalSuffix == null
            ? Text(label)
            : Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: label),
                    TextSpan(
                      text: ' $optionalSuffix',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

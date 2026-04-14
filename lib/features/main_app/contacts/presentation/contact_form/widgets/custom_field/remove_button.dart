import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      padding: const EdgeInsets.all(12),
      icon: CircleAvatar(
        backgroundColor: isDark
            ? null
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
        // : null,
        radius: 12,
        child: Icon(Icons.remove_rounded, color: Colors.white, size: 16),
      ),
      onPressed: onPressed,
    );
  }
}

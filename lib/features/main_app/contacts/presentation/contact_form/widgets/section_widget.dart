import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final List<Widget> children;

  const Section({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(children: children),
    );
  }
}

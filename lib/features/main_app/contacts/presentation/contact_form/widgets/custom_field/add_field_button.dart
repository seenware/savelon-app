import 'package:flutter/material.dart';

class AddFieldButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const AddFieldButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        splashColor: Colors.green.shade600.withValues(alpha: 0.12),
        hoverColor: Colors.green.shade600.withValues(alpha: 0.08),
        highlightColor: Colors.green.shade600.withValues(alpha: 0.15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _AddIcon(),
              const SizedBox(width: 20),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green,
      radius: 12,
      child: Icon(Icons.add_rounded, color: Colors.white, size: 16),
    );
  }
}

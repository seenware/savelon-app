// lib/core/layout/widgets/primary_button.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onDisabledPressed; // ADD THIS
  final bool isLoading;
  final IconData? icon;
  final bool enableHapticFeedback;
  final double? maxWidth;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.onDisabledPressed, // ADD THIS
    this.isLoading = false,
    this.icon,
    this.enableHapticFeedback = false,
    this.maxWidth = 400,
  });

  void _handlePress() {
    if (enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLoading) {
      const indicator = SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2.5),
      );
      final loadingBody = SizedBox(
        height: 52,
        child: Center(child: indicator),
      );
      if (maxWidth != null) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth!),
            child: loadingBody,
          ),
        );
      }
      return loadingBody;
    }

    final button = SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed != null ? _handlePress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          disabledBackgroundColor: theme.colorScheme.primary.withValues(
            alpha: 0.3,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20),
            ],
          ],
        ),
      ),
    );

    // Wrap with GestureDetector if onDisabledPressed is provided and button is disabled
    final wrappedButton = onDisabledPressed != null && onPressed == null
        ? GestureDetector(onTap: onDisabledPressed, child: button)
        : button;

    if (maxWidth != null) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: wrappedButton,
        ),
      );
    }

    return wrappedButton;
  }
}

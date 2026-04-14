// lib/features/main_app/settings/presentation/widgets/reset_app_button.dart

import 'package:contacts/core/layout/widgets/custom_theme_wrapper.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/reset/app_reset_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetAppButton extends ConsumerStatefulWidget {
  const ResetAppButton({super.key});

  @override
  ConsumerState<ResetAppButton> createState() => _ResetAppButtonState();
}

class _ResetAppButtonState extends ConsumerState<ResetAppButton> {
  bool _isResetting = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _isResetting
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.error,
              ),
            )
          : Icon(
              Icons.delete_outline,
              size: 20,
              color: Theme.of(context).colorScheme.error,
            ),
      title: Text(context.l10n.resetAppTitle),
      textColor: Theme.of(context).colorScheme.error,
      iconColor: Theme.of(context).colorScheme.error,
      enabled: !_isResetting,
      onTap: _isResetting ? null : _showResetConfirmationDialog,
    );
  }

  Future<void> _showResetConfirmationDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const _ResetConfirmationDialog(),
    );

    if (confirmed == true && mounted) {
      await _performReset();
    }
  }

  Future<void> _performReset() async {
    setState(() => _isResetting = true);

    try {
      await ref.read(appResetProvider).performReset(ref);

      if (mounted) {
        context.go('/startup/onboarding');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.resetAppError(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isResetting = false);
      }
    }
  }
}

class _ResetConfirmationDialog extends StatelessWidget {
  const _ResetConfirmationDialog();

  @override
  Widget build(BuildContext context) {
    return CustomThemeWrapper(
      seedColor: Colors.red,
      child: Builder(
        builder: (ctx) => AlertDialog(
          title: Text(ctx.l10n.resetAppConfirmTitle),
          content: Text(
            ctx.l10n.resetAppCannotUndo,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(ctx).colorScheme.onErrorContainer,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(ctx.l10n.commonCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(ctx.l10n.commonDelete),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/main_app/updates/presentation/pages/updates_page.dart

import 'dart:math';

import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/theme/app_spacings.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  void _openSupportForm(BuildContext context) {
    context.go('/main_app/updates/support-webview');
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacings>()!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    const double circleSize = 120.0;
    final iconColor = colorScheme.secondary;

    return AppScaffold(
      body: Column(
        children: [
          SizedBox(height: spacing.screenPaddingH),
          Text(l10n.supportTitle, style: theme.textTheme.headlineMedium),
          SizedBox(height: spacing.screenPaddingH * 2),
          Text(
            l10n.supportPageIntro,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: Container(
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_rounded,
                size: circleSize / 2,
                color: iconColor,
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(
            text: l10n.supportCtaMessageTeam,
            onPressed: () => _openSupportForm(context),
          ),

          SizedBox(
            height: max(
              context.spacing.screenPaddingV,
              MediaQuery.of(context).viewPadding.bottom,
            ),
          ),
        ],
      ),
    );
  }
}

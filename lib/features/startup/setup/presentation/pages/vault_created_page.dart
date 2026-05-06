import 'package:contacts/features/startup/setup/presentation/widgets/setup_entrance.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_page_scaffold.dart';
import 'package:contacts/core/theme/app_breakpoints.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class VaultCreatedPage extends StatelessWidget {
  const VaultCreatedPage({
    super.key,
    required this.onBack,
    required this.onOpenVault,
  });

  final VoidCallback onBack;
  final VoidCallback onOpenVault;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return SetupPageScaffold(
      showBackButton: true,
      onBack: onBack,
      bottomButtonText: l10n.setupOpenVaultButton,
      onBottomButtonPressed: onOpenVault,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalPadding = AppBreakpoints.responsive<double>(
            context,
            compact: 16,
            wide: 24,
          );
          final imageWidth = (constraints.maxWidth - (horizontalPadding * 2))
              .clamp(220.0, constraints.maxWidth);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 44,
                child: Row(
                  children: [
                    const SizedBox(width: 48),
                    Expanded(
                      child: SetupEntrance(
                        index: 0,
                        child: Text(
                          l10n.setupVaultCreatedTitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SetupEntrance(
                index: 1,
                child: Text(
                  l10n.setupVaultCreatedSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.74,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SetupEntrance(
                index: 2,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        width: imageWidth,
                        height: imageWidth,
                        child: Image.asset(
                          'assets/onboarding/vault.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}

// lib/features/main_app/settings/presentation/pages/settings_page.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/purchases/premium_gate.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_capabilities.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/export_contacts_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/github_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/language_settings_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/import_contacts_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/password_settings_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/privacy_policy_tile.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/reset_app_button.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final items = <Widget>[];
    final showUnlockProAsync = ref.watch(settingsShowUnlockProTileProvider);
    final showUnlockProTile = showUnlockProAsync.maybeWhen(
      data: (show) => show,
      orElse: () => false,
    );

    if (availableImportSources.isNotEmpty) {
      items.add(const ImportContactsTile());
      final showExport = ref.watch(
        contactsProvider.select(
          (async) => async.maybeWhen(
            data: (list) => list.isNotEmpty,
            orElse: () => false,
          ),
        ),
      );
      if (showExport) {
        items.add(const ExportContactsTile());
      }
    }
    if (showUnlockProTile) {
      items.add(
        ListTile(
          leading: SizedBox(
            width: 24,
            height: 40,
            child: Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: Lottie.asset(
                  'assets/animations/fire.json',
                  repeat: true,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0.12, 0),
                ),
              ),
            ),
          ),
          title: Text(context.l10n.unlockPro),
          onTap: () => PremiumGate.ensurePremium(context),
        ),
      );
    }
    items.add(const LanguageSettingsTile());
    items.add(const PasswordSettingsTile());
    items.add(const GithubTile());
    items.add(const PrivacyPolicyTile());
    items.add(const ResetAppButton());

    return AppScaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.only(
          top: context.spacing.screenPaddingV,
          bottom:
              MediaQuery.of(context).viewPadding.bottom +
              context.spacing.screenPaddingV,
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: context.spacing.screenPaddingH,
              right: context.spacing.screenPaddingH,
              bottom: 24,
            ),
            child: Text(
              context.l10n.settingsTitle,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}

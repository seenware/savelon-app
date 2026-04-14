// lib/features/main_app/settings/presentation/pages/export_contacts_success_page.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExportContactsSuccessPage extends ConsumerWidget {
  const ExportContactsSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final exportState = ref.watch(exportContactsNotifierProvider);

    void goToSettings() {
      context.go('/main_app/settings');
    }

    final showIosAppFolderWarning = exportState.showIosAppFolderWarning;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) goToSettings();
      },
      child: AppScaffold(
        appBar: AppBar(
          title: Text(l10n.exportCompleteTitle, style: theme.textTheme.titleLarge),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: goToSettings,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.screenPaddingH,
            vertical: context.spacing.screenPaddingV,
          ),
          child: showIosAppFolderWarning
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 64,
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(height: context.spacing.large),
                    _IosFolderWarningCard(message: l10n.exportIosSavedFileWarning),
                  ],
                )
              : Center(
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                ),
        ),
      ),
    );
  }
}

class _IosFolderWarningCard extends StatelessWidget {
  const _IosFolderWarningCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return MessageCard(
      type: MessageCardType.warning,
      message: message,
    );
  }
}

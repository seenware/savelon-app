// lib/features/main_app/settings/presentation/pages/export_contacts_page.dart

import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_messages.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_provider.dart';
import 'package:contacts/core/purchases/premium_gate.dart';
import 'package:contacts/features/main_app/settings/presentation/export_contacts_snackbars.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExportContactsPage extends ConsumerWidget {
  const ExportContactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    final contactsAsync = ref.watch(contactsProvider);
    final exportState = ref.watch(exportContactsNotifierProvider);

    ref.listen<ExportContactsState>(exportContactsNotifierProvider, (
      previous,
      next,
    ) {
      scheduleExportContactsSnackBars(context, previous, next);
      if (exportContactsSuccessIsNew(previous, next) && context.mounted) {
        context.push('/main_app/settings/export-contacts/success');
      }
    });

    final contactsLoaded = contactsAsync.hasValue;
    final hasContacts = contactsAsync.value?.isNotEmpty ?? false;
    final isBusy = exportState.isExporting;

    Future<void> runStandardExport() async {
      if (!await PremiumGate.ensurePremium(context)) return;
      if (!context.mounted) return;
      if (!contactsLoaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.stillLoadingContacts)),
        );
        return;
      }
      if (!hasContacts) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ExportContactsError.noContacts.localizedMessage(l10n),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return;
      }
      await ref.read(exportContactsNotifierProvider.notifier).export(
            usePassword: false,
            password: null,
          );
    }

    Future<void> onProtectedTap() async {
      if (isBusy) return;
      if (!await PremiumGate.ensurePremium(context)) return;
      if (!context.mounted) return;
      context.push('/main_app/settings/export-contacts/protected');
    }

    Widget body;
    if (contactsAsync.isLoading && !contactsAsync.hasValue) {
      body = const Center(child: CircularProgressIndicator());
    } else if (contactsAsync.hasError) {
      body = Center(
        child: Text(
          l10n.couldNotLoadContacts,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      body = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.exportSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: context.spacing.large),
            _ExportFormatCard(
              onTap: isBusy ? null : runStandardExport,
              icon: Icons.description_outlined,
              title: l10n.exportFormatVcfTitle,
              subtitle: l10n.exportFormatVcfSubtitle,
            ),
            SizedBox(height: context.spacing.medium),
            _ExportFormatCard(
              onTap: isBusy ? null : onProtectedTap,
              icon: Icons.lock_outline_rounded,
              title: l10n.exportFormatZipTitle,
              subtitle: l10n.exportFormatZipSubtitle,
            ),
          ],
        ),
      );
    }

    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l10n.exportContactsTitle, style: theme.textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: isBusy ? null : () => context.pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.screenPaddingH,
          vertical: context.spacing.screenPaddingV,
        ),
        child: body,
      ),
    );
  }
}

class _ExportFormatCard extends StatelessWidget {
  const _ExportFormatCard({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Material(
      color: scheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: scheme.primary),
              SizedBox(width: context.spacing.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.spacing.small),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

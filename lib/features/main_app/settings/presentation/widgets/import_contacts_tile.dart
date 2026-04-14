// lib/features/main_app/settings/presentation/widgets/import_contacts_tile.dart

import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_capabilities.dart';
import 'package:contacts/core/purchases/premium_gate.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_l10n.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_provider.dart';
import 'package:contacts/core/review/app_review_service.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/import_contacts_dialog.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/import_source_dialog.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/import_zip_password_dialog.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ImportContactsTile extends ConsumerWidget {
  const ImportContactsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importState = ref.watch(importContactsStateProvider);

    ref.listen<ImportContactsState>(importContactsStateProvider, (
      previous,
      next,
    ) {
      if (previous?.status == next.status) return;

      if (next.status == ImportContactsStatus.success) {
        ref.read(appReviewServiceProvider).maybePromptReviewOnce();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            final l10n = context.l10n;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  next.skippedCount > 0
                      ? l10n.importedCountWithSkipped(
                          next.importedCount,
                          next.skippedCount,
                        )
                      : l10n.importedCount(next.importedCount),
                ),
                duration: const Duration(seconds: 3),
              ),
            );
            context.go('/main_app/contacts');
          }
        });

        Future.delayed(const Duration(milliseconds: 100), () {
          if (ref.context.mounted) {
            ref.read(importContactsStateProvider.notifier).reset();
          }
        });
      } else if (next.status == ImportContactsStatus.error) {
        if (next.error == ImportContactsError.wrongArchivePassword) {
          return;
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            final l10n = context.l10n;
            final err = next.error;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  err != null
                      ? err.localizedMessage(
                          l10n,
                          next.importFailureDetail,
                        )
                      : l10n.failedToImportContacts,
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        });
      } else if (next.status == ImportContactsStatus.noContacts) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            final l10n = context.l10n;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.importErrorNoContacts),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        });
      } else if (next.status == ImportContactsStatus.permissionDenied) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            final l10n = context.l10n;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.importErrorPermissionDenied,
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        });
      }
    });

    final isLoading =
        importState.status == ImportContactsStatus.preparing ||
        importState.status == ImportContactsStatus.importing;

    final l10n = context.l10n;
    final label = isLoading
        ? (importState.status == ImportContactsStatus.importing
              ? l10n.importing
              : l10n.commonLoading)
        : l10n.importContacts;

    return ListTile(
      leading: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Icon(
                Icons.file_download_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
      title: Text(label),
      enabled: !isLoading,
      onTap: isLoading ? null : () => _handleImport(context, ref),
    );
  }

  Future<void> _handleImport(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(importContactsStateProvider.notifier);
    final source = await ImportSourceDialog.show(
      context,
      sources: availableImportSources,
    );
    if (source == null) return;
    if (!context.mounted) return;
    if (source == ImportContactsSource.fromFile &&
        !await PremiumGate.ensurePremium(context)) {
      return;
    }
    if (!context.mounted) return;

    final ready = await _prepareContacts(context, ref, notifier, source);
    if (!ready) return;

    final state = ref.read(importContactsStateProvider);
    final contactCount = state.contactsToImport.length;
    if (contactCount == 0) return;

    if (!context.mounted) return;
    final confirmed = await ImportContactsDialog.show(context, contactCount);

    if (confirmed != true) {
      notifier.reset();
      return;
    }

    await notifier.importAllContacts();
  }

  Future<bool> _prepareContacts(
    BuildContext context,
    WidgetRef ref,
    ImportContactsNotifier notifier,
    ImportContactsSource source,
  ) async {
    if (source == ImportContactsSource.deviceContacts) {
      final result = await notifier.prepareDeviceContacts();
      return result == ImportPreparationResult.ready;
    }

    var result = await notifier.prepareFileContacts(pickFile: true);
    while (result == ImportPreparationResult.passwordRequired) {
      if (!context.mounted) return false;
      var shouldAbort = false;
      var didSucceed = false;
      final password = await ImportZipPasswordDialog.show(
        context,
        validatePassword: (password) async {
          final next = await notifier.prepareFileContacts(password: password);
          if (next == ImportPreparationResult.ready) {
            didSucceed = true;
            return true;
          }
          final state = ref.read(importContactsStateProvider);
          if (next == ImportPreparationResult.passwordRequired ||
              state.error == ImportContactsError.wrongArchivePassword) {
            return false;
          }
          shouldAbort = true;
          return true;
        },
      );
      if (password == null) {
        notifier.reset();
        return false;
      }
      if (didSucceed) return true;
      if (shouldAbort) return false;
      result = ImportPreparationResult.passwordRequired;
    }

    return result == ImportPreparationResult.ready;
  }
}

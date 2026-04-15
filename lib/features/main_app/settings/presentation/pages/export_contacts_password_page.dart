// lib/features/main_app/settings/presentation/pages/export_contacts_password_page.dart

import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/layout/widgets/app_scaffold.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_messages.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_provider.dart';
import 'package:contacts/features/main_app/settings/presentation/export_contacts_snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExportContactsPasswordPage extends HookConsumerWidget {
  const ExportContactsPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();
    final showErrors = useState(false);
    final errorShakeTick = useState(0);

    useListenable(passwordController);
    useListenable(confirmController);

    final exportState = ref.watch(exportContactsNotifierProvider);

    ref.listen<ExportContactsState>(exportContactsNotifierProvider, (
      previous,
      next,
    ) {
      scheduleExportContactsSnackBars(
        context,
        previous,
        next,
        showErrorSnackBar: (ExportContactsError e) =>
            !e.isRedundantWithPasswordExportFields,
      );
      if (exportContactsSuccessIsNew(previous, next) && context.mounted) {
        context.push('/main_app/settings/export-contacts/success');
      }
    });

    final p = passwordController.text;
    final c = confirmController.text;
    final isBusy = exportState.isExporting;

    final l10n = context.l10n;

    String? passwordError() {
      if (!showErrors.value) return null;
      if (p.length < kExportProtectedPasswordMinLength) {
        return l10n.exportPasswordHelper(kExportProtectedPasswordMinLength);
      }
      return null;
    }

    String? confirmError() {
      if (!showErrors.value) return null;
      if (p.length < kExportProtectedPasswordMinLength) return null;
      if (p != c) return l10n.setupPasswordMismatch;
      return null;
    }

    bool isValid() {
      return p.length >= kExportProtectedPasswordMinLength &&
          c.length >= kExportProtectedPasswordMinLength &&
          p == c;
    }

    Future<void> onExport() async {
      if (isBusy) return;
      if (!isValid()) {
        showErrors.value = true;
        return;
      }
      await ref.read(exportContactsNotifierProvider.notifier).export(
            usePassword: true,
            password: p,
          );
    }

    void onDisabledPrimaryTap() {
      if (isBusy) return;
      if (showErrors.value && !isValid()) {
        errorShakeTick.value++;
      }
      showErrors.value = true;
    }

    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l10n.exportProtectedTitle, style: theme.textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: isBusy ? null : () => context.pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.screenPaddingH,
                vertical: context.spacing.screenPaddingV,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.exportCreateUniquePasswordTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: context.spacing.large),
                  PasswordInputField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    label: l10n.exportPasswordHint,
                    errorText: passwordError(),
                    shakeSignal: errorShakeTick.value,
                    onFocusLost: () {
                      if (isBusy) return;
                      if (passwordController.text.length <
                          kExportProtectedPasswordMinLength) {
                        showErrors.value = true;
                      }
                    },
                    onSubmitted: () => confirmFocusNode.requestFocus(),
                  ),
                  SizedBox(height: context.spacing.medium),
                  PasswordInputField(
                    controller: confirmController,
                    focusNode: confirmFocusNode,
                    label: l10n.exportPasswordConfirmHint,
                    errorText: confirmError(),
                    shakeSignal: errorShakeTick.value,
                    onFocusLost: () {
                      if (isBusy) return;
                      if (passwordController.text.length >=
                              kExportProtectedPasswordMinLength &&
                          passwordController.text != confirmController.text) {
                        showErrors.value = true;
                      }
                    },
                    onSubmitted: isValid() && !isBusy ? onExport : null,
                  ),
                  SizedBox(height: context.spacing.large),
                  Text(
                    l10n.exportPasswordIrrecoverableHint,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.spacing.medium,
              left: context.spacing.screenPaddingH,
              right: context.spacing.screenPaddingH,
              bottom: context.spacing.screenPaddingV,
            ),
            child: PrimaryButton(
              text: l10n.exportProtectedArchiveCta,
              onPressed: (isValid() && !isBusy) ? onExport : null,
              onDisabledPressed:
                  (!isBusy && !isValid()) ? onDisabledPrimaryTap : null,
              isLoading: isBusy,
              icon: Icons.download_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

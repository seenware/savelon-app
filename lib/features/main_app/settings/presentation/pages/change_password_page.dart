import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/auth/password_flow_argument_messages.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/l10n/password_flow_argument_errors.dart';
import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/password_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final currentFocusNode = useFocusNode();
    final newFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();

    final isLoading = useState(false);
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    final currentPasswordApiError = useState<String?>(null);
    final newPasswordApiError = useState<String?>(null);
    final confirmPasswordApiError = useState<String?>(null);
    final unexpectedError = useState<String?>(null);

    useListenable(currentPasswordController);
    useListenable(newPasswordController);
    useListenable(confirmPasswordController);

    bool isFormValid() {
      final currentPassword = currentPasswordController.text;
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;

      return currentPassword.trim().isNotEmpty &&
          newPassword.length >= 4 &&
          confirmPassword.length >= 4 &&
          currentPassword != newPassword &&
          newPassword == confirmPassword;
    }

    String? currentPasswordError() {
      if (!showErrors.value) return null;
      final currentPassword = currentPasswordController.text;
      if (currentPassword.trim().isEmpty) {
        return l10n.settingsEnterCurrentPasswordHelper;
      }
      return currentPasswordApiError.value;
    }

    String? newPasswordError() {
      if (!showErrors.value) return null;
      final currentPassword = currentPasswordController.text;
      final newPassword = newPasswordController.text;
      if (newPassword.length < 4) return l10n.setupPasswordShortError;
      if (currentPassword == newPassword) {
        return l10n.settingsNewPasswordMustDiffer;
      }
      return newPasswordApiError.value;
    }

    String? confirmPasswordError() {
      if (!showErrors.value) return null;
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;
      if (newPassword.length < 4) return null;
      if (newPassword != confirmPassword) return l10n.setupPasswordMismatch;
      return confirmPasswordApiError.value;
    }

    void showValidationError() {
      if (isLoading.value) return;
      if (!isFormValid()) {
        if (showErrors.value) {
          errorShakeTick.value++;
        }
        showErrors.value = true;
      }
    }

    Future<void> handleChangePassword() async {
      if (isLoading.value) return;
      if (!isFormValid()) {
        showErrors.value = true;
        return;
      }

      showErrors.value = true;
      currentPasswordApiError.value = null;
      newPasswordApiError.value = null;
      confirmPasswordApiError.value = null;
      unexpectedError.value = null;
      isLoading.value = true;

      try {
        await ref.read(authProvider.notifier).changePassword(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
        );

        if (context.mounted) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.passwordChangedSuccess),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } on ArgumentError catch (e) {
        final raw = e.message?.toString() ?? '';
        final text = localizePasswordFlowArgumentError(l10n, e.message);
        switch (raw) {
          case PasswordFlowArgumentMessages.currentPasswordIncorrect:
          case PasswordFlowArgumentMessages.currentPasswordRequired:
            currentPasswordApiError.value = text;
            break;
          case PasswordFlowArgumentMessages.passwordMinLength:
          case PasswordFlowArgumentMessages.newPasswordMustDiffer:
            newPasswordApiError.value = text;
            break;
          default:
            final lower = raw.toLowerCase();
            if (lower.contains('match') || lower.contains('confirm')) {
              confirmPasswordApiError.value = text;
            } else if (lower.contains('current') ||
                lower.contains('wrong password') ||
                lower.contains('invalid password') ||
                lower.contains('incorrect password')) {
              currentPasswordApiError.value = text;
            } else if (lower.contains('different from current')) {
              newPasswordApiError.value = text;
            } else {
              newPasswordApiError.value = text;
            }
        }
        showErrors.value = true;
        isLoading.value = false;
      } catch (e) {
        unexpectedError.value =
            l10n.settingsFailedToChangePassword(e.toString());
        isLoading.value = false;
      }
    }

    Future<void> handleNavigateToRemove() async {
      await context.push('/main_app/settings/password/remove');
    }

    return PasswordPageScaffold(
      title: l10n.settingsChangePasswordPageTitle,
      isLoading: isLoading.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageCard(
            message: l10n.setupPasswordWarning,
            type: MessageCardType.warning,
          ),
          SizedBox(height: context.spacing.large),
          PasswordInputField(
            controller: currentPasswordController,
            focusNode: currentFocusNode,
            textInputAction: TextInputAction.next,
            label: l10n.settingsCurrentPasswordLabel,
            helperText: l10n.settingsEnterCurrentPasswordHelper,
            errorText: currentPasswordError(),
            shakeSignal: errorShakeTick.value,
            onFocusLost: () {
              if (isLoading.value) return;
              if (currentPasswordController.text.trim().isEmpty) {
                showErrors.value = true;
              }
            },
            onSubmitted: () => newFocusNode.requestFocus(),
            onChanged: (_) {
              currentPasswordApiError.value = null;
              unexpectedError.value = null;
            },
          ),
          SizedBox(height: context.spacing.medium),
          PasswordInputField(
            controller: newPasswordController,
            focusNode: newFocusNode,
            textInputAction: TextInputAction.next,
            label: l10n.settingsNewPasswordLabel,
            helperText: l10n.setupPasswordHelper,
            errorText: newPasswordError(),
            shakeSignal: errorShakeTick.value,
            onFocusLost: () {
              if (isLoading.value) return;
              final current = currentPasswordController.text;
              final next = newPasswordController.text;
              if (next.length < 4 || current == next) {
                showErrors.value = true;
              }
            },
            onSubmitted: () => confirmFocusNode.requestFocus(),
            onChanged: (_) {
              newPasswordApiError.value = null;
              confirmPasswordApiError.value = null;
              unexpectedError.value = null;
            },
          ),
          SizedBox(height: context.spacing.medium),
          PasswordInputField(
            controller: confirmPasswordController,
            focusNode: confirmFocusNode,
            label: l10n.settingsConfirmNewPasswordLabel,
            helperText: l10n.settingsReenterNewPasswordHelper,
            errorText: confirmPasswordError(),
            shakeSignal: errorShakeTick.value,
            onFocusLost: () {
              if (isLoading.value) return;
              if (newPasswordController.text.length >= 4 &&
                  newPasswordController.text != confirmPasswordController.text) {
                showErrors.value = true;
              }
            },
            onSubmitted: isFormValid() ? handleChangePassword : null,
            onChanged: (_) {
              confirmPasswordApiError.value = null;
              unexpectedError.value = null;
            },
          ),
          SizedBox(height: context.spacing.large),
          if (unexpectedError.value != null) ...[
            MessageCard(
              message: unexpectedError.value!,
              type: MessageCardType.error,
            ),
            SizedBox(height: context.spacing.large),
          ],
          if (isLoading.value)
            const Center(
              child: SizedBox.square(
                dimension: 44,
                child: CircularProgressIndicator(),
              ),
            )
          else
            PrimaryButton(
              text: l10n.settingsChangePasswordCta,
              onPressed: isFormValid() ? handleChangePassword : null,
              onDisabledPressed: showValidationError,
              icon: Icons.lock,
            ),
          SizedBox(height: context.spacing.medium),
          if (!isLoading.value)
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: TextButton.icon(
                    onPressed: handleNavigateToRemove,
                    icon: const Icon(Icons.lock_open_outlined),
                    label: Text(l10n.removePasswordProtectionButton),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

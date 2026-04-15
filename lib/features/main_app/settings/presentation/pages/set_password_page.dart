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

class SetPasswordPage extends HookConsumerWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final newPasswordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();

    final isLoading = useState(false);
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    final newPasswordApiError = useState<String?>(null);
    final confirmPasswordApiError = useState<String?>(null);
    final unexpectedError = useState<String?>(null);

    useListenable(newPasswordController);
    useListenable(confirmPasswordController);

    bool isFormValid() {
      final newPassword = newPasswordController.text;
      final confirmPassword = confirmPasswordController.text;

      return newPassword.length >= 4 &&
          confirmPassword.length >= 4 &&
          newPassword == confirmPassword;
    }

    String? newPasswordError() {
      if (!showErrors.value) return null;
      final newPassword = newPasswordController.text;
      if (newPassword.length < 4) return l10n.exportPasswordHelper(4);
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

    Future<void> handleSetPassword() async {
      if (isLoading.value) return;
      if (!isFormValid()) {
        showErrors.value = true;
        return;
      }

      showErrors.value = true;
      newPasswordApiError.value = null;
      confirmPasswordApiError.value = null;
      unexpectedError.value = null;
      isLoading.value = true;

      try {
        // No current password when adding protection for the first time.
        await ref
            .read(authProvider.notifier)
            .changePassword(
              currentPassword: null,
              newPassword: newPasswordController.text,
            );

        if (context.mounted) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.passwordProtectionEnabled),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } on ArgumentError catch (e) {
        final raw = e.message?.toString() ?? '';
        final text = localizePasswordFlowArgumentError(l10n, e.message);
        switch (raw) {
          case PasswordFlowArgumentMessages.passwordMinLength:
          case PasswordFlowArgumentMessages.newPasswordMustDiffer:
            newPasswordApiError.value = text;
            break;
          default:
            if (raw.toLowerCase().contains('match')) {
              confirmPasswordApiError.value = text;
            } else {
              newPasswordApiError.value = text;
            }
        }
        showErrors.value = true;
        isLoading.value = false;
      } catch (e) {
        unexpectedError.value = l10n.settingsFailedToSetPassword(e.toString());
        isLoading.value = false;
      }
    }

    return PasswordPageScaffold(
      title: l10n.settingsSetPasswordPageTitle,
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
            controller: newPasswordController,
            focusNode: newPasswordFocusNode,
            textInputAction: TextInputAction.next,
            label: l10n.settingsNewPasswordLabel,
            helperText: l10n.exportPasswordHelper(4),
            errorText: newPasswordError(),
            shakeSignal: errorShakeTick.value,
            onFocusLost: () {
              if (isLoading.value) return;
              if (newPasswordController.text.length < 4) {
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
                  newPasswordController.text !=
                      confirmPasswordController.text) {
                showErrors.value = true;
              }
            },
            onSubmitted: isFormValid() ? handleSetPassword : null,
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
              text: l10n.settingsSetPasswordCta,
              onPressed: isFormValid() ? handleSetPassword : null,
              onDisabledPressed: showValidationError,
              icon: Icons.lock,
            ),
        ],
      ),
    );
  }
}

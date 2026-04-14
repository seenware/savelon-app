import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/l10n/password_flow_argument_errors.dart';
import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/core/layout/widgets/primary_button.dart';
import 'package:contacts/core/theme/app_theme.dart';
import 'package:contacts/features/main_app/settings/presentation/widgets/password_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemovePasswordPage extends HookConsumerWidget {
  const RemovePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final currentPasswordController = useTextEditingController();

    final isLoading = useState(false);
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    final currentPasswordApiError = useState<String?>(null);
    final unexpectedError = useState<String?>(null);

    useListenable(currentPasswordController);

    bool isFormValid() {
      return currentPasswordController.text.trim().isNotEmpty;
    }

    String? currentPasswordError() {
      if (!showErrors.value) return null;
      final currentPassword = currentPasswordController.text;
      if (currentPassword.trim().isEmpty) {
        return l10n.settingsEnterCurrentPasswordHelper;
      }
      return currentPasswordApiError.value;
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

    Future<void> handleRemovePassword() async {
      if (isLoading.value) return;
      if (!isFormValid()) {
        showErrors.value = true;
        return;
      }

      showErrors.value = true;
      currentPasswordApiError.value = null;
      unexpectedError.value = null;
      isLoading.value = true;

      try {
        await ref.read(authProvider.notifier).changePassword(
          currentPassword: currentPasswordController.text,
          newPassword: null, // null = remove protection
        );

        if (context.mounted) {
          final navigator = Navigator.of(context);
          final messenger = ScaffoldMessenger.of(context);

          navigator.pop();
          navigator.pop();

          messenger.showSnackBar(
            SnackBar(
              content: Text(l10n.passwordProtectionRemoved),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } on ArgumentError catch (e) {
        currentPasswordApiError.value =
            localizePasswordFlowArgumentError(l10n, e.message);
        showErrors.value = true;
        isLoading.value = false;
      } catch (e) {
        unexpectedError.value =
            l10n.settingsFailedToRemovePassword(e.toString());
        isLoading.value = false;
      }
    }

    return PasswordPageScaffold(
      title: l10n.settingsRemovePasswordPageTitle,
      isLoading: isLoading.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PasswordInputField(
            controller: currentPasswordController,
            label: l10n.settingsCurrentPasswordLabel,
            errorText: currentPasswordError(),
            shakeSignal: errorShakeTick.value,
            onSubmitted: isFormValid() ? handleRemovePassword : null,
            onChanged: (_) {
              currentPasswordApiError.value = null;
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
              text: l10n.settingsRemovePasswordCta,
              onPressed: isFormValid() ? handleRemovePassword : null,
              onDisabledPressed: showValidationError,
              icon: Icons.lock_open,
            ),
        ],
      ),
    );
  }
}

// lib/features/startup/setup/presentation/password_page/password_page.dart

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/features/startup/setup/presentation/setup_provider.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/page_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordPage extends HookConsumerWidget {
  final VoidCallback onNext;
  const PasswordPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    final unexpectedError = useState<String?>(null);
    final usePassword = useState(false);
    final showLoading = useState(false);

    useListenable(passwordController);
    useListenable(confirmPasswordController);

    bool isFormValid() {
      if (!usePassword.value) return true;

      return passwordController.text.length >= 4 &&
          confirmPasswordController.text.length >= 4 &&
          passwordController.text == confirmPasswordController.text;
    }

    String? passwordError() {
      if (!usePassword.value || !showErrors.value) return null;
      if (passwordController.text.length < 4) {
        return l10n.exportPasswordHelper(4);
      }
      return null;
    }

    String? confirmPasswordError() {
      if (!usePassword.value || !showErrors.value) return null;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password.length < 4) return null;
      if (password != confirmPassword) return l10n.setupPasswordMismatch;
      return null;
    }

    Future<void> validateAndContinue() async {
      if (showLoading.value) return;
      if (!isFormValid()) {
        showErrors.value = true;
        return;
      }

      final password = passwordController.text;

      try {
        unexpectedError.value = null;
        showLoading.value = true;

        // Store password choice in setup state
        final setupNotifier = ref.read(setupNotifierProvider.notifier);
        setupNotifier.setPassword(usePassword.value ? password : null);

        // Generate seed and initialize crypto
        final authNotifier = ref.read(authProvider.notifier);
        final mnemonic = await authNotifier.setupNewSeed(
          enablePassword: usePassword.value,
          password: usePassword.value ? password : null,
        );

        if (mnemonic != null) {
          // Store mnemonic in setup state for display on complete page
          setupNotifier.setSecretKey(mnemonic);
          onNext();
        } else {
          unexpectedError.value = l10n.setupPasswordFailedSeed;
          showLoading.value = false;
        }
      } catch (e) {
        unexpectedError.value = l10n.setupPasswordFailedInit(e.toString());
        showLoading.value = false;
      }
    }

    final children = [
      const SizedBox(height: 16),

      CheckboxListTile(
        value: usePassword.value,
        onChanged: (value) {
          usePassword.value = value ?? false;
          showErrors.value = false;
          unexpectedError.value = null;
          passwordController.clear();
          confirmPasswordController.clear();
        },
        title: Text(l10n.setupPasswordTitle),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),

      const SizedBox(height: 8),

      if (!usePassword.value) ...[
        MessageCard(
          message: l10n.setupPasswordInfo,
          type: MessageCardType.info,
        ),
      ],

      if (usePassword.value) ...[
        const SizedBox(height: 16),
        PasswordInputField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          textInputAction: TextInputAction.next,
          label: l10n.setupPasswordLabel,
          helperText: l10n.exportPasswordHelper(4),
          errorText: passwordError(),
          shakeSignal: errorShakeTick.value,
          onFocusLost: () {
            if (!usePassword.value || showLoading.value) return;
            if (passwordController.text.length < 4) {
              showErrors.value = true;
            }
          },
          onSubmitted: () => confirmFocusNode.requestFocus(),
          onChanged: (_) => unexpectedError.value = null,
        ),
        const SizedBox(height: 16),
        PasswordInputField(
          controller: confirmPasswordController,
          focusNode: confirmFocusNode,
          label: l10n.setupPasswordConfirmLabel,
          errorText: confirmPasswordError(),
          shakeSignal: errorShakeTick.value,
          onFocusLost: () {
            if (!usePassword.value || showLoading.value) return;
            if (passwordController.text.length >= 4 &&
                passwordController.text != confirmPasswordController.text) {
              showErrors.value = true;
            }
          },
          onSubmitted: isFormValid() ? validateAndContinue : null,
          onChanged: (_) => unexpectedError.value = null,
        ),
        const SizedBox(height: 20),
        MessageCard(
          message: l10n.setupPasswordWarning,
          type: MessageCardType.warning,
        ),
      ],
      if (unexpectedError.value != null) ...[
        const SizedBox(height: 16),
        MessageCard(
          message: unexpectedError.value!,
          type: MessageCardType.error,
        ),
      ],
    ];

    return PageShell(
      title: l10n.setupPasswordPageTitle,
      showBackButton: false,
      onNext: isFormValid() ? validateAndContinue : null,
      onDisabledNext: () {
        if (showLoading.value || !usePassword.value) return;
        if (!isFormValid()) {
          if (showErrors.value) {
            errorShakeTick.value++;
          }
          showErrors.value = true;
        }
      },
      nextButtonText:
          usePassword.value ? l10n.setupPasswordNext : l10n.setupPasswordSkip,
      isLoading: showLoading.value,
      children: children,
    );
  }
}

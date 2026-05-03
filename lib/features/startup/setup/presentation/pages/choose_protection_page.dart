import 'dart:async';

import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/features/startup/setup/presentation/setup_provider.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/protection_switch_row.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_entrance.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_page_scaffold.dart';
import 'package:contacts/l10n/l10n_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseProtectionPage extends HookConsumerWidget {
  const ChooseProtectionPage({
    super.key,
    required this.onBack,
    required this.onProceedToCreatingVault,
  });

  final VoidCallback onBack;
  final VoidCallback onProceedToCreatingVault;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final setupState = ref.watch(setupNotifierProvider);
    final notifier = ref.read(setupNotifierProvider.notifier);
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    useListenable(passwordController);
    useListenable(confirmPasswordController);

    bool passwordValid() {
      if (!setupState.addPasswordEnabled) return true;
      return passwordController.text.length >= 4 &&
          confirmPasswordController.text.length >= 4 &&
          passwordController.text == confirmPasswordController.text;
    }

    String? passwordError() {
      if (!setupState.addPasswordEnabled || !showErrors.value) return null;
      if (passwordController.text.length < 4) {
        return l10n.exportPasswordHelper(4);
      }
      return null;
    }

    String? confirmPasswordError() {
      if (!setupState.addPasswordEnabled || !showErrors.value) return null;
      if (passwordController.text.length < 4) return null;
      if (confirmPasswordController.text != passwordController.text) {
        return l10n.setupPasswordMismatch;
      }
      return null;
    }

    void showValidationError() {
      if (!passwordValid()) {
        if (showErrors.value) {
          errorShakeTick.value++;
        }
        showErrors.value = true;
      }
    }

    Future<void> submit() async {
      if (!passwordValid()) {
        showErrors.value = true;
        return;
      }
      if (setupState.addPasswordEnabled) {
        notifier.setPassword(passwordController.text);
      } else {
        notifier.setPassword(null);
      }
      onProceedToCreatingVault();
    }

    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SetupPageScaffold(
        showBackButton: true,
        onBack: onBack,
        bottomButtonText: l10n.setupCreateVaultButton,
        onBottomButtonPressed: passwordValid() ? submit : null,
        onBottomButtonDisabledPressed: setupState.addPasswordEnabled
            ? showValidationError
            : null,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
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
                              l10n.setupProtectionTitle,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SetupEntrance(
                    index: 1,
                    child: Column(
                      children: [
                        ProtectionSwitchRow(
                          label: l10n.setupEncryption256Label,
                          enabled: false,
                          value: true,
                        ),
                        ProtectionSwitchRow(
                          label: l10n.setupRequirePasswordLabel,
                          optionalSuffix: l10n.setupOptionalSuffix,
                          enabled: true,
                          value: setupState.addPasswordEnabled,
                          onChanged: (value) {
                            notifier.setAddPasswordEnabled(value);
                            if (!value) {
                              passwordController.clear();
                              confirmPasswordController.clear();
                              showErrors.value = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  if (setupState.addPasswordEnabled) ...[
                    const SizedBox(height: 12),
                    PasswordInputField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      label: l10n.setupPasswordLabel,
                      helperText: null,
                      errorText: passwordError(),
                      shakeSignal: errorShakeTick.value,
                      onFocusLost: () {
                        if (passwordController.text.length < 4) {
                          showErrors.value = true;
                        }
                      },
                      onSubmitted: () => confirmFocusNode.requestFocus(),
                      onChanged: (_) {},
                    ),
                    SizedBox(
                      height: 22,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 180),
                        opacity: passwordController.text.length < 4 ? 1 : 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.exportPasswordHelper(4),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    PasswordInputField(
                      controller: confirmPasswordController,
                      focusNode: confirmFocusNode,
                      label: l10n.setupPasswordConfirmLabel,
                      errorText: confirmPasswordError(),
                      shakeSignal: errorShakeTick.value,
                      onFocusLost: () {
                        if (passwordController.text.length >= 4 &&
                            passwordController.text !=
                                confirmPasswordController.text) {
                          showErrors.value = true;
                        }
                      },
                      onSubmitted: () => confirmFocusNode.unfocus(),
                      onChanged: (_) {},
                    ),
                    const SizedBox(height: 12),
                    MessageCard(
                      message: l10n.setupPasswordWarning,
                      type: MessageCardType.warning,
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

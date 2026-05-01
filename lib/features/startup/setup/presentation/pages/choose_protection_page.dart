import 'dart:async';

import 'package:contacts/core/layout/widgets/message_card.dart';
import 'package:contacts/core/layout/widgets/password_input_field.dart';
import 'package:contacts/core/security/app_biometric_lock_storage.dart';
import 'package:contacts/features/startup/setup/presentation/setup_provider.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/protection_switch_row.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_entrance.dart';
import 'package:contacts/features/startup/setup/presentation/widgets/setup_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

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
    final setupState = ref.watch(setupNotifierProvider);
    final notifier = ref.read(setupNotifierProvider.notifier);

    final localAuth = useMemoized(LocalAuthentication.new);
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final confirmFocusNode = useFocusNode();
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    useListenable(passwordController);
    useListenable(confirmPasswordController);

    final biometricSupported = useState(false);
    final biometricRowLabel = useState<String>('none');

    useEffect(() {
      Future<void>(() async {
        final enabledPref = await AppBiometricLockStorage().readEnabled();
        if (!context.mounted) return;
        notifier.setAppBiometricLockEnabled(enabledPref);

        final can = await localAuth.canCheckBiometrics;
        if (!context.mounted) return;
        if (!can) {
          biometricSupported.value = false;
          biometricRowLabel.value = 'none';
          return;
        }
        final types = await localAuth.getAvailableBiometrics();
        if (!context.mounted) return;
        biometricSupported.value = true;
        if (types.contains(BiometricType.face)) {
          biometricRowLabel.value = 'Require Face ID';
        } else if (types.contains(BiometricType.fingerprint)) {
          biometricRowLabel.value = 'Require fingerprint';
        } else {
          biometricRowLabel.value = 'Require biometrics';
        }
      });
      return null;
    }, const []);

    bool passwordValid() {
      if (!setupState.addPasswordEnabled) return true;
      return passwordController.text.length >= 4 &&
          confirmPasswordController.text.length >= 4 &&
          passwordController.text == confirmPasswordController.text;
    }

    String? passwordError() {
      if (!setupState.addPasswordEnabled || !showErrors.value) return null;
      if (passwordController.text.length < 4) return 'Minimum 4 characters';
      return null;
    }

    String? confirmPasswordError() {
      if (!setupState.addPasswordEnabled || !showErrors.value) return null;
      if (passwordController.text.length < 4) return null;
      if (confirmPasswordController.text != passwordController.text) {
        return 'Passwords do not match';
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
      await AppBiometricLockStorage().writeEnabled(
        setupState.appBiometricLockEnabled,
      );
      onProceedToCreatingVault();
    }

    final theme = Theme.of(context);
    return SetupPageScaffold(
      showBackButton: true,
      onBack: onBack,
      bottomButtonText: 'Create vault',
      onBottomButtonPressed: passwordValid() ? submit : null,
      onBottomButtonDisabledPressed:
          setupState.addPasswordEnabled ? showValidationError : null,
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
                            'Protection',
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
                        label: '256-bit encryption',
                        enabled: false,
                        value: true,
                      ),
                      ProtectionSwitchRow(
                        label: biometricRowLabel.value,
                        enabled: biometricSupported.value,
                        value: biometricSupported.value &&
                            setupState.appBiometricLockEnabled,
                        onChanged: biometricSupported.value
                            ? (value) {
                                notifier.setAppBiometricLockEnabled(value);
                                unawaited(
                                  AppBiometricLockStorage().writeEnabled(value),
                                );
                              }
                            : null,
                      ),
                      ProtectionSwitchRow(
                        label: 'Require password',
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
                    label: 'Password',
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
                          'Minimum 4 characters',
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
                    label: 'Confirm password',
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
                  const MessageCard(
                    message:
                        'This password cannot be recovered. Write it down and keep it safe!',
                    type: MessageCardType.warning,
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

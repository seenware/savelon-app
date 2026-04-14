// lib/features/startup/login/presentation/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contacts/l10n/app_localizations.dart';

import '../../../../core/auth/auth_provider.dart';
import '../../../../core/auth/auth_state.dart';
import '../../../../core/layout/widgets/app_icon.dart';
import '../../../../core/layout/widgets/app_scaffold.dart';
import '../../../../core/layout/widgets/password_input_field.dart';
import '../../../../core/layout/widgets/primary_button.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final passwordController = useTextEditingController();
    final showErrors = useState(false);
    final errorShakeTick = useState(0);
    final passwordApiError = useState<String?>(null);
    final showLoading = useState(false);

    useListenable(passwordController);

    final authAsync = ref.watch(authProvider);

    // Check if password is required, redirect if not
    useEffect(() {
      authAsync.whenData((authState) {
        if (authState is AuthStateNeedsLogin && !authState.passwordRequired) {
          // No password required - auto authenticate
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final notifier = ref.read(authProvider.notifier);
            final success = await notifier.authenticate();
            if (success && context.mounted) {
              context.go('/main_app');
            }
          });
        } else if (authState is AuthStateAuthenticated) {
          // Already authenticated
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              context.go('/main_app');
            }
          });
        }
      });
      return null;
    }, [authAsync]);

    Future<void> login() async {
      if (showLoading.value) return;
      final password = passwordController.text;

      if (password.isEmpty) {
        showErrors.value = true;
        return;
      }

      showErrors.value = true;
      passwordApiError.value = null;
      showLoading.value = true;

      final success = await ref
          .read(authProvider.notifier)
          .authenticate(password: password);

      if (!success) {
        passwordApiError.value = l10n.loginIncorrectPassword;
      } else if (context.mounted) {
        context.go('/main_app');
      }

      showLoading.value = false;
    }

    bool isFormValid() => passwordController.text.isNotEmpty;

    String? passwordError() {
      if (!showErrors.value) return null;
      if (passwordController.text.isEmpty) return l10n.loginPasswordRequired;
      return passwordApiError.value;
    }

    void onDisabledUnlockTap() {
      if (showLoading.value) return;
      if (!isFormValid()) {
        if (showErrors.value) {
          errorShakeTick.value++;
        }
        showErrors.value = true;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        limitWidth: true,
        body: Column(
          children: [
            const SizedBox(height: 20),
            const AppIcon(size: 96),
            Text(
              l10n.loginWelcomeBack,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            PasswordInputField(
              controller: passwordController,
              label: l10n.loginPasswordLabel,
              errorText: passwordError(),
              shakeSignal: errorShakeTick.value,
              onSubmitted: isFormValid() ? login : null,
              onChanged: (_) {
                passwordApiError.value = null;
              },
            ),
            const SizedBox(height: 16),

            const Spacer(),
            PrimaryButton(
              text: l10n.loginUnlock,
              onPressed: isFormValid() ? login : null,
              onDisabledPressed: onDisabledUnlockTap,
              isLoading: showLoading.value,
            ),
          ],
        ),
      ),
    );
  }
}

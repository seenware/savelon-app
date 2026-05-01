// lib/features/startup/login/presentation/login_page.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contacts/l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/auth/auth_provider.dart';
import '../../../../core/auth/auth_state.dart';
import '../../../../core/profile/profile_service.dart';
import '../../../../core/layout/widgets/app_scaffold.dart';
import '../../../../core/layout/widgets/password_input_field.dart';
import '../../../../core/layout/widgets/primary_button.dart';
import '../../setup/presentation/models/avatar_catalog.dart';

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
    final profileUsername = useState('Anonymous');
    final profileAvatarId = useState('cat');

    useListenable(passwordController);

    final authAsync = ref.watch(authProvider);
    final authState = authAsync.value;
    final isLoginSuccess = authState is AuthStateLoginSuccess;

    useEffect(() {
      Future<void>(() async {
        final profileService = ProfileService();
        profileUsername.value = await profileService.readUsername();
        profileAvatarId.value = await profileService.readAvatarId();
      });
      return null;
    }, const []);

    useEffect(() {
      if (!isLoginSuccess) return null;
      final timer = Timer(const Duration(milliseconds: 1400), () {
        if (!context.mounted) return;
        ref.read(authProvider.notifier).completeLoginSuccess();
      });
      return timer.cancel;
    }, [isLoginSuccess]);

    useEffect(() {
      authAsync.whenData((state) {
        if (state is AuthStateNeedsLogin && !state.passwordRequired) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final notifier = ref.read(authProvider.notifier);
            await notifier.authenticate();
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

    final avatar = avatarById(profileAvatarId.value);
    final theme = Theme.of(context);
    final needsPasswordField =
        authState is AuthStateNeedsLogin && authState.passwordRequired;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        limitWidth: true,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: avatar.background,
              ),
              child: Icon(avatar.icon, size: 54, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              profileUsername.value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 320),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: isLoginSuccess
                    ? Column(
                        key: const ValueKey('success'),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Logged in securely',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF36D17F),
                              BlendMode.srcATop,
                            ),
                            child: SizedBox(
                              width: 180,
                              height: 180,
                              child: Lottie.asset(
                                'assets/animations/check.json',
                                repeat: false,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        key: const ValueKey('form'),
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (needsPasswordField) ...[
                            PasswordInputField(
                              controller: passwordController,
                              label: l10n.loginPasswordLabel,
                              errorText: passwordError(),
                              shakeSignal: errorShakeTick.value,
                              onSubmitted:
                                  isFormValid() ? login : null,
                              onChanged: (_) {
                                passwordApiError.value = null;
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                          const Spacer(),
                          if (needsPasswordField)
                            PrimaryButton(
                              text: 'Login',
                              onPressed:
                                  isFormValid() ? login : null,
                              onDisabledPressed: onDisabledUnlockTap,
                              isLoading: showLoading.value,
                            ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

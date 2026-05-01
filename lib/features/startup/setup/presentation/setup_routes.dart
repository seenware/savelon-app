import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/profile/profile_service.dart';
import 'package:contacts/features/startup/setup/presentation/pages/choose_protection_page.dart';
import 'package:contacts/features/startup/setup/presentation/pages/create_vault_page.dart';
import 'package:contacts/features/startup/setup/presentation/pages/creating_vault_page.dart';
import 'package:contacts/features/startup/setup/presentation/pages/vault_created_page.dart';
import 'package:contacts/features/startup/setup/presentation/setup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

GoRoute setupRoute(String path) => GoRoute(
      path: path,
      redirect: (context, state) {
        final currentPath = state.uri.path;

        if (currentPath == path || currentPath == '$path/') {
          return '$path/create_vault';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: 'create_vault',
          pageBuilder: (context, state) => _transition(
            child: Consumer(
              builder: (context, ref, _) {
                final setupState = ref.watch(setupNotifierProvider);
                final notifier = ref.read(setupNotifierProvider.notifier);
                return CreateVaultPage(
                  initialUsername: setupState.username,
                  initialAvatarId: setupState.avatarId,
                  onAvatarChanged: notifier.setAvatarId,
                  onUsernameChanged: notifier.setUsername,
                  onBack: () => context.go(
                    '/startup/onboarding',
                    extra: <String, dynamic>{
                      'initialIndex': 3,
                      'noTransition': true,
                    },
                  ),
                  onContinue: () => context.go('$path/choose_protection'),
                );
              },
            ),
          ),
        ),
        GoRoute(
          path: 'choose_protection',
          pageBuilder: (context, state) => _transition(
            child: Consumer(
              builder: (context, ref, _) {
                return ChooseProtectionPage(
                  onBack: () => context.go('$path/create_vault'),
                  onProceedToCreatingVault: () =>
                      context.go('$path/creating_vault'),
                );
              },
            ),
          ),
        ),
        GoRoute(
          path: 'creating_vault',
          pageBuilder: (context, state) => _transition(
            child: Consumer(
              builder: (context, ref, _) {
                return CreatingVaultPage(
                  onBack: () => context.go('$path/choose_protection'),
                  onCompleted: () async {
                    final setupState = ref.read(setupNotifierProvider);
                    final mnemonic = await ref
                        .read(authProvider.notifier)
                        .setupNewSeed(
                          enablePassword: setupState.usePassword,
                          password: setupState.password,
                          stayInSetupFlow: true,
                        );
                    if (mnemonic == null) {
                      return false;
                    }
                    await ProfileService().saveProfile(
                      username: setupState.username,
                      avatarId: setupState.avatarId,
                    );
                    if (context.mounted) {
                      context.go('$path/vault_created');
                    }
                    return true;
                  },
                );
              },
            ),
          ),
        ),
        GoRoute(
          path: 'vault_created',
          pageBuilder: (context, state) => _transition(
            child: Consumer(
              builder: (context, ref, _) {
                return VaultCreatedPage(
                  onBack: () => context.go('$path/choose_protection'),
                  onOpenVault: () {
                    ref
                        .read(authProvider.notifier)
                        .completeSetupOpeningVault();
                  },
                );
              },
            ),
          ),
        ),
      ],
    );

CustomTransitionPage<void> _transition({required Widget child}) {
  return CustomTransitionPage<void>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.14, 0),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

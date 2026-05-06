// lib/app/router.dart

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/auth/auth_state.dart';
import 'package:contacts/features/main_app/main_app_route.dart';
import 'package:contacts/features/startup/lifetime_thanks/presentation/lifetime_thanks_route.dart';
import 'package:contacts/features/startup/login/presentation/login_route.dart';
import 'package:contacts/features/startup/onboarding/presentation/onboarding_route.dart';
import 'package:contacts/features/startup/paywall/presentation/paywall_route.dart';
import 'package:contacts/features/startup/setup/presentation/router/setup_route.dart';
import 'package:contacts/features/startup/subscription/presentation/subscription_expired_route.dart';
import 'package:contacts/features/startup/subscription/presentation/subscription_soft_warning_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ValueNotifier<int>(0);

  ref.listen(authProvider, (_, _) {
    notifier.value++;
  });

  return GoRouter(
    initialLocation: '/startup',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authAsync = ref.read(authProvider);

      // Keep splash visible while loading (includes auto-migration time).
      if (authAsync.isLoading) {
        return null;
      }

      // Remove splash once we know where to go.
      FlutterNativeSplash.remove();

      // Unexpected error — send to onboarding as a safe fallback.
      if (authAsync.hasError) {
        return '/startup/onboarding';
      }

      final authState = authAsync.value;

      if (authState is AuthStateNeedsOnboarding) {
        if (!state.matchedLocation.startsWith('/startup/onboarding') &&
            !state.matchedLocation.startsWith('/startup/setup')) {
          return '/startup/onboarding';
        }
      } else if (authState is AuthStateNeedsSoftPaywall) {
        final loc = state.matchedLocation;
        final mode = state.uri.queryParameters['mode'];
        final entry = state.uri.queryParameters['entry'];
        if (loc != '/startup/paywall' || mode != 'soft' || entry != 'startup') {
          return '/startup/paywall?mode=soft&entry=startup';
        }
      } else if (authState is AuthStateNeedsLifetimeThanks) {
        if (state.matchedLocation != '/startup/lifetime_thanks') {
          return '/startup/lifetime_thanks';
        }
      } else if (authState is AuthStateSubscriptionSoftWarning) {
        if (state.matchedLocation != '/startup/subscription_warning') {
          return '/startup/subscription_warning';
        }
      } else if (authState is AuthStateSubscriptionExpired) {
        if (state.matchedLocation != '/startup/subscription_expired') {
          return '/startup/subscription_expired';
        }
      } else if (authState is AuthStateNeedsLogin) {
        if (state.matchedLocation != '/startup/login') {
          return '/startup/login';
        }
      } else if (authState is AuthStateLoginSuccess) {
        if (state.matchedLocation != '/startup/login') {
          return '/startup/login';
        }
      } else if (authState is AuthStateAuthenticated) {
        final loc = state.matchedLocation;
        if (!loc.startsWith('/main_app')) {
          return '/main_app';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SizedBox.shrink()),
      ),
      onboardingRoute('/startup/onboarding'),
      setupRoute('/startup/setup'),
      paywallRoute('/startup/paywall'),
      lifetimeThanksRoute('/startup/lifetime_thanks'),
      subscriptionSoftWarningRoute('/startup/subscription_warning'),
      subscriptionExpiredRoute('/startup/subscription_expired'),
      loginRoute('/startup/login'),
      mainAppRoute('/main_app'),
    ],
  );
});

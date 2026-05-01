// lib/core/auth/auth_state.dart

import 'package:flutter/foundation.dart';

/// Authentication state for the app
@immutable
sealed class AuthState {
  const AuthState();
}

/// Paywall not yet cleared — shown once after setup or on cold-start when
/// the paywall_completed flag is absent.
class AuthStateNeedsPaywall extends AuthState {
  final bool passwordEnabled;
  const AuthStateNeedsPaywall({required this.passwordEnabled});
}

/// Soft paywall shown on app launch after the first free session.
/// User can dismiss and continue using non-premium features.
class AuthStateNeedsSoftPaywall extends AuthState {
  final bool passwordEnabled;
  const AuthStateNeedsSoftPaywall({required this.passwordEnabled});
}

/// One-time gratitude screen for early adopters and lifetime users.
class AuthStateNeedsLifetimeThanks extends AuthState {
  final bool passwordEnabled;
  const AuthStateNeedsLifetimeThanks({required this.passwordEnabled});
}

/// No seed exists - needs onboarding
class AuthStateNeedsOnboarding extends AuthState {
  const AuthStateNeedsOnboarding();
}

/// Seed exists but not authenticated - needs login
class AuthStateNeedsLogin extends AuthState {
  final bool passwordRequired;

  const AuthStateNeedsLogin({required this.passwordRequired});
}

/// Subscription expired but within the offline grace window.
/// User may dismiss and continue; must verify before grace window closes.
class AuthStateSubscriptionSoftWarning extends AuthState {
  final bool passwordEnabled;
  const AuthStateSubscriptionSoftWarning({required this.passwordEnabled});
}

/// Subscription expired and grace window has closed, or storage anomaly.
/// Hard block — user must verify online to continue.
class AuthStateSubscriptionExpired extends AuthState {
  final bool passwordEnabled;
  const AuthStateSubscriptionExpired({required this.passwordEnabled});
}

/// Fully authenticated and ready
class AuthStateAuthenticated extends AuthState {
  const AuthStateAuthenticated();
}

class AuthStateLoginSuccess extends AuthState {
  const AuthStateLoginSuccess();
}

// lib/core/auth/auth_state.dart

import 'package:flutter/foundation.dart';

/// Authentication state for the app
@immutable
sealed class AuthState {
  const AuthState();
}

/// Paywall shown when subscription access is required; user may dismiss and
/// continue using non-premium features.
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

// lib/features/startup/paywall/presentation/paywall_page.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/purchases/purchases_service.dart'
    show PurchasesService, SubscriptionRefreshResult, kRcEntitlementId;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

// ---------------------------------------------------------------------------
// Access check state
// ---------------------------------------------------------------------------

sealed class _AccessState {}

class _Checking extends _AccessState {}

class _AutoGranted extends _AccessState {
  /// True when granted by install date — writes the permanent flag.
  /// False when granted by an active RC entitlement — no flag needed.
  final bool permanent;
  final DateTime? purchasedPaidThrough;
  _AutoGranted({required this.permanent, this.purchasedPaidThrough});
}

class _Offline extends _AccessState {}

class _ShowPaywall extends _AccessState {
  final Offering offering;
  _ShowPaywall(this.offering);
}

class _NoOffering extends _AccessState {}

class _StoreAccountUnavailable extends _AccessState {}

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------

class PaywallPage extends HookConsumerWidget {
  final bool softMode;
  final bool startupEntry;
  const PaywallPage({
    super.key,
    this.softMode = false,
    this.startupEntry = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessState = useState<_AccessState>(_Checking());
    final purchaseError = useState<String?>(null);

    Future<void> checkAccess() async {
      accessState.value = _Checking();
      purchaseError.value = null;

      // 1. Connectivity check (required for purchase / entitlement refresh).
      final connectivity = await Connectivity().checkConnectivity();
      final isOffline = connectivity.every((r) => r == ConnectivityResult.none);
      if (isOffline) {
        accessState.value = _Offline();
        return;
      }

      // 2. RevenueCat — verify existing entitlement (subscriber re-onboarding).
      //
      // Use the same freshness rules as the main auth gate:
      // - entitled => auto-grant
      // - notEntitled => proceed to paywall
      // - staleCache/error => proceed to paywall (verification uncertain but
      //   user can still purchase/restore)
      final refresh = await PurchasesService.refreshIfOnline();
      if (refresh == SubscriptionRefreshResult.entitled) {
        final paidThrough = await PurchasesService.getCachedPaidThrough();
        accessState.value = _AutoGranted(
          permanent: false,
          purchasedPaidThrough: paidThrough,
        );
        return;
      }
      if (refresh == SubscriptionRefreshResult.storeAccountUnavailable) {
        accessState.value = _StoreAccountUnavailable();
        return;
      }

      // 3. Fetch current offering for the paywall.
      try {
        final offerings = await Purchases.getOfferings();
        final offering = offerings.current;
        if (offering == null) {
          accessState.value = _NoOffering();
          return;
        }
        accessState.value = _ShowPaywall(offering);
      } catch (error) {
        if (PurchasesService.isStoreAccountUnavailableError(error)) {
          accessState.value = _StoreAccountUnavailable();
          return;
        }
        accessState.value = _Offline();
      }
    }

    // Run on first build.
    useEffect(() {
      checkAccess();
      return null;
    }, const []);

    // Auto-grant: call completePaywall() immediately.
    useEffect(() {
      final s = accessState.value;
      if (s is _AutoGranted) {
        ref
            .read(authProvider.notifier)
            .completePaywall(
              grantPermanent: s.permanent,
              purchasedPaidThrough: s.purchasedPaidThrough,
            );
        if (softMode && context.mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop(true);
        }
      }
      return null;
    }, [accessState.value]);

    return PopScope(
      canPop: softMode,
      child: Scaffold(
        backgroundColor:
            softMode && Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFFAFAFA)
            : null,
        body: _buildBody(context, ref, accessState, purchaseError, checkAccess),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<_AccessState> accessState,
    ValueNotifier<String?> purchaseError,
    Future<void> Function() retry,
  ) {
    final state = accessState.value;
    Widget content;

    if (state is _Checking || state is _AutoGranted) {
      content = const Center(child: CircularProgressIndicator());
    } else if (state is _Offline) {
      content = _OfflineView(onRetry: retry);
    } else if (state is _StoreAccountUnavailable) {
      content = _StoreAccountUnavailableView(
        onRetry: retry,
        onContinueFree: () => _closeSoftPaywall(
          context,
          ref,
          unlockResult: false,
          source: 'storeAccountUnavailable',
        ),
      );
    } else if (state is _NoOffering) {
      content = _NoOfferingView(onRetry: retry);
    } else if (state is _ShowPaywall) {
      final paywall = PaywallView(
        offering: state.offering,
        onPurchaseCompleted: (customerInfo, _) {
          final expiry = customerInfo
              .entitlements
              .active[kRcEntitlementId]
              ?.expirationDate;
          ref
              .read(authProvider.notifier)
              .completePaywall(
                grantPermanent: false,
                purchasedPaidThrough: expiry != null
                    ? DateTime.tryParse(expiry)
                    : null,
              );
          if (softMode) {
            _closeSoftPaywall(
              context,
              ref,
              unlockResult: true,
              source: 'purchase',
            );
          }
        },
        onRestoreCompleted: (customerInfo) {
          if (customerInfo.entitlements.active.containsKey(kRcEntitlementId)) {
            final expiry = customerInfo
                .entitlements
                .active[kRcEntitlementId]
                ?.expirationDate;
            ref
                .read(authProvider.notifier)
                .completePaywall(
                  grantPermanent: false,
                  purchasedPaidThrough: expiry != null
                      ? DateTime.tryParse(expiry)
                      : null,
                );
            if (softMode) {
              _closeSoftPaywall(
                context,
                ref,
                unlockResult: true,
                source: 'restore',
              );
            }
          } else {
            purchaseError.value =
                'No active subscription found. Please purchase to continue.';
          }
        },
        onPurchaseError: (error) {
          purchaseError.value = error.message;
        },
        onRestoreError: (error) {
          purchaseError.value = error.message;
        },
        onDismiss: () {
          if (!softMode) return;
          _closeSoftPaywall(
            context,
            ref,
            unlockResult: false,
            source: 'sdkDismiss',
          );
        },
      );
      content = paywall;
    } else {
      content = const Center(child: CircularProgressIndicator());
    }

    if (!softMode) return content;
    return Stack(
      children: [
        Positioned.fill(child: content),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _closeSoftPaywall(
                    context,
                    ref,
                    unlockResult: false,
                    source: 'closeButton',
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _closeSoftPaywall(
    BuildContext context,
    WidgetRef ref, {
    required bool unlockResult,
    required String source,
  }) {
    ref.read(authProvider.notifier).dismissSoftPaywall();
    if (!context.mounted) return;
    // Modal soft paywalls (e.g. opened from Settings) must pop back to caller.
    if (!startupEntry && Navigator.of(context).canPop()) {
      Navigator.of(context).pop(unlockResult);
      return;
    }
    // Startup soft paywall is part of router flow, not a pushed modal.
    context.go('/main_app/contacts');
  }
}

// ---------------------------------------------------------------------------
// Sub-views
// ---------------------------------------------------------------------------

class _OfflineView extends StatelessWidget {
  final Future<void> Function() onRetry;
  const _OfflineView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 24),
            Text(
              'No Internet Connection',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Please connect to the internet and try again to see available plans.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoOfferingView extends StatelessWidget {
  final Future<void> Function() onRetry;
  const _NoOfferingView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 24),
            Text(
              'Store Unavailable',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Unable to load subscription options. Please try again.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreAccountUnavailableView extends StatelessWidget {
  final Future<void> Function() onRetry;
  final VoidCallback onContinueFree;

  const _StoreAccountUnavailableView({
    required this.onRetry,
    required this.onContinueFree,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 24),
            Text(
              'Google Play Account Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Purchases and restores need a signed-in Google Play account. '
              'You can continue using free features without signing in.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onContinueFree,
              child: const Text('Continue with Free Version'),
            ),
          ],
        ),
      ),
    );
  }
}

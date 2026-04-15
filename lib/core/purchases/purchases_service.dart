// lib/core/purchases/purchases_service.dart

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Entitlement identifier configured in the RevenueCat dashboard.
const kRcEntitlementId = 'Savelon Pro';

/// Grace period (days) after paidThrough before the hard block appears.
const kOfflineWindowDays = 30;

// ── Storage keys ─────────────────────────────────────────────────────────────

const _kPaywallKey = 'paywall_access';
const _kEarlyAdopter = 'early_adopter';
const _kSubscriber = 'subscriber';
const _kLifetime = 'lifetime';

const _kPaidThroughKey = 'sub_paid_through'; // ISO-8601 date
const _kLastVerifiedKey = 'sub_last_verified'; // ISO-8601 datetime
const _kCacheInitKey = 'sub_cache_init'; // written once, never deleted
const _kDemoAccessUntilKey = 'demo_access_until'; // ISO-8601 datetime
const _kFirstSessionCompletedKey = 'first_session_completed';
const _kLifetimeThanksShownKey = 'lifetime_thanks_shown_once';

/// Debug-only override to force the paywall to show even when the
/// early-adopter flag or other access markers are present.
///
/// Set this locally while debugging.
///
/// - [PaywallOverrideMode.forcePaywall]: always show paywall (no access)
/// - [PaywallOverrideMode.forceNoPaywall]: always grant access (skip paywall)
/// - [PaywallOverrideMode.normal]: production behavior
const PaywallOverrideMode kDebugPaywallOverride = PaywallOverrideMode.normal;

enum PaywallOverrideMode { forcePaywall, forceNoPaywall, normal }

// ── Result / state enums ─────────────────────────────────────────────────────

/// Result of an attempt to refresh entitlement from RevenueCat.
enum SubscriptionRefreshResult {
  /// Fresh server response confirmed an active entitlement. Cache was updated.
  entitled,

  /// Fresh server response confirmed no active entitlement. Safe to revoke.
  notEntitled,

  /// RC cache was stale but the server response timed out (or RC cache was
  /// fresh enough to skip the network hit on RC's side). The cached values
  /// remain untouched. Caller must NOT revoke on this result.
  staleCache,

  /// Device is offline. No network request was attempted.
  offline,

  /// An unexpected error occurred. Treat the same as staleCache.
  error,
}

/// Access decision based on locally cached entitlement data.
enum OfflineAccessState { active, softWarning, hardBlock }

enum DemoCodeRedeemStatus { success, invalidCode, outsideValidityWindow }

class DemoCodeDefinition {
  final String code;
  final DateTime? validFrom;
  final DateTime? validTo;
  final Duration duration;

  const DemoCodeDefinition({
    required this.code,
    required this.duration,
    this.validFrom,
    this.validTo,
  });

  bool isValidAt(DateTime now) {
    if (validFrom != null && now.isBefore(validFrom!)) return false;
    if (validTo != null && now.isAfter(validTo!)) return false;
    return true;
  }
}

class DemoCodeRedeemResult {
  final DemoCodeRedeemStatus status;
  final DateTime? accessUntil;

  const DemoCodeRedeemResult._({required this.status, this.accessUntil});

  const DemoCodeRedeemResult.success(DateTime accessUntil)
    : this._(status: DemoCodeRedeemStatus.success, accessUntil: accessUntil);

  const DemoCodeRedeemResult.failure(DemoCodeRedeemStatus status)
    : this._(status: status);
}

// ── PurchasesService ──────────────────────────────────────────────────────────

class PurchasesService {
  PurchasesService._();
  static bool _startupSoftPaywallShownThisLaunch = false;
  static bool _lifetimeThanksHandledThisLaunch = false;
  static bool _newSetupGraceThisLaunch = false;

  /// Optional override via `--dart-define` / `--dart-define-from-file`.
  /// Defaults to empty so repo clones have no usable access code.
  static const String _kDemoCodeFromEnv = String.fromEnvironment(
    'SAVELON_DEMO_CODE',
    defaultValue: '',
  );

  /// Duration for the single demo code. Defaults to 72h.
  static const int _kDemoCodeDurationHours = int.fromEnvironment(
    'SAVELON_DEMO_CODE_DURATION_HOURS',
    defaultValue: 72,
  );

  static final List<DemoCodeDefinition> accessCodes = _buildAccessCodes();

  static List<DemoCodeDefinition> _buildAccessCodes() {
    final code = _normalizeCode(_kDemoCodeFromEnv);
    if (code.isEmpty) return const <DemoCodeDefinition>[];
    final hours = _kDemoCodeDurationHours <= 0 ? 72 : _kDemoCodeDurationHours;
    return <DemoCodeDefinition>[
      DemoCodeDefinition(
        code: code,
        duration: Duration(hours: hours),
      ),
    ];
  }

  // ── Sentinel for non-expiring entitlements ────────────────────────────────

  /// Used as paidThrough when an active entitlement has no expiration date
  /// (e.g. lifetime purchase). Stored as ISO-8601 so downstream code is uniform.
  static final DateTime kLifetimeSentinel = DateTime(2099, 1, 1);

  // ── Paywall completion flag ───────────────────────────────────────────────

  /// True when access has been granted (permanently or via subscription).
  /// This is the fast cold-start gate — no network call required.
  static Future<bool> isPaywallCompleted() async {
    switch (kDebugPaywallOverride) {
      case PaywallOverrideMode.forcePaywall:
        return false;
      case PaywallOverrideMode.forceNoPaywall:
        return true;
      case PaywallOverrideMode.normal:
        break;
    }
    if (await hasActiveDemoAccess()) return true;
    return SecureStorageService.instance.containsKey(_kPaywallKey);
  }

  static Future<bool> hasPremiumAccess() async {
    if (await hasPurchasedAccess()) return true;
    return hasActiveDemoAccess();
  }

  static Future<bool> hasPurchasedAccess() async {
    switch (kDebugPaywallOverride) {
      case PaywallOverrideMode.forcePaywall:
        return false;
      case PaywallOverrideMode.forceNoPaywall:
        return true;
      case PaywallOverrideMode.normal:
        break;
    }
    return SecureStorageService.instance.containsKey(_kPaywallKey);
  }

  static Future<bool> isLifetimeOrEarlyAdopter() async {
    final value = await SecureStorageService.instance.read(_kPaywallKey);
    return value == _kEarlyAdopter || value == _kLifetime;
  }

  static Future<bool> hasCompletedFirstSession() async {
    return SecureStorageService.instance.containsKey(
      _kFirstSessionCompletedKey,
    );
  }

  static Future<void> markFirstSessionCompleted() async {
    await SecureStorageService.instance.write(_kFirstSessionCompletedKey, '1');
  }

  static void markNewSetupGraceThisLaunch() {
    _newSetupGraceThisLaunch = true;
  }

  static bool hasNewSetupGraceThisLaunch() {
    return _newSetupGraceThisLaunch;
  }

  static bool hasShownStartupSoftPaywallThisLaunch() {
    return _startupSoftPaywallShownThisLaunch;
  }

  static void markStartupSoftPaywallShownThisLaunch() {
    _startupSoftPaywallShownThisLaunch = true;
  }

  static Future<bool> shouldShowLifetimeThanks() async {
    if (_lifetimeThanksHandledThisLaunch) return false;
    if (!await isLifetimeOrEarlyAdopter()) return false;
    return !await SecureStorageService.instance.containsKey(
      _kLifetimeThanksShownKey,
    );
  }

  static Future<void> markLifetimeThanksShown() async {
    _lifetimeThanksHandledThisLaunch = true;
    await SecureStorageService.instance.write(_kLifetimeThanksShownKey, '1');
  }

  /// Grants permanent access (early adopters). Written once and never cleared.
  static Future<void> grantPermanentAccess() async {
    await SecureStorageService.instance.write(_kPaywallKey, _kEarlyAdopter);
  }

  /// Grants lifetime access. Written once and never cleared.
  static Future<void> grantLifetimeAccess() async {
    await SecureStorageService.instance.write(_kPaywallKey, _kLifetime);
  }

  /// Grants subscriber access. Can be cleared if the subscription expires.
  static Future<void> grantSubscriberAccess() async {
    await SecureStorageService.instance.write(_kPaywallKey, _kSubscriber);
  }

  /// Clears paywall_access (subscription confirmed expired on the server).
  static Future<void> revokeAccess() async {
    final current = await SecureStorageService.instance.read(_kPaywallKey);
    if (current == _kEarlyAdopter || current == _kLifetime) return;
    await SecureStorageService.instance.delete(_kPaywallKey);
  }

  // ── Demo code helpers ─────────────────────────────────────────────────────

  static Future<DateTime?> getDemoAccessUntil() async {
    final raw = await SecureStorageService.instance.read(_kDemoAccessUntilKey);
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  static Future<bool> hasActiveDemoAccess() async {
    final accessUntil = await getDemoAccessUntil();
    if (accessUntil == null) return false;
    return accessUntil.isAfter(DateTime.now());
  }

  static Future<DemoCodeRedeemResult> redeemDemoCode(String enteredCode) async {
    final normalized = _normalizeCode(enteredCode);
    if (normalized.isEmpty) {
      return const DemoCodeRedeemResult.failure(
        DemoCodeRedeemStatus.invalidCode,
      );
    }

    final definition = accessCodes.cast<DemoCodeDefinition?>().firstWhere(
      (d) => _normalizeCode(d!.code) == normalized,
      orElse: () => null,
    );
    if (definition == null) {
      return const DemoCodeRedeemResult.failure(
        DemoCodeRedeemStatus.invalidCode,
      );
    }

    final now = DateTime.now();
    if (!definition.isValidAt(now)) {
      return const DemoCodeRedeemResult.failure(
        DemoCodeRedeemStatus.outsideValidityWindow,
      );
    }

    final existingAccess = await getDemoAccessUntil();
    final proposedUntil = now.add(definition.duration);
    final effectiveUntil =
        (existingAccess != null && existingAccess.isAfter(proposedUntil))
        ? existingAccess
        : proposedUntil;

    await SecureStorageService.instance.write(
      _kDemoAccessUntilKey,
      effectiveUntil.toIso8601String(),
    );

    return DemoCodeRedeemResult.success(effectiveUntil);
  }

  static String _normalizeCode(String code) {
    return code.trim().toUpperCase();
  }

  // ── Subscription cache helpers ────────────────────────────────────────────

  static Future<void> cachePaidThrough(DateTime? date) async {
    final value = (date ?? kLifetimeSentinel).toIso8601String();
    await SecureStorageService.instance.write(_kPaidThroughKey, value);
  }

  static Future<DateTime?> getCachedPaidThrough() async {
    final raw = await SecureStorageService.instance.read(_kPaidThroughKey);
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  static Future<void> cacheLastVerified(DateTime when) async {
    await SecureStorageService.instance.write(
      _kLastVerifiedKey,
      when.toIso8601String(),
    );
  }

  static Future<DateTime?> getLastVerifiedAt() async {
    final raw = await SecureStorageService.instance.read(_kLastVerifiedKey);
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  // ── Cache init marker ─────────────────────────────────────────────────────

  /// True once the cache has been written for the first time (after a
  /// successful RC response or after purchase). When false + paidThrough == null,
  /// the caller may grant benefit-of-the-doubt access. When true + paidThrough
  /// == null, something broke in storage → soft warning.
  static Future<bool> isCacheInitialized() async {
    return SecureStorageService.instance.containsKey(_kCacheInitKey);
  }

  /// Idempotent: writes the init marker once and leaves it forever.
  static Future<void> ensureCacheInit() async {
    if (!await isCacheInitialized()) {
      await SecureStorageService.instance.write(_kCacheInitKey, '1');
    }
  }

  // ── RevenueCat refresh ────────────────────────────────────────────────────

  /// Refreshes entitlement data from RevenueCat and updates the local cache.
  ///
  /// Uses [CustomerInfo.requestDate] to determine whether the value returned by
  /// [Purchases.getCustomerInfo()] is already a server-fresh response (< 5 min
  /// old). If it is, it is used directly. If it is stale, the method registers
  /// a [Purchases.addCustomerInfoUpdateListener] and waits up to 8 seconds for
  /// the background server refresh to complete.
  ///
  /// Only returns [SubscriptionRefreshResult.notEntitled] when the result is
  /// CONFIRMED as a fresh server response — callers must NOT revoke access on
  /// any other result.
  static Future<SubscriptionRefreshResult> refreshIfOnline() async {
    // 1. Connectivity gate.
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.every((c) => c == ConnectivityResult.none)) {
      return SubscriptionRefreshResult.offline;
    }

    // 2. Set up a named listener so it can be removed in the finally block.
    //    addCustomerInfoUpdateListener returns void, so we keep the ref here.
    final completer = Completer<CustomerInfo>();
    void listener(CustomerInfo info) {
      if (!completer.isCompleted) completer.complete(info);
    }

    Purchases.addCustomerInfoUpdateListener(listener);

    try {
      // 3. First call — returns RC's current cache AND triggers a bg server
      //    refresh if the cache is stale (> RC's internal 5-min threshold).
      final cachedInfo = await Purchases.getCustomerInfo();

      // 4. Decide whether the cached data is already server-fresh.
      //    RC sets requestDate to the server timestamp of the last fetch.
      //    If it is < 5 minutes old, the cache IS the current server truth.
      final requestDate = DateTime.tryParse(cachedInfo.requestDate);
      final cacheAge = requestDate != null
          ? DateTime.now().difference(requestDate)
          : const Duration(days: 365); // treat unknown as very stale
      final isRcCacheFresh = cacheAge.inMinutes < 5;
      CustomerInfo freshInfo;
      if (isRcCacheFresh) {
        // Cache is already fresh — no need to wait for the listener.
        freshInfo = cachedInfo;
        if (!completer.isCompleted) completer.complete(cachedInfo);
      } else {
        // Cache is stale — wait for the background server response.
        freshInfo = await completer.future.timeout(const Duration(seconds: 8));
      }

      // 5. Process the confirmed-fresh result.
      //    EntitlementInfo.expirationDate is String? (ISO-8601) in the RC SDK.
      final entitlement = freshInfo.entitlements.active[kRcEntitlementId];
      if (entitlement != null) {
        final expiry = entitlement.expirationDate != null
            ? DateTime.tryParse(entitlement.expirationDate!)
            : null;
        await cachePaidThrough(expiry);
        await cacheLastVerified(DateTime.now());
        await ensureCacheInit();
        return SubscriptionRefreshResult.entitled;
      } else {
        // Confirmed from the server: no active entitlement.
        await cacheLastVerified(DateTime.now());
        await ensureCacheInit();
        return SubscriptionRefreshResult.notEntitled;
      }
    } on TimeoutException {
      // The server did not respond in time. The data is uncertain; do NOT
      // revoke — fall back to the cached values in storage.
      return SubscriptionRefreshResult.staleCache;
    } catch (_) {
      return SubscriptionRefreshResult.error;
    } finally {
      Purchases.removeCustomerInfoUpdateListener(listener);
    }
  }

  // ── Offline access evaluation ─────────────────────────────────────────────

  /// Decides the access tier based purely on locally cached data.
  ///
  /// Grace window is measured from `max(paidThrough, lastVerifiedAt)` so that
  /// a stale [paidThrough] (e.g. pre-renewal RC cache) doesn't cause a
  /// premature hard block — as long as we verified recently, the user keeps
  /// the full 30-day window.
  static OfflineAccessState evaluateOfflineAccess({
    required DateTime? paidThrough,
    required DateTime? lastVerifiedAt,
    required bool cacheInitialized,
  }) {
    final now = DateTime.now();

    // Active: paid-through date is still in the future.
    if (paidThrough != null && paidThrough.isAfter(now)) {
      return OfflineAccessState.active;
    }

    // No paidThrough data at all.
    if (paidThrough == null) {
      // Cache has never been written → first launch post-migration.
      // Benefit of the doubt: treat as active until next online verification.
      if (!cacheInitialized) return OfflineAccessState.active;
      // Cache was initialized but paidThrough is gone → storage anomaly.
      return OfflineAccessState.softWarning;
    }

    // paidThrough has expired. Compute the grace deadline from whichever
    // reference date is newer: paidThrough or lastVerifiedAt.
    // lastVerifiedAt can be newer when the subscription auto-renewed but we
    // hadn't yet fetched the updated paidThrough from RC.
    final referenceDate =
        (lastVerifiedAt != null && lastVerifiedAt.isAfter(paidThrough))
        ? lastVerifiedAt
        : paidThrough;

    final graceCutoff = referenceDate.add(
      const Duration(days: kOfflineWindowDays),
    );

    if (now.isBefore(graceCutoff)) {
      return OfflineAccessState.softWarning;
    }
    return OfflineAccessState.hardBlock;
  }
}

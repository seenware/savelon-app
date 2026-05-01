import 'dart:typed_data';

import 'package:contacts/core/crypto/crypto_provider.dart';
import 'package:contacts/core/crypto/key_derivation_service.dart';
import 'package:contacts/core/database/database_provider.dart';
import 'package:contacts/core/database/database_service.dart';
import 'package:contacts/core/database/schema/contacts_schema.dart';
import 'package:contacts/core/image_storage/image_storage_provider.dart';
import 'package:contacts/core/image_storage/image_storage_service.dart';
import 'package:contacts/core/purchases/purchases_service.dart'
    show
        OfflineAccessState,
        PaywallOverrideMode,
        PurchasesService,
        kDebugPaywallOverride,
        SubscriptionRefreshResult;
import 'package:contacts/core/storage/private_storage_migration.dart';
import 'package:contacts/core/storage/secure_storage_service.dart';
import 'package:contacts/core/review/app_review_service.dart';
import 'package:contacts/core/profile/profile_migration_service.dart';
import 'package:contacts/features/main_app/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:contacts/features/main_app/contacts/data/services/migration_service.dart';
import 'package:contacts/features/main_app/contacts/presentation/providers/contacts_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_state.dart';
import 'password_flow_argument_messages.dart';

class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    final crypto = ref.read(cryptoServiceProvider);

    // Fast path: already fully set up (guards against re-entrant builds
    // that can occur during migration setup).
    final db = ref.read(databaseProvider);
    if (db != null && crypto.isInitialized) {
      await _runProfileMigrationSafe();
      return const AuthStateAuthenticated();
    }

    // No seed means either a fresh install or an upgrade from the legacy app.
    if (!await crypto.hasSeed()) {
      return await _checkLegacyOrOnboard();
    }

    // Seed exists — enforce paywall if the flag is absent.
    // Fast local check (no network). Once purchased or auto-granted the flag
    // stays set across launches.
    final passwordRequired = await crypto.isPasswordEnabled();
    await _runProfileMigrationSafe();

    // Debug override: completely bypass paywall + subscription gates.
    // This must happen BEFORE any subscription refresh that could revoke access.
    if (kDebugPaywallOverride == PaywallOverrideMode.forceNoPaywall) {
      if (passwordRequired) {
        return const AuthStateNeedsLogin(passwordRequired: true);
      }
      await crypto.initialize();
      final dbNotifier = ref.read(databaseProvider.notifier);
      await dbNotifier.initialize(crypto.localDbKey);
      ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);
      return const AuthStateAuthenticated();
    }

    final paywallCompleted = await PurchasesService.isPaywallCompleted();

    if (!paywallCompleted) {
      return AuthStateNeedsLogin(passwordRequired: passwordRequired);
    }

    // Early adopters get a one-time gratitude screen.
    final paywallValue = await SecureStorageService.instance.read(
      'paywall_access',
    );
    if (paywallValue == 'early_adopter') {
      if (await PurchasesService.shouldShowLifetimeThanks()) {
        return AuthStateNeedsLifetimeThanks(passwordEnabled: passwordRequired);
      }
      return _resolvePostGateState(passwordRequired: passwordRequired);
    }

    // Active demo access is temporary but should bypass RevenueCat revocation
    // until the stored expiry time is reached.
    if (await PurchasesService.hasActiveDemoAccess()) {
      return _resolvePostGateState(passwordRequired: passwordRequired);
    }

    // ── Subscriber path — offline-first subscription gate ───────────────────
    //
    // Eagerly refresh from RevenueCat on every cold start with connectivity.
    // RC's own 5-min server cache makes back-to-back launches cheap.
    // Only revoke on a CONFIRMED server-fresh notEntitled response —
    // staleCache / offline / error all fall through to cached values.
    final refreshResult = await PurchasesService.refreshIfOnline();

    if (refreshResult == SubscriptionRefreshResult.notEntitled) {
      await PurchasesService.revokeAccess();
      return AuthStateNeedsPaywall(passwordEnabled: passwordRequired);
    }

    // entitled → cache was just updated; staleCache / offline / error → use
    // whatever is in storage.
    final paidThrough = await PurchasesService.getCachedPaidThrough();
    final lastVerifiedAt = await PurchasesService.getLastVerifiedAt();
    final cacheInitialized = await PurchasesService.isCacheInitialized();

    final access = PurchasesService.evaluateOfflineAccess(
      paidThrough: paidThrough,
      lastVerifiedAt: lastVerifiedAt,
      cacheInitialized: cacheInitialized,
    );

    if (access == OfflineAccessState.softWarning) {
      return AuthStateSubscriptionSoftWarning(
        passwordEnabled: passwordRequired,
      );
    }
    if (access == OfflineAccessState.hardBlock) {
      return AuthStateSubscriptionExpired(passwordEnabled: passwordRequired);
    }

    // active — proceed to normal auth.
    return _resolvePostGateState(passwordRequired: passwordRequired);
  }

  // ── Migration helpers ─────────────────────────────────────────────────────

  /// Decides what to do when no new-system seed exists yet.
  ///
  /// - No legacy file → normal onboarding.
  /// - Legacy file, no password → silently auto-migrate, then authenticate.
  /// - Legacy file, password-protected → show the normal login screen; the
  ///   entered password will be used as the legacy vault password in
  ///   [authenticate].
  Future<AuthState> _checkLegacyOrOnboard() async {
    final checker = MigrationService(
      storage: SecureStorageService.instance,
      contactsRepository: null,
    );

    if (!await checker.checkNeedsMigration()) {
      return const AuthStateNeedsOnboarding();
    }

    // Any user entering the legacy migration flow is an early adopter.
    // Keep this idempotent write tied to migration detection rather than
    // install date so reinstalls/new installs are handled correctly.
    await PurchasesService.grantPermanentAccess();

    if (await checker.requiresLegacyPassword()) {
      // The login page UI is identical — the user just enters their old
      // password; authenticate() will route it to _migrateWithPassword().
      return const AuthStateNeedsLogin(passwordRequired: true);
    }

    return await _autoMigrate();
  }

  /// Generates a new seed, opens the database, runs the no-password migration,
  /// and returns [AuthStateAuthenticated].
  Future<AuthState> _autoMigrate() async {
    final crypto = ref.read(cryptoServiceProvider);
    await crypto.generateNewSeed(enablePassword: false);

    final dbNotifier = ref.read(databaseProvider.notifier);
    await dbNotifier.initialize(crypto.localDbKey);
    ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);

    final repository = _buildRepository();
    await MigrationService(
      storage: SecureStorageService.instance,
      contactsRepository: repository,
    ).run();

    // Ensure any early contactsProvider listeners refresh after migration.
    ref.invalidate(contactsProvider);
    await _runProfileMigrationSafe();

    return const AuthStateAuthenticated();
  }

  // ── Authentication ────────────────────────────────────────────────────────

  Future<bool> authenticate({String? password}) async {
    state = const AsyncValue.loading();

    final crypto = ref.read(cryptoServiceProvider);

    try {
      // No seed: the user is coming from the legacy app.  The "password" they
      // entered on the login screen is their OLD vault password, not a new
      // seed password.  Route to migration instead of normal login.
      if (!await crypto.hasSeed()) {
        return await _migrateWithPassword(legacyPassword: password);
      }

      // Normal login.
      await crypto.initialize(password: password);

      final dbNotifier = ref.read(databaseProvider.notifier);
      await dbNotifier.initialize(crypto.localDbKey);
      ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);

      await _runProfileMigrationSafe();
      state = const AsyncValue.data(AuthStateLoginSuccess());
      return true;
    } catch (_) {
      // A wrong password causes crypto.initialize() to derive the wrong
      // localDbKey, which SQLCipher then rejects with open_failed.
      // Reset crypto so it is not left in a falsely-initialised state.
      crypto.reset();

      final passwordRequired = await crypto.isPasswordEnabled();
      state = AsyncValue.data(
        AuthStateNeedsLogin(passwordRequired: passwordRequired),
      );
      return false;
    }
  }

  /// Validates the legacy vault password, then sets up the new system and
  /// runs the migration.  Called from [authenticate] when no seed exists yet.
  Future<bool> _migrateWithPassword({String? legacyPassword}) async {
    final verifier = MigrationService(
      storage: SecureStorageService.instance,
      contactsRepository: null,
    );

    // Verify before touching any new-system state: if the password is wrong
    // the legacy file must remain intact for the next attempt.
    final valid = await verifier.verifyLegacyPassword(
      legacyPassword: legacyPassword,
    );
    if (!valid) {
      state = const AsyncValue.data(
        AuthStateNeedsLogin(passwordRequired: true),
      );
      return false;
    }

    // Password is correct — set up the new system, preserving the user's
    // password protection so they don't lose it after the migration.
    final crypto = ref.read(cryptoServiceProvider);
    await crypto.generateNewSeed(
      enablePassword: legacyPassword != null && legacyPassword.isNotEmpty,
      password: legacyPassword,
    );

    final dbNotifier = ref.read(databaseProvider.notifier);
    await dbNotifier.initialize(crypto.localDbKey);
    ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);

    // Repository is available now that the database is open.
    await MigrationService(
      storage: SecureStorageService.instance,
      contactsRepository: _buildRepository(),
    ).run(legacyPassword: legacyPassword);

    // Ensure any early contactsProvider listeners refresh after migration.
    ref.invalidate(contactsProvider);
    await _runProfileMigrationSafe();
    state = const AsyncValue.data(AuthStateLoginSuccess());
    return true;
  }

  // ── Password management ───────────────────────────────────────────────────

  /// Changes (or removes) the user's password.
  ///
  /// [currentPassword] must be provided when password protection is currently
  /// enabled.  Pass `null` for [newPassword] to remove password protection.
  ///
  /// Because [localDbKey] is derived from the (optionally password-strengthened)
  /// master seed, changing the password requires re-keying the SQLCipher
  /// database with the key derived from the new password.
  ///
  /// Throws [ArgumentError] on validation failure, rethrows crypto errors.
  Future<void> changePassword({
    String? currentPassword,
    required String? newPassword,
  }) async {
    final crypto = ref.read(cryptoServiceProvider);
    final dbNotifier = ref.read(databaseProvider.notifier);
    final db = ref.read(databaseProvider);

    if (db == null) throw StateError('Database not initialised');

    final passwordCurrentlyEnabled = await crypto.isPasswordEnabled();

    if (passwordCurrentlyEnabled &&
        (currentPassword == null || currentPassword.isEmpty)) {
      throw ArgumentError(PasswordFlowArgumentMessages.currentPasswordRequired);
    }

    if (newPassword != null && newPassword.length < 4) {
      throw ArgumentError(PasswordFlowArgumentMessages.passwordMinLength);
    }

    if (passwordCurrentlyEnabled &&
        currentPassword != null &&
        newPassword != null &&
        currentPassword == newPassword) {
      throw ArgumentError(PasswordFlowArgumentMessages.newPasswordMustDiffer);
    }

    // Verify the current password by deriving keys from it and comparing with
    // the key the database is already open with.  We must NOT call
    // crypto.initialize() here because that overwrites _derivedKeys with
    // potentially-wrong keys before we have validated anything.
    final mnemonic = await crypto.getSeedMnemonic();
    if (mnemonic == null) throw StateError('No seed found');

    if (passwordCurrentlyEnabled) {
      final testSeed = await crypto.seedManager.deriveMasterSeed(
        mnemonic,
        password: currentPassword,
      );
      final testKeys = await KeyDerivationService().deriveKeys(testSeed);
      if (!_bytesEqual(testKeys.localDbKey, crypto.localDbKey)) {
        throw ArgumentError(
          PasswordFlowArgumentMessages.currentPasswordIncorrect,
        );
      }
    }

    final newMasterSeed = await crypto.seedManager.deriveMasterSeed(
      mnemonic,
      password: newPassword,
    );
    final keyDerivation = KeyDerivationService();
    final newDerivedKeys = await keyDerivation.deriveKeys(newMasterSeed);

    // Re-encrypt any contact images before changing the key, because
    // ImageStorageService derives its cipher key from the same localDbKey.
    final oldImageStorage = ref.read(imageStorageProvider);
    if (oldImageStorage != null) {
      await _reencryptImages(db, oldImageStorage, newDerivedKeys.localDbKey);
    }

    // Replace the database file with a fresh copy encrypted with the new key.
    // Using dump-and-restore avoids the PRAGMA rekey key-format mismatch where
    // openDatabase(password: hexString) and PRAGMA rekey = "x'hex'" interpret
    // the same bytes differently, causing an un-openable database.
    await dbNotifier.changeEncryptionKey(newDerivedKeys.localDbKey);

    // Update the image storage provider to use the new key.
    final imageNotifier = ref.read(imageStorageProvider.notifier);
    imageNotifier.reset();
    imageNotifier.initialize(newDerivedKeys.localDbKey);

    // Update password-enabled flag in secure storage.
    await crypto.updatePasswordEnabled(newPassword != null);

    // Reinitialise crypto with the new derived keys.
    await crypto.initialize(password: newPassword);
  }

  // ── Session management ────────────────────────────────────────────────────

  Future<void> logout() async {
    state = const AsyncValue.loading();

    final crypto = ref.read(cryptoServiceProvider);
    final passwordRequired = await crypto.isPasswordEnabled();

    final dbNotifier = ref.read(databaseProvider.notifier);
    await dbNotifier.close();
    ref.read(imageStorageProvider.notifier).reset();

    state = AsyncValue.data(
      AuthStateNeedsLogin(passwordRequired: passwordRequired),
    );
  }

  Future<void> completeLoginSuccess() async {
    final postLoginState = await _resolvePostLoginState();
    state = AsyncValue.data(postLoginState);
  }

  void completeSetupFlow() {
    state = const AsyncValue.data(AuthStateAuthenticated());
  }

  /// After first-time vault setup, show the same login-success celebration UI
  /// before [completeLoginSuccess] resolves paywall / main app.
  void completeSetupOpeningVault() {
    state = const AsyncValue.data(AuthStateLoginSuccess());
  }

  Future<void> factoryReset() async {
    state = const AsyncValue.loading();

    final crypto = ref.read(cryptoServiceProvider);
    await crypto.deleteSeed();

    final dbNotifier = ref.read(databaseProvider.notifier);
    await dbNotifier.deleteDatabase();
    // Orphan files if DB provider had no open handle (state was null).
    await PrivateStorageMigration.deleteEncryptedDatabaseFiles();
    await PrivateStorageMigration.wipeContactImageDirectories();
    ref.read(imageStorageProvider.notifier).reset();

    state = const AsyncValue.data(AuthStateNeedsOnboarding());
  }

  // ── Setup ─────────────────────────────────────────────────────────────────

  Future<String?> setupNewSeed({
    required bool enablePassword,
    String? password,
    bool stayInSetupFlow = false,
  }) async {
    try {
      state = const AsyncValue.loading();

      if (enablePassword && (password == null || password.isEmpty)) {
        throw ArgumentError(
          PasswordFlowArgumentMessages.passwordRequiredWhenProtectionEnabled,
        );
      }

      final crypto = ref.read(cryptoServiceProvider);
      final mnemonic = await crypto.generateNewSeed(
        enablePassword: enablePassword,
        password: password,
      );

      final dbNotifier = ref.read(databaseProvider.notifier);
      await dbNotifier.initialize(crypto.localDbKey);
      ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);

      PurchasesService.markNewSetupGraceThisLaunch();
      await PurchasesService.markFirstSessionCompleted();
      // Setup is part of an active trusted flow, so once seed + DB are ready
      // the user should enter the app directly, even if password protection is enabled.
      state = AsyncValue.data(
        stayInSetupFlow
            ? const AuthStateNeedsOnboarding()
            : const AuthStateAuthenticated(),
      );
      return mnemonic;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  // ── Paywall ───────────────────────────────────────────────────────────────

  /// Called by the paywall page once access has been granted.
  ///
  /// [grantPermanent] — true only for early adopters.
  /// [purchasedPaidThrough] — expiration date extracted from the post-purchase
  ///   [CustomerInfo] provided by the RevenueCat SDK callbacks. Passing this
  ///   immediately populates the subscription cache so the next cold-start
  ///   doesn't read a pre-purchase stale RC response. Pass `null` for lifetime
  ///   (non-expiring) entitlements; the sentinel date is written instead.
  Future<void> completePaywall({
    bool grantPermanent = false,
    DateTime? purchasedPaidThrough,
  }) async {
    final currentState = state.value;
    final passwordEnabled = switch (currentState) {
      AuthStateNeedsPaywall s => s.passwordEnabled,
      AuthStateNeedsSoftPaywall s => s.passwordEnabled,
      AuthStateNeedsLifetimeThanks s => s.passwordEnabled,
      AuthStateNeedsLogin s => s.passwordRequired,
      _ => await ref.read(cryptoServiceProvider).isPasswordEnabled(),
    };

    if (grantPermanent) {
      await PurchasesService.grantPermanentAccess();
    } else {
      if (purchasedPaidThrough == null ||
          purchasedPaidThrough == PurchasesService.kLifetimeSentinel) {
        await PurchasesService.grantLifetimeAccess();
      } else {
        await PurchasesService.grantSubscriberAccess();
      }
      // Cache the expiration date from the just-completed purchase so the next
      // build() finds fresh data rather than potentially stale RC cache.
      await PurchasesService.cachePaidThrough(purchasedPaidThrough);
      await PurchasesService.cacheLastVerified(DateTime.now());
      await PurchasesService.ensureCacheInit();
    }
    PurchasesService.markStartupSoftPaywallShownThisLaunch();

    final db = ref.read(databaseProvider);

    if (db != null) {
      // Setup flow: DB is already open from setupNewSeed() — proceed directly.
      state = const AsyncValue.data(AuthStateAuthenticated());
      return;
    }

    // Cold-start path: DB is not open yet.
    if (passwordEnabled) {
      state = const AsyncValue.data(
        AuthStateNeedsLogin(passwordRequired: true),
      );
    } else {
      // No password — auto-open DB now.
      final crypto = ref.read(cryptoServiceProvider);
      await crypto.initialize();
      final dbNotifier = ref.read(databaseProvider.notifier);
      await dbNotifier.initialize(crypto.localDbKey);
      ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);
      state = const AsyncValue.data(AuthStateAuthenticated());
    }
  }

  // ── Subscription state management ─────────────────────────────────────────

  /// Dismisses the soft-warning and transitions to the normal login/auth flow.
  /// Only valid when the current state is [AuthStateSubscriptionSoftWarning].
  Future<void> dismissSubscriptionWarning() async {
    final currentState = state.value;
    if (currentState is! AuthStateSubscriptionSoftWarning) return;

    final passwordRequired = currentState.passwordEnabled;

    final db = ref.read(databaseProvider);
    if (db != null) {
      state = const AsyncValue.data(AuthStateAuthenticated());
      return;
    }

    if (passwordRequired) {
      state = const AsyncValue.data(
        AuthStateNeedsLogin(passwordRequired: true),
      );
    } else {
      final crypto = ref.read(cryptoServiceProvider);
      await crypto.initialize();
      final dbNotifier = ref.read(databaseProvider.notifier);
      await dbNotifier.initialize(crypto.localDbKey);
      ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);
      state = const AsyncValue.data(AuthStateAuthenticated());
    }
  }

  /// Dismisses the recurring launch soft paywall and resumes normal flow.
  Future<void> dismissSoftPaywall() async {
    final currentState = state.value;
    if (currentState is! AuthStateNeedsSoftPaywall) return;
    PurchasesService.markStartupSoftPaywallShownThisLaunch();
    final next = await _resolvePostGateState(
      passwordRequired: currentState.passwordEnabled,
    );
    state = AsyncValue.data(next);
  }

  Future<void> claimLifetimeThanks() async {
    final currentState = state.value;
    if (currentState is! AuthStateNeedsLifetimeThanks) return;
    await PurchasesService.markLifetimeThanksShown();
    final next = await _resolvePostGateState(
      passwordRequired: currentState.passwordEnabled,
    );
    state = AsyncValue.data(next);
    await ref.read(appReviewServiceProvider).maybePromptReviewOnce();
  }

  /// Attempts an online subscription verification from the hard-block screen.
  ///
  /// Returns an error message string if offline or on RC error, so the UI can
  /// display it inline. Returns `null` on success (state has been updated).
  Future<String?> verifySubscription() async {
    final currentState = state.value;
    if (currentState is! AuthStateSubscriptionExpired) return null;

    state = const AsyncValue.loading();

    final result = await PurchasesService.refreshIfOnline();

    switch (result) {
      case SubscriptionRefreshResult.entitled:
        // Re-run the full build() logic to pick up the new state.
        ref.invalidateSelf();
        return null;

      case SubscriptionRefreshResult.notEntitled:
        await PurchasesService.revokeAccess();
        state = AsyncValue.data(
          AuthStateNeedsPaywall(passwordEnabled: currentState.passwordEnabled),
        );
        return null;

      case SubscriptionRefreshResult.offline:
        state = AsyncValue.data(currentState);
        return 'No internet connection. Please connect and try again.';

      case SubscriptionRefreshResult.staleCache:
      case SubscriptionRefreshResult.error:
        state = AsyncValue.data(currentState);
        return 'Could not reach RevenueCat. Please try again.';
    }
  }

  // ── Private utilities ─────────────────────────────────────────────────────

  /// Builds a [ContactsRepositoryImpl] directly from the currently-open
  /// providers.  Used during migration before Riverpod's derived providers
  /// have had a chance to update.
  ContactsRepositoryImpl _buildRepository() {
    final db = ref.read(databaseProvider)!;
    final imageStorage = ref.read(imageStorageProvider)!;
    return ContactsRepositoryImpl(database: db, imageStorage: imageStorage);
  }

  Future<AuthState> _resolvePostGateState({
    required bool passwordRequired,
  }) async {
    final db = ref.read(databaseProvider);
    final crypto = ref.read(cryptoServiceProvider);
    if (db != null && crypto.isInitialized) {
      return const AuthStateAuthenticated();
    }

    if (passwordRequired) {
      return const AuthStateNeedsLogin(passwordRequired: true);
    }
    final dbNotifier = ref.read(databaseProvider.notifier);
    await crypto.initialize();
    await dbNotifier.initialize(crypto.localDbKey);
    ref.read(imageStorageProvider.notifier).initialize(crypto.localDbKey);
    return const AuthStateAuthenticated();
  }

  Future<AuthState> _resolvePostLoginState() async {
    final passwordRequired = await ref
        .read(cryptoServiceProvider)
        .isPasswordEnabled();
    final paywallCompleted = await PurchasesService.isPaywallCompleted();
    if (!paywallCompleted) {
      if (PurchasesService.hasNewSetupGraceThisLaunch()) {
        return const AuthStateAuthenticated();
      }
      if (!await PurchasesService.hasCompletedFirstSession()) {
        await PurchasesService.markFirstSessionCompleted();
        return const AuthStateAuthenticated();
      }
      if (!PurchasesService.hasShownStartupSoftPaywallThisLaunch()) {
        return AuthStateNeedsSoftPaywall(passwordEnabled: passwordRequired);
      }
      return AuthStateNeedsPaywall(passwordEnabled: passwordRequired);
    }
    return const AuthStateAuthenticated();
  }

  Future<void> _runProfileMigrationSafe() async {
    try {
      await ProfileMigrationService().migrateDefaultsIfNeeded();
    } catch (_) {}
  }

  bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// Re-encrypts every contact image from [oldStorage] using a newly created
  /// [ImageStorageService] keyed with [newLocalDbKey].
  Future<void> _reencryptImages(
    DatabaseService db,
    ImageStorageService oldStorage,
    Uint8List newLocalDbKey,
  ) async {
    final rows = await db.getAllContacts();
    if (rows.isEmpty) return;

    final newStorage = ImageStorageService(encryptionKey: newLocalDbKey);

    for (final row in rows) {
      final filename = row[ContactsSchema.columnImageFilename] as String?;
      if (filename == null || filename.isEmpty) continue;

      final contactId = row[ContactsSchema.columnId] as String?;
      if (contactId == null) continue;

      try {
        final bytes = await oldStorage.loadImage(contactId, filename);
        if (bytes != null) {
          // saveImage overwrites the file in-place; the filename is a hash of
          // the plaintext so it stays the same after re-encryption.
          await newStorage.saveImage(contactId, bytes);
        }
      } catch (_) {}
    }
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

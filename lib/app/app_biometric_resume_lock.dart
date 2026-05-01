import 'dart:async';

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/security/app_biometric_lock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

/// When enabled in settings flow, requires the platform biometric / device PIN
/// sheet after the app returns from the background. Does not read vault keys.
class AppBiometricResumeLock extends ConsumerStatefulWidget {
  const AppBiometricResumeLock({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AppBiometricResumeLock> createState() =>
      _AppBiometricResumeLockState();
}

class _AppBiometricResumeLockState extends ConsumerState<AppBiometricResumeLock>
    with WidgetsBindingObserver {
  bool _showLockOverlay = false;
  bool _wasPaused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _wasPaused = true;
    }
    if (state == AppLifecycleState.resumed && _wasPaused) {
      _wasPaused = false;
      unawaited(_maybeShowLock());
    }
  }

  Future<void> _maybeShowLock() async {
    final enabled = await AppBiometricLockStorage().readEnabled();
    if (!enabled || !mounted) return;

    final authAsync = ref.read(authProvider);
    if (authAsync.isLoading) return;

    final localAuth = LocalAuthentication();
    if (!await localAuth.isDeviceSupported()) return;
    if (!await localAuth.canCheckBiometrics) return;

    setState(() => _showLockOverlay = true);
    await _runLocalAuth(localAuth);
  }

  Future<void> _runLocalAuth(LocalAuthentication localAuth) async {
    final ok = await localAuth.authenticate(
      localizedReason: 'Unlock to continue using the app',
    );
    if (!mounted) return;
    if (ok) {
      setState(() => _showLockOverlay = false);
    }
  }

  Future<void> _onRetryTap() async {
    await _runLocalAuth(LocalAuthentication());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        if (_showLockOverlay)
          Positioned.fill(
            child: Material(
              color: Colors.black.withValues(alpha: 0.92),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unlock to continue',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: _onRetryTap,
                        child: const Text('Unlock'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

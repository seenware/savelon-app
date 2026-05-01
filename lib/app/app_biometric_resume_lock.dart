import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:contacts/core/auth/auth_provider.dart';
import 'package:contacts/core/auth/auth_state.dart';
import 'package:contacts/core/security/app_biometric_lock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

void _debugLogBiometricLock({
  required String runId,
  required String hypothesisId,
  required String location,
  required String message,
  required Map<String, Object?> data,
}) {
  try {
    final payload = <String, Object?>{
      'sessionId': 'ccdec5',
      'runId': runId,
      'hypothesisId': hypothesisId,
      'location': location,
      'message': message,
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    final line = '${jsonEncode(payload)}\n';
    File(
      '/Users/seenware/root-folder/04-dev/savelon/contacts/.cursor/debug-ccdec5.log',
    ).writeAsStringSync(line, mode: FileMode.append, flush: true);
  } catch (_) {}
}

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
  bool _startupLockPending = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H1',
      location: 'app_biometric_resume_lock.dart:initState',
      message: 'biometric lock widget initialized',
      data: <String, Object?>{},
    );
    // #endregion
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // #region agent log
      _debugLogBiometricLock(
        runId: 'post-fix',
        hypothesisId: 'H2',
        location: 'app_biometric_resume_lock.dart:initState:postFrame',
        message: 'running startup biometric check',
        data: <String, Object?>{},
      );
      // #endregion
      unawaited(_maybeShowLock(trigger: 'startup'));
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H2',
      location: 'app_biometric_resume_lock.dart:didChangeAppLifecycleState',
      message: 'lifecycle state changed',
      data: <String, Object?>{
        'state': state.name,
        'wasPaused': _wasPaused,
      },
    );
    // #endregion
    if (state == AppLifecycleState.paused) {
      _wasPaused = true;
    }
    if (state == AppLifecycleState.resumed && _wasPaused) {
      _wasPaused = false;
      unawaited(_maybeShowLock(trigger: 'resumed_after_pause'));
    }
  }

  Future<void> _maybeShowLock({required String trigger}) async {
    final enabled = await AppBiometricLockStorage().readEnabled();
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H3',
      location: 'app_biometric_resume_lock.dart:_maybeShowLock:readEnabled',
      message: 'read biometric lock preference',
      data: <String, Object?>{
        'enabled': enabled,
        'trigger': trigger,
      },
    );
    // #endregion
    if (!enabled || !mounted) {
      _startupLockPending = false;
      return;
    }

    final authAsync = ref.read(authProvider);
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H4',
      location: 'app_biometric_resume_lock.dart:_maybeShowLock:authState',
      message: 'checked auth loading before lock prompt',
      data: <String, Object?>{
        'authLoading': authAsync.isLoading,
        'authStateType': authAsync.value.runtimeType.toString(),
      },
    );
    // #endregion
    if (authAsync.isLoading) {
      _startupLockPending = true;
      // #region agent log
      _debugLogBiometricLock(
        runId: 'post-fix',
        hypothesisId: 'H4',
        location: 'app_biometric_resume_lock.dart:_maybeShowLock:authLoadingDefer',
        message: 'deferring lock until auth finishes loading',
        data: <String, Object?>{
          'trigger': trigger,
        },
      );
      // #endregion
      return;
    }
    _startupLockPending = false;
    final authState = authAsync.value;
    if (authState is AuthStateNeedsOnboarding) {
      // #region agent log
      _debugLogBiometricLock(
        runId: 'post-fix',
        hypothesisId: 'H4',
        location: 'app_biometric_resume_lock.dart:_maybeShowLock:skipOnboarding',
        message: 'skipping biometric lock during onboarding/setup state',
        data: <String, Object?>{
          'trigger': trigger,
        },
      );
      // #endregion
      return;
    }

    final localAuth = LocalAuthentication();
    final supported = await localAuth.isDeviceSupported();
    final canCheck = await localAuth.canCheckBiometrics;
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H5',
      location: 'app_biometric_resume_lock.dart:_maybeShowLock:deviceChecks',
      message: 'checked biometric capability',
      data: <String, Object?>{
        'isDeviceSupported': supported,
        'canCheckBiometrics': canCheck,
      },
    );
    // #endregion
    if (!supported) return;
    if (!canCheck) return;

    setState(() => _showLockOverlay = true);
    await _runLocalAuth(localAuth);
  }

  Future<void> _runLocalAuth(LocalAuthentication localAuth) async {
    final ok = await localAuth.authenticate(
      localizedReason: 'Unlock to continue using the app',
    );
    // #region agent log
    _debugLogBiometricLock(
      runId: 'initial-debug',
      hypothesisId: 'H5',
      location: 'app_biometric_resume_lock.dart:_runLocalAuth:result',
      message: 'biometric authenticate returned',
      data: <String, Object?>{
        'ok': ok,
      },
    );
    // #endregion
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
    ref.listen(authProvider, (previous, next) {
      if (!_startupLockPending) return;
      if (next.isLoading) return;
      // #region agent log
      _debugLogBiometricLock(
        runId: 'post-fix',
        hypothesisId: 'H4',
        location: 'app_biometric_resume_lock.dart:build:authListener',
        message: 'auth finished loading, retrying startup lock',
        data: <String, Object?>{
          'nextStateType': next.value.runtimeType.toString(),
        },
      );
      // #endregion
      unawaited(_maybeShowLock(trigger: 'auth_ready_after_startup'));
    });

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

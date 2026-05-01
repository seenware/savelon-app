// lib/features/startup/setup/presentation/setup_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupState {
  final String? password;
  final String username;
  final String avatarId;
  final bool addPasswordEnabled;
  final bool appBiometricLockEnabled;

  const SetupState({
    this.password,
    this.username = 'My vault',
    this.avatarId = 'cat',
    this.addPasswordEnabled = false,
    this.appBiometricLockEnabled = false,
  });

  SetupState copyWith({
    String? password,
    String? username,
    String? avatarId,
    bool? addPasswordEnabled,
    bool? appBiometricLockEnabled,
  }) {
    return SetupState(
      password: password ?? this.password,
      username: username ?? this.username,
      avatarId: avatarId ?? this.avatarId,
      addPasswordEnabled: addPasswordEnabled ?? this.addPasswordEnabled,
      appBiometricLockEnabled:
          appBiometricLockEnabled ?? this.appBiometricLockEnabled,
    );
  }

  SetupState copyWithNullablePassword(String? password) {
    return SetupState(
      password: password,
      username: username,
      avatarId: avatarId,
      addPasswordEnabled: addPasswordEnabled,
      appBiometricLockEnabled: appBiometricLockEnabled,
    );
  }

  bool get usePassword => password != null && password!.isNotEmpty;
}

class SetupNotifier extends Notifier<SetupState> {
  @override
  SetupState build() {
    return const SetupState();
  }

  void setPassword(String? password) {
    state = state.copyWithNullablePassword(password);
  }

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setAvatarId(String avatarId) {
    state = state.copyWith(avatarId: avatarId);
  }

  void setAddPasswordEnabled(bool enabled) {
    state = state.copyWith(addPasswordEnabled: enabled);
  }

  void setAppBiometricLockEnabled(bool enabled) {
    state = state.copyWith(appBiometricLockEnabled: enabled);
  }

  void reset() {
    state = const SetupState();
  }

  String? get password => state.password;
  String get username => state.username;
  String get avatarId => state.avatarId;
  bool get addPasswordEnabled => state.addPasswordEnabled;
  bool get appBiometricLockEnabled => state.appBiometricLockEnabled;
  bool get usePassword => state.usePassword;
}

final setupNotifierProvider = NotifierProvider<SetupNotifier, SetupState>(
  () => SetupNotifier(),
);

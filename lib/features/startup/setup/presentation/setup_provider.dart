// lib/features/startup/setup/presentation/setup_provider.dart

import 'package:contacts/core/profile/profile_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupState {
  final String? password;
  final String username;
  final String avatarId;
  final bool addPasswordEnabled;

  const SetupState({
    this.password,
    this.username = ProfileConstants.defaultUsername,
    this.avatarId = 'cat',
    this.addPasswordEnabled = false,
  });

  SetupState copyWith({
    String? password,
    String? username,
    String? avatarId,
    bool? addPasswordEnabled,
  }) {
    return SetupState(
      password: password ?? this.password,
      username: username ?? this.username,
      avatarId: avatarId ?? this.avatarId,
      addPasswordEnabled: addPasswordEnabled ?? this.addPasswordEnabled,
    );
  }

  SetupState copyWithNullablePassword(String? password) {
    return SetupState(
      password: password,
      username: username,
      avatarId: avatarId,
      addPasswordEnabled: addPasswordEnabled,
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

  void reset() {
    state = const SetupState();
  }

  String? get password => state.password;
  String get username => state.username;
  String get avatarId => state.avatarId;
  bool get addPasswordEnabled => state.addPasswordEnabled;
  bool get usePassword => state.usePassword;
}

final setupNotifierProvider = NotifierProvider<SetupNotifier, SetupState>(
  () => SetupNotifier(),
);

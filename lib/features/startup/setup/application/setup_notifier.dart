import 'package:contacts/features/startup/setup/domain/setup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  SetupNotifier.new,
);

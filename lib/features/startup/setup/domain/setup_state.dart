import 'package:contacts/core/profile/profile_constants.dart';

/// Wizard-local state for the first-time vault setup flow.
///
/// Persisted only in memory until [SetupNotifier] drives seed creation
/// and profile save on the final step.
class SetupState {
  const SetupState({
    this.password,
    this.username = ProfileConstants.defaultUsername,
    this.avatarId = 'cat',
    this.addPasswordEnabled = false,
  });

  final String? password;
  final String username;
  final String avatarId;
  final bool addPasswordEnabled;

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

  /// Replaces password with an explicit nullable value (unlike [copyWith],
  /// which would keep the previous password when `null` is passed).
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

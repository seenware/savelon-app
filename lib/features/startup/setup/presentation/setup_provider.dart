// lib/features/startup/setup/presentation/setup_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupState {
  final String? password;
  final String? secretKey;

  const SetupState({this.password, this.secretKey});

  SetupState copyWith({String? password, String? secretKey}) {
    return SetupState(
      password: password ?? this.password,
      secretKey: secretKey ?? this.secretKey,
    );
  }

  SetupState copyWithNullablePassword(String? password) {
    return SetupState(password: password, secretKey: secretKey);
  }

  bool get hasSecretKey => secretKey != null && secretKey!.isNotEmpty;
  bool get isComplete => hasSecretKey;
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

  void setSecretKey(String secretKey) {
    state = state.copyWith(secretKey: secretKey);
  }

  void reset() {
    state = const SetupState();
  }

  String? get password => state.password;
  String? get secretKey => state.secretKey;
  bool get usePassword => state.usePassword;
}

final setupNotifierProvider = NotifierProvider<SetupNotifier, SetupState>(
  () => SetupNotifier(),
);

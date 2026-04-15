import 'package:contacts/core/auth/password_flow_argument_messages.dart';
import 'package:contacts/l10n/app_localizations.dart';

/// Returns a user-facing localized string for known auth/crypto [ArgumentError]s.
String localizePasswordFlowArgumentError(
  AppLocalizations l10n,
  Object? message,
) {
  final s = message?.toString();
  if (s == null || s.isEmpty) return l10n.settingsPasswordInvalidFallback;
  switch (s) {
    case PasswordFlowArgumentMessages.currentPasswordIncorrect:
      return l10n.settingsCurrentPasswordIncorrect;
    case PasswordFlowArgumentMessages.currentPasswordRequired:
      return l10n.settingsCurrentPasswordRequired;
    case PasswordFlowArgumentMessages.passwordMinLength:
      return l10n.exportPasswordHelper(4);
    case PasswordFlowArgumentMessages.newPasswordMustDiffer:
      return l10n.settingsNewPasswordMustDiffer;
    case PasswordFlowArgumentMessages.passwordRequiredWhenProtectionEnabled:
      return l10n.authPasswordRequiredWhenProtectionEnabled;
    case PasswordFlowArgumentMessages.passwordRequiredWhenEnablePassword:
      return l10n.authPasswordRequiredWhenEnablePassword;
    case PasswordFlowArgumentMessages.passwordRequiredForAccount:
      return l10n.authPasswordRequiredForAccount;
    default:
      return s;
  }
}

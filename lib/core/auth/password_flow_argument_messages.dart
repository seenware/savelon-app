/// Exact [ArgumentError.message] strings for password flows.
/// Keep in sync with [localizePasswordFlowArgumentError] in `lib/l10n/`.
abstract final class PasswordFlowArgumentMessages {
  static const currentPasswordIncorrect = 'Current password is incorrect';
  static const currentPasswordRequired = 'Current password is required';
  static const passwordMinLength = 'Password must be at least 4 characters';
  static const newPasswordMustDiffer =
      'New password must be different from current password';
  static const passwordRequiredWhenProtectionEnabled =
      'Password required when password protection is enabled';
  static const passwordRequiredWhenEnablePassword =
      'Password required when enablePassword is true';
  static const passwordRequiredForAccount =
      'Password required for this account';
}

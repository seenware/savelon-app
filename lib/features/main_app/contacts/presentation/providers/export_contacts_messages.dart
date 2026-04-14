// lib/features/main_app/contacts/presentation/providers/export_contacts_messages.dart
//
// Single source for export copy + validation rules shared by notifier and UI.

/// Minimum length for a password on protected (.zip) export — keep in sync with UI validation.
const int kExportProtectedPasswordMinLength = 8;

enum ExportContactsError {
  contactsUnavailable,
  noContacts,
  passwordRequiredForProtected,
  passwordTooShortForProtected,
  exportFailed,
}

extension ExportContactsErrorX on ExportContactsError {
  String toUserMessage([String? exportFailureDetail]) {
    return switch (this) {
      ExportContactsError.contactsUnavailable =>
        'Contacts are not available yet.',
      ExportContactsError.noContacts => 'No contacts to export.',
      ExportContactsError.passwordRequiredForProtected =>
        'Password is required for a protected export.',
      ExportContactsError.passwordTooShortForProtected =>
        'Protected export requires a password of at least '
            '$kExportProtectedPasswordMinLength characters.',
      ExportContactsError.exportFailed =>
        'Export failed: ${exportFailureDetail ?? 'unknown error'}',
    };
  }

  /// Shown on password fields on the protected-export screen; SnackBar would duplicate.
  bool get isRedundantWithPasswordExportFields =>
      this == ExportContactsError.passwordRequiredForProtected ||
      this == ExportContactsError.passwordTooShortForProtected;
}

enum ExportContactsNotice {
  downloadStarted,
  fileSavedSuccessfully,
}

extension ExportContactsNoticeX on ExportContactsNotice {
  String get message => switch (this) {
        ExportContactsNotice.downloadStarted => 'Download started.',
        ExportContactsNotice.fileSavedSuccessfully =>
          'File saved successfully.',
      };
}

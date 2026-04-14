import 'package:contacts/features/main_app/contacts/presentation/providers/export_contacts_messages.dart';
import 'package:contacts/l10n/app_localizations.dart';

extension ExportContactsErrorL10n on ExportContactsError {
  String localizedMessage(AppLocalizations l10n, [String? exportFailureDetail]) {
    return switch (this) {
      ExportContactsError.contactsUnavailable =>
        l10n.exportErrorContactsUnavailable,
      ExportContactsError.noContacts => l10n.exportErrorNoContacts,
      ExportContactsError.passwordRequiredForProtected =>
        l10n.exportErrorPasswordRequired,
      ExportContactsError.passwordTooShortForProtected =>
        l10n.exportErrorPasswordTooShort(kExportProtectedPasswordMinLength),
      ExportContactsError.exportFailed =>
        l10n.exportErrorFailed(exportFailureDetail ?? 'unknown error'),
    };
  }
}

extension ExportContactsNoticeL10n on ExportContactsNotice {
  String localizedMessage(AppLocalizations l10n) {
    return switch (this) {
      ExportContactsNotice.downloadStarted =>
        l10n.exportNoticeDownloadStarted,
      ExportContactsNotice.fileSavedSuccessfully =>
        l10n.exportNoticeFileSaved,
    };
  }
}

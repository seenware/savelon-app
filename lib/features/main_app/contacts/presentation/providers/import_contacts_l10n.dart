import 'package:contacts/features/main_app/contacts/presentation/providers/import_contacts_provider.dart';
import 'package:contacts/l10n/app_localizations.dart';

extension ImportContactsErrorL10n on ImportContactsError {
  String localizedMessage(AppLocalizations l10n, [String? detail]) {
    return switch (this) {
      ImportContactsError.unsupportedSource => l10n.importErrorUnsupportedSource,
      ImportContactsError.permissionDenied =>
        l10n.importErrorPermissionDenied,
      ImportContactsError.noContacts => l10n.importErrorNoContacts,
      ImportContactsError.unsupportedFileType =>
        l10n.importErrorUnsupportedFileType,
      ImportContactsError.invalidFile => l10n.importErrorInvalidFile,
      ImportContactsError.wrongArchivePassword =>
        l10n.importErrorWrongPassword,
      ImportContactsError.noVcfInArchive => l10n.importErrorNoVcfInArchive,
      ImportContactsError.importFailed =>
        l10n.importErrorFailed(detail ?? 'unknown error'),
    };
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Verschlüsselte Kontakte';

  @override
  String get navContacts => 'Kontakte';

  @override
  String get navOrganize => 'Organisieren';

  @override
  String get navSupport => 'Support';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystemDefault => 'Systemstandard';

  @override
  String get organizeTitle => 'Organisieren';

  @override
  String get supportTitle => 'Support';

  @override
  String get search => 'Suchen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonMerge => 'Zusammenführen';

  @override
  String get commonSkip => 'Überspringen';

  @override
  String get commonRetry => 'Wiederholen';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonNext => 'Weiter';

  @override
  String get commonBack => 'Zurück';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nein';

  @override
  String get commonContinue => 'Fortfahren';

  @override
  String get commonTryAgain => 'Erneut versuchen';

  @override
  String get commonApply => 'Anwenden';

  @override
  String get commonDiscard => 'Verwerfen';

  @override
  String get commonUnlock => 'Entsperren';

  @override
  String get commonLoading => 'Laden...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Fehler: $error';
  }

  @override
  String get brandSlogan => 'Ihre Kontakte. Nur Ihre.';

  @override
  String get contactNotFound => 'Kontakt nicht gefunden';

  @override
  String get contactDeleted => 'Kontakt gelöscht';

  @override
  String get contactUpdated => 'Kontakt aktualisiert';

  @override
  String get contactSaved => 'Kontakt gespeichert';

  @override
  String get contactsMerged => 'Kontakte zusammengeführt';

  @override
  String get deleteContactTitle => 'Kontakt löschen';

  @override
  String deleteContactConfirm(String name) {
    return 'Sind Sie sicher, dass Sie $name löschen möchten?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Sind Sie sicher, dass Sie „$name“ löschen möchten?';
  }

  @override
  String failedToDelete(String error) {
    return 'Fehler beim Löschen: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Aktualisierung fehlgeschlagen: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get noName => 'Kein Name';

  @override
  String get noNameTitle => 'Kein Name';

  @override
  String get noNameBody =>
      'Dieser Kontakt hat keinen Namen. Trotzdem speichern?';

  @override
  String get discardChangesTitle => 'Änderungen verwerfen?';

  @override
  String get discardChangesBody =>
      'Es liegen nicht gespeicherte Änderungen vor, die verloren gehen.';

  @override
  String get newContact => 'Neuer Kontakt';

  @override
  String get editContact => 'Kontakt bearbeiten';

  @override
  String get addMore => 'Fügen Sie weitere hinzu';

  @override
  String get addNameFieldsTitle => 'Namensfelder hinzufügen';

  @override
  String get call => 'Anrufen';

  @override
  String get sendEmail => 'E-Mail senden';

  @override
  String get copy => 'Kopieren';

  @override
  String get visit => 'Besuchen';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get importContacts => 'Kontakte importieren';

  @override
  String get importing => 'Importieren...';

  @override
  String importedCount(int count) {
    return '$count Kontakte importiert';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported Kontakte importiert, $skipped übersprungen';
  }

  @override
  String get failedToImportContacts =>
      'Kontakte konnten nicht importiert werden';

  @override
  String get noContactsToImport =>
      'Es sind keine Kontakte zum Importieren vorhanden.';

  @override
  String get contactsPermissionRequiredImport =>
      'Zum Importieren von Kontakten ist die Berechtigung „Kontakte“ erforderlich';

  @override
  String get importDialogTitle => 'Kontakte importieren';

  @override
  String get importDialogBody =>
      'Kontakte von Ihrem Gerät oder aus einer Datei importieren?';

  @override
  String get importSourceTitle => 'Import';

  @override
  String get importZipPasswordTitle => 'Archivpasswort';

  @override
  String get importZipPasswordChecking => 'Wird geprüft...';

  @override
  String get exportContacts => 'Kontakte exportieren';

  @override
  String get unlockPro => 'Pro freischalten';

  @override
  String get exportContactsTitle => 'Kontakte exportieren';

  @override
  String get exportSubtitle =>
      'Wählen Sie aus, wie Sie Ihre Kontakte speichern möchten.';

  @override
  String get exportFormatVcfTitle => 'Speichern als .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Eine Datei, die mit Apple-Kontakten, Google-Kontakten und mehr funktioniert.';

  @override
  String get exportFormatZipTitle => 'Im passwortgeschützten Archiv speichern';

  @override
  String get exportFormatZipSubtitle =>
      'Ein .zip mit Ihrem .vcf darin – zum Öffnen ist ein Passwort erforderlich.';

  @override
  String get exportProtectedTitle => 'Geschützter Export';

  @override
  String get exportCompleteTitle => 'Export abgeschlossen';

  @override
  String get stillLoadingContacts =>
      'Es werden immer noch Kontakte geladen. Bitte warten.';

  @override
  String get couldNotLoadContacts => 'Kontakte konnten nicht geladen werden.';

  @override
  String get passwordChangedSuccess => 'Passwort erfolgreich geändert';

  @override
  String get passwordProtectionEnabled =>
      'Passwortschutz erfolgreich aktiviert';

  @override
  String get passwordProtectionRemoved =>
      'Der Passwortschutz wurde erfolgreich entfernt';

  @override
  String get removePasswordProtectionButton => 'Passwortschutz entfernen';

  @override
  String get changePasswordTitle => 'Passwort ändern';

  @override
  String get setPasswordTitle => 'Passwort festlegen';

  @override
  String get passwordSettingsChangeTitle => 'Passwort ändern';

  @override
  String get passwordSettingsSetTitle => 'Passwort festlegen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Datenschutzrichtlinie konnte nicht geöffnet werden: $error';
  }

  @override
  String get resetAppTitle => 'App zurücksetzen';

  @override
  String get resetAppConfirmTitle =>
      'Alle Kontakte löschen und die App zurücksetzen?';

  @override
  String get resetAppCannotUndo => 'Dies kann nicht rückgängig gemacht werden';

  @override
  String resetAppError(String error) {
    return 'Fehler beim Zurücksetzen der App: $error';
  }

  @override
  String get photoPickerNewImage => 'Neues Bild auswählen';

  @override
  String get photoPickerRemoveImage => 'Bild entfernen';

  @override
  String get onboardingHeadline1 => 'Wer kann auf Ihre Kontakte zugreifen?';

  @override
  String get onboardingSubline1 =>
      'Einige Apps laden sie in die Cloud hoch. Dies kann zu größeren Datenschutzrisiken führen.';

  @override
  String get onboardingHeadline2 => 'Viele Apps verlangen einen Kontaktzugriff';

  @override
  String get onboardingSubline2 =>
      'Es kann nützlich sein – wichtige Kontakte sollten jedoch privat bleiben.';

  @override
  String get onboardingHeadline3 => 'Halten Sie sensible Kontakte getrennt';

  @override
  String get onboardingSubline3 =>
      'Wir empfehlen, wichtige und selten verwendete Kontakte außerhalb Ihrer Hauptkontakte-App zu speichern.';

  @override
  String get onboardingHeadline4 => 'Schützen Sie Ihre wichtigen Kontakte';

  @override
  String get onboardingSubline4 =>
      'Savelon speichert sie auf Ihrem Gerät, verschlüsselt und geschützt vor anderen Apps.';

  @override
  String get onboardingGetStarted => 'Legen Sie los';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get activateDemoTitle => 'Demo aktivieren';

  @override
  String get activateDemoCancel => 'Abbrechen';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Sie haben jetzt Demozugang bis $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Passwortschutz hinzufügen';

  @override
  String get setupPasswordShortError => 'Verwenden Sie mindestens 4 Zeichen';

  @override
  String get setupPasswordMismatch => 'Passwörter stimmen nicht überein';

  @override
  String get setupPasswordFailedSeed =>
      'Die Seed-Generierung ist fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Initialisierung fehlgeschlagen. Fehler: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Ihre Kontakte werden weiterhin durch einen langen geheimen Schlüssel stark verschlüsselt, der nur auf Ihrem Gerät gespeichert wird. Aber das Passwort bietet zusätzlichen Schutz.';

  @override
  String get setupPasswordLabel => 'Passwort';

  @override
  String get setupPasswordHelper => 'Mindestens 4 Zeichen';

  @override
  String get setupPasswordConfirmLabel => 'Passwort bestätigen';

  @override
  String get setupPasswordWarning =>
      'Dieses Passwort kann nicht wiederhergestellt werden. Schreiben Sie es auf und bewahren Sie es gut auf!';

  @override
  String get setupPasswordPageTitle => 'Passwort erstellen';

  @override
  String get setupPasswordNext => 'Weiter';

  @override
  String get setupPasswordSkip => 'Überspringen';

  @override
  String get confirmationCheckboxTitle =>
      'Ich verstehe, dass mein Passwort nicht wiederhergestellt werden kann';

  @override
  String get loginWelcomeBack => 'Willkommen zurück';

  @override
  String get loginPasswordLabel => 'Passwort';

  @override
  String get loginUnlock => 'Entsperren';

  @override
  String get loginPasswordRequired => 'Geben Sie Ihr Passwort ein';

  @override
  String get loginIncorrectPassword =>
      'Falsches Passwort. Bitte versuchen Sie es erneut.';

  @override
  String get paywallNoSubscription =>
      'Kein aktives Abonnement gefunden. Bitte kaufen Sie ein Abonnement, um fortzufahren.';

  @override
  String get lifetimeThanksTitle => 'Danke, dass du bei uns bist';

  @override
  String get lifetimeThanksSubtitle =>
      'Wir schenken dir lebenslangen Pro-Zugang';

  @override
  String get lifetimeThanksGift => 'Geschenk';

  @override
  String get lifetimeThanksCta => 'Lebenslangen Zugang sichern';

  @override
  String get paywallNoInternetTitle => 'Keine Internetverbindung';

  @override
  String get paywallNoInternetBody =>
      'Für den erstmaligen Zugriff auf die App ist eine Internetverbindung erforderlich. Bitte stellen Sie eine Verbindung her und versuchen Sie es erneut.';

  @override
  String get paywallStoreUnavailableTitle => 'Store nicht verfügbar';

  @override
  String get paywallStoreUnavailableBody =>
      'Abonnementoptionen können nicht geladen werden. Bitte versuchen Sie es erneut.';

  @override
  String get subscriptionVerifyTitle => 'Abonnement überprüfen';

  @override
  String get subscriptionSoftWarningTitle =>
      'Abonnementbestätigung erforderlich';

  @override
  String get subscriptionContinueAnyway => 'Trotzdem fortfahren';

  @override
  String subscriptionLastVerified(String date) {
    return 'Zuletzt überprüft $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Das Abonnement konnte online nicht überprüft werden.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Ihr Zugriff bleibt bis $date bestehen – stellen Sie vorher eine Verbindung her, um dies zu überprüfen.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Stellen Sie eine Verbindung zum Internet her, um Ihr Abonnement zu überprüfen.';

  @override
  String get organizeNoDuplicates => 'Keine potenziellen Duplikate gefunden';

  @override
  String get organizeSkippedShownAgain =>
      'Übersprungene Duplikate werden erneut angezeigt.';

  @override
  String get organizeShowSkippedTooltip =>
      'Übersprungene Duplikatgruppen erneut anzeigen';

  @override
  String organizeFailedToLoad(String error) {
    return 'Doppelte Gruppen konnten nicht geladen werden: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count Duplikate';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Tippen Sie, um Details anzuzeigen';

  @override
  String get organizeConflictMostlyIdentical => 'Größtenteils identisch';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count Varianten';
  }

  @override
  String get fieldLabelName => 'Name';

  @override
  String get fieldLabelCompany => 'Unternehmen';

  @override
  String get fieldLabelPhone => 'Telefon';

  @override
  String get fieldLabelEmail => 'E-Mail';

  @override
  String get importErrorUnsupportedSource =>
      'Der Import ist hier nicht verfügbar.';

  @override
  String get importErrorPermissionDenied =>
      'Zum Importieren von Kontakten ist die Berechtigung „Kontakte“ erforderlich.';

  @override
  String get importErrorNoContacts =>
      'Es sind keine Kontakte zum Importieren vorhanden.';

  @override
  String get importErrorUnsupportedFileType =>
      'Bitte wählen Sie eine .vcf-Datei oder ein .zip-Archiv aus.';

  @override
  String get importErrorInvalidFile =>
      'Die ausgewählte Datei ist ungültig oder nicht lesbar.';

  @override
  String get importErrorWrongPassword =>
      'Falsches Archivpasswort. Bitte versuchen Sie es erneut.';

  @override
  String get importErrorNoVcfInArchive =>
      'Im ausgewählten Archiv wurden keine .vcf-Dateien gefunden.';

  @override
  String importErrorFailed(String detail) {
    return 'Kontakte konnten nicht importiert werden: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Kontakte sind noch nicht verfügbar.';

  @override
  String get exportErrorNoContacts => 'Keine Kontakte zum Exportieren.';

  @override
  String get exportErrorPasswordRequired =>
      'Für einen geschützten Export ist ein Passwort erforderlich.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Für den geschützten Export ist ein Passwort mit mindestens $min Zeichen erforderlich.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Export fehlgeschlagen: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Download gestartet.';

  @override
  String get exportNoticeFileSaved => 'Datei erfolgreich gespeichert.';

  @override
  String get phoneTypeMobile => 'Mobil';

  @override
  String get phoneTypeHome => 'Zuhause';

  @override
  String get phoneTypeWork => 'Arbeit';

  @override
  String get phoneTypeSchool => 'Schule';

  @override
  String get phoneTypeOther => 'Sonstiges';

  @override
  String get emailTypePersonal => 'persönlich';

  @override
  String get emailTypeWork => 'Geschäftlich';

  @override
  String get emailTypeSchool => 'Schule';

  @override
  String get emailTypeOther => 'Sonstiges';

  @override
  String get addressTypeHome => 'Zuhause';

  @override
  String get addressTypeWork => 'Arbeit';

  @override
  String get addressTypeSchool => 'Schule';

  @override
  String get addressTypeBirth => 'Geburt';

  @override
  String get linkTypeWebsite => 'Webseite';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Sonstiges';

  @override
  String get dateTypeCreated => 'Erstellt';

  @override
  String get dateTypeBirthday => 'Geburtstag';

  @override
  String get dateTypeMet => 'Getroffen';

  @override
  String get dateTypeGraduation => 'Abschluss';

  @override
  String get dateTypeMarriage => 'Hochzeit';

  @override
  String get dateTypeOther => 'Sonstiges';

  @override
  String get noNameInList => '(Kein Name)';

  @override
  String get formAddPhone => 'Telefon hinzufügen';

  @override
  String get formAddEmail => 'E-Mail hinzufügen';

  @override
  String get formAddAddress => 'Adresse hinzufügen';

  @override
  String get formAddLink => 'Link hinzufügen';

  @override
  String get formAddDate => 'Datum hinzufügen';

  @override
  String get formHintPhoneNumber => 'Telefonnummer';

  @override
  String get formHintEmail => 'E-Mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Adresse';

  @override
  String get formHintSelectDate => 'Datum auswählen';

  @override
  String get formHintNotes => 'Notizen hinzufügen';

  @override
  String get formCompany => 'Unternehmen';

  @override
  String get formDepartment => 'Abteilung';

  @override
  String get formJobTitle => 'Berufsbezeichnung';

  @override
  String get formPrefix => 'Präfix';

  @override
  String get formFirstName => 'Vorname';

  @override
  String get formMiddleName => 'Zweiter Vorname';

  @override
  String get formLastName => 'Nachname';

  @override
  String get formSuffix => 'Suffix';

  @override
  String get formNickname => 'Spitzname';

  @override
  String get contactsListTitle => 'Kontakte';

  @override
  String get contactsListEmpty => 'Noch keine Kontakte';

  @override
  String get contactsImportButton => 'Kontakte importieren';

  @override
  String get mergeContactsTitle => 'Kontakte zusammenführen';

  @override
  String get mergeContactsSubtitle =>
      'Wählen Sie Kontakte aus, die zu einem zusammengeführt werden sollen';

  @override
  String get exportPasswordHint => 'Passwort';

  @override
  String get exportPasswordConfirmHint => 'Passwort bestätigen';

  @override
  String exportPasswordHelper(int min) {
    return 'Mindestens $min Zeichen';
  }

  @override
  String get zipPasswordHint => 'Archivpasswort';

  @override
  String get activateDemoAccessCodeLabel => 'Zugangscode';

  @override
  String get subscriptionExpiredTitle => 'Das Abonnement ist abgelaufen';

  @override
  String get subscriptionExpiredBody =>
      'Verlängern Sie Ihr Abonnement, um alle Funktionen weiter nutzen zu können.';

  @override
  String get contactsLoadError => 'Kontakte konnten nicht geladen werden.';

  @override
  String get contactsListError => 'Kontakte konnten nicht geladen werden.';

  @override
  String get contactsSearchNoResults => 'Keine Kontakte gefunden';

  @override
  String get supportPageIntro =>
      'Fragen, Feedback oder etwas funktioniert nicht? Das Savelon-Team liest jede Nachricht.';

  @override
  String get supportCtaMessageTeam => 'Nachricht an das Team';

  @override
  String get importFromDeviceContacts => 'Aus Ihren Kontakten';

  @override
  String get importFromFileVcfZip => 'Aus einer Datei (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle =>
      'Eindeutiges Passwort festlegen';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Dieses Passwort kann nicht wiederhergestellt werden.';

  @override
  String get exportProtectedArchiveCta => 'Geschütztes Archiv exportieren';

  @override
  String get exportIosSavedFileWarning =>
      'Diese Datei wird im Savelon-Ordner gespeichert. Wenn Sie die App löschen, wird die Datei ebenfalls gelöscht. Verschieben Sie sie an einen anderen Ort, um sie zu behalten.';

  @override
  String importContactsConfirmBody(int count) {
    return '$count Kontakte nach Savelon importieren?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Passwort festlegen';

  @override
  String get settingsChangePasswordPageTitle => 'Passwort ändern';

  @override
  String get settingsRemovePasswordPageTitle => 'Passwort entfernen';

  @override
  String get settingsNewPasswordLabel => 'Neues Passwort';

  @override
  String get settingsConfirmNewPasswordLabel => 'Neues Passwort bestätigen';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Neues Passwort erneut eingeben';

  @override
  String get settingsSetPasswordCta => 'Passwort festlegen';

  @override
  String get settingsChangePasswordCta => 'Passwort ändern';

  @override
  String get settingsRemovePasswordCta => 'Passwort entfernen';

  @override
  String get settingsCurrentPasswordLabel => 'Aktuelles Passwort';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Geben Sie Ihr aktuelles Passwort ein';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Das neue Passwort muss sich vom aktuellen unterscheiden';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Das Passwort konnte nicht festgelegt werden: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Das Passwort konnte nicht geändert werden: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Das Passwort konnte nicht entfernt werden: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Passwort ist ungültig';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'Das aktuelle Passwort ist falsch';

  @override
  String get settingsCurrentPasswordRequired =>
      'Aktuelles Passwort erforderlich';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Passwort erforderlich, wenn Passwortschutz aktiviert ist';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Passwort erforderlich, wenn Sie die Passwortoption aktivieren';

  @override
  String get authPasswordRequiredForAccount =>
      'Für dieses Konto ist ein Passwort erforderlich';
}

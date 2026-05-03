// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Versleutelde contacten';

  @override
  String get navContacts => 'Contacten';

  @override
  String get navOrganize => 'Organiseren';

  @override
  String get navSupport => 'Ondersteuning';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get language => 'Taal';

  @override
  String get languageSystemDefault => 'Systeemstandaard';

  @override
  String get organizeTitle => 'Organiseren';

  @override
  String get supportTitle => 'Ondersteuning';

  @override
  String get search => 'Zoeken';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonDelete => 'Verwijderen';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonEdit => 'Bewerken';

  @override
  String get commonMerge => 'Samenvoegen';

  @override
  String get commonSkip => 'Overslaan';

  @override
  String get commonRetry => 'Opnieuw proberen';

  @override
  String get commonClose => 'Sluiten';

  @override
  String get commonNext => 'Volgende';

  @override
  String get commonBack => 'Ga terug';

  @override
  String get commonYes => 'Ja';

  @override
  String get commonNo => 'Nee';

  @override
  String get commonContinue => 'Doorgaan';

  @override
  String get commonTryAgain => 'Probeer het opnieuw';

  @override
  String get commonApply => 'Toepassen';

  @override
  String get commonDiscard => 'Weggooien';

  @override
  String get commonUnlock => 'Ontgrendelen';

  @override
  String get commonLoading => 'Laden...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Fout: $error';
  }

  @override
  String get brandSlogan => 'Jouw contacten. Alleen de jouwe.';

  @override
  String get contactNotFound => 'Contact niet gevonden';

  @override
  String get contactDeleted => 'Contact verwijderd';

  @override
  String get contactUpdated => 'Contact bijgewerkt';

  @override
  String get contactSaved => 'Contact opgeslagen';

  @override
  String get contactsMerged => 'Contacten samengevoegd';

  @override
  String get deleteContactTitle => 'Contact verwijderen';

  @override
  String deleteContactConfirm(String name) {
    return 'Weet u zeker dat u $name wilt verwijderen?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Weet u zeker dat u \"$name\" wilt verwijderen?';
  }

  @override
  String failedToDelete(String error) {
    return 'Kan niet verwijderen: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Kan niet bijwerken: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Kan niet opslaan: $error';
  }

  @override
  String get noName => 'Geen naam';

  @override
  String get noNameTitle => 'Geen naam';

  @override
  String get noNameBody => 'Dit contact heeft geen naam. Toch opslaan?';

  @override
  String get discardChangesTitle => 'Wijzigingen weggooien?';

  @override
  String get discardChangesBody =>
      'Er zijn niet-opgeslagen wijzigingen die verloren gaan.';

  @override
  String get newContact => 'Nieuw contact';

  @override
  String get editContact => 'Contact bewerken';

  @override
  String get addMore => 'Voeg meer toe';

  @override
  String get addNameFieldsTitle => 'Naamvelden toevoegen';

  @override
  String get call => 'Bellen';

  @override
  String get sendEmail => 'E-mail verzenden';

  @override
  String get copy => 'Kopiëren';

  @override
  String get visit => 'Bezoeken';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get importContacts => 'Contacten importeren';

  @override
  String get importing => 'Importeren...';

  @override
  String importedCount(int count) {
    return '$count contacten geïmporteerd';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Geïmporteerde $imported contacten, $skipped overgeslagen';
  }

  @override
  String get failedToImportContacts => 'Kan contacten niet importeren';

  @override
  String get noContactsToImport => 'Er zijn geen contacten om te importeren.';

  @override
  String get contactsPermissionRequiredImport =>
      'Om contacten te importeren is toestemming voor contacten vereist';

  @override
  String get importDialogTitle => 'Contacten importeren';

  @override
  String get importDialogBody =>
      'Contacten importeren vanaf uw apparaat of een bestand?';

  @override
  String get importSourceTitle => 'Importeren';

  @override
  String get importZipPasswordTitle => 'Archiefwachtwoord';

  @override
  String get importZipPasswordChecking => 'Controleren...';

  @override
  String get exportContacts => 'Contacten exporteren';

  @override
  String get unlockPro => 'Pro ontgrendelen';

  @override
  String get exportContactsTitle => 'Contacten exporteren';

  @override
  String get exportSubtitle => 'Kies hoe u uw contacten wilt opslaan.';

  @override
  String get exportFormatVcfTitle => 'Opslaan als .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Eén bestand dat werkt met Apple Contacten, Google Contacten en meer.';

  @override
  String get exportFormatZipTitle =>
      'Opslaan in een met een wachtwoord beveiligd archief';

  @override
  String get exportFormatZipSubtitle =>
      'Een .zip met uw .vcf erin — u hebt een wachtwoord nodig om het te openen.';

  @override
  String get exportProtectedTitle => 'Beschermde export';

  @override
  String get exportCompleteTitle => 'Exporteren voltooid';

  @override
  String get stillLoadingContacts =>
      'Contacten worden nog steeds geladen. Wacht alstublieft.';

  @override
  String get couldNotLoadContacts => 'Kan contacten niet laden.';

  @override
  String get passwordChangedSuccess => 'Wachtwoord succesvol gewijzigd';

  @override
  String get passwordProtectionEnabled =>
      'Wachtwoordbeveiliging is succesvol ingeschakeld';

  @override
  String get passwordProtectionRemoved =>
      'Wachtwoordbeveiliging is succesvol verwijderd';

  @override
  String get removePasswordProtectionButton =>
      'Wachtwoordbeveiliging verwijderen';

  @override
  String get changePasswordTitle => 'Wachtwoord wijzigen';

  @override
  String get setPasswordTitle => 'Wachtwoord instellen';

  @override
  String get passwordSettingsChangeTitle => 'Wachtwoord wijzigen';

  @override
  String get passwordSettingsSetTitle => 'Wachtwoord instellen';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Kan privacybeleid niet openen: $error';
  }

  @override
  String get resetAppTitle => 'Reset de app';

  @override
  String get resetAppConfirmTitle =>
      'Alle contacten verwijderen en de app resetten?';

  @override
  String get resetAppCannotUndo => 'Dit kan niet ongedaan worden gemaakt';

  @override
  String resetAppError(String error) {
    return 'Fout bij het opnieuw instellen van de app: $error';
  }

  @override
  String get photoPickerNewImage => 'Selecteer nieuwe afbeelding';

  @override
  String get photoPickerRemoveImage => 'Afbeelding verwijderen';

  @override
  String get onboardingHeadline1 => 'Wie heeft toegang tot uw contacten?';

  @override
  String get onboardingSubline1 =>
      'Sommige apps uploaden ze naar de cloud. Dit kan meer privacyrisico’s met zich meebrengen.';

  @override
  String get onboardingHeadline2 => 'Veel apps vragen om contacttoegang';

  @override
  String get onboardingSubline2 =>
      'Het kan nuttig zijn, maar belangrijke contacten moeten privé blijven.';

  @override
  String get onboardingHeadline3 => 'Houd gevoelige contacten gescheiden';

  @override
  String get onboardingSubline3 =>
      'We raden aan om belangrijke en zelden gebruikte contacten buiten uw hoofdcontacten-app op te slaan.';

  @override
  String get onboardingHeadline4 => 'Bescherm uw belangrijke contacten';

  @override
  String get onboardingSubline4 =>
      'Savelon slaat ze op uw apparaat op, versleuteld en afgeschermd van andere apps.';

  @override
  String get onboardingGetStarted => 'Aan de slag';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'Open source';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'Iedereen kan onze code op ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => ' bekijken.';

  @override
  String get onboardingBenefitsPrivateTitle => 'Privé';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'Zelfs wij kunnen uw contacten niet zien';

  @override
  String get onboardingBenefitsSandboxTitle =>
      'Andere apps kunnen niet naar binnen kijken';

  @override
  String get onboardingBenefitsOfflineTitle => 'Offline';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'Houdt u uit de buurt van de cloud, datamakelaars en surveillance';

  @override
  String get activateDemoTitle => 'Activeer de demo';

  @override
  String get activateDemoCancel => 'Annuleren';

  @override
  String demoAccessGranted(String dateTime) {
    return 'U hebt nu demo-toegang tot $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Voeg wachtwoordbeveiliging toe';

  @override
  String get setupPasswordMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String get setupPasswordFailedSeed =>
      'Sleutel aanmaken mislukt. Probeer het opnieuw.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Initialiseren is mislukt. Fout: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Uw contacten blijven sterk versleuteld met een lange geheime sleutel die alleen op uw apparaat wordt opgeslagen. Het wachtwoord voegt extra bescherming toe.';

  @override
  String get setupPasswordLabel => 'Wachtwoord';

  @override
  String get setupPasswordConfirmLabel => 'Bevestig wachtwoord';

  @override
  String get setupPasswordWarning =>
      'Dit wachtwoord kan niet worden hersteld. Schrijf het op en bewaar het veilig!';

  @override
  String get setupPasswordPageTitle => 'Wachtwoord aanmaken';

  @override
  String get setupPasswordNext => 'Volgende';

  @override
  String get setupPasswordSkip => 'Overslaan';

  @override
  String get setupCreateVaultTitle => 'Maak je kluis';

  @override
  String get setupCreateVaultSubtitle =>
      'Alleen op je apparaat opgeslagen. Versleuteld en privé.';

  @override
  String get setupDefaultVaultName => 'Mijn kluis';

  @override
  String setupRandomVaultName(String number) {
    return 'Kluis$number';
  }

  @override
  String get setupCropPhotoTitle => 'Foto bijsnijden';

  @override
  String get setupProtectionTitle => 'Beveiliging';

  @override
  String get setupEncryption256Label => '256-bits encryptie';

  @override
  String get setupRequirePasswordLabel => 'Wachtwoord vereisen';

  @override
  String get setupOptionalSuffix => 'optioneel';

  @override
  String get setupCreateVaultButton => 'Kluis aanmaken';

  @override
  String get setupCreatingVaultTitle => 'Je kluis wordt aangemaakt';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'Je sleutel wordt aangemaakt';

  @override
  String get setupEncryptingDataLabel => 'Je gegevens worden versleuteld';

  @override
  String get setupCheckingSecurityLabel => 'Beveiliging wordt gecontroleerd';

  @override
  String get setupCreatingVaultError =>
      'Er ging iets mis. Probeer het opnieuw.';

  @override
  String get setupVaultCreatedTitle => 'Kluis aangemaakt';

  @override
  String get setupVaultCreatedSubtitle =>
      'Je kluis is klaar. Hij is versleuteld en veilig.';

  @override
  String get setupOpenVaultButton => 'Kluis openen';

  @override
  String get setupSavedSecretKeyCheckbox =>
      'Ik heb mijn geheime sleutel veilig bewaard';

  @override
  String get setupContinue => 'Doorgaan';

  @override
  String get setupAddPasswordPageTitle => 'Wachtwoord toevoegen';

  @override
  String get setupSavePasswordButton => 'Wachtwoord opslaan';

  @override
  String get confirmationCheckboxTitle =>
      'Ik begrijp dat mijn wachtwoord niet kan worden hersteld';

  @override
  String get loginWelcomeBack => 'Welkom terug';

  @override
  String get loginPasswordLabel => 'Wachtwoord';

  @override
  String get loginUnlock => 'Ontgrendelen';

  @override
  String get loginPasswordRequired => 'Voer uw wachtwoord in';

  @override
  String get loginIncorrectPassword =>
      'Onjuist wachtwoord. Probeer het opnieuw.';

  @override
  String get paywallNoSubscription =>
      'Geen actief abonnement gevonden. Koop een abonnement om door te gaan.';

  @override
  String get lifetimeThanksTitle => 'Bedankt dat je bij ons bent';

  @override
  String get lifetimeThanksSubtitle =>
      'We geven je levenslange Pro-toegang cadeau';

  @override
  String get lifetimeThanksGift => 'cadeau';

  @override
  String get lifetimeThanksCta => 'Levenslange toegang claimen';

  @override
  String get paywallNoInternetTitle => 'Geen internetverbinding';

  @override
  String get paywallNoInternetBody =>
      'Om voor de eerste keer toegang te krijgen tot de app is een internetverbinding vereist. Maak verbinding en probeer het opnieuw.';

  @override
  String get paywallStoreUnavailableTitle => 'Winkel niet beschikbaar';

  @override
  String get paywallStoreUnavailableBody =>
      'Kan abonnementsopties niet laden. Probeer het opnieuw.';

  @override
  String get subscriptionVerifyTitle => 'Abonnement verifiëren';

  @override
  String get subscriptionSoftWarningTitle => 'Abonnementsverificatie vereist';

  @override
  String get subscriptionContinueAnyway => 'Hoe dan ook doorgaan';

  @override
  String subscriptionLastVerified(String date) {
    return 'Laatst geverifieerd $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Het abonnement kon niet online worden geverifieerd.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Uw toegang loopt door tot $date — maak vóór die tijd verbinding om te verifiëren.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Maak verbinding met internet om uw abonnement te verifiëren.';

  @override
  String get organizeNoDuplicates => 'Geen potentiële duplicaten gevonden';

  @override
  String get organizeSkippedShownAgain =>
      'Overgeslagen duplicaten worden opnieuw weergegeven.';

  @override
  String get organizeShowSkippedTooltip =>
      'Overgeslagen duplicaatgroepen opnieuw tonen';

  @override
  String organizeFailedToLoad(String error) {
    return 'Kan dubbele groepen niet laden: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicaten';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Tik om details te bekijken';

  @override
  String get organizeConflictMostlyIdentical => 'Grotendeels identiek';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count varianten';
  }

  @override
  String get fieldLabelName => 'naam';

  @override
  String get fieldLabelCompany => 'bedrijf';

  @override
  String get fieldLabelPhone => 'telefoon';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'Importeren is hier niet beschikbaar.';

  @override
  String get importErrorPermissionDenied =>
      'Om contacten te importeren is toestemming voor contacten vereist.';

  @override
  String get importErrorNoContacts =>
      'Er zijn geen contacten om te importeren.';

  @override
  String get importErrorUnsupportedFileType =>
      'Selecteer een .vcf-bestand of een .zip-archief.';

  @override
  String get importErrorInvalidFile =>
      'Het geselecteerde bestand is ongeldig of onleesbaar.';

  @override
  String get importErrorWrongPassword =>
      'Onjuist archiefwachtwoord. Probeer het opnieuw.';

  @override
  String get importErrorNoVcfInArchive =>
      'Er zijn geen .vcf-bestanden gevonden in het geselecteerde archief.';

  @override
  String importErrorFailed(String detail) {
    return 'Kan contacten niet importeren: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Contacten zijn nog niet beschikbaar.';

  @override
  String get exportErrorNoContacts => 'Geen contacten om te exporteren.';

  @override
  String get exportErrorPasswordRequired =>
      'Voor een beveiligde export is een wachtwoord vereist.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Voor beveiligde export is een wachtwoord van minimaal $min tekens vereist.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Exporteren mislukt: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Het downloaden is gestart.';

  @override
  String get exportNoticeFileSaved => 'Bestand succesvol opgeslagen.';

  @override
  String get phoneTypeMobile => 'mobiel';

  @override
  String get phoneTypeHome => 'thuis';

  @override
  String get phoneTypeWork => 'werk';

  @override
  String get phoneTypeSchool => 'school';

  @override
  String get phoneTypeOther => 'ander';

  @override
  String get emailTypePersonal => 'persoonlijk';

  @override
  String get emailTypeWork => 'werk';

  @override
  String get emailTypeSchool => 'school';

  @override
  String get emailTypeOther => 'ander';

  @override
  String get addressTypeHome => 'Thuis';

  @override
  String get addressTypeWork => 'Werk';

  @override
  String get addressTypeSchool => 'School';

  @override
  String get addressTypeBirth => 'Geboorte';

  @override
  String get linkTypeWebsite => 'Website';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Overig';

  @override
  String get dateTypeCreated => 'Gemaakt';

  @override
  String get dateTypeBirthday => 'Verjaardag';

  @override
  String get dateTypeMet => 'Ontmoeting';

  @override
  String get dateTypeGraduation => 'Afstuderen';

  @override
  String get dateTypeMarriage => 'Huwelijk';

  @override
  String get dateTypeOther => 'Overig';

  @override
  String get noNameInList => '(Geen naam)';

  @override
  String get formAddPhone => 'Telefoon toevoegen';

  @override
  String get formAddEmail => 'E-mailadres toevoegen';

  @override
  String get formAddAddress => 'Adres toevoegen';

  @override
  String get formAddLink => 'Koppeling toevoegen';

  @override
  String get formAddDate => 'Datum toevoegen';

  @override
  String get formHintPhoneNumber => 'Telefoonnummer';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Adres';

  @override
  String get formHintSelectDate => 'Datum selecteren';

  @override
  String get formHintNotes => 'Voeg notities toe';

  @override
  String get formCompany => 'Bedrijf';

  @override
  String get formDepartment => 'Afdeling';

  @override
  String get formJobTitle => 'Functietitel';

  @override
  String get formPrefix => 'Voorvoegsel';

  @override
  String get formFirstName => 'Voornaam';

  @override
  String get formMiddleName => 'Middelste naam';

  @override
  String get formLastName => 'Achternaam';

  @override
  String get formSuffix => 'Achtervoegsel';

  @override
  String get formNickname => 'Bijnaam';

  @override
  String get contactsListTitle => 'Contacten';

  @override
  String get contactsListEmpty => 'Nog geen contacten';

  @override
  String get contactsImportButton => 'Contacten importeren';

  @override
  String get mergeContactsTitle => 'Contacten samenvoegen';

  @override
  String get mergeContactsSubtitle =>
      'Selecteer contacten om samen te voegen tot één';

  @override
  String get exportPasswordHint => 'Wachtwoord';

  @override
  String get exportPasswordConfirmHint => 'Bevestig wachtwoord';

  @override
  String exportPasswordHelper(int min) {
    return 'Minimaal $min tekens';
  }

  @override
  String get zipPasswordHint => 'Archiefwachtwoord';

  @override
  String get activateDemoAccessCodeLabel => 'Toegangscode';

  @override
  String get subscriptionExpiredTitle => 'Abonnement verlopen';

  @override
  String get subscriptionExpiredBody =>
      'Verleng om alle functies te blijven gebruiken.';

  @override
  String get contactsLoadError => 'Kan contacten niet laden.';

  @override
  String get contactsListError => 'Kan contacten niet laden.';

  @override
  String get contactsSearchNoResults => 'Geen contacten gevonden';

  @override
  String get supportPageIntro =>
      'Vragen, feedback of iets werkt niet? Het Savelon-team leest elk bericht.';

  @override
  String get supportCtaMessageTeam => 'Bericht naar het team';

  @override
  String get importFromDeviceContacts => 'Uit uw contacten';

  @override
  String get importFromFileVcfZip => 'Uit een bestand (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Uniek wachtwoord aanmaken';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Dit wachtwoord kan niet worden hersteld.';

  @override
  String get exportProtectedArchiveCta => 'Beveiligd archief exporteren';

  @override
  String get exportIosSavedFileWarning =>
      'Dit bestand wordt opgeslagen in de Savelon-map. Als u de app verwijdert, wordt het bestand ook verwijderd. Verplaats het naar een andere locatie om het te bewaren.';

  @override
  String importContactsConfirmBody(int count) {
    return '$count contacten importeren in Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Wachtwoord instellen';

  @override
  String get settingsChangePasswordPageTitle => 'Wachtwoord wijzigen';

  @override
  String get settingsRemovePasswordPageTitle => 'Wachtwoord verwijderen';

  @override
  String get settingsNewPasswordLabel => 'Nieuw wachtwoord';

  @override
  String get settingsConfirmNewPasswordLabel => 'Nieuw wachtwoord bevestigen';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Voer uw nieuwe wachtwoord opnieuw in';

  @override
  String get settingsSetPasswordCta => 'Wachtwoord instellen';

  @override
  String get settingsChangePasswordCta => 'Wachtwoord wijzigen';

  @override
  String get settingsRemovePasswordCta => 'Wachtwoord verwijderen';

  @override
  String get settingsCurrentPasswordLabel => 'Huidig wachtwoord';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Voer uw huidige wachtwoord in';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Het nieuwe wachtwoord moet verschillen van het huidige';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Wachtwoord instellen mislukt: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Wachtwoord wijzigen mislukt: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Wachtwoord verwijderen mislukt: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Wachtwoord is ongeldig';

  @override
  String get settingsCurrentPasswordIncorrect => 'Huidig wachtwoord is onjuist';

  @override
  String get settingsCurrentPasswordRequired =>
      'Huidig wachtwoord is verplicht';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Wachtwoord vereist wanneer wachtwoordbeveiliging is ingeschakeld';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Wachtwoord vereist bij het inschakelen van de wachtwoordoptie';

  @override
  String get authPasswordRequiredForAccount =>
      'Wachtwoord vereist voor dit account';
}

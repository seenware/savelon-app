// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contacte criptate';

  @override
  String get navContacts => 'Contacte';

  @override
  String get navOrganize => 'Organizare';

  @override
  String get navSupport => 'Asistență';

  @override
  String get navSettings => 'Setări';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get language => 'Limbă';

  @override
  String get languageSystemDefault => 'Implicit sistem';

  @override
  String get organizeTitle => 'Organizare';

  @override
  String get supportTitle => 'Asistență';

  @override
  String get search => 'Caută';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonDelete => 'Șterge';

  @override
  String get commonSave => 'Salvează';

  @override
  String get commonEdit => 'Editează';

  @override
  String get commonMerge => 'Combină';

  @override
  String get commonSkip => 'Omite';

  @override
  String get commonRetry => 'Reîncearcă';

  @override
  String get commonClose => 'Închide';

  @override
  String get commonNext => 'Următorul';

  @override
  String get commonBack => 'Înapoi';

  @override
  String get commonYes => 'Da';

  @override
  String get commonNo => 'Nu';

  @override
  String get commonContinue => 'Continuă';

  @override
  String get commonTryAgain => 'Încearcă din nou';

  @override
  String get commonApply => 'Aplică';

  @override
  String get commonDiscard => 'Renunță';

  @override
  String get commonUnlock => 'Deblochează';

  @override
  String get commonLoading => 'Se încarcă...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Eroare: $error';
  }

  @override
  String get brandSlogan => 'Contactele tale. Doar ale tale.';

  @override
  String get contactNotFound => 'Contactul nu a fost găsit';

  @override
  String get contactDeleted => 'Contact șters';

  @override
  String get contactUpdated => 'Contact actualizat';

  @override
  String get contactSaved => 'Contact salvat';

  @override
  String get contactsMerged => 'Contactele au fost combinate';

  @override
  String get deleteContactTitle => 'Șterge contactul';

  @override
  String deleteContactConfirm(String name) {
    return 'Sigur vrei să ștergi $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Sigur vrei să ștergi „$name”?';
  }

  @override
  String failedToDelete(String error) {
    return 'Nu s-a putut șterge: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Nu s-a putut actualiza: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Nu s-a putut salva: $error';
  }

  @override
  String get noName => 'Fără nume';

  @override
  String get noNameTitle => 'Fără nume';

  @override
  String get noNameBody =>
      'Acest contact nu are nume. Vrei să-l salvezi oricum?';

  @override
  String get discardChangesTitle => 'Renunți la modificări?';

  @override
  String get discardChangesBody =>
      'Ai modificări nesalvate care se vor pierde.';

  @override
  String get newContact => 'Contact nou';

  @override
  String get editContact => 'Editează contactul';

  @override
  String get addMore => 'Adaugă mai multe';

  @override
  String get addNameFieldsTitle => 'Adaugă câmpuri pentru nume';

  @override
  String get call => 'Apelează';

  @override
  String get sendEmail => 'Trimite e-mail';

  @override
  String get copy => 'Copiază';

  @override
  String get visit => 'Deschide';

  @override
  String get copiedToClipboard => 'Copiat în clipboard';

  @override
  String get importContacts => 'Importă contacte';

  @override
  String get importing => 'Se importă...';

  @override
  String importedCount(int count) {
    return 'S-au importat $count contacte';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'S-au importat $imported contacte, $skipped omise';
  }

  @override
  String get failedToImportContacts => 'Nu s-au putut importa contactele';

  @override
  String get noContactsToImport => 'Nu există contacte de importat.';

  @override
  String get contactsPermissionRequiredImport =>
      'Este necesară permisiunea pentru contacte pentru a importa contacte';

  @override
  String get importDialogTitle => 'Importă contacte';

  @override
  String get importDialogBody =>
      'Vrei să imporți contacte de pe dispozitiv sau dintr-un fișier?';

  @override
  String get importSourceTitle => 'Import';

  @override
  String get importZipPasswordTitle => 'Parola arhivei';

  @override
  String get importZipPasswordChecking => 'Se verifică...';

  @override
  String get exportContacts => 'Exportă contacte';

  @override
  String get unlockPro => 'Deblochează Pro';

  @override
  String get exportContactsTitle => 'Exportă contacte';

  @override
  String get exportSubtitle => 'Alege cum vrei să-ți salvezi contactele.';

  @override
  String get exportFormatVcfTitle => 'Salvează ca fișier .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Un singur fișier compatibil cu Apple Contacts, Google Contacts și altele.';

  @override
  String get exportFormatZipTitle =>
      'Salvează într-o arhivă protejată cu parolă';

  @override
  String get exportFormatZipSubtitle =>
      'Un fișier .zip cu .vcf-ul în interior — e nevoie de o parolă pentru a-l deschide.';

  @override
  String get exportProtectedTitle => 'Export protejat';

  @override
  String get exportCompleteTitle => 'Export finalizat';

  @override
  String get stillLoadingContacts =>
      'Contactele încă se încarcă. Te rugăm să aștepți.';

  @override
  String get couldNotLoadContacts => 'Contactele nu au putut fi încărcate.';

  @override
  String get passwordChangedSuccess => 'Parola a fost schimbată cu succes';

  @override
  String get passwordProtectionEnabled =>
      'Protecția prin parolă a fost activată cu succes';

  @override
  String get passwordProtectionRemoved =>
      'Protecția prin parolă a fost eliminată cu succes';

  @override
  String get removePasswordProtectionButton => 'Elimină protecția prin parolă';

  @override
  String get changePasswordTitle => 'Schimbă parola';

  @override
  String get setPasswordTitle => 'Setează parola';

  @override
  String get passwordSettingsChangeTitle => 'Schimbă parola';

  @override
  String get passwordSettingsSetTitle => 'Setează parola';

  @override
  String get privacyPolicy => 'Politica de confidențialitate';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Nu s-a putut deschide politica de confidențialitate: $error';
  }

  @override
  String get resetAppTitle => 'Resetează aplicația';

  @override
  String get resetAppConfirmTitle =>
      'Ștergi toate contactele și resetezi aplicația?';

  @override
  String get resetAppCannotUndo => 'Această acțiune nu poate fi anulată';

  @override
  String resetAppError(String error) {
    return 'Eroare la resetarea aplicației: $error';
  }

  @override
  String get photoPickerNewImage => 'Selectează o imagine nouă';

  @override
  String get photoPickerRemoveImage => 'Elimină imaginea';

  @override
  String get onboardingHeadline1 => 'Cine îți poate accesa contactele?';

  @override
  String get onboardingSubline1 =>
      'Unele aplicații le încarcă în cloud. Asta poate crea riscuri suplimentare pentru confidențialitate.';

  @override
  String get onboardingHeadline2 => 'Multe aplicații cer acces la contacte';

  @override
  String get onboardingSubline2 =>
      'Poate fi util, dar contactele importante ar trebui să rămână private.';

  @override
  String get onboardingHeadline3 => 'Păstrează separat contactele sensibile';

  @override
  String get onboardingSubline3 =>
      'Îți recomandăm să păstrezi contactele importante și folosite rar în afara aplicației principale de contacte.';

  @override
  String get onboardingHeadline4 => 'Protejează-ți contactele importante';

  @override
  String get onboardingSubline4 =>
      'Savelon le stochează pe dispozitivul tău, criptate și ferite de alte aplicații.';

  @override
  String get onboardingGetStarted => 'Începe';

  @override
  String get onboardingNext => 'Următorul';

  @override
  String get activateDemoTitle => 'Activează demo';

  @override
  String get activateDemoCancel => 'Anulează';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Ai acum acces demo până la $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Adaugă protecție prin parolă';

  @override
  String get setupPasswordMismatch => 'Parolele nu se potrivesc';

  @override
  String get setupPasswordFailedSeed =>
      'Nu s-a putut genera cheia inițială. Încearcă din nou.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Nu s-a putut inițializa aplicația. Eroare: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Contactele tale vor rămâne criptate puternic cu o cheie secretă lungă, stocată doar pe dispozitiv. Parola adaugă un nivel suplimentar de protecție.';

  @override
  String get setupPasswordLabel => 'Parolă';

  @override
  String get setupPasswordConfirmLabel => 'Confirmă parola';

  @override
  String get setupPasswordWarning =>
      'Această parolă nu poate fi recuperată. Noteaz-o și păstreaz-o în siguranță!';

  @override
  String get setupPasswordPageTitle => 'Creează parola';

  @override
  String get setupPasswordNext => 'Următorul';

  @override
  String get setupPasswordSkip => 'Omite';

  @override
  String get confirmationCheckboxTitle =>
      'Înțeleg că parola mea nu poate fi recuperată';

  @override
  String get loginWelcomeBack => 'Bine ai revenit';

  @override
  String get loginPasswordLabel => 'Parolă';

  @override
  String get loginUnlock => 'Deblochează';

  @override
  String get loginPasswordRequired => 'Introdu parola';

  @override
  String get loginIncorrectPassword => 'Parolă incorectă. Încearcă din nou.';

  @override
  String get paywallNoSubscription =>
      'Nu a fost găsit niciun abonament activ. Cumpără unul pentru a continua.';

  @override
  String get lifetimeThanksTitle => 'Îți mulțumim că ești alături de noi';

  @override
  String get lifetimeThanksSubtitle => 'Îți oferim acces Pro pe viață';

  @override
  String get lifetimeThanksGift => 'cadou';

  @override
  String get lifetimeThanksCta => 'Solicită acces pe viață';

  @override
  String get paywallNoInternetTitle => 'Fără conexiune la internet';

  @override
  String get paywallNoInternetBody =>
      'Este nevoie de o conexiune la internet pentru a accesa aplicația prima dată. Conectează-te și încearcă din nou.';

  @override
  String get paywallStoreUnavailableTitle => 'Magazin indisponibil';

  @override
  String get paywallStoreUnavailableBody =>
      'Nu s-au putut încărca opțiunile de abonament. Încearcă din nou.';

  @override
  String get subscriptionVerifyTitle => 'Verifică abonamentul';

  @override
  String get subscriptionSoftWarningTitle =>
      'Este nevoie de verificarea abonamentului';

  @override
  String get subscriptionContinueAnyway => 'Continuă oricum';

  @override
  String subscriptionLastVerified(String date) {
    return 'Ultima verificare: $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Abonamentul nu a putut fi verificat online.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Accesul tău rămâne activ până la $date — conectează-te înainte de atunci pentru verificare.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Conectează-te la internet pentru a-ți verifica abonamentul.';

  @override
  String get organizeNoDuplicates => 'Nu s-au găsit duplicate potențiale';

  @override
  String get organizeSkippedShownAgain =>
      'Duplicatele omise sunt afișate din nou.';

  @override
  String get organizeShowSkippedTooltip =>
      'Arată din nou grupurile de duplicate omise';

  @override
  String organizeFailedToLoad(String error) {
    return 'Nu s-au putut încărca grupurile de duplicate: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicate';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Atinge pentru a vedea detaliile';

  @override
  String get organizeConflictMostlyIdentical => 'În mare parte identice';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count variante';
  }

  @override
  String get fieldLabelName => 'nume';

  @override
  String get fieldLabelCompany => 'companie';

  @override
  String get fieldLabelPhone => 'telefon';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'Importul nu este disponibil aici.';

  @override
  String get importErrorPermissionDenied =>
      'Este necesară permisiunea pentru contacte pentru a importa contacte.';

  @override
  String get importErrorNoContacts => 'Nu există contacte de importat.';

  @override
  String get importErrorUnsupportedFileType =>
      'Selectează un fișier .vcf sau o arhivă .zip.';

  @override
  String get importErrorInvalidFile =>
      'Fișierul selectat este invalid sau nu poate fi citit.';

  @override
  String get importErrorWrongPassword =>
      'Parola arhivei este incorectă. Încearcă din nou.';

  @override
  String get importErrorNoVcfInArchive =>
      'Nu au fost găsite fișiere .vcf în arhiva selectată.';

  @override
  String importErrorFailed(String detail) {
    return 'Nu s-au putut importa contactele: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Contactele nu sunt disponibile încă.';

  @override
  String get exportErrorNoContacts => 'Nu există contacte de exportat.';

  @override
  String get exportErrorPasswordRequired =>
      'Este necesară o parolă pentru un export protejat.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Exportul protejat necesită o parolă de cel puțin $min caractere.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Exportul a eșuat: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Descărcarea a început.';

  @override
  String get exportNoticeFileSaved => 'Fișierul a fost salvat cu succes.';

  @override
  String get phoneTypeMobile => 'mobil';

  @override
  String get phoneTypeHome => 'acasă';

  @override
  String get phoneTypeWork => 'serviciu';

  @override
  String get phoneTypeSchool => 'școală';

  @override
  String get phoneTypeOther => 'altul';

  @override
  String get emailTypePersonal => 'personal';

  @override
  String get emailTypeWork => 'serviciu';

  @override
  String get emailTypeSchool => 'școală';

  @override
  String get emailTypeOther => 'altul';

  @override
  String get addressTypeHome => 'Acasă';

  @override
  String get addressTypeWork => 'Serviciu';

  @override
  String get addressTypeSchool => 'Școală';

  @override
  String get addressTypeBirth => 'Locul nașterii';

  @override
  String get linkTypeWebsite => 'Site web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Altul';

  @override
  String get dateTypeCreated => 'Creat';

  @override
  String get dateTypeBirthday => 'Zi de naștere';

  @override
  String get dateTypeMet => 'Data întâlnirii';

  @override
  String get dateTypeGraduation => 'Absolvire';

  @override
  String get dateTypeMarriage => 'Căsătorie';

  @override
  String get dateTypeOther => 'Altul';

  @override
  String get noNameInList => '(Fără nume)';

  @override
  String get formAddPhone => 'Adaugă telefon';

  @override
  String get formAddEmail => 'Adaugă e-mail';

  @override
  String get formAddAddress => 'Adaugă adresă';

  @override
  String get formAddLink => 'Adaugă link';

  @override
  String get formAddDate => 'Adaugă dată';

  @override
  String get formHintPhoneNumber => 'Număr de telefon';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Adresă';

  @override
  String get formHintSelectDate => 'Selectează data';

  @override
  String get formHintNotes => 'Adaugă note';

  @override
  String get formCompany => 'Companie';

  @override
  String get formDepartment => 'Departament';

  @override
  String get formJobTitle => 'Funcție';

  @override
  String get formPrefix => 'Prefix';

  @override
  String get formFirstName => 'Prenume';

  @override
  String get formMiddleName => 'Al doilea prenume';

  @override
  String get formLastName => 'Nume';

  @override
  String get formSuffix => 'Sufix';

  @override
  String get formNickname => 'Poreclă';

  @override
  String get contactsListTitle => 'Contacte';

  @override
  String get contactsListEmpty => 'Nu ai încă niciun contact';

  @override
  String get contactsImportButton => 'Importă contacte';

  @override
  String get mergeContactsTitle => 'Combină contacte';

  @override
  String get mergeContactsSubtitle =>
      'Selectează contactele pe care vrei să le unești într-unul singur';

  @override
  String get exportPasswordHint => 'Parolă';

  @override
  String get exportPasswordConfirmHint => 'Confirmă parola';

  @override
  String exportPasswordHelper(int min) {
    return 'Cel puțin $min caractere';
  }

  @override
  String get zipPasswordHint => 'Parola arhivei';

  @override
  String get activateDemoAccessCodeLabel => 'Cod de acces';

  @override
  String get subscriptionExpiredTitle => 'Abonamentul a expirat';

  @override
  String get subscriptionExpiredBody =>
      'Reînnoiește abonamentul ca să poți folosi în continuare toate funcțiile.';

  @override
  String get contactsLoadError => 'Contactele nu au putut fi încărcate.';

  @override
  String get contactsListError => 'Contactele nu au putut fi încărcate.';

  @override
  String get contactsSearchNoResults => 'Nu s-au găsit contacte';

  @override
  String get supportPageIntro =>
      'Ai întrebări, feedback sau ceva ce nu funcționează? Echipa Savelon citește fiecare mesaj.';

  @override
  String get supportCtaMessageTeam => 'Trimite un mesaj echipei';

  @override
  String get importFromDeviceContacts => 'Din contactele tale';

  @override
  String get importFromFileVcfZip => 'Dintr-un fișier (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Creează o parolă unică';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Această parolă nu poate fi recuperată.';

  @override
  String get exportProtectedArchiveCta => 'Exportă arhiva protejată';

  @override
  String get exportIosSavedFileWarning =>
      'Acest fișier este salvat în folderul Savelon. Dacă ștergi aplicația, fișierul va fi șters și el. Mută-l într-o altă locație dacă vrei să-l păstrezi.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Importi $count contacte în Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Setează parola';

  @override
  String get settingsChangePasswordPageTitle => 'Schimbă parola';

  @override
  String get settingsRemovePasswordPageTitle => 'Elimină parola';

  @override
  String get settingsNewPasswordLabel => 'Parolă nouă';

  @override
  String get settingsConfirmNewPasswordLabel => 'Confirmă noua parolă';

  @override
  String get settingsReenterNewPasswordHelper => 'Introdu din nou noua parolă';

  @override
  String get settingsSetPasswordCta => 'Setează parola';

  @override
  String get settingsChangePasswordCta => 'Schimbă parola';

  @override
  String get settingsRemovePasswordCta => 'Elimină parola';

  @override
  String get settingsCurrentPasswordLabel => 'Parola actuală';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Introdu parola actuală';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Noua parolă trebuie să fie diferită de parola actuală';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Nu s-a putut seta parola: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Nu s-a putut schimba parola: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Nu s-a putut elimina parola: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Parola nu este validă';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'Parola actuală este incorectă';

  @override
  String get settingsCurrentPasswordRequired => 'Este necesară parola actuală';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Parola este necesară când protecția prin parolă este activată';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Parola este necesară când opțiunea enablePassword este activată';

  @override
  String get authPasswordRequiredForAccount =>
      'Este necesară o parolă pentru acest cont';
}

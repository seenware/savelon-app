// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contatti crittografati';

  @override
  String get navContacts => 'Contatti';

  @override
  String get navDuplicates => 'Duplicati';

  @override
  String get navSupport => 'Supporto';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get languageSystemDefault => 'Predefinito del sistema';

  @override
  String get duplicatesTitle => 'Duplicati';

  @override
  String get supportTitle => 'Supporto';

  @override
  String get search => 'Ricerca';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonMerge => 'Unisci';

  @override
  String get commonSkip => 'Ignora';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonNext => 'Prossimo';

  @override
  String get commonBack => 'Torna indietro';

  @override
  String get commonYes => 'Sì';

  @override
  String get commonNo => 'No';

  @override
  String get commonContinue => 'Continua';

  @override
  String get commonTryAgain => 'Riprova';

  @override
  String get commonApply => 'Applica';

  @override
  String get commonDiscard => 'Scartare';

  @override
  String get commonUnlock => 'Sblocca';

  @override
  String get commonLoading => 'Caricamento...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Errore: $error';
  }

  @override
  String get brandSlogan => 'I tuoi contatti. Solo tuoi.';

  @override
  String get contactNotFound => 'Contatto non trovato';

  @override
  String get contactDeleted => 'Contatto eliminato';

  @override
  String get contactUpdated => 'Contatto aggiornato';

  @override
  String get contactSaved => 'Contatto salvato';

  @override
  String get contactsMerged => 'Contatti uniti';

  @override
  String get deleteContactTitle => 'Elimina contatto';

  @override
  String deleteContactConfirm(String name) {
    return 'Sei sicuro di voler eliminare $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Sei sicuro di voler eliminare \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'Impossibile eliminare: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Impossibile aggiornare: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Impossibile salvare: $error';
  }

  @override
  String get noName => 'Nessun nome';

  @override
  String get noNameTitle => 'Nessun nome';

  @override
  String get noNameBody => 'Questo contatto non ha un nome. Salvare comunque?';

  @override
  String get discardChangesTitle => 'Eliminare le modifiche?';

  @override
  String get discardChangesBody =>
      'Sono presenti modifiche non salvate che andranno perse.';

  @override
  String get newContact => 'Nuovo contatto';

  @override
  String get editContact => 'Modifica contatto';

  @override
  String get addMore => 'Aggiungi altro';

  @override
  String get addNameFieldsTitle => 'Aggiungi campi nome';

  @override
  String get call => 'Chiama';

  @override
  String get sendEmail => 'Invia e-mail';

  @override
  String get copy => 'Copia';

  @override
  String get visit => 'Visita';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get importContacts => 'Importa contatti';

  @override
  String get importing => 'Importazione...';

  @override
  String importedCount(int count) {
    return '$count contatti importati';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported contatti importati, $skipped ignorati';
  }

  @override
  String get failedToImportContacts => 'Impossibile importare i contatti';

  @override
  String get noContactsToImport => 'Non ci sono contatti da importare.';

  @override
  String get contactsPermissionRequiredImport =>
      'Per importare i contatti è necessaria l\'autorizzazione per i contatti';

  @override
  String get importDialogTitle => 'Importa contatti';

  @override
  String get importDialogBody =>
      'Importare i contatti dal tuo dispositivo o da un file?';

  @override
  String get importSourceTitle => 'Importa';

  @override
  String get importZipPasswordTitle => 'Password di archivio';

  @override
  String get importZipPasswordChecking => 'Verifica...';

  @override
  String get exportContacts => 'Esporta contatti';

  @override
  String get unlockPro => 'Sblocca Pro';

  @override
  String get exportContactsTitle => 'Esporta contatti';

  @override
  String get exportSubtitle => 'Scegli come vuoi salvare i tuoi contatti.';

  @override
  String get exportFormatVcfTitle => 'Salva come .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Un file che funziona con Apple Contatti, Google Contatti e altro ancora.';

  @override
  String get exportFormatZipTitle => 'Salva in archivio protetto da password';

  @override
  String get exportFormatZipSubtitle =>
      'Un .zip con il tuo .vcf all\'interno: richiede una password per aprirlo.';

  @override
  String get exportProtectedTitle => 'Esportazione protetta';

  @override
  String get exportCompleteTitle => 'Esportazione completata';

  @override
  String get stillLoadingContacts =>
      'Sto ancora caricando i contatti. Attendere prego.';

  @override
  String get couldNotLoadContacts => 'Impossibile caricare i contatti.';

  @override
  String get passwordChangedSuccess =>
      'La password è stata modificata con successo';

  @override
  String get passwordProtectionEnabled =>
      'Protezione tramite password abilitata correttamente';

  @override
  String get passwordProtectionRemoved =>
      'Protezione tramite password rimossa correttamente';

  @override
  String get removePasswordProtectionButton =>
      'Rimuovi la protezione tramite password';

  @override
  String get changePasswordTitle => 'Cambiare la password';

  @override
  String get setPasswordTitle => 'Imposta password';

  @override
  String get passwordSettingsChangeTitle => 'Cambiare la password';

  @override
  String get passwordSettingsSetTitle => 'Imposta password';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Impossibile aprire l\'informativa sulla privacy: $error';
  }

  @override
  String get resetAppTitle => 'Reimposta l\'app';

  @override
  String get resetAppConfirmTitle =>
      'Eliminare tutti i contatti e reimpostare l\'app?';

  @override
  String get resetAppCannotUndo => 'Questa operazione non può essere annullata';

  @override
  String resetAppError(String error) {
    return 'Errore durante la reimpostazione dell\'app: $error';
  }

  @override
  String get photoPickerNewImage => 'Seleziona una nuova immagine';

  @override
  String get photoPickerRemoveImage => 'Rimuovi l\'immagine';

  @override
  String get onboardingHeadline1 => 'Chi può accedere ai tuoi contatti?';

  @override
  String get onboardingSubline1 =>
      'Alcune app li caricano sul cloud. Ciò può creare maggiori rischi per la privacy.';

  @override
  String get onboardingHeadline2 =>
      'Molte app richiedono l\'accesso ai contatti';

  @override
  String get onboardingSubline2 =>
      'Può essere utile, ma i contatti importanti dovrebbero rimanere privati.';

  @override
  String get onboardingHeadline3 => 'Mantieni separati i contatti sensibili';

  @override
  String get onboardingSubline3 =>
      'Ti consigliamo di archiviare i contatti importanti e utilizzati raramente al di fuori dell\'app dei contatti principale.';

  @override
  String get onboardingHeadline4 => 'Proteggi i tuoi contatti importanti';

  @override
  String get onboardingSubline4 =>
      'Savelon li memorizza sul tuo dispositivo, crittografati e privati ​​da altre app.';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboardingNext => 'Prossimo';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'Open source';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'Chiunque può controllare il nostro codice su ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => '.';

  @override
  String get onboardingBenefitsPrivateTitle => 'Privato';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'Nemmeno noi possiamo vedere i tuoi contatti';

  @override
  String get onboardingBenefitsSandboxTitle =>
      'Le altre app non possono guardare dentro';

  @override
  String get onboardingBenefitsOfflineTitle => 'Offline';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'Ti tiene lontano dal cloud, dai rivenditori di dati e dai sistemi di sorveglianza';

  @override
  String get activateDemoTitle => 'Attiva Demo';

  @override
  String get activateDemoCancel => 'Annulla';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Ora hai accesso demo fino al $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Aggiungi la protezione tramite password';

  @override
  String get setupPasswordMismatch => 'Le password non corrispondono';

  @override
  String get setupPasswordFailedSeed =>
      'Impossibile generare il seed. Riprova.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Impossibile inizializzare. Errore: $error';
  }

  @override
  String get setupPasswordInfo =>
      'I tuoi contatti saranno comunque fortemente crittografati da una lunga chiave segreta, memorizzata solo sul tuo dispositivo. Ma la password aggiunge ulteriore protezione.';

  @override
  String get setupPasswordLabel => 'Password';

  @override
  String get setupPasswordConfirmLabel => 'Conferma password';

  @override
  String get setupPasswordWarning =>
      'Questa password non può essere recuperata. Scrivila e tienila al sicuro!';

  @override
  String get setupPasswordPageTitle => 'Crea password';

  @override
  String get setupPasswordNext => 'Prossimo';

  @override
  String get setupPasswordSkip => 'Saltare';

  @override
  String get setupCreateVaultTitle => 'Crea la tua cassaforte';

  @override
  String get setupCreateVaultSubtitle =>
      'Memorizzata solo sul tuo dispositivo. Crittografata e privata.';

  @override
  String get setupDefaultVaultName => 'La mia cassaforte';

  @override
  String setupRandomVaultName(String number) {
    return 'Cassaforte$number';
  }

  @override
  String get setupCropPhotoTitle => 'Ritaglia foto';

  @override
  String get setupProtectionTitle => 'Protezione';

  @override
  String get setupEncryption256Label => 'Crittografia a 256 bit';

  @override
  String get setupRequirePasswordLabel => 'Richiedi password';

  @override
  String get setupCreateVaultButton => 'Crea cassaforte';

  @override
  String get setupCreatingVaultTitle => 'Creazione della cassaforte';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'Creazione della chiave';

  @override
  String get setupEncryptingDataLabel => 'Crittografia dei dati';

  @override
  String get setupCheckingSecurityLabel => 'Verifica della sicurezza';

  @override
  String get setupCreatingVaultError => 'Qualcosa è andato storto. Riprova.';

  @override
  String get setupVaultCreatedTitle => 'Cassaforte creata';

  @override
  String get setupVaultCreatedSubtitle =>
      'La tua cassaforte è pronta. È crittografata e al sicuro.';

  @override
  String get setupOpenVaultButton => 'Apri cassaforte';

  @override
  String get setupSavedSecretKeyCheckbox =>
      'Ho conservato la mia chiave segreta in modo sicuro';

  @override
  String get setupContinue => 'Continua';

  @override
  String get setupAddPasswordPageTitle => 'Aggiungi password';

  @override
  String get setupSavePasswordButton => 'Salva password';

  @override
  String get confirmationCheckboxTitle =>
      'Capisco che la mia password non può essere recuperata';

  @override
  String get loginWelcomeBack => 'Bentornato';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginUnlock => 'Sblocca';

  @override
  String get loginPasswordRequired => 'Inserisci la tua password';

  @override
  String get loginIncorrectPassword => 'Password errata. Per favore riprova.';

  @override
  String get paywallNoSubscription =>
      'Nessun abbonamento attivo trovato. Si prega di acquistare per continuare.';

  @override
  String get lifetimeThanksTitle => 'Grazie per essere con noi';

  @override
  String get lifetimeThanksSubtitle => 'Ti regaliamo l\'accesso Pro a vita';

  @override
  String get lifetimeThanksGift => 'regalo';

  @override
  String get lifetimeThanksCta => 'Richiedi accesso a vita';

  @override
  String get paywallNoInternetTitle => 'Nessuna connessione Internet';

  @override
  String get paywallNoInternetBody =>
      'Per accedere all\'app per la prima volta è necessaria una connessione Internet. Connettiti e riprova.';

  @override
  String get paywallStoreUnavailableTitle => 'Negozio non disponibile';

  @override
  String get paywallStoreUnavailableBody =>
      'Impossibile caricare le opzioni di abbonamento. Per favore riprova.';

  @override
  String get subscriptionVerifyTitle => 'Verifica abbonamento';

  @override
  String get subscriptionSoftWarningTitle =>
      'È necessaria la verifica dell\'abbonamento';

  @override
  String get subscriptionContinueAnyway => 'Continua comunque';

  @override
  String subscriptionLastVerified(String date) {
    return 'Ultima verifica: $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Impossibile verificare l\'abbonamento online.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Il tuo accesso continua fino al $date: connettiti prima per verificare.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Connettiti a Internet per verificare il tuo abbonamento.';

  @override
  String get duplicatesNoDuplicates => 'Nessun potenziale duplicato trovato';

  @override
  String get duplicatesSkippedShownAgain =>
      'I duplicati saltati vengono visualizzati nuovamente.';

  @override
  String get duplicatesShowSkippedTooltip =>
      'Mostra di nuovo i gruppi duplicati saltati';

  @override
  String duplicatesFailedToLoad(String error) {
    return 'Impossibile caricare i gruppi duplicati: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicati';
  }

  @override
  String get duplicatesSubtitlePlaceholder =>
      'Tocca per visualizzare i dettagli';

  @override
  String get duplicatesConflictMostlyIdentical => 'Per lo più identico';

  @override
  String duplicatesConflictFieldVariants(String field, int count) {
    return '$field: $count varianti';
  }

  @override
  String get fieldLabelName => 'nome';

  @override
  String get fieldLabelCompany => 'azienda';

  @override
  String get fieldLabelPhone => 'telefono';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'L\'importazione non è disponibile qui.';

  @override
  String get importErrorPermissionDenied =>
      'Per importare i contatti è necessaria l\'autorizzazione per i contatti.';

  @override
  String get importErrorNoContacts => 'Non ci sono contatti da importare.';

  @override
  String get importErrorUnsupportedFileType =>
      'Seleziona un file .vcf o un archivio .zip.';

  @override
  String get importErrorInvalidFile =>
      'Il file selezionato non è valido o illeggibile.';

  @override
  String get importErrorWrongPassword =>
      'Password di archivio errata. Per favore riprova.';

  @override
  String get importErrorNoVcfInArchive =>
      'Nessun file .vcf trovato nell\'archivio selezionato.';

  @override
  String importErrorFailed(String detail) {
    return 'Impossibile importare i contatti: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'I contatti non sono ancora disponibili.';

  @override
  String get exportErrorNoContacts => 'Nessun contatto da esportare.';

  @override
  String get exportErrorPasswordRequired =>
      'Per un\'esportazione protetta è richiesta la password.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'L\'esportazione protetta richiede una password di almeno $min caratteri.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Esportazione non riuscita: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Download avviato.';

  @override
  String get exportNoticeFileSaved => 'File salvato con successo.';

  @override
  String get phoneTypeMobile => 'mobile';

  @override
  String get phoneTypeHome => 'casa';

  @override
  String get phoneTypeWork => 'lavoro';

  @override
  String get phoneTypeSchool => 'scuola';

  @override
  String get phoneTypeOther => 'altro';

  @override
  String get emailTypePersonal => 'personale';

  @override
  String get emailTypeWork => 'lavoro';

  @override
  String get emailTypeSchool => 'scuola';

  @override
  String get emailTypeOther => 'altro';

  @override
  String get addressTypeHome => 'Casa';

  @override
  String get addressTypeWork => 'Lavoro';

  @override
  String get addressTypeSchool => 'Scuola';

  @override
  String get addressTypeBirth => 'Nascita';

  @override
  String get linkTypeWebsite => 'Sito web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Altro';

  @override
  String get dateTypeCreated => 'Creato';

  @override
  String get dateTypeBirthday => 'Compleanno';

  @override
  String get dateTypeMet => 'Incontro';

  @override
  String get dateTypeGraduation => 'Laurea';

  @override
  String get dateTypeMarriage => 'Matrimonio';

  @override
  String get dateTypeOther => 'Altro';

  @override
  String get noNameInList => '(Nessun nome)';

  @override
  String get formAddPhone => 'Aggiungi telefono';

  @override
  String get formAddEmail => 'Aggiungi e-mail';

  @override
  String get formAddAddress => 'Aggiungi indirizzo';

  @override
  String get formAddLink => 'Aggiungi collegamento';

  @override
  String get formAddDate => 'Aggiungi data';

  @override
  String get formHintPhoneNumber => 'Numero di telefono';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Indirizzo';

  @override
  String get formHintSelectDate => 'Seleziona la data';

  @override
  String get formHintNotes => 'Aggiungi note';

  @override
  String get formCompany => 'Azienda';

  @override
  String get formDepartment => 'Dipartimento';

  @override
  String get formJobTitle => 'Titolo di lavoro';

  @override
  String get formPrefix => 'Prefisso';

  @override
  String get formFirstName => 'Nome di battesimo';

  @override
  String get formMiddleName => 'Secondo nome';

  @override
  String get formLastName => 'Cognome';

  @override
  String get formSuffix => 'Suffisso';

  @override
  String get formNickname => 'Soprannome';

  @override
  String get contactsListTitle => 'Contatti';

  @override
  String get contactsListEmpty => 'Nessun contatto ancora';

  @override
  String get contactsImportButton => 'Importa contatti';

  @override
  String get mergeContactsTitle => 'Unisci contatti';

  @override
  String get mergeContactsSubtitle =>
      'Seleziona i contatti da unire in uno solo';

  @override
  String get exportPasswordHint => 'Password';

  @override
  String get exportPasswordConfirmHint => 'Conferma password';

  @override
  String exportPasswordHelper(int min) {
    return 'Almeno $min caratteri';
  }

  @override
  String get zipPasswordHint => 'Password di archivio';

  @override
  String get activateDemoAccessCodeLabel => 'Codice di accesso';

  @override
  String get subscriptionExpiredTitle => 'Abbonamento scaduto';

  @override
  String get subscriptionExpiredBody =>
      'Rinnova per continuare a utilizzare tutte le funzionalità.';

  @override
  String get contactsLoadError => 'Impossibile caricare i contatti.';

  @override
  String get contactsListError => 'Impossibile caricare i contatti.';

  @override
  String get contactsSearchNoResults => 'Nessun contatto trovato';

  @override
  String get supportPageIntro =>
      'Domande, feedback o qualcosa non funziona? Il team Savelon legge ogni messaggio.';

  @override
  String get supportCtaMessageTeam => 'Scrivi al team';

  @override
  String get importFromDeviceContacts => 'Dai tuoi contatti';

  @override
  String get importFromFileVcfZip => 'Da un file (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Crea una password univoca';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Questa password non può essere recuperata.';

  @override
  String get exportProtectedArchiveCta => 'Esporta archivio protetto';

  @override
  String get exportIosSavedFileWarning =>
      'Questo file viene salvato nella cartella Savelon. Se elimini l\'app, anche il file verrà eliminato. Spostalo in un\'altra posizione per conservarlo.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Importare $count contatti in Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Imposta password';

  @override
  String get settingsChangePasswordPageTitle => 'Cambia password';

  @override
  String get settingsRemovePasswordPageTitle => 'Rimuovi password';

  @override
  String get settingsNewPasswordLabel => 'Nuova password';

  @override
  String get settingsConfirmNewPasswordLabel => 'Conferma nuova password';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Reinserisci la nuova password';

  @override
  String get settingsSetPasswordCta => 'Imposta password';

  @override
  String get settingsChangePasswordCta => 'Cambia password';

  @override
  String get settingsRemovePasswordCta => 'Rimuovi password';

  @override
  String get settingsCurrentPasswordLabel => 'Password attuale';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Inserisci la password attuale';

  @override
  String get settingsNewPasswordMustDiffer =>
      'La nuova password deve essere diversa da quella attuale';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Impossibile impostare la password: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Impossibile cambiare la password: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Impossibile rimuovere la password: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'La password non è valida';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'La password attuale non è corretta';

  @override
  String get settingsCurrentPasswordRequired =>
      'La password attuale è obbligatoria';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Password richiesta quando la protezione con password è attiva';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Password richiesta quando attivi l\'opzione password';

  @override
  String get authPasswordRequiredForAccount =>
      'Password richiesta per questo account';

  @override
  String get loginLoggedInSecurely => 'Accesso effettuato in modo sicuro';
}

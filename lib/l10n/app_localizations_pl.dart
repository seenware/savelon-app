// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Szyfrowane kontakty';

  @override
  String get navContacts => 'Kontakty';

  @override
  String get navOrganize => 'Zorganizować';

  @override
  String get navSupport => 'Wsparcie';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get language => 'Język';

  @override
  String get languageSystemDefault => 'Domyślne systemowe';

  @override
  String get organizeTitle => 'Zorganizować';

  @override
  String get supportTitle => 'Wsparcie';

  @override
  String get search => 'Szukaj';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonMerge => 'Łączyć';

  @override
  String get commonSkip => 'Pomiń';

  @override
  String get commonRetry => 'Spróbować ponownie';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonNext => 'Następny';

  @override
  String get commonBack => 'Wróć';

  @override
  String get commonYes => 'Tak';

  @override
  String get commonNo => 'Nie';

  @override
  String get commonContinue => 'Kontynuuj';

  @override
  String get commonTryAgain => 'Spróbuj ponownie';

  @override
  String get commonApply => 'Zastosuj';

  @override
  String get commonDiscard => 'Odrzuć';

  @override
  String get commonUnlock => 'Odblokuj';

  @override
  String get commonLoading => 'Ładowanie...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Błąd: $error';
  }

  @override
  String get brandSlogan => 'Twoje kontakty. Tylko Twoje.';

  @override
  String get contactNotFound => 'Nie znaleziono kontaktu';

  @override
  String get contactDeleted => 'Kontakt usunięty';

  @override
  String get contactUpdated => 'Kontakt zaktualizowany';

  @override
  String get contactSaved => 'Kontakt zapisany';

  @override
  String get contactsMerged => 'Kontakty zostały połączone';

  @override
  String get deleteContactTitle => 'Usuń kontakt';

  @override
  String deleteContactConfirm(String name) {
    return 'Czy na pewno chcesz usunąć $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Czy na pewno chcesz usunąć „$name”?';
  }

  @override
  String failedToDelete(String error) {
    return 'Nie udało się usunąć: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Nie udało się zaktualizować: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Nie udało się zapisać: $error';
  }

  @override
  String get noName => 'Brak imienia';

  @override
  String get noNameTitle => 'Brak imienia';

  @override
  String get noNameBody => 'Ten kontakt nie ma nazwy. Zapisać mimo to?';

  @override
  String get discardChangesTitle => 'Odrzucić zmiany?';

  @override
  String get discardChangesBody =>
      'Masz niezapisane zmiany, które zostaną utracone.';

  @override
  String get newContact => 'Nowy kontakt';

  @override
  String get editContact => 'Edytuj kontakt';

  @override
  String get addMore => 'Dodaj więcej';

  @override
  String get addNameFieldsTitle => 'Dodaj pola nazw';

  @override
  String get call => 'Zadzwoń';

  @override
  String get sendEmail => 'Wyślij e-mail';

  @override
  String get copy => 'Kopiuj';

  @override
  String get visit => 'Odwiedź';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get importContacts => 'Importuj kontakty';

  @override
  String get importing => 'Importowanie...';

  @override
  String importedCount(int count) {
    return 'Zaimportowano $count kontaktów';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Zaimportowano $imported kontaktów, pominięto $skipped';
  }

  @override
  String get failedToImportContacts => 'Nie udało się zaimportować kontaktów';

  @override
  String get noContactsToImport => 'Brak kontaktów do zaimportowania.';

  @override
  String get contactsPermissionRequiredImport =>
      'Do importowania kontaktów wymagane jest zezwolenie na kontakty';

  @override
  String get importDialogTitle => 'Importuj kontakty';

  @override
  String get importDialogBody =>
      'Zaimportować kontakty ze swojego urządzenia lub pliku?';

  @override
  String get importSourceTitle => 'Import';

  @override
  String get importZipPasswordTitle => 'Hasło archiwum';

  @override
  String get importZipPasswordChecking => 'Sprawdzanie...';

  @override
  String get exportContacts => 'Eksportuj kontakty';

  @override
  String get unlockPro => 'Odblokuj Pro';

  @override
  String get exportContactsTitle => 'Eksportuj kontakty';

  @override
  String get exportSubtitle => 'Wybierz sposób zapisywania kontaktów.';

  @override
  String get exportFormatVcfTitle => 'Zapisz jako .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Jeden plik współpracujący z kontaktami Apple, kontaktami Google i nie tylko.';

  @override
  String get exportFormatZipTitle => 'Zapisz w archiwum chronionym hasłem';

  @override
  String get exportFormatZipSubtitle =>
      '.zip z Twoim .vcf w środku — wymaga hasła, aby go otworzyć.';

  @override
  String get exportProtectedTitle => 'Eksport chroniony';

  @override
  String get exportCompleteTitle => 'Eksport zakończony';

  @override
  String get stillLoadingContacts => 'Nadal ładuję kontakty. Proszę czekać.';

  @override
  String get couldNotLoadContacts => 'Nie udało się wczytać kontaktów.';

  @override
  String get passwordChangedSuccess => 'Hasło zostało pomyślnie zmienione';

  @override
  String get passwordProtectionEnabled => 'Pomyślnie włączono ochronę hasłem';

  @override
  String get passwordProtectionRemoved => 'Pomyślnie usunięto ochronę hasłem';

  @override
  String get removePasswordProtectionButton => 'Usuń ochronę hasłem';

  @override
  String get changePasswordTitle => 'Zmień hasło';

  @override
  String get setPasswordTitle => 'Ustaw hasło';

  @override
  String get passwordSettingsChangeTitle => 'Zmień hasło';

  @override
  String get passwordSettingsSetTitle => 'Ustaw hasło';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Nie udało się otworzyć polityki prywatności: $error';
  }

  @override
  String get resetAppTitle => 'Zresetuj aplikację';

  @override
  String get resetAppConfirmTitle =>
      'Usunąć wszystkie kontakty i zresetować aplikację?';

  @override
  String get resetAppCannotUndo => 'Tego nie można cofnąć';

  @override
  String resetAppError(String error) {
    return 'Błąd resetowania aplikacji: $error';
  }

  @override
  String get photoPickerNewImage => 'Wybierz nowy obraz';

  @override
  String get photoPickerRemoveImage => 'Usuń obraz';

  @override
  String get onboardingHeadline1 =>
      'Kto może uzyskać dostęp do Twoich kontaktów?';

  @override
  String get onboardingSubline1 =>
      'Niektóre aplikacje przesyłają je do chmury. Może to spowodować większe ryzyko dla prywatności.';

  @override
  String get onboardingHeadline2 =>
      'Wiele aplikacji prosi o dostęp do kontaktów';

  @override
  String get onboardingSubline2 =>
      'Może się to przydać, ale ważne kontakty powinny pozostać prywatne.';

  @override
  String get onboardingHeadline3 => 'Trzymaj wrażliwe kontakty oddzielnie';

  @override
  String get onboardingSubline3 =>
      'Zalecamy przechowywanie ważnych i rzadko używanych kontaktów poza główną aplikacją kontaktów.';

  @override
  String get onboardingHeadline4 => 'Chroń swoje ważne kontakty';

  @override
  String get onboardingSubline4 =>
      'Savelon przechowuje je na Twoim urządzeniu, zaszyfrowane i prywatne przed innymi aplikacjami.';

  @override
  String get onboardingGetStarted => 'Rozpocznij';

  @override
  String get onboardingNext => 'Następny';

  @override
  String get activateDemoTitle => 'Aktywuj wersję demonstracyjną';

  @override
  String get activateDemoCancel => 'Anuluj';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Masz teraz dostęp demo do $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Dodaj ochronę hasłem';

  @override
  String get setupPasswordMismatch => 'Hasła nie pasują';

  @override
  String get setupPasswordFailedSeed =>
      'Nie udało się wygenerować ziarna losowości. Spróbuj ponownie.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Nie udało się zainicjować. Błąd: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Twoje kontakty będą nadal silnie szyfrowane długim tajnym kluczem przechowywanym tylko na Twoim urządzeniu. Ale hasło zapewnia dodatkową ochronę.';

  @override
  String get setupPasswordLabel => 'Hasło';

  @override
  String get setupPasswordConfirmLabel => 'Potwierdź hasło';

  @override
  String get setupPasswordWarning =>
      'Tego hasła nie można odzyskać. Zapisz to i zachowaj bezpieczeństwo!';

  @override
  String get setupPasswordPageTitle => 'Utwórz hasło';

  @override
  String get setupPasswordNext => 'Następny';

  @override
  String get setupPasswordSkip => 'Pomiń';

  @override
  String get confirmationCheckboxTitle =>
      'Rozumiem, że mojego hasła nie można odzyskać';

  @override
  String get loginWelcomeBack => 'Witamy z powrotem';

  @override
  String get loginPasswordLabel => 'Hasło';

  @override
  String get loginUnlock => 'Odblokuj';

  @override
  String get loginPasswordRequired => 'Wpisz swoje hasło';

  @override
  String get loginIncorrectPassword => 'Nieprawidłowe hasło. Spróbuj ponownie.';

  @override
  String get paywallNoSubscription =>
      'Nie znaleziono aktywnej subskrypcji. Kup, aby kontynuować.';

  @override
  String get lifetimeThanksTitle => 'Dziękujemy, że jesteś z nami';

  @override
  String get lifetimeThanksSubtitle =>
      'Dajemy Ci dożywotni dostęp Pro w prezencie';

  @override
  String get lifetimeThanksGift => 'prezent';

  @override
  String get lifetimeThanksCta => 'Odbierz dożywotni dostęp';

  @override
  String get paywallNoInternetTitle => 'Brak połączenia z Internetem';

  @override
  String get paywallNoInternetBody =>
      'Aby uzyskać dostęp do aplikacji po raz pierwszy, wymagane jest połączenie internetowe. Połącz się i spróbuj ponownie.';

  @override
  String get paywallStoreUnavailableTitle => 'Sklep niedostępny';

  @override
  String get paywallStoreUnavailableBody =>
      'Nie można wczytać opcji subskrypcji. Spróbuj ponownie.';

  @override
  String get subscriptionVerifyTitle => 'Zweryfikuj subskrypcję';

  @override
  String get subscriptionSoftWarningTitle => 'Wymagana weryfikacja subskrypcji';

  @override
  String get subscriptionContinueAnyway => 'Kontynuuj mimo wszystko';

  @override
  String subscriptionLastVerified(String date) {
    return 'Ostatnio zweryfikowany $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Nie można zweryfikować subskrypcji online.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Twój dostęp będzie kontynuowany do $date — połącz się wcześniej, aby to zweryfikować.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Połącz się z Internetem, aby zweryfikować swoją subskrypcję.';

  @override
  String get organizeNoDuplicates => 'Nie znaleziono potencjalnych duplikatów';

  @override
  String get organizeSkippedShownAgain =>
      'Pominięte duplikaty zostaną ponownie wyświetlone.';

  @override
  String get organizeShowSkippedTooltip =>
      'Pokaż ponownie pominięte zduplikowane grupy';

  @override
  String organizeFailedToLoad(String error) {
    return 'Nie udało się załadować zduplikowanych grup: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplikatów';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Kliknij, aby wyświetlić szczegóły';

  @override
  String get organizeConflictMostlyIdentical => 'W większości identyczne';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: warianty $count';
  }

  @override
  String get fieldLabelName => 'nazwa';

  @override
  String get fieldLabelCompany => 'firma';

  @override
  String get fieldLabelPhone => 'telefon';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource => 'Import nie jest tutaj dostępny.';

  @override
  String get importErrorPermissionDenied =>
      'Do importowania kontaktów wymagane jest zezwolenie na kontakty.';

  @override
  String get importErrorNoContacts => 'Brak kontaktów do zaimportowania.';

  @override
  String get importErrorUnsupportedFileType =>
      'Proszę wybrać plik .vcf lub archiwum .zip.';

  @override
  String get importErrorInvalidFile =>
      'Wybrany plik jest nieprawidłowy lub nieczytelny.';

  @override
  String get importErrorWrongPassword =>
      'Nieprawidłowe hasło do archiwum. Spróbuj ponownie.';

  @override
  String get importErrorNoVcfInArchive =>
      'W wybranym archiwum nie znaleziono plików .vcf.';

  @override
  String importErrorFailed(String detail) {
    return 'Nie udało się zaimportować kontaktów: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Kontakty nie są jeszcze dostępne.';

  @override
  String get exportErrorNoContacts => 'Brak kontaktów do wyeksportowania.';

  @override
  String get exportErrorPasswordRequired =>
      'Do chronionego eksportu wymagane jest hasło.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Eksport chroniony wymaga hasła o długości co najmniej $min znaków.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Eksport nie powiódł się: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Pobieranie rozpoczęte.';

  @override
  String get exportNoticeFileSaved => 'Plik został zapisany pomyślnie.';

  @override
  String get phoneTypeMobile => 'Komórkowy';

  @override
  String get phoneTypeHome => 'dom';

  @override
  String get phoneTypeWork => 'praca';

  @override
  String get phoneTypeSchool => 'szkoła';

  @override
  String get phoneTypeOther => 'Inny';

  @override
  String get emailTypePersonal => 'osobisty';

  @override
  String get emailTypeWork => 'praca';

  @override
  String get emailTypeSchool => 'szkoła';

  @override
  String get emailTypeOther => 'Inny';

  @override
  String get addressTypeHome => 'Dom';

  @override
  String get addressTypeWork => 'Praca';

  @override
  String get addressTypeSchool => 'Szkoła';

  @override
  String get addressTypeBirth => 'Narodziny';

  @override
  String get linkTypeWebsite => 'Strona internetowa';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Inny';

  @override
  String get dateTypeCreated => 'Stworzony';

  @override
  String get dateTypeBirthday => 'Urodziny';

  @override
  String get dateTypeMet => 'Spotkane';

  @override
  String get dateTypeGraduation => 'Ukończenie studiów';

  @override
  String get dateTypeMarriage => 'Małżeństwo';

  @override
  String get dateTypeOther => 'Inny';

  @override
  String get noNameInList => '(Bez imienia)';

  @override
  String get formAddPhone => 'Dodaj telefon';

  @override
  String get formAddEmail => 'Dodaj e-mail';

  @override
  String get formAddAddress => 'Dodaj adres';

  @override
  String get formAddLink => 'Dodaj link';

  @override
  String get formAddDate => 'Dodaj datę';

  @override
  String get formHintPhoneNumber => 'Numer telefonu';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'Adres URL';

  @override
  String get formHintAddress => 'Adres';

  @override
  String get formHintSelectDate => 'Wybierz datę';

  @override
  String get formHintNotes => 'Dodaj notatki';

  @override
  String get formCompany => 'Firma';

  @override
  String get formDepartment => 'Dział';

  @override
  String get formJobTitle => 'Tytuł pracy';

  @override
  String get formPrefix => 'Prefiks';

  @override
  String get formFirstName => 'Imię';

  @override
  String get formMiddleName => 'Drugie imię';

  @override
  String get formLastName => 'Nazwisko';

  @override
  String get formSuffix => 'Przyrostek';

  @override
  String get formNickname => 'Przydomek';

  @override
  String get contactsListTitle => 'Kontakty';

  @override
  String get contactsListEmpty => 'Nie ma jeszcze żadnych kontaktów';

  @override
  String get contactsImportButton => 'Importuj kontakty';

  @override
  String get mergeContactsTitle => 'Połącz kontakty';

  @override
  String get mergeContactsSubtitle =>
      'Wybierz kontakty, które chcesz połączyć w jeden';

  @override
  String get exportPasswordHint => 'Hasło';

  @override
  String get exportPasswordConfirmHint => 'Potwierdź hasło';

  @override
  String exportPasswordHelper(int min) {
    return 'Co najmniej $min znaków';
  }

  @override
  String get zipPasswordHint => 'Hasło archiwum';

  @override
  String get activateDemoAccessCodeLabel => 'Kod dostępu';

  @override
  String get subscriptionExpiredTitle => 'Subskrypcja wygasła';

  @override
  String get subscriptionExpiredBody =>
      'Odnów, aby nadal korzystać ze wszystkich funkcji.';

  @override
  String get contactsLoadError => 'Nie udało się wczytać kontaktów.';

  @override
  String get contactsListError => 'Nie udało się wczytać kontaktów.';

  @override
  String get contactsSearchNoResults => 'Nie znaleziono kontaktów';

  @override
  String get supportPageIntro =>
      'Pytania, opinie lub coś nie działa? Zespół Savelon czyta każdą wiadomość.';

  @override
  String get supportCtaMessageTeam => 'Napisz do zespołu';

  @override
  String get importFromDeviceContacts => 'Z kontaktów w urządzeniu';

  @override
  String get importFromFileVcfZip => 'Z pliku (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Utwórz unikalne hasło';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Tego hasła nie można odzyskać.';

  @override
  String get exportProtectedArchiveCta => 'Eksportuj chronione archiwum';

  @override
  String get exportIosSavedFileWarning =>
      'Ten plik jest zapisywany w folderze Savelon. Po usunięciu aplikacji plik również zostanie usunięty. Przenieś go w inne miejsce, aby go zachować.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Zaimportować $count kontaktów do Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Ustaw hasło';

  @override
  String get settingsChangePasswordPageTitle => 'Zmień hasło';

  @override
  String get settingsRemovePasswordPageTitle => 'Usuń hasło';

  @override
  String get settingsNewPasswordLabel => 'Nowe hasło';

  @override
  String get settingsConfirmNewPasswordLabel => 'Potwierdź nowe hasło';

  @override
  String get settingsReenterNewPasswordHelper => 'Wpisz ponownie nowe hasło';

  @override
  String get settingsSetPasswordCta => 'Ustaw hasło';

  @override
  String get settingsChangePasswordCta => 'Zmień hasło';

  @override
  String get settingsRemovePasswordCta => 'Usuń hasło';

  @override
  String get settingsCurrentPasswordLabel => 'Obecne hasło';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Wpisz obecne hasło';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Nowe hasło musi różnić się od obecnego';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Nie udało się ustawić hasła: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Nie udało się zmienić hasła: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Nie udało się usunąć hasła: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Hasło jest nieprawidłowe';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'Obecne hasło jest nieprawidłowe';

  @override
  String get settingsCurrentPasswordRequired => 'Wymagane jest obecne hasło';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Hasło wymagane, gdy włączona jest ochrona hasłem';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Hasło wymagane przy włączaniu opcji hasła';

  @override
  String get authPasswordRequiredForAccount => 'Hasło wymagane dla tego konta';
}

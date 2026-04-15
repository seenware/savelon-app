// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Şifrelenmiş Kişiler';

  @override
  String get navContacts => 'Kişiler';

  @override
  String get navOrganize => 'Düzenle';

  @override
  String get navSupport => 'Destek';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get languageSystemDefault => 'Sistem varsayılanı';

  @override
  String get organizeTitle => 'Düzenle';

  @override
  String get supportTitle => 'Destek';

  @override
  String get search => 'Ara';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonMerge => 'Birleştir';

  @override
  String get commonSkip => 'Atla';

  @override
  String get commonRetry => 'Yeniden dene';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonNext => 'Sonraki';

  @override
  String get commonBack => 'Geri gitmek';

  @override
  String get commonYes => 'Evet';

  @override
  String get commonNo => 'Hayır';

  @override
  String get commonContinue => 'Devam et';

  @override
  String get commonTryAgain => 'Tekrar deneyin';

  @override
  String get commonApply => 'Uygula';

  @override
  String get commonDiscard => 'Vazgeç';

  @override
  String get commonUnlock => 'Kilidi aç';

  @override
  String get commonLoading => 'Yükleniyor...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Hata: $error';
  }

  @override
  String get brandSlogan => 'Kişileriniz. Yalnızca sizin.';

  @override
  String get contactNotFound => 'Kişi bulunamadı';

  @override
  String get contactDeleted => 'Kişi silindi';

  @override
  String get contactUpdated => 'Kişi güncellendi';

  @override
  String get contactSaved => 'Kişi kaydedildi';

  @override
  String get contactsMerged => 'Kişiler birleştirildi';

  @override
  String get deleteContactTitle => 'Kişiyi Sil';

  @override
  String deleteContactConfirm(String name) {
    return '$name\'ı silmek istediğinizden emin misiniz?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '\"$name\" kişisini silmek istediğinizden emin misiniz?';
  }

  @override
  String failedToDelete(String error) {
    return 'Silinemedi: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Güncellenemedi: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get noName => 'İsim Yok';

  @override
  String get noNameTitle => 'İsim Yok';

  @override
  String get noNameBody => 'Bu kişinin adı yok. Yine de kaydedilsin mi?';

  @override
  String get discardChangesTitle => 'Değişiklikler silinsin mi?';

  @override
  String get discardChangesBody =>
      'Kaybedilecek kaydedilmemiş değişiklikleriniz var.';

  @override
  String get newContact => 'Yeni Kişi';

  @override
  String get editContact => 'Kişiyi Düzenle';

  @override
  String get addMore => 'Daha fazlasını ekle';

  @override
  String get addNameFieldsTitle => 'Ad Alanları Ekle';

  @override
  String get call => 'Ara';

  @override
  String get sendEmail => 'E-posta Gönder';

  @override
  String get copy => 'Kopyala';

  @override
  String get visit => 'Ziyaret et';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get importContacts => 'Kişileri İçe Aktar';

  @override
  String get importing => 'İçe aktarılıyor...';

  @override
  String importedCount(int count) {
    return '$count kişi içe aktarıldı';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported kişi içe aktarıldı, $skipped atlandı';
  }

  @override
  String get failedToImportContacts => 'Kişiler içe aktarılamadı';

  @override
  String get noContactsToImport => 'İçe aktarılacak kişi yok.';

  @override
  String get contactsPermissionRequiredImport =>
      'Kişileri içe aktarmak için Kişiler izni gereklidir';

  @override
  String get importDialogTitle => 'Kişileri İçe Aktar';

  @override
  String get importDialogBody =>
      'Kişileri cihazınızdan mı yoksa bir dosyadan mı aktarıyorsunuz?';

  @override
  String get importSourceTitle => 'İçe aktar';

  @override
  String get importZipPasswordTitle => 'Arşiv parolası';

  @override
  String get importZipPasswordChecking => 'Kontrol ediliyor...';

  @override
  String get exportContacts => 'Kişileri Dışa Aktar';

  @override
  String get unlockPro => 'Pro kilidini aç';

  @override
  String get exportContactsTitle => 'Kişileri dışa aktar';

  @override
  String get exportSubtitle =>
      'Kişilerinizi nasıl kaydetmek istediğinizi seçin.';

  @override
  String get exportFormatVcfTitle => '.vcf olarak kaydet';

  @override
  String get exportFormatVcfSubtitle =>
      'Apple Kişiler, Google Kişiler ve daha fazlasıyla çalışan tek bir dosya.';

  @override
  String get exportFormatZipTitle => 'Parola korumalı arşive kaydet';

  @override
  String get exportFormatZipSubtitle =>
      'İçinde .vcf bulunan bir .zip — onu açmak için bir şifre gerekir.';

  @override
  String get exportProtectedTitle => 'Korumalı dışa aktarma';

  @override
  String get exportCompleteTitle => 'Dışa aktarma tamamlandı';

  @override
  String get stillLoadingContacts =>
      'Kişiler hâlâ yükleniyor. Lütfen bekleyin.';

  @override
  String get couldNotLoadContacts => 'Kişiler yüklenemedi.';

  @override
  String get passwordChangedSuccess => 'Şifre başarıyla değiştirildi';

  @override
  String get passwordProtectionEnabled =>
      'Şifre koruması başarıyla etkinleştirildi';

  @override
  String get passwordProtectionRemoved => 'Şifre koruması başarıyla kaldırıldı';

  @override
  String get removePasswordProtectionButton => 'Şifre Korumasını Kaldır';

  @override
  String get changePasswordTitle => 'Şifre değiştir';

  @override
  String get setPasswordTitle => 'Şifreyi Ayarla';

  @override
  String get passwordSettingsChangeTitle => 'Şifre değiştir';

  @override
  String get passwordSettingsSetTitle => 'Şifreyi Ayarla';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Gizlilik politikası açılamadı: $error';
  }

  @override
  String get resetAppTitle => 'Uygulamayı sıfırla';

  @override
  String get resetAppConfirmTitle =>
      'Tüm kişiler silinip uygulama sıfırlansın mı?';

  @override
  String get resetAppCannotUndo => 'Bu geri alınamaz';

  @override
  String resetAppError(String error) {
    return 'Uygulama sıfırlanırken hata oluştu: $error';
  }

  @override
  String get photoPickerNewImage => 'Yeni resim seç';

  @override
  String get photoPickerRemoveImage => 'Resmi kaldır';

  @override
  String get onboardingHeadline1 => 'Kişilerinize kimler erişebilir?';

  @override
  String get onboardingSubline1 =>
      'Bazı uygulamalar bunları buluta yükler. Bu daha fazla gizlilik riski oluşturabilir.';

  @override
  String get onboardingHeadline2 => 'Birçok uygulama kişi erişimi istiyor';

  @override
  String get onboardingSubline2 =>
      'Yararlı olabilir ancak önemli kişiler gizli kalmalıdır.';

  @override
  String get onboardingHeadline3 => 'Hassas kişileri ayrı tutun';

  @override
  String get onboardingSubline3 =>
      'Önemli ve nadiren kullanılan kişileri ana kişiler uygulamanızın dışında saklamanızı öneririz.';

  @override
  String get onboardingHeadline4 => 'Önemli kişilerinizi koruyun';

  @override
  String get onboardingSubline4 =>
      'Savelon bunları cihazınızda şifrelenmiş ve diğer uygulamalardan özel olarak saklar.';

  @override
  String get onboardingGetStarted => 'Başlayın';

  @override
  String get onboardingNext => 'Sonraki';

  @override
  String get activateDemoTitle => 'Demoyu Etkinleştir';

  @override
  String get activateDemoCancel => 'İptal';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Artık $dateTime tarihine kadar demo erişiminiz var';
  }

  @override
  String get setupPasswordTitle => 'Şifre koruması ekleyin';

  @override
  String get setupPasswordMismatch => 'Şifreler eşleşmiyor';

  @override
  String get setupPasswordFailedSeed =>
      'Tohum oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Başlatılamadı. Hata: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Kişileriniz yalnızca cihazınızda saklanan uzun bir gizli anahtarla güçlü bir şekilde şifrelenmeye devam edecektir. Ancak şifre ekstra koruma sağlar.';

  @override
  String get setupPasswordLabel => 'Şifre';

  @override
  String get setupPasswordConfirmLabel => 'Şifreyi Onayla';

  @override
  String get setupPasswordWarning =>
      'Bu şifre kurtarılamaz. Bunu bir yere yazın ve güvende tutun!';

  @override
  String get setupPasswordPageTitle => 'Şifre Oluştur';

  @override
  String get setupPasswordNext => 'Sonraki';

  @override
  String get setupPasswordSkip => 'Atla';

  @override
  String get confirmationCheckboxTitle =>
      'Şifremin kurtarılamayacağını anlıyorum';

  @override
  String get loginWelcomeBack => 'Tekrar hoşgeldiniz';

  @override
  String get loginPasswordLabel => 'Şifre';

  @override
  String get loginUnlock => 'Kilidi aç';

  @override
  String get loginPasswordRequired => 'Şifrenizi girin';

  @override
  String get loginIncorrectPassword => 'Yanlış şifre. Lütfen tekrar deneyin.';

  @override
  String get paywallNoSubscription =>
      'Aktif abonelik bulunamadı. Devam etmek için lütfen satın alın.';

  @override
  String get lifetimeThanksTitle => 'Bizimle olduğunuz için teşekkür ederiz';

  @override
  String get lifetimeThanksSubtitle =>
      'Size ömür boyu Pro erişimi hediye ediyoruz';

  @override
  String get lifetimeThanksGift => 'hediye';

  @override
  String get lifetimeThanksCta => 'Ömür boyu erişimi al';

  @override
  String get paywallNoInternetTitle => 'İnternet Bağlantısı Yok';

  @override
  String get paywallNoInternetBody =>
      'Uygulamaya ilk kez erişmek için internet bağlantısı gereklidir. Lütfen bağlanın ve tekrar deneyin.';

  @override
  String get paywallStoreUnavailableTitle => 'Mağaza Kullanılamıyor';

  @override
  String get paywallStoreUnavailableBody =>
      'Abonelik seçenekleri yüklenemiyor. Lütfen tekrar deneyin.';

  @override
  String get subscriptionVerifyTitle => 'Aboneliği Doğrula';

  @override
  String get subscriptionSoftWarningTitle => 'Abonelik Doğrulaması Gerekiyor';

  @override
  String get subscriptionContinueAnyway => 'Yine de Devam Et';

  @override
  String subscriptionLastVerified(String date) {
    return 'Son doğrulama $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Abonelik çevrimiçi olarak doğrulanamadı.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Erişiminiz $date tarihine kadar devam eder — doğrulamak için bu tarihten önce bağlanın.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Aboneliğinizi doğrulamak için internete bağlanın.';

  @override
  String get organizeNoDuplicates => 'Potansiyel kopya bulunamadı';

  @override
  String get organizeSkippedShownAgain => 'Atlanan kopyalar tekrar gösterilir.';

  @override
  String get organizeShowSkippedTooltip =>
      'Atlanan yinelenen grupları tekrar göster';

  @override
  String organizeFailedToLoad(String error) {
    return 'Yinelenen gruplar yüklenemedi: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count kopya';
  }

  @override
  String get organizeSubtitlePlaceholder =>
      'Ayrıntıları görüntülemek için dokunun';

  @override
  String get organizeConflictMostlyIdentical => 'Çoğunlukla aynı';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count varyant';
  }

  @override
  String get fieldLabelName => 'isim';

  @override
  String get fieldLabelCompany => 'şirket';

  @override
  String get fieldLabelPhone => 'telefon';

  @override
  String get fieldLabelEmail => 'e-posta';

  @override
  String get importErrorUnsupportedSource =>
      'İçe aktarma burada kullanılamıyor.';

  @override
  String get importErrorPermissionDenied =>
      'Kişileri içe aktarmak için Kişilerin izni gereklidir.';

  @override
  String get importErrorNoContacts => 'İçe aktarılacak kişi yok.';

  @override
  String get importErrorUnsupportedFileType =>
      'Lütfen bir .vcf dosyası veya .zip arşivi seçin.';

  @override
  String get importErrorInvalidFile =>
      'Seçilen dosya geçersiz veya okunamıyor.';

  @override
  String get importErrorWrongPassword =>
      'Yanlış arşiv şifresi. Lütfen tekrar deneyin.';

  @override
  String get importErrorNoVcfInArchive =>
      'Seçilen arşivde .vcf dosyası bulunamadı.';

  @override
  String importErrorFailed(String detail) {
    return 'Kişiler içe aktarılamadı: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'Kişiler henüz kullanılamıyor.';

  @override
  String get exportErrorNoContacts => 'Dışa aktarılacak kişi yok.';

  @override
  String get exportErrorPasswordRequired =>
      'Korumalı bir dışa aktarma için parola gereklidir.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Korumalı dışa aktarma, en az $min karakterden oluşan bir parola gerektirir.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Dışa aktarma başarısız oldu: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'İndirme başladı.';

  @override
  String get exportNoticeFileSaved => 'Dosya başarıyla kaydedildi.';

  @override
  String get phoneTypeMobile => 'mobil';

  @override
  String get phoneTypeHome => 'Ev';

  @override
  String get phoneTypeWork => 'iş';

  @override
  String get phoneTypeSchool => 'okul';

  @override
  String get phoneTypeOther => 'diğer';

  @override
  String get emailTypePersonal => 'kişisel';

  @override
  String get emailTypeWork => 'iş';

  @override
  String get emailTypeSchool => 'okul';

  @override
  String get emailTypeOther => 'diğer';

  @override
  String get addressTypeHome => 'Ev';

  @override
  String get addressTypeWork => 'İş';

  @override
  String get addressTypeSchool => 'Okul';

  @override
  String get addressTypeBirth => 'Doğum';

  @override
  String get linkTypeWebsite => 'Web sitesi';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Diğer';

  @override
  String get dateTypeCreated => 'Oluşturuldu';

  @override
  String get dateTypeBirthday => 'Doğum günü';

  @override
  String get dateTypeMet => 'Buluştu';

  @override
  String get dateTypeGraduation => 'Mezuniyet';

  @override
  String get dateTypeMarriage => 'Evlilik';

  @override
  String get dateTypeOther => 'Diğer';

  @override
  String get noNameInList => '(İsim yok)';

  @override
  String get formAddPhone => 'Telefon ekle';

  @override
  String get formAddEmail => 'E-posta ekle';

  @override
  String get formAddAddress => 'Adres ekle';

  @override
  String get formAddLink => 'Bağlantı ekle';

  @override
  String get formAddDate => 'Tarih ekle';

  @override
  String get formHintPhoneNumber => 'Telefon numarası';

  @override
  String get formHintEmail => 'E-posta';

  @override
  String get formHintUrl => 'URL\'si';

  @override
  String get formHintAddress => 'Adres';

  @override
  String get formHintSelectDate => 'Tarih seçin';

  @override
  String get formHintNotes => 'Not ekle';

  @override
  String get formCompany => 'Şirket';

  @override
  String get formDepartment => 'Departman';

  @override
  String get formJobTitle => 'İş unvanı';

  @override
  String get formPrefix => 'Önek';

  @override
  String get formFirstName => 'İlk adı';

  @override
  String get formMiddleName => 'İkinci ad';

  @override
  String get formLastName => 'Soy isim';

  @override
  String get formSuffix => 'sonek';

  @override
  String get formNickname => 'Takma ad';

  @override
  String get contactsListTitle => 'Kişiler';

  @override
  String get contactsListEmpty => 'Henüz kişi yok';

  @override
  String get contactsImportButton => 'Kişileri İçe Aktar';

  @override
  String get mergeContactsTitle => 'Kişileri birleştir';

  @override
  String get mergeContactsSubtitle =>
      'Tek bir kişide birleştirilecek kişileri seçin';

  @override
  String get exportPasswordHint => 'Şifre';

  @override
  String get exportPasswordConfirmHint => 'Şifreyi onayla';

  @override
  String exportPasswordHelper(int min) {
    return 'En az $min karakter';
  }

  @override
  String get zipPasswordHint => 'Arşiv parolası';

  @override
  String get activateDemoAccessCodeLabel => 'Erişim kodu';

  @override
  String get subscriptionExpiredTitle => 'Aboneliğin süresi doldu';

  @override
  String get subscriptionExpiredBody =>
      'Tüm özellikleri kullanmaya devam etmek için yenileyin.';

  @override
  String get contactsLoadError => 'Kişiler yüklenemedi.';

  @override
  String get contactsListError => 'Kişiler yüklenemedi.';

  @override
  String get contactsSearchNoResults => 'Kişi bulunamadı';

  @override
  String get supportPageIntro =>
      'Sorularınız, geri bildiriminiz veya bir sorun mu var? Savelon ekibi her mesajı okur.';

  @override
  String get supportCtaMessageTeam => 'Ekibe yazın';

  @override
  String get importFromDeviceContacts => 'Kişilerinizden';

  @override
  String get importFromFileVcfZip => 'Dosyadan (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Benzersiz şifre oluştur';

  @override
  String get exportPasswordIrrecoverableHint => 'Bu şifre kurtarılamaz.';

  @override
  String get exportProtectedArchiveCta => 'Korumalı arşivi dışa aktar';

  @override
  String get exportIosSavedFileWarning =>
      'Bu dosya Savelon klasörüne kaydedilir. Uygulamayı silerseniz dosya da silinir. Saklamak için başka bir konuma taşıyın.';

  @override
  String importContactsConfirmBody(int count) {
    return '$count kişi Savelon\'a aktarılsın mı?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Şifre belirle';

  @override
  String get settingsChangePasswordPageTitle => 'Şifreyi değiştir';

  @override
  String get settingsRemovePasswordPageTitle => 'Şifreyi kaldır';

  @override
  String get settingsNewPasswordLabel => 'Yeni şifre';

  @override
  String get settingsConfirmNewPasswordLabel => 'Yeni şifreyi onayla';

  @override
  String get settingsReenterNewPasswordHelper => 'Yeni şifrenizi tekrar girin';

  @override
  String get settingsSetPasswordCta => 'Şifre belirle';

  @override
  String get settingsChangePasswordCta => 'Şifreyi değiştir';

  @override
  String get settingsRemovePasswordCta => 'Şifreyi kaldır';

  @override
  String get settingsCurrentPasswordLabel => 'Mevcut şifre';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Mevcut şifrenizi girin';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Yeni şifre mevcut şifreden farklı olmalıdır';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Şifre belirlenemedi: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Şifre değiştirilemedi: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Şifre kaldırılamadı: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Şifre geçersiz';

  @override
  String get settingsCurrentPasswordIncorrect => 'Mevcut şifre yanlış';

  @override
  String get settingsCurrentPasswordRequired => 'Mevcut şifre gerekli';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Şifre koruması açıkken şifre gerekir';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Şifre seçeneğini açarken şifre gerekir';

  @override
  String get authPasswordRequiredForAccount => 'Bu hesap için şifre gerekir';
}

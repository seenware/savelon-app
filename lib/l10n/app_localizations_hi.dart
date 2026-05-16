// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'एन्क्रिप्टेड संपर्क';

  @override
  String get navContacts => 'संपर्क';

  @override
  String get navDuplicates => 'डुप्लिकेट';

  @override
  String get navSupport => 'सहायता';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get languageSystemDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get duplicatesTitle => 'डुप्लिकेट';

  @override
  String get supportTitle => 'सहायता';

  @override
  String get search => 'खोज';

  @override
  String get commonCancel => 'रद्द करना';

  @override
  String get commonDelete => 'मिटाना';

  @override
  String get commonSave => 'सहेजें';

  @override
  String get commonEdit => 'संपादन करना';

  @override
  String get commonMerge => 'मर्ज';

  @override
  String get commonSkip => 'छोडना';

  @override
  String get commonRetry => 'पुन: प्रयास करें';

  @override
  String get commonClose => 'बंद करना';

  @override
  String get commonNext => 'अगला';

  @override
  String get commonBack => 'वापस जाओ';

  @override
  String get commonYes => 'हाँ';

  @override
  String get commonNo => 'नहीं';

  @override
  String get commonContinue => 'जारी रखना';

  @override
  String get commonTryAgain => 'पुनः प्रयास करें';

  @override
  String get commonApply => 'लागू करें';

  @override
  String get commonDiscard => 'खारिज करना';

  @override
  String get commonUnlock => 'अनलॉक';

  @override
  String get commonLoading => 'लोड हो रहा है...';

  @override
  String commonErrorWithDetails(String error) {
    return 'त्रुटि: $error';
  }

  @override
  String get brandSlogan => 'आपके संपर्क। केवल आपके।';

  @override
  String get contactNotFound => 'संपर्क नहीं मिला';

  @override
  String get contactDeleted => 'संपर्क हटा दिया गया';

  @override
  String get contactUpdated => 'संपर्क अपडेट किया गया';

  @override
  String get contactSaved => 'संपर्क सहेजा गया';

  @override
  String get contactsMerged => 'संपर्क विलीन हो गए';

  @override
  String get deleteContactTitle => 'संपर्क हटाएँ';

  @override
  String deleteContactConfirm(String name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'क्या आप वाकई \"$name\" को हटाना चाहते हैं?';
  }

  @override
  String failedToDelete(String error) {
    return 'हटाने में विफल: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'अद्यतन करने में विफल: $error';
  }

  @override
  String failedToSave(String error) {
    return 'सहेजने में विफल: $error';
  }

  @override
  String get noName => 'कोई नाम नहीं';

  @override
  String get noNameTitle => 'कोई नाम नहीं';

  @override
  String get noNameBody => 'इस संपर्क का कोई नाम नहीं है। फिर भी सहेजें?';

  @override
  String get discardChangesTitle => 'परिवर्तनों को निरस्त करें?';

  @override
  String get discardChangesBody =>
      'आपके पास सहेजे न गए परिवर्तन हैं जो खो जाएंगे.';

  @override
  String get newContact => 'नया संपर्क';

  @override
  String get editContact => 'संपर्क संपादित करें';

  @override
  String get addMore => 'अधिक जोड़ें';

  @override
  String get addNameFieldsTitle => 'नाम फ़ील्ड जोड़ें';

  @override
  String get call => 'कॉल करें';

  @override
  String get sendEmail => 'ईमेल भेजें';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get visit => 'देखें';

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get importContacts => 'संपर्क आयात करें';

  @override
  String get importing => 'आयात किया जा रहा है...';

  @override
  String importedCount(int count) {
    return 'आयातित $count संपर्क';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'आयातित $imported संपर्क, $skipped छोड़ दिया गया';
  }

  @override
  String get failedToImportContacts => 'संपर्क आयात करने में विफल';

  @override
  String get noContactsToImport => 'आयात करने के लिए कोई संपर्क नहीं हैं.';

  @override
  String get contactsPermissionRequiredImport =>
      'संपर्कों को आयात करने के लिए संपर्क अनुमति आवश्यक है';

  @override
  String get importDialogTitle => 'संपर्क आयात करें';

  @override
  String get importDialogBody => 'अपने डिवाइस या फ़ाइल से संपर्क आयात करें?';

  @override
  String get importSourceTitle => 'आयात';

  @override
  String get importZipPasswordTitle => 'आर्काइव पासवर्ड';

  @override
  String get importZipPasswordChecking => 'जांच हो रही है...';

  @override
  String get exportContacts => 'संपर्क निर्यात करें';

  @override
  String get unlockPro => 'Pro अनलॉक करें';

  @override
  String get exportContactsTitle => 'संपर्क निर्यात करें';

  @override
  String get exportSubtitle =>
      'चुनें कि आप अपने संपर्कों को कैसे सहेजना चाहते हैं.';

  @override
  String get exportFormatVcfTitle => '.vcf के रूप में सहेजें';

  @override
  String get exportFormatVcfSubtitle =>
      'एक फ़ाइल जो Apple संपर्क, Google संपर्क और बहुत कुछ के साथ काम करती है।';

  @override
  String get exportFormatZipTitle => 'पासवर्ड से सुरक्षित संग्रह में सहेजें';

  @override
  String get exportFormatZipSubtitle =>
      'एक .zip जिसके अंदर आपका .vcf है - इसे खोलने के लिए एक पासवर्ड की आवश्यकता होती है।';

  @override
  String get exportProtectedTitle => 'संरक्षित निर्यात';

  @override
  String get exportCompleteTitle => 'निर्यात पूर्ण';

  @override
  String get stillLoadingContacts =>
      'अभी भी संपर्क लोड हो रहे हैं. कृपया प्रतीक्षा करें।';

  @override
  String get couldNotLoadContacts => 'संपर्क लोड नहीं किये जा सके.';

  @override
  String get passwordChangedSuccess => 'पासवर्ड सफलतापूर्वक बदला गया';

  @override
  String get passwordProtectionEnabled =>
      'पासवर्ड सुरक्षा सफलतापूर्वक सक्षम की गई';

  @override
  String get passwordProtectionRemoved =>
      'पासवर्ड सुरक्षा सफलतापूर्वक हटा दी गई';

  @override
  String get removePasswordProtectionButton => 'पासवर्ड सुरक्षा हटाएँ';

  @override
  String get changePasswordTitle => 'पासवर्ड बदलें';

  @override
  String get setPasswordTitle => 'पासवर्ड सेट करें';

  @override
  String get passwordSettingsChangeTitle => 'पासवर्ड बदलें';

  @override
  String get passwordSettingsSetTitle => 'पासवर्ड सेट करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'गोपनीयता नीति खोलने में विफल: $error';
  }

  @override
  String get resetAppTitle => 'ऐप रीसेट करें';

  @override
  String get resetAppConfirmTitle => 'सभी संपर्क हटाएं, और ऐप रीसेट करें?';

  @override
  String get resetAppCannotUndo => 'इसे पूर्ववत नहीं किया जा सकता';

  @override
  String resetAppError(String error) {
    return 'ऐप रीसेट करने में त्रुटि: $error';
  }

  @override
  String get photoPickerNewImage => 'नई छवि चुनें';

  @override
  String get photoPickerRemoveImage => 'छवि हटाएँ';

  @override
  String get onboardingHeadline1 => 'आपके संपर्कों तक कौन पहुंच सकता है?';

  @override
  String get onboardingSubline1 =>
      'कुछ ऐप्स उन्हें क्लाउड पर अपलोड करते हैं। इससे अधिक गोपनीयता जोखिम पैदा हो सकता है.';

  @override
  String get onboardingHeadline2 => 'कई ऐप्स संपर्क पहुंच मांगते हैं';

  @override
  String get onboardingSubline2 =>
      'यह उपयोगी हो सकता है - लेकिन महत्वपूर्ण संपर्क निजी रहने चाहिए।';

  @override
  String get onboardingHeadline3 => 'संवेदनशील संपर्कों को अलग रखें';

  @override
  String get onboardingSubline3 =>
      'हम महत्वपूर्ण और शायद ही कभी उपयोग किए जाने वाले संपर्कों को आपके मुख्य संपर्क ऐप के बाहर संग्रहीत करने की सलाह देते हैं।';

  @override
  String get onboardingHeadline4 => 'अपने महत्वपूर्ण संपर्कों को सुरक्षित रखें';

  @override
  String get onboardingSubline4 =>
      'Savelon उन्हें आपके डिवाइस पर एन्क्रिप्टेड और अन्य ऐप्स से निजी रूप से संग्रहीत करता है।';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get onboardingNext => 'अगला';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'ओपन सोर्स';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink => 'कोई भी हमारा कोड ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => ' पर देख सकता है।';

  @override
  String get onboardingBenefitsPrivateTitle => 'निजी';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'हम भी आपके संपर्क नहीं देख सकते';

  @override
  String get onboardingBenefitsSandboxTitle => 'अन्य ऐप अंदर नहीं देख सकते';

  @override
  String get onboardingBenefitsOfflineTitle => 'ऑफ़लाइन';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'आपको क्लाउड, डेटा दलालों और निगरानी प्रणालियों से दूर रखता है';

  @override
  String get activateDemoTitle => 'डेमो सक्रिय करें';

  @override
  String get activateDemoCancel => 'रद्द करना';

  @override
  String demoAccessGranted(String dateTime) {
    return 'अब आपके पास $dateTime तक डेमो एक्सेस है';
  }

  @override
  String get setupPasswordTitle => 'पासवर्ड सुरक्षा जोड़ें';

  @override
  String get setupPasswordMismatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get setupPasswordFailedSeed =>
      'बीज उत्पन्न करने में विफल. कृपया पुन: प्रयास करें।';

  @override
  String setupPasswordFailedInit(String error) {
    return 'प्रारंभ करने में विफल. त्रुटि: $error';
  }

  @override
  String get setupPasswordInfo =>
      'आपके संपर्क अभी भी केवल आपके डिवाइस पर संग्रहीत एक लंबी गुप्त कुंजी द्वारा दृढ़ता से एन्क्रिप्ट किए जाएंगे। लेकिन पासवर्ड अतिरिक्त सुरक्षा जोड़ता है।';

  @override
  String get setupPasswordLabel => 'पासवर्ड';

  @override
  String get setupPasswordConfirmLabel => 'पासवर्ड की पुष्टि कीजिये';

  @override
  String get setupPasswordWarning =>
      'यह पासवर्ड पुनर्प्राप्त नहीं किया जा सकता. इसे लिख लें और सुरक्षित रखें!';

  @override
  String get setupPasswordPageTitle => 'पासवर्ड बनाएं';

  @override
  String get setupPasswordNext => 'अगला';

  @override
  String get setupPasswordSkip => 'छोडना';

  @override
  String get setupCreateVaultTitle => 'अपना वॉल्ट बनाएं';

  @override
  String get setupCreateVaultSubtitle =>
      'केवल आपके डिवाइस पर संग्रहीत। एन्क्रिप्टेड और निजी।';

  @override
  String get setupDefaultVaultName => 'मेरा वॉल्ट';

  @override
  String setupRandomVaultName(String number) {
    return 'वॉल्ट$number';
  }

  @override
  String get setupCropPhotoTitle => 'फोटो क्रॉप करें';

  @override
  String get setupProtectionTitle => 'सुरक्षा';

  @override
  String get setupEncryption256Label => '256-बिट एन्क्रिप्शन';

  @override
  String get setupRequirePasswordLabel => 'पासवर्ड आवश्यक';

  @override
  String get setupCreateVaultButton => 'वॉल्ट बनाएं';

  @override
  String get setupCreatingVaultTitle => 'आपका वॉल्ट बनाया जा रहा है';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'आपकी कुंजी बनाई जा रही है';

  @override
  String get setupEncryptingDataLabel => 'आपका डेटा एन्क्रिप्ट किया जा रहा है';

  @override
  String get setupCheckingSecurityLabel => 'सुरक्षा जाँची जा रही है';

  @override
  String get setupCreatingVaultError =>
      'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get setupVaultCreatedTitle => 'वॉल्ट बन गया';

  @override
  String get setupVaultCreatedSubtitle =>
      'आपका वॉल्ट तैयार है। यह एन्क्रिप्टेड और सुरक्षित है।';

  @override
  String get setupOpenVaultButton => 'वॉल्ट खोलें';

  @override
  String get setupSavedSecretKeyCheckbox =>
      'मैंने अपनी गुप्त कुंजी सुरक्षित रखी है';

  @override
  String get setupContinue => 'जारी रखें';

  @override
  String get setupAddPasswordPageTitle => 'पासवर्ड जोड़ें';

  @override
  String get setupSavePasswordButton => 'पासवर्ड सहेजें';

  @override
  String get confirmationCheckboxTitle =>
      'मैं समझता हूं कि मेरा पासवर्ड पुनर्प्राप्त नहीं किया जा सकता';

  @override
  String get loginWelcomeBack => 'वापसी पर स्वागत है';

  @override
  String get loginPasswordLabel => 'पासवर्ड';

  @override
  String get loginUnlock => 'अनलॉक';

  @override
  String get loginPasswordRequired => 'अपना पासवर्ड दर्ज करें';

  @override
  String get loginIncorrectPassword => 'गलत पासवर्ड। कृपया पुन: प्रयास करें।';

  @override
  String get paywallNoSubscription =>
      'कोई सक्रिय सदस्यता नहीं मिली. कृपया जारी रखने के लिए खरीदारी करें.';

  @override
  String get lifetimeThanksTitle => 'हमारे साथ बने रहने के लिए धन्यवाद';

  @override
  String get lifetimeThanksSubtitle =>
      'हम आपको लाइफटाइम Pro एक्सेस उपहार में दे रहे हैं';

  @override
  String get lifetimeThanksGift => 'उपहार';

  @override
  String get lifetimeThanksCta => 'लाइफटाइम एक्सेस प्राप्त करें';

  @override
  String get paywallNoInternetTitle => 'कोई इंटरनेट कनेक्शन नहीं';

  @override
  String get paywallNoInternetBody =>
      'पहली बार ऐप तक पहुंचने के लिए इंटरनेट कनेक्शन की आवश्यकता होती है। कृपया कनेक्ट करें और पुनः प्रयास करें.';

  @override
  String get paywallStoreUnavailableTitle => 'स्टोर अनुपलब्ध';

  @override
  String get paywallStoreUnavailableBody =>
      'सदस्यता विकल्प लोड करने में असमर्थ. कृपया पुन: प्रयास करें।';

  @override
  String get subscriptionVerifyTitle => 'सदस्यता सत्यापित करें';

  @override
  String get subscriptionSoftWarningTitle => 'सदस्यता सत्यापन की आवश्यकता है';

  @override
  String get subscriptionContinueAnyway => 'फिर भी जारी रखें';

  @override
  String subscriptionLastVerified(String date) {
    return 'अंतिम बार सत्यापित $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'सदस्यता को ऑनलाइन सत्यापित नहीं किया जा सका.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'आपकी पहुंच $date तक जारी रहेगी - सत्यापित करने के लिए उससे पहले कनेक्ट करें।';
  }

  @override
  String get subscriptionConnectToVerify =>
      'अपनी सदस्यता सत्यापित करने के लिए इंटरनेट से कनेक्ट करें।';

  @override
  String get duplicatesNoDuplicates => 'कोई संभावित डुप्लिकेट नहीं मिला';

  @override
  String get duplicatesSkippedShownAgain =>
      'छोड़े गए डुप्लिकेट फिर से दिखाए जाते हैं।';

  @override
  String get duplicatesShowSkippedTooltip =>
      'छोड़े गए डुप्लिकेट समूहों को फिर से दिखाएं';

  @override
  String duplicatesFailedToLoad(String error) {
    return 'डुप्लिकेट समूह लोड करने में विफल: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count डुप्लिकेट';
  }

  @override
  String get duplicatesSubtitlePlaceholder => 'विवरण देखने के लिए टैप करें';

  @override
  String get duplicatesConflictMostlyIdentical => 'अधिकतर समान';

  @override
  String duplicatesConflictFieldVariants(String field, int count) {
    return '$field: $count वेरिएंट';
  }

  @override
  String get fieldLabelName => 'नाम';

  @override
  String get fieldLabelCompany => 'कंपनी';

  @override
  String get fieldLabelPhone => 'फ़ोन';

  @override
  String get fieldLabelEmail => 'ईमेल';

  @override
  String get importErrorUnsupportedSource => 'यहां आयात उपलब्ध नहीं है.';

  @override
  String get importErrorPermissionDenied =>
      'संपर्कों को आयात करने के लिए संपर्क अनुमति आवश्यक है.';

  @override
  String get importErrorNoContacts => 'आयात करने के लिए कोई संपर्क नहीं हैं.';

  @override
  String get importErrorUnsupportedFileType =>
      'कृपया एक .vcf फ़ाइल या एक .zip संग्रह चुनें।';

  @override
  String get importErrorInvalidFile => 'चयनित फ़ाइल अमान्य या अपठनीय है.';

  @override
  String get importErrorWrongPassword =>
      'ग़लत संग्रह पासवर्ड. कृपया पुन: प्रयास करें।';

  @override
  String get importErrorNoVcfInArchive =>
      'चयनित संग्रह में कोई .vcf फ़ाइलें नहीं मिलीं।';

  @override
  String importErrorFailed(String detail) {
    return 'संपर्क आयात करने में विफल: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'संपर्क अभी तक उपलब्ध नहीं हैं.';

  @override
  String get exportErrorNoContacts => 'निर्यात करने के लिए कोई संपर्क नहीं.';

  @override
  String get exportErrorPasswordRequired =>
      'संरक्षित निर्यात के लिए पासवर्ड आवश्यक है।';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'संरक्षित निर्यात के लिए कम से कम $min वर्णों का पासवर्ड आवश्यक है।';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'निर्यात विफल: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'डाउनलोड प्रारंभ हुआ.';

  @override
  String get exportNoticeFileSaved => 'फ़ाइल सफलतापूर्वक सहेजी गई.';

  @override
  String get phoneTypeMobile => 'मोबाइल';

  @override
  String get phoneTypeHome => 'घर';

  @override
  String get phoneTypeWork => 'काम';

  @override
  String get phoneTypeSchool => 'विद्यालय';

  @override
  String get phoneTypeOther => 'अन्य';

  @override
  String get emailTypePersonal => 'निजी';

  @override
  String get emailTypeWork => 'काम';

  @override
  String get emailTypeSchool => 'विद्यालय';

  @override
  String get emailTypeOther => 'अन्य';

  @override
  String get addressTypeHome => 'घर';

  @override
  String get addressTypeWork => 'काम';

  @override
  String get addressTypeSchool => 'विद्यालय';

  @override
  String get addressTypeBirth => 'जन्म';

  @override
  String get linkTypeWebsite => 'वेबसाइट';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'अन्य';

  @override
  String get dateTypeCreated => 'बनाया था';

  @override
  String get dateTypeBirthday => 'जन्मदिन';

  @override
  String get dateTypeMet => 'मिले';

  @override
  String get dateTypeGraduation => 'स्नातक';

  @override
  String get dateTypeMarriage => 'शादी';

  @override
  String get dateTypeOther => 'अन्य';

  @override
  String get noNameInList => '(कोई नाम नहीं)';

  @override
  String get formAddPhone => 'फ़ोन जोड़ें';

  @override
  String get formAddEmail => 'ईमेल जोड़ें';

  @override
  String get formAddAddress => 'पता जोड़ें';

  @override
  String get formAddLink => 'लिंक जोड़ें';

  @override
  String get formAddDate => 'दिनांक जोड़ें';

  @override
  String get formHintPhoneNumber => 'फ़ोन नंबर';

  @override
  String get formHintEmail => 'ईमेल';

  @override
  String get formHintUrl => 'यूआरएल';

  @override
  String get formHintAddress => 'पता';

  @override
  String get formHintSelectDate => 'तारीख़ चुनें';

  @override
  String get formHintNotes => 'नोट्स जोड़ें';

  @override
  String get formCompany => 'कंपनी';

  @override
  String get formDepartment => 'विभाग';

  @override
  String get formJobTitle => 'नौकरी का शीर्षक';

  @override
  String get formPrefix => 'उपसर्ग';

  @override
  String get formFirstName => 'पहला नाम';

  @override
  String get formMiddleName => 'मध्य नाम';

  @override
  String get formLastName => 'अंतिम नाम';

  @override
  String get formSuffix => 'प्रत्यय';

  @override
  String get formNickname => 'उपनाम';

  @override
  String get contactsListTitle => 'संपर्क';

  @override
  String get contactsListEmpty => 'अभी तक कोई संपर्क नहीं';

  @override
  String get contactsImportButton => 'संपर्क आयात करें';

  @override
  String get mergeContactsTitle => 'संपर्क मर्ज करें';

  @override
  String get mergeContactsSubtitle =>
      'एक में विलय करने के लिए संपर्कों का चयन करें';

  @override
  String get exportPasswordHint => 'पासवर्ड';

  @override
  String get exportPasswordConfirmHint => 'पासवर्ड की पुष्टि कीजिये';

  @override
  String exportPasswordHelper(int min) {
    return 'कम से कम $min अक्षर';
  }

  @override
  String get zipPasswordHint => 'पुरालेख पासवर्ड';

  @override
  String get activateDemoAccessCodeLabel => 'एक्सेस कोड';

  @override
  String get subscriptionExpiredTitle => 'सदस्यता समाप्त हो गई';

  @override
  String get subscriptionExpiredBody =>
      'सभी सुविधाओं का उपयोग जारी रखने के लिए नवीनीकृत करें।';

  @override
  String get contactsLoadError => 'संपर्क लोड नहीं किये जा सके.';

  @override
  String get contactsListError => 'संपर्क लोड नहीं किये जा सके.';

  @override
  String get contactsSearchNoResults => 'कोई संपर्क नहीं मिला';

  @override
  String get supportPageIntro =>
      'प्रश्न, प्रतिक्रिया या कुछ काम नहीं कर रहा? Savelon टीम हर संदेश पढ़ती है।';

  @override
  String get supportCtaMessageTeam => 'टीम को संदेश भेजें';

  @override
  String get importFromDeviceContacts => 'आपके संपर्कों से';

  @override
  String get importFromFileVcfZip => 'फ़ाइल से (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'अद्वितीय पासवर्ड बनाएँ';

  @override
  String get exportPasswordIrrecoverableHint =>
      'इस पासवर्ड को पुनर्प्राप्त नहीं किया जा सकता।';

  @override
  String get exportProtectedArchiveCta => 'संरक्षित संग्रह निर्यात करें';

  @override
  String get exportIosSavedFileWarning =>
      'यह फ़ाइल Savelon फ़ोल्डर में सहेजी जाती है। यदि आप ऐप हटाते हैं तो फ़ाइल भी हट जाएगी। इसे रखने के लिए कहीं और ले जाएँ।';

  @override
  String importContactsConfirmBody(int count) {
    return 'Savelon में $count संपर्क आयात करें?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'पासवर्ड सेट करें';

  @override
  String get settingsChangePasswordPageTitle => 'पासवर्ड बदलें';

  @override
  String get settingsRemovePasswordPageTitle => 'पासवर्ड हटाएँ';

  @override
  String get settingsNewPasswordLabel => 'नया पासवर्ड';

  @override
  String get settingsConfirmNewPasswordLabel => 'नया पासवर्ड पुष्टि करें';

  @override
  String get settingsReenterNewPasswordHelper => 'नया पासवर्ड फिर से दर्ज करें';

  @override
  String get settingsSetPasswordCta => 'पासवर्ड सेट करें';

  @override
  String get settingsChangePasswordCta => 'पासवर्ड बदलें';

  @override
  String get settingsRemovePasswordCta => 'पासवर्ड हटाएँ';

  @override
  String get settingsCurrentPasswordLabel => 'वर्तमान पासवर्ड';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'अपना वर्तमान पासवर्ड दर्ज करें';

  @override
  String get settingsNewPasswordMustDiffer =>
      'नया पासवर्ड वर्तमान से अलग होना चाहिए';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'पासवर्ड सेट नहीं हो सका: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'पासवर्ड बदला नहीं जा सका: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'पासवर्ड हटाया नहीं जा सका: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'पासवर्ड अमान्य है';

  @override
  String get settingsCurrentPasswordIncorrect => 'वर्तमान पासवर्ड गलत है';

  @override
  String get settingsCurrentPasswordRequired => 'वर्तमान पासवर्ड आवश्यक है';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'जब पासवर्ड सुरक्षा चालू हो तो पासवर्ड आवश्यक है';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'पासवर्ड विकल्प चालू करते समय पासवर्ड आवश्यक है';

  @override
  String get authPasswordRequiredForAccount =>
      'इस खाते के लिए पासवर्ड आवश्यक है';

  @override
  String get loginLoggedInSecurely => 'सुरक्षित रूप से लॉग इन किया गया';
}

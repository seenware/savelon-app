// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'এনক্রিপ্ট করা পরিচিতি';

  @override
  String get navContacts => 'পরিচিতি';

  @override
  String get navOrganize => 'সংগঠিত করুন';

  @override
  String get navSupport => 'সহায়তা';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSystemDefault => 'সিস্টেম ডিফল্ট';

  @override
  String get organizeTitle => 'সংগঠিত করুন';

  @override
  String get supportTitle => 'সহায়তা';

  @override
  String get search => 'অনুসন্ধান করুন';

  @override
  String get commonCancel => 'বাতিল করুন';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonSave => 'সংরক্ষণ করুন';

  @override
  String get commonEdit => 'সম্পাদনা করুন';

  @override
  String get commonMerge => 'একত্রিত করুন';

  @override
  String get commonSkip => 'এড়িয়ে যান';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonClose => 'বন্ধ';

  @override
  String get commonNext => 'পরবর্তী';

  @override
  String get commonBack => 'ফিরে যান';

  @override
  String get commonYes => 'হ্যাঁ';

  @override
  String get commonNo => 'না';

  @override
  String get commonContinue => 'চালিয়ে যান';

  @override
  String get commonTryAgain => 'আবার চেষ্টা করুন';

  @override
  String get commonApply => 'প্রয়োগ করুন';

  @override
  String get commonDiscard => 'বাতিল করুন';

  @override
  String get commonUnlock => 'আনলক করুন';

  @override
  String get commonLoading => 'লোড হচ্ছে...';

  @override
  String commonErrorWithDetails(String error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get brandSlogan => 'আপনার পরিচিতি। শুধু আপনার।';

  @override
  String get contactNotFound => 'পরিচিতি পাওয়া যায়নি';

  @override
  String get contactDeleted => 'পরিচিতি মুছে ফেলা হয়েছে';

  @override
  String get contactUpdated => 'পরিচিতি আপডেট করা হয়েছে';

  @override
  String get contactSaved => 'পরিচিতি সংরক্ষিত';

  @override
  String get contactsMerged => 'পরিচিতি একত্রিত হয়েছে৷';

  @override
  String get deleteContactTitle => 'পরিচিতি মুছুন';

  @override
  String deleteContactConfirm(String name) {
    return 'আপনি কি $name মুছতে চান?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'আপনি কি \"$name\" মুছতে চান?';
  }

  @override
  String failedToDelete(String error) {
    return 'মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String failedToSave(String error) {
    return 'সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get noName => 'নাম নেই';

  @override
  String get noNameTitle => 'নাম নেই';

  @override
  String get noNameBody => 'এই পরিচিতির কোন নাম নেই। যাইহোক সংরক্ষণ করবেন?';

  @override
  String get discardChangesTitle => 'পরিবর্তনগুলি বাতিল করবেন?';

  @override
  String get discardChangesBody => 'আপনার অসংরক্ষিত পরিবর্তনগুলি হারিয়ে যাবে৷';

  @override
  String get newContact => 'নতুন পরিচিতি';

  @override
  String get editContact => 'পরিচিতি সম্পাদনা করুন';

  @override
  String get addMore => 'আরো যোগ করুন';

  @override
  String get addNameFieldsTitle => 'নাম ক্ষেত্র যোগ করুন';

  @override
  String get call => 'কল';

  @override
  String get sendEmail => 'ইমেইল পাঠান';

  @override
  String get copy => 'কপি';

  @override
  String get visit => 'ভিজিট করুন';

  @override
  String get copiedToClipboard => 'ক্লিপবোর্ডে কপি করা হয়েছে';

  @override
  String get importContacts => 'পরিচিতি আমদানি করুন';

  @override
  String get importing => 'আমদানি করা হচ্ছে...';

  @override
  String importedCount(int count) {
    return 'আমদানি করা $count পরিচিতি';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'আমদানি করা $imported পরিচিতি, $skipped বাদ দেওয়া হয়েছে৷';
  }

  @override
  String get failedToImportContacts => 'পরিচিতি আমদানি করতে ব্যর্থ হয়েছে৷';

  @override
  String get noContactsToImport => 'আমদানি করার জন্য কোনো পরিচিতি নেই৷';

  @override
  String get contactsPermissionRequiredImport =>
      'পরিচিতি আমদানি করতে পরিচিতির অনুমতি প্রয়োজন৷';

  @override
  String get importDialogTitle => 'পরিচিতি আমদানি করুন';

  @override
  String get importDialogBody =>
      'আপনার ডিভাইস বা একটি ফাইল থেকে পরিচিতি আমদানি করবেন?';

  @override
  String get importSourceTitle => 'আমদানি';

  @override
  String get importZipPasswordTitle => 'সংরক্ষণাগার পাসওয়ার্ড';

  @override
  String get importZipPasswordChecking => 'যাচাই করা হচ্ছে...';

  @override
  String get exportContacts => 'পরিচিতি রপ্তানি করুন';

  @override
  String get unlockPro => 'Pro আনলক করুন';

  @override
  String get exportContactsTitle => 'পরিচিতি রপ্তানি করুন';

  @override
  String get exportSubtitle =>
      'আপনি কীভাবে আপনার পরিচিতিগুলি সংরক্ষণ করতে চান তা চয়ন করুন৷';

  @override
  String get exportFormatVcfTitle => '.vcf হিসাবে সংরক্ষণ করুন';

  @override
  String get exportFormatVcfSubtitle =>
      'একটি ফাইল যা Apple পরিচিতি, Google পরিচিতি এবং আরও অনেক কিছুর সাথে কাজ করে৷';

  @override
  String get exportFormatZipTitle =>
      'পাসওয়ার্ড-সুরক্ষিত আর্কাইভে সংরক্ষণ করুন';

  @override
  String get exportFormatZipSubtitle =>
      'ভিতরে আপনার .vcf সহ একটি .zip — এটি খুলতে একটি পাসওয়ার্ড প্রয়োজন৷';

  @override
  String get exportProtectedTitle => 'সুরক্ষিত রপ্তানি';

  @override
  String get exportCompleteTitle => 'রপ্তানি সম্পূর্ণ';

  @override
  String get stillLoadingContacts =>
      'এখনও পরিচিতি লোড হচ্ছে৷ অনুগ্রহ করে অপেক্ষা করুন।';

  @override
  String get couldNotLoadContacts => 'পরিচিতি লোড করা যায়নি।';

  @override
  String get passwordChangedSuccess => 'পাসওয়ার্ড সফলভাবে পরিবর্তন করা হয়েছে';

  @override
  String get passwordProtectionEnabled =>
      'পাসওয়ার্ড সুরক্ষা সফলভাবে সক্ষম হয়েছে৷';

  @override
  String get passwordProtectionRemoved =>
      'পাসওয়ার্ড সুরক্ষা সফলভাবে সরানো হয়েছে';

  @override
  String get removePasswordProtectionButton => 'পাসওয়ার্ড সুরক্ষা সরান';

  @override
  String get changePasswordTitle => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get setPasswordTitle => 'পাসওয়ার্ড সেট করুন';

  @override
  String get passwordSettingsChangeTitle => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get passwordSettingsSetTitle => 'পাসওয়ার্ড সেট করুন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'গোপনীয়তা নীতি খুলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get resetAppTitle => 'অ্যাপটি রিসেট করুন';

  @override
  String get resetAppConfirmTitle =>
      'সমস্ত পরিচিতি মুছে ফেলবেন, এবং অ্যাপ রিসেট করবেন?';

  @override
  String get resetAppCannotUndo => 'এটি পূর্বাবস্থায় ফেরানো যাবে না';

  @override
  String resetAppError(String error) {
    return 'অ্যাপ রিসেট করার সময় ত্রুটি: $error';
  }

  @override
  String get photoPickerNewImage => 'নতুন ছবি নির্বাচন করুন';

  @override
  String get photoPickerRemoveImage => 'ছবি সরান';

  @override
  String get onboardingHeadline1 => 'কে আপনার পরিচিতি অ্যাক্সেস করতে পারে?';

  @override
  String get onboardingSubline1 =>
      'কিছু অ্যাপ ক্লাউডে আপলোড করে। এটি আরও গোপনীয়তার ঝুঁকি তৈরি করতে পারে।';

  @override
  String get onboardingHeadline2 =>
      'অনেক অ্যাপ পরিচিতি অ্যাক্সেসের অনুমতি চায়';

  @override
  String get onboardingSubline2 =>
      'এটি দরকারী হতে পারে - তবে গুরুত্বপূর্ণ পরিচিতিগুলি ব্যক্তিগত থাকা উচিত৷';

  @override
  String get onboardingHeadline3 => 'সংবেদনশীল পরিচিতি আলাদা রাখুন';

  @override
  String get onboardingSubline3 =>
      'আমরা আপনার প্রধান পরিচিতি অ্যাপের বাইরে গুরুত্বপূর্ণ এবং খুব কমই ব্যবহৃত পরিচিতিগুলি সংরক্ষণ করার পরামর্শ দিই।';

  @override
  String get onboardingHeadline4 => 'আপনার গুরুত্বপূর্ণ পরিচিতি রক্ষা করুন';

  @override
  String get onboardingSubline4 =>
      'Savelon সেগুলিকে আপনার ডিভাইসে সঞ্চয় করে, এনক্রিপ্ট করা এবং অন্যান্য অ্যাপ থেকে ব্যক্তিগত।';

  @override
  String get onboardingGetStarted => 'শুরু করুন';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'ওপেন সোর্স';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'যে কেউ আমাদের কোড দেখতে পারেন ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => '।';

  @override
  String get onboardingBenefitsPrivateTitle => 'ব্যক্তিগত';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'আমরাও আপনার পরিচিতিগুলি দেখতে পারি না';

  @override
  String get onboardingBenefitsSandboxTitle =>
      'অন্যান্য অ্যাপ ভেতরে দেখতে পারে না';

  @override
  String get onboardingBenefitsOfflineTitle => 'অফলাইন';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'ক্লাউড, ডেটা ব্রোকার ও নজরদারি সিস্টেম থেকে আপনাকে দূরে রাখে';

  @override
  String get activateDemoTitle => 'ডেমো সক্রিয় করুন';

  @override
  String get activateDemoCancel => 'বাতিল করুন';

  @override
  String demoAccessGranted(String dateTime) {
    return 'আপনার কাছে এখন $dateTime পর্যন্ত ডেমো অ্যাক্সেস আছে';
  }

  @override
  String get setupPasswordTitle => 'পাসওয়ার্ড সুরক্ষা যোগ করুন';

  @override
  String get setupPasswordMismatch => 'পাসওয়ার্ড মেলে না';

  @override
  String get setupPasswordFailedSeed =>
      'বীজ উৎপন্ন করতে ব্যর্থ। আবার চেষ্টা করুন.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'আরম্ভ করতে ব্যর্থ হয়েছে. ত্রুটি: $error';
  }

  @override
  String get setupPasswordInfo =>
      'আপনার পরিচিতিগুলি এখনও একটি দীর্ঘ গোপন কী দ্বারা দৃঢ়ভাবে এনক্রিপ্ট করা হবে, শুধুমাত্র আপনার ডিভাইসে সংরক্ষিত। কিন্তু পাসওয়ার্ড অতিরিক্ত সুরক্ষা যোগ করে।';

  @override
  String get setupPasswordLabel => 'পাসওয়ার্ড';

  @override
  String get setupPasswordConfirmLabel => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get setupPasswordWarning =>
      'এই পাসওয়ার্ড পুনরুদ্ধার করা যাবে না. এটি লিখুন এবং এটি নিরাপদ রাখুন!';

  @override
  String get setupPasswordPageTitle => 'পাসওয়ার্ড তৈরি করুন';

  @override
  String get setupPasswordNext => 'পরবর্তী';

  @override
  String get setupPasswordSkip => 'এড়িয়ে যান';

  @override
  String get setupCreateVaultTitle => 'আপনার ভল্ট তৈরি করুন';

  @override
  String get setupCreateVaultSubtitle =>
      'শুধু আপনার ডিভাইসে সংরক্ষিত। এনক্রিপ্টেড ও ব্যক্তিগত।';

  @override
  String get setupDefaultVaultName => 'আমার ভল্ট';

  @override
  String setupRandomVaultName(String number) {
    return 'ভল্ট$number';
  }

  @override
  String get setupCropPhotoTitle => 'ছবি ক্রপ করুন';

  @override
  String get setupProtectionTitle => 'সুরক্ষা';

  @override
  String get setupEncryption256Label => '২৫৬-বিট এনক্রিপশন';

  @override
  String get setupRequirePasswordLabel => 'পাসওয়ার্ড প্রয়োজন';

  @override
  String get setupOptionalSuffix => 'ঐচ্ছিক';

  @override
  String get setupCreateVaultButton => 'ভল্ট তৈরি করুন';

  @override
  String get setupCreatingVaultTitle => 'আপনার ভল্ট তৈরি হচ্ছে';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'আপনার কী তৈরি হচ্ছে';

  @override
  String get setupEncryptingDataLabel => 'আপনার ডেটা এনক্রিপ্ট করা হচ্ছে';

  @override
  String get setupCheckingSecurityLabel => 'নিরাপত্তা যাচাই করা হচ্ছে';

  @override
  String get setupCreatingVaultError => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get setupVaultCreatedTitle => 'ভল্ট তৈরি হয়েছে';

  @override
  String get setupVaultCreatedSubtitle =>
      'আপনার ভল্ট প্রস্তুত। এটি এনক্রিপ্টেড ও নিরাপদ।';

  @override
  String get setupOpenVaultButton => 'ভল্ট খুলুন';

  @override
  String get setupSavedSecretKeyCheckbox => 'আমি আমার গোপন চাবি নিরাপদে রেখেছি';

  @override
  String get setupContinue => 'চালিয়ে যান';

  @override
  String get setupAddPasswordPageTitle => 'পাসওয়ার্ড যোগ করুন';

  @override
  String get setupSavePasswordButton => 'পাসওয়ার্ড সংরক্ষণ করুন';

  @override
  String get confirmationCheckboxTitle =>
      'আমি বুঝি আমার পাসওয়ার্ড পুনরুদ্ধার করা যাবে না';

  @override
  String get loginWelcomeBack => 'ফিরে স্বাগতম';

  @override
  String get loginPasswordLabel => 'পাসওয়ার্ড';

  @override
  String get loginUnlock => 'আনলক করুন';

  @override
  String get loginPasswordRequired => 'আপনার পাসওয়ার্ড লিখুন';

  @override
  String get loginIncorrectPassword => 'ভুল পাসওয়ার্ড। আবার চেষ্টা করুন.';

  @override
  String get paywallNoSubscription =>
      'কোনো সক্রিয় সাবস্ক্রিপশন পাওয়া যায়নি। চালিয়ে যেতে ক্রয় করুন।';

  @override
  String get lifetimeThanksTitle => 'আমাদের সঙ্গে থাকার জন্য ধন্যবাদ';

  @override
  String get lifetimeThanksSubtitle =>
      'আমরা আপনাকে লাইফটাইম Pro অ্যাক্সেস উপহার দিচ্ছি';

  @override
  String get lifetimeThanksGift => 'উপহার';

  @override
  String get lifetimeThanksCta => 'লাইফটাইম অ্যাক্সেস দাবি করুন';

  @override
  String get paywallNoInternetTitle => 'ইন্টারনেট সংযোগ নেই';

  @override
  String get paywallNoInternetBody =>
      'প্রথমবার অ্যাপটি অ্যাক্সেস করার জন্য একটি ইন্টারনেট সংযোগ প্রয়োজন। অনুগ্রহ করে সংযোগ করুন এবং আবার চেষ্টা করুন।';

  @override
  String get paywallStoreUnavailableTitle => 'স্টোর অনুপলব্ধ';

  @override
  String get paywallStoreUnavailableBody =>
      'সদস্যতা বিকল্প লোড করতে অক্ষম. আবার চেষ্টা করুন.';

  @override
  String get subscriptionVerifyTitle => 'সদস্যতা যাচাই করুন';

  @override
  String get subscriptionSoftWarningTitle => 'সদস্যতা যাচাইকরণ প্রয়োজন';

  @override
  String get subscriptionContinueAnyway => 'যাইহোক চালিয়ে যান';

  @override
  String subscriptionLastVerified(String date) {
    return 'সর্বশেষ যাচাইকৃত $date।';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'সদস্যতা অনলাইন যাচাই করা যায়নি.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'আপনার অ্যাক্সেস $date পর্যন্ত চলতে থাকবে — যাচাই করতে তার আগে সংযোগ করুন।';
  }

  @override
  String get subscriptionConnectToVerify =>
      'আপনার সদস্যতা যাচাই করতে ইন্টারনেটে সংযোগ করুন৷';

  @override
  String get organizeNoDuplicates => 'কোন সম্ভাব্য সদৃশ পাওয়া যায়নি';

  @override
  String get organizeSkippedShownAgain =>
      'এড়িয়ে যাওয়া সদৃশগুলি আবার দেখানো হয়।';

  @override
  String get organizeShowSkippedTooltip =>
      'এড়িয়ে যাওয়া সদৃশ গোষ্ঠীগুলি আবার দেখান৷';

  @override
  String organizeFailedToLoad(String error) {
    return 'সদৃশ গোষ্ঠীগুলি লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count ডুপ্লিকেট';
  }

  @override
  String get organizeSubtitlePlaceholder => 'বিস্তারিত দেখতে আলতো চাপুন';

  @override
  String get organizeConflictMostlyIdentical => 'বেশিরভাগই অভিন্ন';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count ভেরিয়েন্ট';
  }

  @override
  String get fieldLabelName => 'নাম';

  @override
  String get fieldLabelCompany => 'কোম্পানি';

  @override
  String get fieldLabelPhone => 'ফোন';

  @override
  String get fieldLabelEmail => 'ইমেইল';

  @override
  String get importErrorUnsupportedSource => 'আমদানি এখানে উপলব্ধ নয়.';

  @override
  String get importErrorPermissionDenied =>
      'পরিচিতি আমদানি করতে পরিচিতির অনুমতি প্রয়োজন৷';

  @override
  String get importErrorNoContacts => 'আমদানি করার জন্য কোনো পরিচিতি নেই৷';

  @override
  String get importErrorUnsupportedFileType =>
      'অনুগ্রহ করে একটি .vcf ফাইল বা একটি .zip সংরক্ষণাগার নির্বাচন করুন৷';

  @override
  String get importErrorInvalidFile => 'নির্বাচিত ফাইলটি অবৈধ বা অপঠনযোগ্য।';

  @override
  String get importErrorWrongPassword =>
      'ভুল সংরক্ষণাগার পাসওয়ার্ড. আবার চেষ্টা করুন.';

  @override
  String get importErrorNoVcfInArchive =>
      'নির্বাচিত আর্কাইভে কোনো .vcf ফাইল পাওয়া যায়নি।';

  @override
  String importErrorFailed(String detail) {
    return 'পরিচিতি আমদানি করতে ব্যর্থ হয়েছে: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'পরিচিতি এখনও উপলব্ধ নেই.';

  @override
  String get exportErrorNoContacts => 'রপ্তানি করার জন্য কোনো পরিচিতি নেই৷';

  @override
  String get exportErrorPasswordRequired =>
      'একটি সুরক্ষিত রপ্তানির জন্য পাসওয়ার্ড প্রয়োজন৷';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'সুরক্ষিত রপ্তানির জন্য কমপক্ষে $min অক্ষরের পাসওয়ার্ড প্রয়োজন৷';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'রপ্তানি ব্যর্থ হয়েছে: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'ডাউনলোড শুরু হয়েছে।';

  @override
  String get exportNoticeFileSaved => 'ফাইল সফলভাবে সংরক্ষণ করা হয়েছে.';

  @override
  String get phoneTypeMobile => 'মোবাইল';

  @override
  String get phoneTypeHome => 'বাড়ি';

  @override
  String get phoneTypeWork => 'কাজ';

  @override
  String get phoneTypeSchool => 'স্কুল';

  @override
  String get phoneTypeOther => 'অন্যান্য';

  @override
  String get emailTypePersonal => 'ব্যক্তিগত';

  @override
  String get emailTypeWork => 'কাজ';

  @override
  String get emailTypeSchool => 'স্কুল';

  @override
  String get emailTypeOther => 'অন্যান্য';

  @override
  String get addressTypeHome => 'বাড়ি';

  @override
  String get addressTypeWork => 'কাজ';

  @override
  String get addressTypeSchool => 'স্কুল';

  @override
  String get addressTypeBirth => 'জন্ম';

  @override
  String get linkTypeWebsite => 'ওয়েবসাইট';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'অন্যান্য';

  @override
  String get dateTypeCreated => 'তৈরি হয়েছে';

  @override
  String get dateTypeBirthday => 'জন্মদিন';

  @override
  String get dateTypeMet => 'দেখা হয়েছে';

  @override
  String get dateTypeGraduation => 'স্নাতক';

  @override
  String get dateTypeMarriage => 'বিবাহ';

  @override
  String get dateTypeOther => 'অন্যান্য';

  @override
  String get noNameInList => '(নাম নেই)';

  @override
  String get formAddPhone => 'ফোন যোগ করুন';

  @override
  String get formAddEmail => 'ইমেল যোগ করুন';

  @override
  String get formAddAddress => 'ঠিকানা যোগ করুন';

  @override
  String get formAddLink => 'লিঙ্ক যোগ করুন';

  @override
  String get formAddDate => 'তারিখ যোগ করুন';

  @override
  String get formHintPhoneNumber => 'ফোন নম্বর';

  @override
  String get formHintEmail => 'ইমেইল';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'ঠিকানা';

  @override
  String get formHintSelectDate => 'তারিখ নির্বাচন করুন';

  @override
  String get formHintNotes => 'নোট যোগ করুন';

  @override
  String get formCompany => 'কোম্পানি';

  @override
  String get formDepartment => 'বিভাগ';

  @override
  String get formJobTitle => 'চাকরির শিরোনাম';

  @override
  String get formPrefix => 'উপসর্গ';

  @override
  String get formFirstName => 'প্রথম নাম';

  @override
  String get formMiddleName => 'মধ্য নাম';

  @override
  String get formLastName => 'পদবি';

  @override
  String get formSuffix => 'প্রত্যয়';

  @override
  String get formNickname => 'ডাকনাম';

  @override
  String get contactsListTitle => 'পরিচিতি';

  @override
  String get contactsListEmpty => 'এখনও কোন পরিচিতি নেই';

  @override
  String get contactsImportButton => 'পরিচিতি আমদানি করুন';

  @override
  String get mergeContactsTitle => 'পরিচিতি মার্জ করুন';

  @override
  String get mergeContactsSubtitle =>
      'একটিতে একত্রিত করতে পরিচিতিগুলি নির্বাচন করুন৷';

  @override
  String get exportPasswordHint => 'পাসওয়ার্ড';

  @override
  String get exportPasswordConfirmHint => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String exportPasswordHelper(int min) {
    return 'কমপক্ষে $min অক্ষর';
  }

  @override
  String get zipPasswordHint => 'সংরক্ষণাগার পাসওয়ার্ড';

  @override
  String get activateDemoAccessCodeLabel => 'অ্যাক্সেস কোড';

  @override
  String get subscriptionExpiredTitle => 'সদস্যতার মেয়াদ শেষ';

  @override
  String get subscriptionExpiredBody =>
      'সমস্ত বৈশিষ্ট্য ব্যবহার চালিয়ে যেতে পুনর্নবীকরণ করুন।';

  @override
  String get contactsLoadError => 'পরিচিতি লোড করা যায়নি।';

  @override
  String get contactsListError => 'পরিচিতি লোড করা যায়নি।';

  @override
  String get contactsSearchNoResults => 'কোনো পরিচিতি পাওয়া যায়নি';

  @override
  String get supportPageIntro =>
      'প্রশ্ন, মতামত বা কিছু কাজ করছে না? Savelon দল প্রতিটি বার্তা পড়ে।';

  @override
  String get supportCtaMessageTeam => 'দলকে বার্তা পাঠান';

  @override
  String get importFromDeviceContacts => 'আপনার পরিচিতি থেকে';

  @override
  String get importFromFileVcfZip => 'ফাইল থেকে (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'অনন্য পাসওয়ার্ড তৈরি করুন';

  @override
  String get exportPasswordIrrecoverableHint =>
      'এই পাসওয়ার্ড পুনরুদ্ধার করা যাবে না।';

  @override
  String get exportProtectedArchiveCta => 'সুরক্ষিত আর্কাইভ রপ্তানি করুন';

  @override
  String get exportIosSavedFileWarning =>
      'এই ফাইলটি Savelon ফোল্ডারে সংরক্ষিত হয়। অ্যাপ মুছে ফেললে ফাইলও মুছে যাবে। রাখতে অন্য জায়গায় সরিয়ে নিন।';

  @override
  String importContactsConfirmBody(int count) {
    return 'Savelon-এ $countটি পরিচিতি আমদানি করবেন?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'পাসওয়ার্ড সেট করুন';

  @override
  String get settingsChangePasswordPageTitle => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get settingsRemovePasswordPageTitle => 'পাসওয়ার্ড সরান';

  @override
  String get settingsNewPasswordLabel => 'নতুন পাসওয়ার্ড';

  @override
  String get settingsConfirmNewPasswordLabel => 'নতুন পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get settingsReenterNewPasswordHelper => 'নতুন পাসওয়ার্ড আবার লিখুন';

  @override
  String get settingsSetPasswordCta => 'পাসওয়ার্ড সেট করুন';

  @override
  String get settingsChangePasswordCta => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get settingsRemovePasswordCta => 'পাসওয়ার্ড সরান';

  @override
  String get settingsCurrentPasswordLabel => 'বর্তমান পাসওয়ার্ড';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'আপনার বর্তমান পাসওয়ার্ড লিখুন';

  @override
  String get settingsNewPasswordMustDiffer =>
      'নতুন পাসওয়ার্ড বর্তমান থেকে আলাদা হতে হবে';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'পাসওয়ার্ড সেট করা যায়নি: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'পাসওয়ার্ড পরিবর্তন করা যায়নি: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'পাসওয়ার্ড সরানো যায়নি: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'পাসওয়ার্ড অবৈধ';

  @override
  String get settingsCurrentPasswordIncorrect => 'বর্তমান পাসওয়ার্ড ভুল';

  @override
  String get settingsCurrentPasswordRequired => 'বর্তমান পাসওয়ার্ড প্রয়োজন';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'পাসওয়ার্ড সুরক্ষা চালু থাকলে পাসওয়ার্ড প্রয়োজন';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'পাসওয়ার্ড বিকল্প চালু করার সময় পাসওয়ার্ড প্রয়োজন';

  @override
  String get authPasswordRequiredForAccount =>
      'এই অ্যাকাউন্টের জন্য পাসওয়ার্ড প্রয়োজন';

  @override
  String get loginLoggedInSecurely => 'নিরাপদভাবে লগ ইন করা হয়েছে';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'مخاطبین رمزگذاری شده';

  @override
  String get navContacts => 'مخاطبین';

  @override
  String get navOrganize => 'سازماندهی کنید';

  @override
  String get navSupport => 'پشتیبانی';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get language => 'زبان';

  @override
  String get languageSystemDefault => 'پیش فرض سیستم';

  @override
  String get organizeTitle => 'سازماندهی کنید';

  @override
  String get supportTitle => 'پشتیبانی';

  @override
  String get search => 'جستجو کنید';

  @override
  String get commonCancel => 'لغو کنید';

  @override
  String get commonDelete => 'حذف کنید';

  @override
  String get commonSave => 'ذخیره کنید';

  @override
  String get commonEdit => 'ویرایش کنید';

  @override
  String get commonMerge => 'ادغام';

  @override
  String get commonSkip => 'پرش کنید';

  @override
  String get commonRetry => 'دوباره امتحان کنید';

  @override
  String get commonClose => 'بستن';

  @override
  String get commonNext => 'بعدی';

  @override
  String get commonBack => 'به عقب برگرد';

  @override
  String get commonYes => 'بله';

  @override
  String get commonNo => 'خیر';

  @override
  String get commonContinue => 'ادامه دهید';

  @override
  String get commonTryAgain => 'دوباره امتحان کنید';

  @override
  String get commonApply => 'اعمال';

  @override
  String get commonDiscard => 'دور انداختن';

  @override
  String get commonUnlock => 'باز کردن قفل';

  @override
  String get commonLoading => 'در حال بارگیری...';

  @override
  String commonErrorWithDetails(String error) {
    return 'خطا: $error';
  }

  @override
  String get brandSlogan => 'مخاطبین شما مال شما تنها.';

  @override
  String get contactNotFound => 'مخاطب یافت نشد';

  @override
  String get contactDeleted => 'مخاطب حذف شد';

  @override
  String get contactUpdated => 'مخاطب به‌روزرسانی شد';

  @override
  String get contactSaved => 'مخاطب ذخیره شد';

  @override
  String get contactsMerged => 'مخاطبین ادغام شدند';

  @override
  String get deleteContactTitle => 'حذف مخاطب';

  @override
  String deleteContactConfirm(String name) {
    return 'آیا مطمئن هستید که می خواهید $name را حذف کنید؟';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'آیا مطمئن هستید که می خواهید \"$name\" را حذف کنید؟';
  }

  @override
  String failedToDelete(String error) {
    return 'حذف نشد: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'به روز رسانی انجام نشد: $error';
  }

  @override
  String failedToSave(String error) {
    return 'ذخیره نشد: $error';
  }

  @override
  String get noName => 'بدون نام';

  @override
  String get noNameTitle => 'بدون نام';

  @override
  String get noNameBody => 'این مخاطب نامی ندارد. به هر حال ذخیره شود؟';

  @override
  String get discardChangesTitle => 'از تغییرات صرفنظر شود؟';

  @override
  String get discardChangesBody =>
      'شما تغییرات ذخیره نشده ای دارید که از بین خواهند رفت.';

  @override
  String get newContact => 'مخاطب جدید';

  @override
  String get editContact => 'ویرایش مخاطب';

  @override
  String get addMore => 'بیشتر اضافه کنید';

  @override
  String get addNameFieldsTitle => 'فیلدهای نام را اضافه کنید';

  @override
  String get call => 'تماس بگیرید';

  @override
  String get sendEmail => 'ارسال ایمیل';

  @override
  String get copy => 'کپی کنید';

  @override
  String get visit => 'بازدید';

  @override
  String get copiedToClipboard => 'در کلیپ بورد کپی شد';

  @override
  String get importContacts => 'وارد کردن مخاطبین';

  @override
  String get importing => 'واردات...';

  @override
  String importedCount(int count) {
    return 'مخاطبین $count وارد شده است';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'مخاطبین $imported وارد شدند، $skipped رد شدند';
  }

  @override
  String get failedToImportContacts => 'وارد کردن مخاطبین انجام نشد';

  @override
  String get noContactsToImport => 'هیچ مخاطبی برای وارد کردن وجود ندارد.';

  @override
  String get contactsPermissionRequiredImport =>
      'مجوز مخاطبین برای وارد کردن مخاطبین مورد نیاز است';

  @override
  String get importDialogTitle => 'وارد کردن مخاطبین';

  @override
  String get importDialogBody => 'مخاطبین را از دستگاه یا یک فایل وارد کنید؟';

  @override
  String get importSourceTitle => 'واردات';

  @override
  String get importZipPasswordTitle => 'رمز عبور بایگانی';

  @override
  String get importZipPasswordChecking => 'در حال بررسی...';

  @override
  String get exportContacts => 'صادرات مخاطبین';

  @override
  String get unlockPro => 'فعال‌سازی Pro';

  @override
  String get exportContactsTitle => 'صادرات مخاطبین';

  @override
  String get exportSubtitle => 'نحوه ذخیره مخاطبین خود را انتخاب کنید.';

  @override
  String get exportFormatVcfTitle => 'ذخیره به عنوان .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'یک فایل که با مخاطبین Apple، Google و موارد دیگر کار می‌کند.';

  @override
  String get exportFormatZipTitle => 'ذخیره در آرشیو محافظت شده با رمز عبور';

  @override
  String get exportFormatZipSubtitle =>
      'یک .zip با .vcf شما در داخل - برای باز کردن آن به رمز عبور نیاز دارد.';

  @override
  String get exportProtectedTitle => 'صادرات محافظت شده';

  @override
  String get exportCompleteTitle => 'صادرات کامل شد';

  @override
  String get stillLoadingContacts =>
      'هنوز مخاطبین در حال بارگیری هستند. لطفا صبر کنید.';

  @override
  String get couldNotLoadContacts => 'مخاطبین بارگیری نشد.';

  @override
  String get passwordChangedSuccess => 'رمز عبور با موفقیت تغییر کرد';

  @override
  String get passwordProtectionEnabled => 'حفاظت از رمز عبور با موفقیت فعال شد';

  @override
  String get passwordProtectionRemoved => 'حفاظت از رمز عبور با موفقیت حذف شد';

  @override
  String get removePasswordProtectionButton => 'محافظت از رمز عبور را حذف کنید';

  @override
  String get changePasswordTitle => 'رمز عبور را تغییر دهید';

  @override
  String get setPasswordTitle => 'رمز عبور را تنظیم کنید';

  @override
  String get passwordSettingsChangeTitle => 'رمز عبور را تغییر دهید';

  @override
  String get passwordSettingsSetTitle => 'رمز عبور را تنظیم کنید';

  @override
  String get privacyPolicy => 'سیاست حفظ حریم خصوصی';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'سیاست حفظ حریم خصوصی باز نشد: $error';
  }

  @override
  String get resetAppTitle => 'برنامه را ریست کنید';

  @override
  String get resetAppConfirmTitle =>
      'همه مخاطبین حذف شوند و برنامه بازنشانی شود؟';

  @override
  String get resetAppCannotUndo => 'این قابل واگرد نیست';

  @override
  String resetAppError(String error) {
    return 'خطا در بازنشانی برنامه: $error';
  }

  @override
  String get photoPickerNewImage => 'تصویر جدید را انتخاب کنید';

  @override
  String get photoPickerRemoveImage => 'حذف تصویر';

  @override
  String get onboardingHeadline1 =>
      'چه کسی می تواند به مخاطبین شما دسترسی داشته باشد؟';

  @override
  String get onboardingSubline1 =>
      'برخی از برنامه ها آنها را در فضای ابری آپلود می کنند. این می تواند خطرات بیشتری برای حفظ حریم خصوصی ایجاد کند.';

  @override
  String get onboardingHeadline2 =>
      'بسیاری از برنامه ها برای دسترسی به مخاطب درخواست می کنند';

  @override
  String get onboardingSubline2 =>
      'می تواند مفید باشد - اما مخاطبین مهم باید خصوصی بمانند.';

  @override
  String get onboardingHeadline3 => 'مخاطبین حساس را جدا نگه دارید';

  @override
  String get onboardingSubline3 =>
      'توصیه می کنیم مخاطبین مهم و به ندرت استفاده شده را خارج از برنامه مخاطبین اصلی خود ذخیره کنید.';

  @override
  String get onboardingHeadline4 => 'از مخاطبین مهم خود محافظت کنید';

  @override
  String get onboardingSubline4 =>
      'Savelon آنها را به صورت رمزگذاری شده و خصوصی از سایر برنامه ها در دستگاه شما ذخیره می کند.';

  @override
  String get onboardingGetStarted => 'شروع کنید';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get activateDemoTitle => 'دمو را فعال کنید';

  @override
  String get activateDemoCancel => 'لغو کنید';

  @override
  String demoAccessGranted(String dateTime) {
    return 'اکنون تا $dateTime به نسخه آزمایشی دسترسی دارید';
  }

  @override
  String get setupPasswordTitle => 'محافظت از رمز عبور را اضافه کنید';

  @override
  String get setupPasswordShortError => 'حداقل از 4 کاراکتر استفاده کنید';

  @override
  String get setupPasswordMismatch => 'گذرواژه ها مطابقت ندارند';

  @override
  String get setupPasswordFailedSeed =>
      'تولید دانه انجام نشد. لطفا دوباره امتحان کنید.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'مقداردهی اولیه ناموفق بود. خطا: $error';
  }

  @override
  String get setupPasswordInfo =>
      'مخاطبین شما همچنان با یک کلید مخفی طولانی که فقط در دستگاه شما ذخیره می شود، به شدت رمزگذاری می شوند. اما رمز عبور محافظت بیشتری را اضافه می کند.';

  @override
  String get setupPasswordLabel => 'رمز عبور';

  @override
  String get setupPasswordHelper => 'حداقل 4 کاراکتر';

  @override
  String get setupPasswordConfirmLabel => 'رمز عبور را تایید کنید';

  @override
  String get setupPasswordWarning =>
      'این رمز عبور قابل بازیابی نیست. آن را یادداشت کنید و از آن محافظت کنید!';

  @override
  String get setupPasswordPageTitle => 'رمز عبور ایجاد کنید';

  @override
  String get setupPasswordNext => 'بعدی';

  @override
  String get setupPasswordSkip => 'پرش کنید';

  @override
  String get confirmationCheckboxTitle =>
      'می دانم رمز عبور من قابل بازیابی نیست';

  @override
  String get loginWelcomeBack => 'خوش آمدید بازگشت';

  @override
  String get loginPasswordLabel => 'رمز عبور';

  @override
  String get loginUnlock => 'باز کردن قفل';

  @override
  String get loginPasswordRequired => 'رمز عبور خود را وارد کنید';

  @override
  String get loginIncorrectPassword =>
      'رمز عبور نادرست است. لطفاً دوباره امتحان کنید.';

  @override
  String get paywallNoSubscription =>
      'هیچ اشتراک فعالی یافت نشد. لطفاً برای ادامه خرید کنید.';

  @override
  String get lifetimeThanksTitle => 'ممنون که با ما هستید';

  @override
  String get lifetimeThanksSubtitle =>
      'ما دسترسی Pro مادام‌العمر را به شما هدیه می‌دهیم';

  @override
  String get lifetimeThanksGift => 'هدیه';

  @override
  String get lifetimeThanksCta => 'دریافت دسترسی مادام‌العمر';

  @override
  String get paywallNoInternetTitle => 'بدون اتصال به اینترنت';

  @override
  String get paywallNoInternetBody =>
      'اتصال به اینترنت برای دسترسی به برنامه برای اولین بار مورد نیاز است. لطفاً وصل شوید و دوباره امتحان کنید.';

  @override
  String get paywallStoreUnavailableTitle => 'فروشگاه در دسترس نیست';

  @override
  String get paywallStoreUnavailableBody =>
      'بارگیری گزینه های اشتراک امکان پذیر نیست. لطفا دوباره امتحان کنید.';

  @override
  String get subscriptionVerifyTitle => 'تایید اشتراک';

  @override
  String get subscriptionSoftWarningTitle => 'تأیید اشتراک مورد نیاز است';

  @override
  String get subscriptionContinueAnyway => 'به هر حال ادامه بده';

  @override
  String subscriptionLastVerified(String date) {
    return 'آخرین تأیید $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline => 'اشتراک آنلاین تأیید نشد.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'دسترسی شما تا $date ادامه می‌یابد — قبل از آن برای تأیید، متصل شوید.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'برای تأیید اشتراک خود به اینترنت متصل شوید.';

  @override
  String get organizeNoDuplicates => 'هیچ مورد تکراری احتمالی یافت نشد';

  @override
  String get organizeSkippedShownAgain =>
      'موارد تکراری نادیده گرفته شده دوباره نشان داده می شوند.';

  @override
  String get organizeShowSkippedTooltip =>
      'دوباره گروه های تکراری حذف شده را نشان دهید';

  @override
  String organizeFailedToLoad(String error) {
    return 'بارگیری گروه های تکراری انجام نشد: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count مورد تکراری';
  }

  @override
  String get organizeSubtitlePlaceholder => 'برای مشاهده جزئیات ضربه بزنید';

  @override
  String get organizeConflictMostlyIdentical => 'اکثراً یکسان است';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: انواع $count';
  }

  @override
  String get fieldLabelName => 'نام';

  @override
  String get fieldLabelCompany => 'شرکت';

  @override
  String get fieldLabelPhone => 'تلفن';

  @override
  String get fieldLabelEmail => 'ایمیل';

  @override
  String get importErrorUnsupportedSource => 'واردات در اینجا در دسترس نیست.';

  @override
  String get importErrorPermissionDenied =>
      'مجوز مخاطبین برای وارد کردن مخاطبین مورد نیاز است.';

  @override
  String get importErrorNoContacts => 'هیچ مخاطبی برای وارد کردن وجود ندارد.';

  @override
  String get importErrorUnsupportedFileType =>
      'لطفاً یک فایل .vcf یا بایگانی .zip را انتخاب کنید.';

  @override
  String get importErrorInvalidFile =>
      'فایل انتخابی نامعتبر یا غیرقابل خواندن است.';

  @override
  String get importErrorWrongPassword =>
      'رمز عبور بایگانی اشتباه است. لطفا دوباره امتحان کنید.';

  @override
  String get importErrorNoVcfInArchive =>
      'هیچ فایل .vcf در بایگانی انتخاب شده یافت نشد.';

  @override
  String importErrorFailed(String detail) {
    return 'وارد کردن مخاطبین انجام نشد: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'مخاطبین هنوز در دسترس نیستند.';

  @override
  String get exportErrorNoContacts => 'هیچ مخاطبی برای صادرات وجود ندارد.';

  @override
  String get exportErrorPasswordRequired =>
      'رمز عبور برای صادرات محافظت شده مورد نیاز است.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'صادرات محافظت‌شده به رمز عبور حداقل $min کاراکتر نیاز دارد.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'صادر نشد: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'دانلود شروع شد.';

  @override
  String get exportNoticeFileSaved => 'فایل با موفقیت ذخیره شد.';

  @override
  String get phoneTypeMobile => 'موبایل';

  @override
  String get phoneTypeHome => 'خانه';

  @override
  String get phoneTypeWork => 'کاری';

  @override
  String get phoneTypeSchool => 'مدرسه';

  @override
  String get phoneTypeOther => 'دیگر';

  @override
  String get emailTypePersonal => 'شخصی';

  @override
  String get emailTypeWork => 'کاری';

  @override
  String get emailTypeSchool => 'مدرسه';

  @override
  String get emailTypeOther => 'دیگر';

  @override
  String get addressTypeHome => 'خانه';

  @override
  String get addressTypeWork => 'محل کار';

  @override
  String get addressTypeSchool => 'مدرسه';

  @override
  String get addressTypeBirth => 'تولد';

  @override
  String get linkTypeWebsite => 'وب سایت';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'دیگر';

  @override
  String get dateTypeCreated => 'ایجاد شد';

  @override
  String get dateTypeBirthday => 'تولد';

  @override
  String get dateTypeMet => 'ملاقات کرد';

  @override
  String get dateTypeGraduation => 'فارغ التحصیلی';

  @override
  String get dateTypeMarriage => 'ازدواج';

  @override
  String get dateTypeOther => 'دیگر';

  @override
  String get noNameInList => '(بدون نام)';

  @override
  String get formAddPhone => 'تلفن را اضافه کنید';

  @override
  String get formAddEmail => 'ایمیل اضافه کنید';

  @override
  String get formAddAddress => 'آدرس اضافه کنید';

  @override
  String get formAddLink => 'لینک اضافه کنید';

  @override
  String get formAddDate => 'اضافه کردن تاریخ';

  @override
  String get formHintPhoneNumber => 'شماره تلفن';

  @override
  String get formHintEmail => 'ایمیل';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'آدرس';

  @override
  String get formHintSelectDate => 'تاریخ را انتخاب کنید';

  @override
  String get formHintNotes => 'یادداشت ها را اضافه کنید';

  @override
  String get formCompany => 'شرکت';

  @override
  String get formDepartment => 'بخش';

  @override
  String get formJobTitle => 'عنوان شغلی';

  @override
  String get formPrefix => 'پیشوند';

  @override
  String get formFirstName => 'نام';

  @override
  String get formMiddleName => 'نام میانی';

  @override
  String get formLastName => 'نام خانوادگی';

  @override
  String get formSuffix => 'پسوند';

  @override
  String get formNickname => 'نام مستعار';

  @override
  String get contactsListTitle => 'مخاطبین';

  @override
  String get contactsListEmpty => 'هنوز مخاطبی وجود ندارد';

  @override
  String get contactsImportButton => 'وارد کردن مخاطبین';

  @override
  String get mergeContactsTitle => 'ادغام مخاطبین';

  @override
  String get mergeContactsSubtitle =>
      'مخاطبین را برای ادغام در یکی انتخاب کنید';

  @override
  String get exportPasswordHint => 'رمز عبور';

  @override
  String get exportPasswordConfirmHint => 'رمز عبور را تایید کنید';

  @override
  String exportPasswordHelper(int min) {
    return 'حداقل $min کاراکتر';
  }

  @override
  String get zipPasswordHint => 'رمز عبور بایگانی';

  @override
  String get activateDemoAccessCodeLabel => 'کد دسترسی';

  @override
  String get subscriptionExpiredTitle => 'اشتراک منقضی شده است';

  @override
  String get subscriptionExpiredBody =>
      'برای ادامه استفاده از همه ویژگی‌ها، تمدید کنید.';

  @override
  String get contactsLoadError => 'مخاطبین بارگیری نشد.';

  @override
  String get contactsListError => 'مخاطبین بارگیری نشد.';

  @override
  String get contactsSearchNoResults => 'مخاطبی یافت نشد';

  @override
  String get supportPageIntro =>
      'سؤال، بازخورد یا مشکلی دارید؟ تیم Savelon هر پیام را می‌خواند.';

  @override
  String get supportCtaMessageTeam => 'پیام به تیم';

  @override
  String get importFromDeviceContacts => 'از مخاطبین شما';

  @override
  String get importFromFileVcfZip => 'از پرونده (VCF، ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'ایجاد گذرواژهٔ یکتا';

  @override
  String get exportPasswordIrrecoverableHint =>
      'این گذرواژه قابل بازیابی نیست.';

  @override
  String get exportProtectedArchiveCta => 'صادرات بایگانی محافظت‌شده';

  @override
  String get exportIosSavedFileWarning =>
      'این پرونده در پوشهٔ Savelon ذخیره می‌شود. با حذف برنامه، پرونده هم حذف می‌شود. برای نگه‌داشتن آن به جای دیگری منتقل کنید.';

  @override
  String importContactsConfirmBody(int count) {
    return '$count مخاطب به Savelon وارد شود؟';
  }

  @override
  String get settingsSetPasswordPageTitle => 'تنظیم گذرواژه';

  @override
  String get settingsChangePasswordPageTitle => 'تغییر گذرواژه';

  @override
  String get settingsRemovePasswordPageTitle => 'حذف گذرواژه';

  @override
  String get settingsNewPasswordLabel => 'گذرواژهٔ جدید';

  @override
  String get settingsConfirmNewPasswordLabel => 'تأیید گذرواژهٔ جدید';

  @override
  String get settingsReenterNewPasswordHelper =>
      'گذرواژهٔ جدید را دوباره وارد کنید';

  @override
  String get settingsSetPasswordCta => 'تنظیم گذرواژه';

  @override
  String get settingsChangePasswordCta => 'تغییر گذرواژه';

  @override
  String get settingsRemovePasswordCta => 'حذف گذرواژه';

  @override
  String get settingsCurrentPasswordLabel => 'گذرواژهٔ فعلی';

  @override
  String get settingsEnterCurrentPasswordHelper => 'گذرواژهٔ فعلی را وارد کنید';

  @override
  String get settingsNewPasswordMustDiffer =>
      'گذرواژهٔ جدید باید با فعلی متفاوت باشد';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'تنظیم گذرواژه ناموفق بود: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'تغییر گذرواژه ناموفق بود: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'حذف گذرواژه ناموفق بود: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'گذرواژه نامعتبر است';

  @override
  String get settingsCurrentPasswordIncorrect => 'گذرواژهٔ فعلی نادرست است';

  @override
  String get settingsCurrentPasswordRequired => 'گذرواژهٔ فعلی لازم است';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'با فعال بودن محافظت با گذرواژه، گذرواژه لازم است';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'با فعال کردن گزینهٔ گذرواژه، گذرواژه لازم است';

  @override
  String get authPasswordRequiredForAccount => 'برای این حساب گذرواژه لازم است';
}

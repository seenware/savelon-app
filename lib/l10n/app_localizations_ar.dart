// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'جهات الاتصال المشفرة';

  @override
  String get navContacts => 'جهات الاتصال';

  @override
  String get navOrganize => 'تنظيم';

  @override
  String get navSupport => 'الدعم';

  @override
  String get navSettings => 'إعدادات';

  @override
  String get settingsTitle => 'إعدادات';

  @override
  String get language => 'لغة';

  @override
  String get languageSystemDefault => 'الافتراضي للنظام';

  @override
  String get organizeTitle => 'تنظم';

  @override
  String get supportTitle => 'الدعم';

  @override
  String get search => 'بحث';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonMerge => 'دمج';

  @override
  String get commonSkip => 'تخطّي';

  @override
  String get commonRetry => 'أعد المحاولة';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonNext => 'التالي';

  @override
  String get commonBack => 'عُد';

  @override
  String get commonYes => 'نعم';

  @override
  String get commonNo => 'لا';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonTryAgain => 'حاول ثانية';

  @override
  String get commonApply => 'تطبيق';

  @override
  String get commonDiscard => 'تجاهل';

  @override
  String get commonUnlock => 'فتح';

  @override
  String get commonLoading => 'تحميل...';

  @override
  String commonErrorWithDetails(String error) {
    return 'خطأ: $error';
  }

  @override
  String get brandSlogan => 'جهات الاتصال الخاصة بك. لك وحدك.';

  @override
  String get contactNotFound => 'لم يتم العثور على جهة الاتصال';

  @override
  String get contactDeleted => 'تم حذف جهة الاتصال';

  @override
  String get contactUpdated => 'تم تحديث جهة الاتصال';

  @override
  String get contactSaved => 'تم حفظ جهة الاتصال';

  @override
  String get contactsMerged => 'تم دمج جهات الاتصال';

  @override
  String get deleteContactTitle => 'حذف جهة الاتصال';

  @override
  String deleteContactConfirm(String name) {
    return 'هل أنت متأكد أنك تريد حذف $name؟';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'هل أنت متأكد أنك تريد حذف \"$name\"؟';
  }

  @override
  String failedToDelete(String error) {
    return 'فشل الحذف: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'فشل التحديث: $error';
  }

  @override
  String failedToSave(String error) {
    return 'فشل الحفظ: $error';
  }

  @override
  String get noName => 'لا اسم';

  @override
  String get noNameTitle => 'لا اسم';

  @override
  String get noNameBody =>
      'جهة الاتصال هذه ليس لها اسم. هل تريد الحفظ على أي حال؟';

  @override
  String get discardChangesTitle => 'هل تريد تجاهل التغييرات؟';

  @override
  String get discardChangesBody => 'لديك تغييرات غير محفوظة وسيتم فقدها.';

  @override
  String get newContact => 'جهة اتصال جديدة';

  @override
  String get editContact => 'تحرير جهة الاتصال';

  @override
  String get addMore => 'أضف المزيد';

  @override
  String get addNameFieldsTitle => 'إضافة حقول الاسم';

  @override
  String get call => 'اتصال';

  @override
  String get sendEmail => 'إرسال البريد الإلكتروني';

  @override
  String get copy => 'نسخ';

  @override
  String get visit => 'زيارة';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get importContacts => 'استيراد جهات الاتصال';

  @override
  String get importing => 'جارٍ الاستيراد...';

  @override
  String importedCount(int count) {
    return 'تم استيراد $count من جهات الاتصال';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'تم استيراد جهات اتصال $imported، وتم تخطي $skipped';
  }

  @override
  String get failedToImportContacts => 'فشل استيراد جهات الاتصال';

  @override
  String get noContactsToImport => 'لا توجد جهات اتصال لاستيرادها.';

  @override
  String get contactsPermissionRequiredImport =>
      'مطلوب إذن جهات الاتصال لاستيراد جهات الاتصال';

  @override
  String get importDialogTitle => 'استيراد جهات الاتصال';

  @override
  String get importDialogBody => 'استيراد جهات الاتصال من جهازك أو ملف؟';

  @override
  String get importSourceTitle => 'استيراد';

  @override
  String get importZipPasswordTitle => 'كلمة مرور الأرشيف';

  @override
  String get importZipPasswordChecking => 'جارٍ التحقق...';

  @override
  String get exportContacts => 'تصدير جهات الاتصال';

  @override
  String get unlockPro => 'فتح Pro';

  @override
  String get exportContactsTitle => 'تصدير جهات الاتصال';

  @override
  String get exportSubtitle =>
      'اختر الطريقة التي تريد بها حفظ جهات الاتصال الخاصة بك.';

  @override
  String get exportFormatVcfTitle => 'حفظ باسم .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'ملف واحد يعمل مع جهات اتصال Apple وجهات اتصال Google والمزيد.';

  @override
  String get exportFormatZipTitle => 'حفظ في الأرشيف المحمي بكلمة مرور';

  @override
  String get exportFormatZipSubtitle =>
      'ملف .zip يحتوي على ملف .vcf بداخله — يلزم كلمة مرور لفتحه.';

  @override
  String get exportProtectedTitle => 'التصدير المحمي';

  @override
  String get exportCompleteTitle => 'اكتمل التصدير';

  @override
  String get stillLoadingContacts =>
      'لا يزال يتم تحميل جهات الاتصال. انتظر من فضلك.';

  @override
  String get couldNotLoadContacts => 'تعذر تحميل جهات الاتصال.';

  @override
  String get passwordChangedSuccess => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get passwordProtectionEnabled => 'تم تمكين الحماية بكلمة مرور بنجاح';

  @override
  String get passwordProtectionRemoved => 'تمت إزالة حماية كلمة المرور بنجاح';

  @override
  String get removePasswordProtectionButton => 'إزالة الحماية بكلمة المرور';

  @override
  String get changePasswordTitle => 'تغيير كلمة المرور';

  @override
  String get setPasswordTitle => 'تعيين كلمة المرور';

  @override
  String get passwordSettingsChangeTitle => 'تغيير كلمة المرور';

  @override
  String get passwordSettingsSetTitle => 'تعيين كلمة المرور';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'فشل في فتح سياسة الخصوصية: $error';
  }

  @override
  String get resetAppTitle => 'إعادة ضبط التطبيق';

  @override
  String get resetAppConfirmTitle =>
      'هل تريد حذف جميع جهات الاتصال وإعادة ضبط التطبيق؟';

  @override
  String get resetAppCannotUndo => 'لا يمكن التراجع عن هذا';

  @override
  String resetAppError(String error) {
    return 'خطأ في إعادة تعيين التطبيق: $error';
  }

  @override
  String get photoPickerNewImage => 'حدد صورة جديدة';

  @override
  String get photoPickerRemoveImage => 'إزالة الصورة';

  @override
  String get onboardingHeadline1 =>
      'من يمكنه الوصول إلى جهات الاتصال الخاصة بك؟';

  @override
  String get onboardingSubline1 =>
      'تقوم بعض التطبيقات بتحميلها إلى السحابة. وهذا يمكن أن يخلق المزيد من المخاطر المتعلقة بالخصوصية.';

  @override
  String get onboardingHeadline2 =>
      'تطلب العديد من التطبيقات الوصول إلى جهات الاتصال';

  @override
  String get onboardingSubline2 =>
      'يمكن أن يكون مفيدًا، لكن جهات الاتصال المهمة يجب أن تظل خاصة.';

  @override
  String get onboardingHeadline3 => 'احتفظ بجهات الاتصال الحساسة منفصلة';

  @override
  String get onboardingSubline3 =>
      'نوصي بتخزين جهات الاتصال المهمة ونادرا ما تستخدم خارج تطبيق جهات الاتصال الرئيسي.';

  @override
  String get onboardingHeadline4 => 'حماية جهات الاتصال الهامة الخاصة بك';

  @override
  String get onboardingSubline4 =>
      'Savelon يخزنها على جهازك، مشفرة وخاصة من التطبيقات الأخرى.';

  @override
  String get onboardingGetStarted => 'ابدأ';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get activateDemoTitle => 'تفعيل النسخة التجريبية';

  @override
  String get activateDemoCancel => 'إلغاء';

  @override
  String demoAccessGranted(String dateTime) {
    return 'لديك الآن وصول تجريبي حتى $dateTime';
  }

  @override
  String get setupPasswordTitle => 'إضافة حماية كلمة المرور';

  @override
  String get setupPasswordMismatch => 'كلمات المرور غير متطابقة';

  @override
  String get setupPasswordFailedSeed =>
      'فشل في توليد البذور. يرجى المحاولة مرة أخرى.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'فشل في التهيئة. خطأ: $error';
  }

  @override
  String get setupPasswordInfo =>
      'ستظل جهات الاتصال الخاصة بك مشفرة بقوة باستخدام مفتاح سري طويل، يتم تخزينه على جهازك فقط. لكن كلمة المرور تضيف حماية إضافية.';

  @override
  String get setupPasswordLabel => 'كلمة المرور';

  @override
  String get setupPasswordConfirmLabel => 'تأكيد كلمة المرور';

  @override
  String get setupPasswordWarning =>
      'لا يمكن استعادة كلمة المرور هذه. اكتبها واحتفظ بها آمنة!';

  @override
  String get setupPasswordPageTitle => 'إنشاء كلمة المرور';

  @override
  String get setupPasswordNext => 'التالي';

  @override
  String get setupPasswordSkip => 'تخطّي';

  @override
  String get confirmationCheckboxTitle =>
      'أدرك أنه لا يمكن استعادة كلمة المرور الخاصة بي';

  @override
  String get loginWelcomeBack => 'مرحبًا بعودتك';

  @override
  String get loginPasswordLabel => 'كلمة المرور';

  @override
  String get loginUnlock => 'فتح';

  @override
  String get loginPasswordRequired => 'أدخل كلمة المرور الخاصة بك';

  @override
  String get loginIncorrectPassword =>
      'كلمة مرور غير صحيحة. يرجى المحاولة مرة أخرى.';

  @override
  String get paywallNoSubscription =>
      'لم يتم العثور على اشتراك نشط. يرجى الشراء للمتابعة.';

  @override
  String get lifetimeThanksTitle => 'شكرًا لكونك معنا';

  @override
  String get lifetimeThanksSubtitle => 'نمنحك وصول Pro مدى الحياة';

  @override
  String get lifetimeThanksGift => 'هدية';

  @override
  String get lifetimeThanksCta => 'احصل على الوصول مدى الحياة';

  @override
  String get paywallNoInternetTitle => 'لا يوجد اتصال بالإنترنت';

  @override
  String get paywallNoInternetBody =>
      'مطلوب اتصال بالإنترنت للوصول إلى التطبيق لأول مرة. يرجى الاتصال والمحاولة مرة أخرى.';

  @override
  String get paywallStoreUnavailableTitle => 'المتجر غير متاح';

  @override
  String get paywallStoreUnavailableBody =>
      'غير قادر على تحميل خيارات الاشتراك. يرجى المحاولة مرة أخرى.';

  @override
  String get subscriptionVerifyTitle => 'التحقق من الاشتراك';

  @override
  String get subscriptionSoftWarningTitle => 'مطلوب التحقق من الاشتراك';

  @override
  String get subscriptionContinueAnyway => 'استمر على أي حال';

  @override
  String subscriptionLastVerified(String date) {
    return 'آخر التحقق $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'لا يمكن التحقق من الاشتراك عبر الإنترنت.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'يستمر وصولك حتى $date — اتصل بالإنترنت قبل ذلك للتحقق.';
  }

  @override
  String get subscriptionConnectToVerify => 'اتصل بالإنترنت للتحقق من اشتراكك.';

  @override
  String get organizeNoDuplicates => 'لم يتم العثور على التكرارات المحتملة';

  @override
  String get organizeSkippedShownAgain =>
      'يتم عرض التكرارات التي تم تخطيها مرة أخرى.';

  @override
  String get organizeShowSkippedTooltip =>
      'إظهار المجموعات المكررة التي تم تخطيها مرة أخرى';

  @override
  String organizeFailedToLoad(String error) {
    return 'فشل تحميل المجموعات المكررة: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count مكررات';
  }

  @override
  String get organizeSubtitlePlaceholder => 'انقر لعرض التفاصيل';

  @override
  String get organizeConflictMostlyIdentical => 'متطابقة في الغالب';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count متغيرات';
  }

  @override
  String get fieldLabelName => 'اسم';

  @override
  String get fieldLabelCompany => 'شركة';

  @override
  String get fieldLabelPhone => 'هاتف';

  @override
  String get fieldLabelEmail => 'بريد إلكتروني';

  @override
  String get importErrorUnsupportedSource => 'الاستيراد غير متوفر هنا.';

  @override
  String get importErrorPermissionDenied =>
      'مطلوب إذن جهات الاتصال لاستيراد جهات الاتصال.';

  @override
  String get importErrorNoContacts => 'لا توجد جهات اتصال لاستيرادها.';

  @override
  String get importErrorUnsupportedFileType =>
      'الرجاء تحديد ملف .vcf أو أرشيف .zip.';

  @override
  String get importErrorInvalidFile =>
      'الملف المحدد غير صالح أو غير قابل للقراءة.';

  @override
  String get importErrorWrongPassword =>
      'كلمة مرور الأرشيف غير صحيحة. يرجى المحاولة مرة أخرى.';

  @override
  String get importErrorNoVcfInArchive =>
      'لم يتم العثور على ملفات .vcf في الأرشيف المحدد.';

  @override
  String importErrorFailed(String detail) {
    return 'فشل استيراد جهات الاتصال: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'جهات الاتصال ليست متاحة بعد.';

  @override
  String get exportErrorNoContacts => 'لا توجد جهات اتصال للتصدير.';

  @override
  String get exportErrorPasswordRequired =>
      'كلمة المرور مطلوبة للتصدير المحمي.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'يتطلب التصدير المحمي كلمة مرور لا تقل عن $min حرفًا.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'فشل التصدير: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'بدأ التنزيل.';

  @override
  String get exportNoticeFileSaved => 'تم حفظ الملف بنجاح.';

  @override
  String get phoneTypeMobile => 'جوال';

  @override
  String get phoneTypeHome => 'المنزل';

  @override
  String get phoneTypeWork => 'عمل';

  @override
  String get phoneTypeSchool => 'مدرسة';

  @override
  String get phoneTypeOther => 'آخر';

  @override
  String get emailTypePersonal => 'شخصي';

  @override
  String get emailTypeWork => 'عمل';

  @override
  String get emailTypeSchool => 'مدرسة';

  @override
  String get emailTypeOther => 'آخر';

  @override
  String get addressTypeHome => 'بيت';

  @override
  String get addressTypeWork => 'عمل';

  @override
  String get addressTypeSchool => 'مدرسة';

  @override
  String get addressTypeBirth => 'الولادة';

  @override
  String get linkTypeWebsite => 'موقع إلكتروني';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'آخر';

  @override
  String get dateTypeCreated => 'تاريخ الإنشاء';

  @override
  String get dateTypeBirthday => 'عيد ميلاد';

  @override
  String get dateTypeMet => 'لقاء';

  @override
  String get dateTypeGraduation => 'تخرُّج';

  @override
  String get dateTypeMarriage => 'زواج';

  @override
  String get dateTypeOther => 'آخر';

  @override
  String get noNameInList => '(بدون اسم)';

  @override
  String get formAddPhone => 'إضافة هاتف';

  @override
  String get formAddEmail => 'أضف البريد الإلكتروني';

  @override
  String get formAddAddress => 'أضف عنوانًا';

  @override
  String get formAddLink => 'إضافة رابط';

  @override
  String get formAddDate => 'أضف التاريخ';

  @override
  String get formHintPhoneNumber => 'رقم التليفون';

  @override
  String get formHintEmail => 'بريد إلكتروني';

  @override
  String get formHintUrl => 'عنوان URL';

  @override
  String get formHintAddress => 'عنوان';

  @override
  String get formHintSelectDate => 'اختر التاريخ';

  @override
  String get formHintNotes => 'أضف ملاحظات';

  @override
  String get formCompany => 'شركة';

  @override
  String get formDepartment => 'قسم';

  @override
  String get formJobTitle => 'مسمى وظيفي';

  @override
  String get formPrefix => 'بادئة';

  @override
  String get formFirstName => 'الاسم الأول';

  @override
  String get formMiddleName => 'الاسم الأوسط';

  @override
  String get formLastName => 'اسم العائلة';

  @override
  String get formSuffix => 'لاحقة';

  @override
  String get formNickname => 'كنية';

  @override
  String get contactsListTitle => 'جهات الاتصال';

  @override
  String get contactsListEmpty => 'لا توجد جهات اتصال بعد';

  @override
  String get contactsImportButton => 'استيراد جهات الاتصال';

  @override
  String get mergeContactsTitle => 'دمج جهات الاتصال';

  @override
  String get mergeContactsSubtitle => 'حدد جهات الاتصال لدمجها في جهة واحدة';

  @override
  String get exportPasswordHint => 'كلمة المرور';

  @override
  String get exportPasswordConfirmHint => 'تأكيد كلمة المرور';

  @override
  String exportPasswordHelper(int min) {
    return 'على الأقل $min حرفًا';
  }

  @override
  String get zipPasswordHint => 'كلمة مرور الأرشيف';

  @override
  String get activateDemoAccessCodeLabel => 'رمز الوصول';

  @override
  String get subscriptionExpiredTitle => 'انتهت صلاحية الاشتراك';

  @override
  String get subscriptionExpiredBody =>
      'قم بالتجديد لمواصلة استخدام جميع الميزات.';

  @override
  String get contactsLoadError => 'تعذر تحميل جهات الاتصال.';

  @override
  String get contactsListError => 'تعذر تحميل جهات الاتصال.';

  @override
  String get contactsSearchNoResults => 'لم يتم العثور على جهات اتصال';

  @override
  String get supportPageIntro =>
      'أسئلة أو ملاحظات أو شيء لا يعمل؟ يقرأ فريق Savelon كل رسالة.';

  @override
  String get supportCtaMessageTeam => 'مراسلة الفريق';

  @override
  String get importFromDeviceContacts => 'من جهات اتصالك';

  @override
  String get importFromFileVcfZip => 'من ملف (VCF، ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'إنشاء كلمة مرور فريدة';

  @override
  String get exportPasswordIrrecoverableHint =>
      'لا يمكن استعادة كلمة المرور هذه.';

  @override
  String get exportProtectedArchiveCta => 'تصدير أرشيف محمي';

  @override
  String get exportIosSavedFileWarning =>
      'يُحفظ هذا الملف في مجلد Savelon. إذا حذفت التطبيق، يُحذف الملف أيضًا. انقله إلى موقع آخر للاحتفاظ به.';

  @override
  String importContactsConfirmBody(int count) {
    return 'استيراد $count جهة اتصال إلى Savelon؟';
  }

  @override
  String get settingsSetPasswordPageTitle => 'تعيين كلمة المرور';

  @override
  String get settingsChangePasswordPageTitle => 'تغيير كلمة المرور';

  @override
  String get settingsRemovePasswordPageTitle => 'إزالة كلمة المرور';

  @override
  String get settingsNewPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get settingsConfirmNewPasswordLabel => 'تأكيد كلمة المرور الجديدة';

  @override
  String get settingsReenterNewPasswordHelper =>
      'أعد إدخال كلمة المرور الجديدة';

  @override
  String get settingsSetPasswordCta => 'تعيين كلمة المرور';

  @override
  String get settingsChangePasswordCta => 'تغيير كلمة المرور';

  @override
  String get settingsRemovePasswordCta => 'إزالة كلمة المرور';

  @override
  String get settingsCurrentPasswordLabel => 'كلمة المرور الحالية';

  @override
  String get settingsEnterCurrentPasswordHelper => 'أدخل كلمة المرور الحالية';

  @override
  String get settingsNewPasswordMustDiffer =>
      'يجب أن تختلف كلمة المرور الجديدة عن الحالية';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'تعذر تعيين كلمة المرور: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'تعذر تغيير كلمة المرور: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'تعذر إزالة كلمة المرور: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'كلمة المرور غير صالحة';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'كلمة المرور الحالية غير صحيحة';

  @override
  String get settingsCurrentPasswordRequired => 'كلمة المرور الحالية مطلوبة';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'كلمة المرور مطلوبة عند تفعيل الحماية بكلمة المرور';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'كلمة المرور مطلوبة عند تفعيل خيار كلمة المرور';

  @override
  String get authPasswordRequiredForAccount => 'كلمة المرور مطلوبة لهذا الحساب';
}

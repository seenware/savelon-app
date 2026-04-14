// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'ผู้ติดต่อที่เข้ารหัส';

  @override
  String get navContacts => 'รายชื่อผู้ติดต่อ';

  @override
  String get navOrganize => 'จัดระเบียบ';

  @override
  String get navSupport => 'ช่วยเหลือ';

  @override
  String get navSettings => 'การตั้งค่า';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSystemDefault => 'ค่าเริ่มต้นของระบบ';

  @override
  String get organizeTitle => 'จัดระเบียบ';

  @override
  String get supportTitle => 'ช่วยเหลือ';

  @override
  String get search => 'ค้นหา';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonDelete => 'ลบ';

  @override
  String get commonSave => 'บันทึก';

  @override
  String get commonEdit => 'แก้ไข';

  @override
  String get commonMerge => 'ผสาน';

  @override
  String get commonSkip => 'ข้าม';

  @override
  String get commonRetry => 'ลองอีกครั้ง';

  @override
  String get commonClose => 'ปิด';

  @override
  String get commonNext => 'ต่อไป';

  @override
  String get commonBack => 'กลับไป';

  @override
  String get commonYes => 'ใช่';

  @override
  String get commonNo => 'ไม่';

  @override
  String get commonContinue => 'ดำเนินการต่อ';

  @override
  String get commonTryAgain => 'ลองอีกครั้ง';

  @override
  String get commonApply => 'นำมาใช้';

  @override
  String get commonDiscard => 'ทิ้ง';

  @override
  String get commonUnlock => 'ปลดล็อค';

  @override
  String get commonLoading => 'กำลังโหลด...';

  @override
  String commonErrorWithDetails(String error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get brandSlogan => 'ผู้ติดต่อของคุณ ของคุณคนเดียว';

  @override
  String get contactNotFound => 'ไม่พบผู้ติดต่อ';

  @override
  String get contactDeleted => 'ลบผู้ติดต่อแล้ว';

  @override
  String get contactUpdated => 'อัพเดทรายชื่อติดต่อแล้ว';

  @override
  String get contactSaved => 'บันทึกการติดต่อแล้ว';

  @override
  String get contactsMerged => 'รวมรายชื่อแล้ว';

  @override
  String get deleteContactTitle => 'ลบผู้ติดต่อ';

  @override
  String deleteContactConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $name';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ \"$name\"';
  }

  @override
  String failedToDelete(String error) {
    return 'ลบไม่สำเร็จ: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'ไม่สามารถอัปเดต: $error';
  }

  @override
  String failedToSave(String error) {
    return 'ไม่สามารถบันทึก: $error';
  }

  @override
  String get noName => 'ไม่มีชื่อ';

  @override
  String get noNameTitle => 'ไม่มีชื่อ';

  @override
  String get noNameBody => 'ผู้ติดต่อรายนี้ไม่มีชื่อ บันทึกต่อไปใช่ไหม?';

  @override
  String get discardChangesTitle => 'ยกเลิกการเปลี่ยนแปลงใช่ไหม';

  @override
  String get discardChangesBody =>
      'คุณมีการเปลี่ยนแปลงที่ยังไม่ได้บันทึกซึ่งจะสูญหายไป';

  @override
  String get newContact => 'ติดต่อใหม่';

  @override
  String get editContact => 'แก้ไขการติดต่อ';

  @override
  String get addMore => 'เพิ่มมากขึ้น';

  @override
  String get addNameFieldsTitle => 'เพิ่มฟิลด์ชื่อ';

  @override
  String get call => 'เรียก';

  @override
  String get sendEmail => 'ส่งอีเมล์';

  @override
  String get copy => 'คัดลอก';

  @override
  String get visit => 'เยี่ยมชม';

  @override
  String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ดแล้ว';

  @override
  String get importContacts => 'นำเข้าผู้ติดต่อ';

  @override
  String get importing => 'กำลังนำเข้า...';

  @override
  String importedCount(int count) {
    return 'นำเข้ารายชื่อติดต่อ $count แล้ว';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'นำเข้ารายชื่อติดต่อ $imported แล้ว $skipped ข้ามไป';
  }

  @override
  String get failedToImportContacts => 'ไม่สามารถนำเข้าผู้ติดต่อได้';

  @override
  String get noContactsToImport => 'ไม่มีผู้ติดต่อให้นำเข้า';

  @override
  String get contactsPermissionRequiredImport =>
      'ต้องอนุญาตให้เข้าถึงรายชื่อผู้ติดต่อเพื่อนำเข้า';

  @override
  String get importDialogTitle => 'นำเข้าผู้ติดต่อ';

  @override
  String get importDialogBody => 'นำเข้าผู้ติดต่อจากอุปกรณ์หรือไฟล์ของคุณ?';

  @override
  String get importSourceTitle => 'นำเข้า';

  @override
  String get importZipPasswordTitle => 'รหัสผ่านของไฟล์บีบอัด';

  @override
  String get importZipPasswordChecking => 'กำลังตรวจสอบ...';

  @override
  String get exportContacts => 'ส่งออกผู้ติดต่อ';

  @override
  String get unlockPro => 'ปลดล็อก Pro';

  @override
  String get exportContactsTitle => 'ส่งออกผู้ติดต่อ';

  @override
  String get exportSubtitle => 'เลือกวิธีที่คุณต้องการบันทึกผู้ติดต่อของคุณ';

  @override
  String get exportFormatVcfTitle => 'บันทึกเป็น .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'ไฟล์เดียวที่ใช้งานได้กับ Apple Contacts, Google Contacts และอื่นๆ';

  @override
  String get exportFormatZipTitle =>
      'บันทึกในไฟล์เก็บถาวรที่มีการป้องกันด้วยรหัสผ่าน';

  @override
  String get exportFormatZipSubtitle =>
      '.zip ที่มี .vcf อยู่ข้างใน — ต้องใช้รหัสผ่านเพื่อเปิด';

  @override
  String get exportProtectedTitle => 'การส่งออกที่ได้รับการคุ้มครอง';

  @override
  String get exportCompleteTitle => 'ส่งออกเสร็จสมบูรณ์';

  @override
  String get stillLoadingContacts => 'กำลังโหลดรายชื่อติดต่ออยู่ โปรดรอ.';

  @override
  String get couldNotLoadContacts => 'ไม่สามารถโหลดผู้ติดต่อได้';

  @override
  String get passwordChangedSuccess => 'เปลี่ยนรหัสผ่านเรียบร้อยแล้ว';

  @override
  String get passwordProtectionEnabled =>
      'เปิดใช้งานการป้องกันด้วยรหัสผ่านสำเร็จแล้ว';

  @override
  String get passwordProtectionRemoved =>
      'ลบการป้องกันด้วยรหัสผ่านเรียบร้อยแล้ว';

  @override
  String get removePasswordProtectionButton => 'ลบการป้องกันด้วยรหัสผ่าน';

  @override
  String get changePasswordTitle => 'เปลี่ยนรหัสผ่าน';

  @override
  String get setPasswordTitle => 'ตั้งรหัสผ่าน';

  @override
  String get passwordSettingsChangeTitle => 'เปลี่ยนรหัสผ่าน';

  @override
  String get passwordSettingsSetTitle => 'ตั้งรหัสผ่าน';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'ไม่สามารถเปิดนโยบายความเป็นส่วนตัว: $error';
  }

  @override
  String get resetAppTitle => 'รีเซ็ตแอป';

  @override
  String get resetAppConfirmTitle => 'ลบผู้ติดต่อทั้งหมดแล้วรีเซ็ตแอปใช่ไหม';

  @override
  String get resetAppCannotUndo => 'สิ่งนี้ไม่สามารถยกเลิกได้';

  @override
  String resetAppError(String error) {
    return 'เกิดข้อผิดพลาดในการรีเซ็ตแอป: $error';
  }

  @override
  String get photoPickerNewImage => 'เลือกรูปภาพใหม่';

  @override
  String get photoPickerRemoveImage => 'ลบรูปภาพ';

  @override
  String get onboardingHeadline1 => 'ใครสามารถเข้าถึงผู้ติดต่อของคุณได้บ้าง?';

  @override
  String get onboardingSubline1 =>
      'แอปบางแอปจะอัปโหลดไปยังระบบคลาวด์ สิ่งนี้สามารถสร้างความเสี่ยงด้านความเป็นส่วนตัวได้มากขึ้น';

  @override
  String get onboardingHeadline2 => 'แอพจำนวนมากขอการเข้าถึงผู้ติดต่อ';

  @override
  String get onboardingSubline2 =>
      'อาจมีประโยชน์ แต่ผู้ติดต่อที่สำคัญควรเก็บไว้เป็นส่วนตัว';

  @override
  String get onboardingHeadline3 => 'แยกผู้ติดต่อที่ละเอียดอ่อนออกจากกัน';

  @override
  String get onboardingSubline3 =>
      'เราขอแนะนำให้จัดเก็บรายชื่อติดต่อที่สำคัญและไม่ค่อยได้ใช้ไว้นอกแอปรายชื่อติดต่อหลักของคุณ';

  @override
  String get onboardingHeadline4 => 'ปกป้องผู้ติดต่อที่สำคัญของคุณ';

  @override
  String get onboardingSubline4 =>
      'Savelon เก็บไว้ในอุปกรณ์ของคุณ เข้ารหัสและเป็นส่วนตัวจากแอปอื่น';

  @override
  String get onboardingGetStarted => 'เริ่มต้นเลย';

  @override
  String get onboardingNext => 'ต่อไป';

  @override
  String get activateDemoTitle => 'เปิดใช้งานการสาธิต';

  @override
  String get activateDemoCancel => 'ยกเลิก';

  @override
  String demoAccessGranted(String dateTime) {
    return 'ตอนนี้คุณมีสิทธิ์เข้าถึงการสาธิตจนถึง $dateTime';
  }

  @override
  String get setupPasswordTitle => 'เพิ่มการป้องกันด้วยรหัสผ่าน';

  @override
  String get setupPasswordShortError => 'ใช้อย่างน้อย 4 ตัวอักษร';

  @override
  String get setupPasswordMismatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get setupPasswordFailedSeed =>
      'ไม่สามารถสร้าง seed ได้ โปรดลองอีกครั้ง';

  @override
  String setupPasswordFailedInit(String error) {
    return 'ไม่สามารถเริ่มต้นได้ ข้อผิดพลาด: $error';
  }

  @override
  String get setupPasswordInfo =>
      'ผู้ติดต่อของคุณจะยังคงได้รับการเข้ารหัสอย่างแน่นหนาด้วยรหัสลับขนาดยาวที่จัดเก็บไว้ในอุปกรณ์ของคุณเท่านั้น แต่รหัสผ่านเพิ่มการป้องกันพิเศษ';

  @override
  String get setupPasswordLabel => 'รหัสผ่าน';

  @override
  String get setupPasswordHelper => 'อย่างน้อย 4 ตัวอักษร';

  @override
  String get setupPasswordConfirmLabel => 'ยืนยันรหัสผ่าน';

  @override
  String get setupPasswordWarning =>
      'รหัสผ่านนี้ไม่สามารถกู้คืนได้ เขียนมันลงไปและเก็บไว้อย่างปลอดภัย!';

  @override
  String get setupPasswordPageTitle => 'สร้างรหัสผ่าน';

  @override
  String get setupPasswordNext => 'ต่อไป';

  @override
  String get setupPasswordSkip => 'ข้าม';

  @override
  String get confirmationCheckboxTitle =>
      'ฉันเข้าใจว่ารหัสผ่านของฉันไม่สามารถกู้คืนได้';

  @override
  String get loginWelcomeBack => 'ยินดีต้อนรับกลับ';

  @override
  String get loginPasswordLabel => 'รหัสผ่าน';

  @override
  String get loginUnlock => 'ปลดล็อค';

  @override
  String get loginPasswordRequired => 'ใส่รหัสผ่านของคุณ';

  @override
  String get loginIncorrectPassword => 'รหัสผ่านไม่ถูกต้อง โปรดลองอีกครั้ง';

  @override
  String get paywallNoSubscription =>
      'ไม่พบการสมัครสมาชิกที่ใช้งานอยู่ กรุณาซื้อเพื่อดำเนินการต่อ';

  @override
  String get lifetimeThanksTitle => 'ขอบคุณที่อยู่กับเรา';

  @override
  String get lifetimeThanksSubtitle => 'เรามอบสิทธิ์ Pro ตลอดชีพให้คุณ';

  @override
  String get lifetimeThanksGift => 'ของขวัญ';

  @override
  String get lifetimeThanksCta => 'รับสิทธิ์ตลอดชีพ';

  @override
  String get paywallNoInternetTitle => 'ไม่มีการเชื่อมต่ออินเทอร์เน็ต';

  @override
  String get paywallNoInternetBody =>
      'จำเป็นต้องเชื่อมต่ออินเทอร์เน็ตเพื่อเข้าถึงแอปเป็นครั้งแรก โปรดเชื่อมต่อและลองอีกครั้ง';

  @override
  String get paywallStoreUnavailableTitle => 'ร้านค้าไม่พร้อมใช้งาน';

  @override
  String get paywallStoreUnavailableBody =>
      'ไม่สามารถโหลดตัวเลือกการสมัครสมาชิกได้ โปรดลองอีกครั้ง';

  @override
  String get subscriptionVerifyTitle => 'ยืนยันการสมัครสมาชิก';

  @override
  String get subscriptionSoftWarningTitle =>
      'จำเป็นต้องมีการยืนยันการสมัครสมาชิก';

  @override
  String get subscriptionContinueAnyway => 'ดำเนินการต่อ';

  @override
  String subscriptionLastVerified(String date) {
    return 'ตรวจสอบครั้งล่าสุด $date';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'ไม่สามารถยืนยันการสมัครสมาชิกทางออนไลน์ได้';

  @override
  String subscriptionAccessUntil(String date) {
    return 'การเข้าถึงของคุณจะดำเนินต่อไปจนถึง $date — เชื่อมต่อก่อนเวลาดังกล่าวเพื่อยืนยัน';
  }

  @override
  String get subscriptionConnectToVerify =>
      'เชื่อมต่ออินเทอร์เน็ตเพื่อยืนยันการสมัครสมาชิกของคุณ';

  @override
  String get organizeNoDuplicates => 'ไม่พบรายการที่ซ้ำกัน';

  @override
  String get organizeSkippedShownAgain => 'รายการซ้ำที่ข้ามจะแสดงอีกครั้ง';

  @override
  String get organizeShowSkippedTooltip =>
      'แสดงกลุ่มที่ซ้ำกันที่ถูกข้ามอีกครั้ง';

  @override
  String organizeFailedToLoad(String error) {
    return 'ไม่สามารถโหลดกลุ่มที่ซ้ำกัน: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count รายการซ้ำ';
  }

  @override
  String get organizeSubtitlePlaceholder => 'แตะเพื่อดูรายละเอียด';

  @override
  String get organizeConflictMostlyIdentical => 'เหมือนกันเป็นส่วนใหญ่';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count เวอร์ชัน';
  }

  @override
  String get fieldLabelName => 'ชื่อ';

  @override
  String get fieldLabelCompany => 'บริษัท';

  @override
  String get fieldLabelPhone => 'โทรศัพท์';

  @override
  String get fieldLabelEmail => 'อีเมล';

  @override
  String get importErrorUnsupportedSource => 'ไม่สามารถนำเข้าได้ที่นี่';

  @override
  String get importErrorPermissionDenied =>
      'ต้องอนุญาตให้แอปเข้าถึงรายชื่อติดต่อ.';

  @override
  String get importErrorNoContacts => 'ไม่มีผู้ติดต่อให้นำเข้า';

  @override
  String get importErrorUnsupportedFileType =>
      'โปรดเลือกไฟล์ .vcf หรือไฟล์เก็บถาวร .zip';

  @override
  String get importErrorInvalidFile =>
      'ไฟล์ที่เลือกไม่ถูกต้องหรือไม่สามารถอ่านได้';

  @override
  String get importErrorWrongPassword =>
      'รหัสผ่านการเก็บถาวรไม่ถูกต้อง โปรดลองอีกครั้ง';

  @override
  String get importErrorNoVcfInArchive =>
      'ไม่พบไฟล์ .vcf ในไฟล์เก็บถาวรที่เลือก';

  @override
  String importErrorFailed(String detail) {
    return 'นำเข้าผู้ติดต่อไม่สำเร็จ: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'ผู้ติดต่อยังไม่พร้อมใช้งาน';

  @override
  String get exportErrorNoContacts => 'ไม่มีผู้ติดต่อให้ส่งออก';

  @override
  String get exportErrorPasswordRequired =>
      'ต้องใช้รหัสผ่านเพื่อการส่งออกที่มีการป้องกัน';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'การส่งออกที่มีการป้องกันต้องใช้รหัสผ่านที่มีความยาวอย่างน้อย $min อักขระ';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'การส่งออกล้มเหลว: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'เริ่มดาวน์โหลดแล้ว';

  @override
  String get exportNoticeFileSaved => 'บันทึกไฟล์เรียบร้อยแล้ว';

  @override
  String get phoneTypeMobile => 'มือถือ';

  @override
  String get phoneTypeHome => 'บ้าน';

  @override
  String get phoneTypeWork => 'งาน';

  @override
  String get phoneTypeSchool => 'โรงเรียน';

  @override
  String get phoneTypeOther => 'อื่น';

  @override
  String get emailTypePersonal => 'ส่วนตัว';

  @override
  String get emailTypeWork => 'งาน';

  @override
  String get emailTypeSchool => 'โรงเรียน';

  @override
  String get emailTypeOther => 'อื่น';

  @override
  String get addressTypeHome => 'บ้าน';

  @override
  String get addressTypeWork => 'งาน';

  @override
  String get addressTypeSchool => 'โรงเรียน';

  @override
  String get addressTypeBirth => 'การเกิด';

  @override
  String get linkTypeWebsite => 'เว็บไซต์';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'อื่น';

  @override
  String get dateTypeCreated => 'สร้าง';

  @override
  String get dateTypeBirthday => 'วันเกิด';

  @override
  String get dateTypeMet => 'พบกัน';

  @override
  String get dateTypeGraduation => 'การสำเร็จการศึกษา';

  @override
  String get dateTypeMarriage => 'การแต่งงาน';

  @override
  String get dateTypeOther => 'อื่น';

  @override
  String get noNameInList => '(ไม่มีชื่อ)';

  @override
  String get formAddPhone => 'เพิ่มโทรศัพท์';

  @override
  String get formAddEmail => 'เพิ่มอีเมล';

  @override
  String get formAddAddress => 'เพิ่มที่อยู่';

  @override
  String get formAddLink => 'เพิ่มลิงค์';

  @override
  String get formAddDate => 'เพิ่มวันที่';

  @override
  String get formHintPhoneNumber => 'หมายเลขโทรศัพท์';

  @override
  String get formHintEmail => 'อีเมล';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'ที่อยู่';

  @override
  String get formHintSelectDate => 'เลือกวันที่';

  @override
  String get formHintNotes => 'เพิ่มบันทึก';

  @override
  String get formCompany => 'บริษัท';

  @override
  String get formDepartment => 'แผนก';

  @override
  String get formJobTitle => 'ตำแหน่งงาน';

  @override
  String get formPrefix => 'คำนำหน้า';

  @override
  String get formFirstName => 'ชื่อ';

  @override
  String get formMiddleName => 'ชื่อกลาง';

  @override
  String get formLastName => 'นามสกุล';

  @override
  String get formSuffix => 'คำต่อท้าย';

  @override
  String get formNickname => 'ชื่อเล่น';

  @override
  String get contactsListTitle => 'รายชื่อผู้ติดต่อ';

  @override
  String get contactsListEmpty => 'ยังไม่มีผู้ติดต่อ';

  @override
  String get contactsImportButton => 'นำเข้าผู้ติดต่อ';

  @override
  String get mergeContactsTitle => 'รวมผู้ติดต่อ';

  @override
  String get mergeContactsSubtitle => 'เลือกผู้ติดต่อที่จะรวมเป็นหนึ่งเดียว';

  @override
  String get exportPasswordHint => 'รหัสผ่าน';

  @override
  String get exportPasswordConfirmHint => 'ยืนยันรหัสผ่าน';

  @override
  String exportPasswordHelper(int min) {
    return 'อย่างน้อย $min อักขระ';
  }

  @override
  String get zipPasswordHint => 'รหัสผ่านของไฟล์บีบอัด';

  @override
  String get activateDemoAccessCodeLabel => 'รหัสการเข้าถึง';

  @override
  String get subscriptionExpiredTitle => 'การสมัครสมาชิกหมดอายุแล้ว';

  @override
  String get subscriptionExpiredBody => 'ต่ออายุเพื่อใช้ฟีเจอร์ทั้งหมดต่อไป';

  @override
  String get contactsLoadError => 'ไม่สามารถโหลดผู้ติดต่อได้';

  @override
  String get contactsListError => 'ไม่สามารถโหลดผู้ติดต่อได้';

  @override
  String get contactsSearchNoResults => 'ไม่พบผู้ติดต่อ';

  @override
  String get supportPageIntro =>
      'มีคำถาม ข้อเสนอแนะ หรือมีบางอย่างใช้งานไม่ได้? ทีม Savelon อ่านทุกข้อความ';

  @override
  String get supportCtaMessageTeam => 'ส่งข้อความถึงทีม';

  @override
  String get importFromDeviceContacts => 'จากรายชื่อติดต่อของคุณ';

  @override
  String get importFromFileVcfZip => 'จากไฟล์ (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'สร้างรหัสผ่านเฉพาะ';

  @override
  String get exportPasswordIrrecoverableHint => 'รหัสผ่านนี้กู้คืนไม่ได้';

  @override
  String get exportProtectedArchiveCta => 'ส่งออกคลังที่ป้องกันไว้';

  @override
  String get exportIosSavedFileWarning =>
      'ไฟล์นี้ถูกบันทึกในโฟลเดอร์ Savelon หากคุณลบแอป ไฟล์จะถูกลบด้วย ย้ายไปที่อื่นเพื่อเก็บไว้';

  @override
  String importContactsConfirmBody(int count) {
    return 'นำเข้า $count รายชื่อไปยัง Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'ตั้งรหัสผ่าน';

  @override
  String get settingsChangePasswordPageTitle => 'เปลี่ยนรหัสผ่าน';

  @override
  String get settingsRemovePasswordPageTitle => 'ลบรหัสผ่าน';

  @override
  String get settingsNewPasswordLabel => 'รหัสผ่านใหม่';

  @override
  String get settingsConfirmNewPasswordLabel => 'ยืนยันรหัสผ่านใหม่';

  @override
  String get settingsReenterNewPasswordHelper => 'ป้อนรหัสผ่านใหม่อีกครั้ง';

  @override
  String get settingsSetPasswordCta => 'ตั้งรหัสผ่าน';

  @override
  String get settingsChangePasswordCta => 'เปลี่ยนรหัสผ่าน';

  @override
  String get settingsRemovePasswordCta => 'ลบรหัสผ่าน';

  @override
  String get settingsCurrentPasswordLabel => 'รหัสผ่านปัจจุบัน';

  @override
  String get settingsEnterCurrentPasswordHelper => 'ป้อนรหัสผ่านปัจจุบัน';

  @override
  String get settingsNewPasswordMustDiffer =>
      'รหัสผ่านใหม่ต้องไม่เหมือนรหัสปัจจุบัน';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'ตั้งรหัสผ่านไม่สำเร็จ: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'เปลี่ยนรหัสผ่านไม่สำเร็จ: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'ลบรหัสผ่านไม่สำเร็จ: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'รหัสผ่านไม่ถูกต้อง';

  @override
  String get settingsCurrentPasswordIncorrect => 'รหัสผ่านปัจจุบันไม่ถูกต้อง';

  @override
  String get settingsCurrentPasswordRequired => 'ต้องระบุรหัสผ่านปัจจุบัน';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'ต้องมีรหัสผ่านเมื่อเปิดการป้องกันด้วยรหัสผ่าน';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'ต้องมีรหัสผ่านเมื่อเปิดตัวเลือกรหัสผ่าน';

  @override
  String get authPasswordRequiredForAccount => 'บัญชีนี้ต้องใช้รหัสผ่าน';
}

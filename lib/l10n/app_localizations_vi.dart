// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Danh bạ được mã hóa';

  @override
  String get navContacts => 'Danh bạ';

  @override
  String get navOrganize => 'Tổ chức';

  @override
  String get navSupport => 'Hỗ trợ';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSystemDefault => 'Mặc định hệ thống';

  @override
  String get organizeTitle => 'Tổ chức';

  @override
  String get supportTitle => 'Hỗ trợ';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get commonCancel => 'Hủy bỏ';

  @override
  String get commonDelete => 'Xóa bỏ';

  @override
  String get commonSave => 'Lưu';

  @override
  String get commonEdit => 'Chỉnh sửa';

  @override
  String get commonMerge => 'Hợp nhất';

  @override
  String get commonSkip => 'Bỏ qua';

  @override
  String get commonRetry => 'Thử lại';

  @override
  String get commonClose => 'Đóng';

  @override
  String get commonNext => 'Kế tiếp';

  @override
  String get commonBack => 'Quay lại';

  @override
  String get commonYes => 'Đúng';

  @override
  String get commonNo => 'Không';

  @override
  String get commonContinue => 'Tiếp tục';

  @override
  String get commonTryAgain => 'Thử lại';

  @override
  String get commonApply => 'Áp dụng';

  @override
  String get commonDiscard => 'Loại bỏ';

  @override
  String get commonUnlock => 'Mở khóa';

  @override
  String get commonLoading => 'Đang tải...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Lỗi: $error';
  }

  @override
  String get brandSlogan => 'Danh bạ của bạn. Của riêng bạn.';

  @override
  String get contactNotFound => 'Không tìm thấy liên hệ';

  @override
  String get contactDeleted => 'Đã xóa liên hệ';

  @override
  String get contactUpdated => 'Đã cập nhật liên hệ';

  @override
  String get contactSaved => 'Đã lưu liên hệ';

  @override
  String get contactsMerged => 'Đã hợp nhất các liên hệ';

  @override
  String get deleteContactTitle => 'Xóa liên hệ';

  @override
  String deleteContactConfirm(String name) {
    return 'Bạn có chắc chắn muốn xóa $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Bạn có chắc chắn muốn xóa \"$name\" không?';
  }

  @override
  String failedToDelete(String error) {
    return 'Không xóa được: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Không cập nhật được: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Không lưu được: $error';
  }

  @override
  String get noName => 'Không có tên';

  @override
  String get noNameTitle => 'Không có tên';

  @override
  String get noNameBody => 'Liên hệ này không có tên. Vẫn lưu?';

  @override
  String get discardChangesTitle => 'Hủy thay đổi?';

  @override
  String get discardChangesBody =>
      'Bạn có những thay đổi chưa được lưu sẽ bị mất.';

  @override
  String get newContact => 'Liên hệ mới';

  @override
  String get editContact => 'Chỉnh sửa liên hệ';

  @override
  String get addMore => 'Thêm nhiều hơn nữa';

  @override
  String get addNameFieldsTitle => 'Thêm trường tên';

  @override
  String get call => 'Gọi';

  @override
  String get sendEmail => 'Gửi email';

  @override
  String get copy => 'Sao chép';

  @override
  String get visit => 'Truy cập';

  @override
  String get copiedToClipboard => 'Đã sao chép vào bảng nhớ tạm';

  @override
  String get importContacts => 'Nhập danh bạ';

  @override
  String get importing => 'Đang nhập...';

  @override
  String importedCount(int count) {
    return 'Đã nhập liên hệ $count';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Đã nhập liên hệ $imported, $skipped bị bỏ qua';
  }

  @override
  String get failedToImportContacts => 'Không thể nhập danh bạ';

  @override
  String get noContactsToImport => 'Không có liên hệ nào để nhập.';

  @override
  String get contactsPermissionRequiredImport =>
      'Cần có quyền liên hệ để nhập danh bạ';

  @override
  String get importDialogTitle => 'Nhập danh bạ';

  @override
  String get importDialogBody => 'Nhập danh bạ từ thiết bị hoặc tệp của bạn?';

  @override
  String get importSourceTitle => 'Nhập';

  @override
  String get importZipPasswordTitle => 'Mật khẩu tệp nén';

  @override
  String get importZipPasswordChecking => 'Đang kiểm tra...';

  @override
  String get exportContacts => 'Xuất danh bạ';

  @override
  String get unlockPro => 'Mở khóa Pro';

  @override
  String get exportContactsTitle => 'Xuất danh bạ';

  @override
  String get exportSubtitle => 'Chọn cách bạn muốn lưu danh bạ của mình.';

  @override
  String get exportFormatVcfTitle => 'Lưu dưới dạng .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Một tệp hoạt động với Danh bạ Apple, Danh bạ Google, v.v.';

  @override
  String get exportFormatZipTitle =>
      'Lưu vào kho lưu trữ được bảo vệ bằng mật khẩu';

  @override
  String get exportFormatZipSubtitle =>
      '.zip có .vcf bên trong - yêu cầu mật khẩu để mở nó.';

  @override
  String get exportProtectedTitle => 'Xuất được bảo vệ';

  @override
  String get exportCompleteTitle => 'Xuất hoàn tất';

  @override
  String get stillLoadingContacts => 'Vẫn đang tải danh bạ. Vui lòng chờ.';

  @override
  String get couldNotLoadContacts => 'Không thể tải danh bạ.';

  @override
  String get passwordChangedSuccess => 'Đã thay đổi mật khẩu thành công';

  @override
  String get passwordProtectionEnabled =>
      'Đã bật bảo vệ bằng mật khẩu thành công';

  @override
  String get passwordProtectionRemoved => 'Đã xóa thành công mật khẩu bảo vệ';

  @override
  String get removePasswordProtectionButton => 'Xóa bảo vệ bằng mật khẩu';

  @override
  String get changePasswordTitle => 'Thay đổi mật khẩu';

  @override
  String get setPasswordTitle => 'Đặt mật khẩu';

  @override
  String get passwordSettingsChangeTitle => 'Thay đổi mật khẩu';

  @override
  String get passwordSettingsSetTitle => 'Đặt mật khẩu';

  @override
  String get privacyPolicy => 'Chính sách riêng tư';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Không mở được chính sách quyền riêng tư: $error';
  }

  @override
  String get resetAppTitle => 'Xoá mọi thông tin';

  @override
  String get resetAppConfirmTitle => 'Xóa tất cả danh bạ và đặt lại ứng dụng?';

  @override
  String get resetAppCannotUndo => 'Việc này không thể hoàn tác được';

  @override
  String resetAppError(String error) {
    return 'Lỗi đặt lại ứng dụng: $error';
  }

  @override
  String get photoPickerNewImage => 'Chọn hình ảnh mới';

  @override
  String get photoPickerRemoveImage => 'Xóa hình ảnh';

  @override
  String get onboardingHeadline1 => 'Ai có thể truy cập danh bạ của bạn?';

  @override
  String get onboardingSubline1 =>
      'Một số ứng dụng tải chúng lên đám mây. Điều này có thể tạo ra nhiều rủi ro về quyền riêng tư hơn.';

  @override
  String get onboardingHeadline2 =>
      'Nhiều ứng dụng yêu cầu quyền truy cập liên hệ';

  @override
  String get onboardingSubline2 =>
      'Nó có thể hữu ích — nhưng những liên hệ quan trọng nên được giữ kín.';

  @override
  String get onboardingHeadline3 => 'Giữ các liên hệ nhạy cảm riêng biệt';

  @override
  String get onboardingSubline3 =>
      'Chúng tôi khuyên bạn nên lưu trữ các liên hệ quan trọng và hiếm khi được sử dụng bên ngoài ứng dụng danh bạ chính của mình.';

  @override
  String get onboardingHeadline4 => 'Bảo vệ các liên hệ quan trọng của bạn';

  @override
  String get onboardingSubline4 =>
      'Savelon lưu trữ chúng trên thiết bị của bạn, được mã hóa và riêng tư khỏi các ứng dụng khác.';

  @override
  String get onboardingGetStarted => 'Bắt đầu';

  @override
  String get onboardingNext => 'Kế tiếp';

  @override
  String get activateDemoTitle => 'Kích hoạt bản demo';

  @override
  String get activateDemoCancel => 'Hủy bỏ';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Bây giờ bạn có quyền truy cập demo cho đến $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Thêm mật khẩu bảo vệ';

  @override
  String get setupPasswordMismatch => 'Mật khẩu không khớp';

  @override
  String get setupPasswordFailedSeed =>
      'Không thể tạo hạt giống. Vui lòng thử lại.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Không khởi tạo được. Lỗi: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Danh bạ của bạn sẽ vẫn được mã hóa mạnh bằng một khóa bí mật dài, chỉ được lưu trữ trên thiết bị của bạn. Nhưng mật khẩu bổ sung thêm sự bảo vệ.';

  @override
  String get setupPasswordLabel => 'Mật khẩu';

  @override
  String get setupPasswordConfirmLabel => 'Xác nhận mật khẩu';

  @override
  String get setupPasswordWarning =>
      'Mật khẩu này không thể phục hồi được. Hãy viết nó ra và giữ nó an toàn!';

  @override
  String get setupPasswordPageTitle => 'Tạo mật khẩu';

  @override
  String get setupPasswordNext => 'Kế tiếp';

  @override
  String get setupPasswordSkip => 'Bỏ qua';

  @override
  String get confirmationCheckboxTitle =>
      'Tôi hiểu mật khẩu của tôi không thể lấy lại được';

  @override
  String get loginWelcomeBack => 'Chào mừng trở lại';

  @override
  String get loginPasswordLabel => 'Mật khẩu';

  @override
  String get loginUnlock => 'Mở khóa';

  @override
  String get loginPasswordRequired => 'Nhập mật khẩu của bạn';

  @override
  String get loginIncorrectPassword =>
      'Mật khẩu không chính xác. Vui lòng thử lại.';

  @override
  String get paywallNoSubscription =>
      'Không tìm thấy đăng ký hoạt động. Vui lòng mua để tiếp tục.';

  @override
  String get lifetimeThanksTitle => 'Cảm ơn bạn đã đồng hành cùng chúng tôi';

  @override
  String get lifetimeThanksSubtitle =>
      'Chúng tôi tặng bạn quyền truy cập Pro trọn đời';

  @override
  String get lifetimeThanksGift => 'quà tặng';

  @override
  String get lifetimeThanksCta => 'Nhận quyền truy cập trọn đời';

  @override
  String get paywallNoInternetTitle => 'Không có kết nối Internet';

  @override
  String get paywallNoInternetBody =>
      'Cần có kết nối internet để truy cập ứng dụng lần đầu tiên. Vui lòng kết nối và thử lại.';

  @override
  String get paywallStoreUnavailableTitle => 'Cửa hàng không có sẵn';

  @override
  String get paywallStoreUnavailableBody =>
      'Không thể tải tùy chọn đăng ký. Vui lòng thử lại.';

  @override
  String get subscriptionVerifyTitle => 'Xác minh đăng ký';

  @override
  String get subscriptionSoftWarningTitle => 'Cần xác minh đăng ký';

  @override
  String get subscriptionContinueAnyway => 'Vẫn tiếp tục';

  @override
  String subscriptionLastVerified(String date) {
    return 'Đã xác minh lần cuối $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Đăng ký không thể được xác minh trực tuyến.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Quyền truy cập của bạn tiếp tục cho đến $date — hãy kết nối trước đó để xác minh.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Kết nối với Internet để xác minh đăng ký của bạn.';

  @override
  String get organizeNoDuplicates =>
      'Không tìm thấy thông tin liên lạc bị trùng';

  @override
  String get organizeSkippedShownAgain =>
      'Các bản sao bị bỏ qua sẽ được hiển thị lại.';

  @override
  String get organizeShowSkippedTooltip =>
      'Hiển thị lại các nhóm trùng lặp bị bỏ qua';

  @override
  String organizeFailedToLoad(String error) {
    return 'Không thể tải các nhóm trùng lặp: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count bản trùng lặp';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Nhấn để xem chi tiết';

  @override
  String get organizeConflictMostlyIdentical => 'Hầu hết giống hệt nhau';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: các biến thể $count';
  }

  @override
  String get fieldLabelName => 'tên';

  @override
  String get fieldLabelCompany => 'công ty';

  @override
  String get fieldLabelPhone => 'điện thoại';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource => 'Không thể nhập tại đây.';

  @override
  String get importErrorPermissionDenied =>
      'Cần có quyền liên hệ để nhập danh bạ.';

  @override
  String get importErrorNoContacts => 'Không có liên hệ nào để nhập.';

  @override
  String get importErrorUnsupportedFileType =>
      'Vui lòng chọn tệp .vcf hoặc kho lưu trữ .zip.';

  @override
  String get importErrorInvalidFile =>
      'Tệp đã chọn không hợp lệ hoặc không thể đọc được.';

  @override
  String get importErrorWrongPassword =>
      'Mật khẩu lưu trữ không chính xác. Vui lòng thử lại.';

  @override
  String get importErrorNoVcfInArchive =>
      'Không tìm thấy tệp .vcf nào trong kho lưu trữ đã chọn.';

  @override
  String importErrorFailed(String detail) {
    return 'Không nhập được danh bạ: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => 'Danh bạ vẫn chưa có sẵn.';

  @override
  String get exportErrorNoContacts => 'Không có địa chỉ liên hệ nào để xuất.';

  @override
  String get exportErrorPasswordRequired =>
      'Cần có mật khẩu để xuất được bảo vệ.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Xuất được bảo vệ yêu cầu mật khẩu có ít nhất $min ký tự.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Xuất không thành công: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Đã bắt đầu tải xuống.';

  @override
  String get exportNoticeFileSaved => 'Tệp đã được lưu thành công.';

  @override
  String get phoneTypeMobile => 'di động';

  @override
  String get phoneTypeHome => 'Nhà';

  @override
  String get phoneTypeWork => 'công việc';

  @override
  String get phoneTypeSchool => 'trường học';

  @override
  String get phoneTypeOther => 'khác';

  @override
  String get emailTypePersonal => 'riêng tư';

  @override
  String get emailTypeWork => 'công việc';

  @override
  String get emailTypeSchool => 'trường học';

  @override
  String get emailTypeOther => 'khác';

  @override
  String get addressTypeHome => 'Trang chủ';

  @override
  String get addressTypeWork => 'Công việc';

  @override
  String get addressTypeSchool => 'Trường học';

  @override
  String get addressTypeBirth => 'sinh';

  @override
  String get linkTypeWebsite => 'Trang web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Khác';

  @override
  String get dateTypeCreated => 'Tạo';

  @override
  String get dateTypeBirthday => 'Sinh nhật';

  @override
  String get dateTypeMet => 'Đã gặp';

  @override
  String get dateTypeGraduation => 'Tốt nghiệp';

  @override
  String get dateTypeMarriage => 'Kết hôn';

  @override
  String get dateTypeOther => 'Khác';

  @override
  String get noNameInList => '(Không có tên)';

  @override
  String get formAddPhone => 'Thêm điện thoại';

  @override
  String get formAddEmail => 'Thêm email';

  @override
  String get formAddAddress => 'Thêm địa chỉ';

  @override
  String get formAddLink => 'Thêm địa chỉ web';

  @override
  String get formAddDate => 'Thêm ngày';

  @override
  String get formHintPhoneNumber => 'Số điện thoại';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Địa chỉ';

  @override
  String get formHintSelectDate => 'Chọn ngày';

  @override
  String get formHintNotes => 'Thêm ghi chú';

  @override
  String get formCompany => 'Công ty';

  @override
  String get formDepartment => 'Phòng';

  @override
  String get formJobTitle => 'Chức danh';

  @override
  String get formPrefix => 'Tiền tố';

  @override
  String get formFirstName => 'Tên';

  @override
  String get formMiddleName => 'Tên đệm';

  @override
  String get formLastName => 'Họ';

  @override
  String get formSuffix => 'Hậu tố';

  @override
  String get formNickname => 'Biệt danh';

  @override
  String get contactsListTitle => 'Danh bạ';

  @override
  String get contactsListEmpty => 'Chưa có liên hệ nào';

  @override
  String get contactsImportButton => 'Nhập danh bạ';

  @override
  String get mergeContactsTitle => 'Hợp nhất danh bạ';

  @override
  String get mergeContactsSubtitle => 'Chọn liên hệ để hợp nhất thành một';

  @override
  String get exportPasswordHint => 'Mật khẩu';

  @override
  String get exportPasswordConfirmHint => 'Xác nhận mật khẩu';

  @override
  String exportPasswordHelper(int min) {
    return 'Ít nhất $min ký tự';
  }

  @override
  String get zipPasswordHint => 'Mật khẩu tệp nén';

  @override
  String get activateDemoAccessCodeLabel => 'Mã truy cập';

  @override
  String get subscriptionExpiredTitle => 'Đăng ký đã hết hạn';

  @override
  String get subscriptionExpiredBody =>
      'Gia hạn để tiếp tục sử dụng tất cả các tính năng.';

  @override
  String get contactsLoadError => 'Không thể tải danh bạ.';

  @override
  String get contactsListError => 'Không thể tải danh bạ.';

  @override
  String get contactsSearchNoResults => 'Không tìm thấy liên hệ';

  @override
  String get supportPageIntro =>
      'Câu hỏi, phản hồi hoặc có gì không hoạt động? Đội ngũ Savelon đọc mọi tin nhắn từ bạn.';

  @override
  String get supportCtaMessageTeam => 'Nhắn cho đội ngũ';

  @override
  String get importFromDeviceContacts => 'Từ danh bạ của bạn';

  @override
  String get importFromFileVcfZip => 'Từ tệp (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Tạo mật khẩu duy nhất';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Mật khẩu này không thể khôi phục.';

  @override
  String get exportProtectedArchiveCta => 'Xuất kho lưu trữ được bảo vệ';

  @override
  String get exportIosSavedFileWarning =>
      'Tệp này được lưu trong thư mục Savelon. Nếu bạn xóa ứng dụng, tệp cũng sẽ bị xóa. Di chuyển sang vị trí khác để giữ lại.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Nhập $count liên hệ vào Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Đặt mật khẩu';

  @override
  String get settingsChangePasswordPageTitle => 'Đổi mật khẩu';

  @override
  String get settingsRemovePasswordPageTitle => 'Xóa mật khẩu';

  @override
  String get settingsNewPasswordLabel => 'Mật khẩu mới';

  @override
  String get settingsConfirmNewPasswordLabel => 'Xác nhận mật khẩu mới';

  @override
  String get settingsReenterNewPasswordHelper => 'Nhập lại mật khẩu mới';

  @override
  String get settingsSetPasswordCta => 'Đặt mật khẩu';

  @override
  String get settingsChangePasswordCta => 'Đổi mật khẩu';

  @override
  String get settingsRemovePasswordCta => 'Xóa mật khẩu';

  @override
  String get settingsCurrentPasswordLabel => 'Mật khẩu hiện tại';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Nhập mật khẩu hiện tại';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Mật khẩu mới phải khác mật khẩu hiện tại';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Không thể đặt mật khẩu: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Không thể đổi mật khẩu: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Không thể xóa mật khẩu: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Mật khẩu không hợp lệ';

  @override
  String get settingsCurrentPasswordIncorrect => 'Mật khẩu hiện tại không đúng';

  @override
  String get settingsCurrentPasswordRequired => 'Cần nhập mật khẩu hiện tại';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Cần mật khẩu khi bật bảo vệ bằng mật khẩu';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Cần mật khẩu khi bật tùy chọn mật khẩu';

  @override
  String get authPasswordRequiredForAccount => 'Cần mật khẩu cho tài khoản này';
}

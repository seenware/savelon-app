// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => '암호화된 연락처';

  @override
  String get navContacts => '연락처';

  @override
  String get navOrganize => '정리';

  @override
  String get navSupport => '지원';

  @override
  String get navSettings => '설정';

  @override
  String get settingsTitle => '설정';

  @override
  String get language => '언어';

  @override
  String get languageSystemDefault => '시스템 기본값';

  @override
  String get organizeTitle => '정리';

  @override
  String get supportTitle => '지원';

  @override
  String get search => '검색';

  @override
  String get commonCancel => '취소';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonSave => '저장';

  @override
  String get commonEdit => '편집';

  @override
  String get commonMerge => '병합';

  @override
  String get commonSkip => '건너뛰기';

  @override
  String get commonRetry => '다시 시도';

  @override
  String get commonClose => '닫기';

  @override
  String get commonNext => '다음';

  @override
  String get commonBack => '돌아가기';

  @override
  String get commonYes => '예';

  @override
  String get commonNo => '아니요';

  @override
  String get commonContinue => '계속';

  @override
  String get commonTryAgain => '다시 시도';

  @override
  String get commonApply => '적용';

  @override
  String get commonDiscard => '버리다';

  @override
  String get commonUnlock => '잠금 해제';

  @override
  String get commonLoading => '로드 중...';

  @override
  String commonErrorWithDetails(String error) {
    return '오류: $error';
  }

  @override
  String get brandSlogan => '귀하의 연락처. 당신만의 것.';

  @override
  String get contactNotFound => '연락처를 찾을 수 없습니다';

  @override
  String get contactDeleted => '연락처가 삭제되었습니다.';

  @override
  String get contactUpdated => '연락처가 업데이트되었습니다.';

  @override
  String get contactSaved => '연락처가 저장되었습니다';

  @override
  String get contactsMerged => '연락처가 병합되었습니다.';

  @override
  String get deleteContactTitle => '연락처 삭제';

  @override
  String deleteContactConfirm(String name) {
    return '$name을 삭제하시겠습니까?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '정말로 \'$name\'을 삭제하시겠습니까?';
  }

  @override
  String failedToDelete(String error) {
    return '삭제 실패: $error';
  }

  @override
  String failedToUpdate(String error) {
    return '업데이트 실패: $error';
  }

  @override
  String failedToSave(String error) {
    return '저장 실패: $error';
  }

  @override
  String get noName => '이름 없음';

  @override
  String get noNameTitle => '이름 없음';

  @override
  String get noNameBody => '이 연락처에는 이름이 없습니다. 저장하시겠습니까?';

  @override
  String get discardChangesTitle => '변경사항을 취소하시겠습니까?';

  @override
  String get discardChangesBody => '저장되지 않은 변경사항은 손실됩니다.';

  @override
  String get newContact => '새 연락처';

  @override
  String get editContact => '연락처 편집';

  @override
  String get addMore => '더 추가';

  @override
  String get addNameFieldsTitle => '이름 필드 추가';

  @override
  String get call => '통화';

  @override
  String get sendEmail => '이메일 보내기';

  @override
  String get copy => '복사';

  @override
  String get visit => '방문';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get importContacts => '연락처 가져오기';

  @override
  String get importing => '가져오는 중...';

  @override
  String importedCount(int count) {
    return '$count 연락처를 가져왔습니다.';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported 연락처를 가져왔고, $skipped 연락처를 건너뛰었습니다.';
  }

  @override
  String get failedToImportContacts => '연락처를 가져오지 못했습니다.';

  @override
  String get noContactsToImport => '가져올 연락처가 없습니다.';

  @override
  String get contactsPermissionRequiredImport => '연락처를 가져오려면 연락처 권한이 필요합니다.';

  @override
  String get importDialogTitle => '연락처 가져오기';

  @override
  String get importDialogBody => '장치 또는 파일에서 연락처를 가져오시겠습니까?';

  @override
  String get importSourceTitle => '가져오기';

  @override
  String get importZipPasswordTitle => '아카이브 비밀번호';

  @override
  String get importZipPasswordChecking => '확인 중...';

  @override
  String get exportContacts => '연락처 내보내기';

  @override
  String get unlockPro => 'Pro 잠금 해제';

  @override
  String get exportContactsTitle => '연락처 내보내기';

  @override
  String get exportSubtitle => '연락처를 저장할 방법을 선택하세요.';

  @override
  String get exportFormatVcfTitle => '.vcf로 저장';

  @override
  String get exportFormatVcfSubtitle =>
      'Apple 연락처, Google 연락처 등과 함께 작동하는 하나의 파일입니다.';

  @override
  String get exportFormatZipTitle => '비밀번호로 보호된 아카이브에 저장';

  @override
  String get exportFormatZipSubtitle => '.vcf이 포함된 .zip — 열려면 비밀번호가 필요합니다.';

  @override
  String get exportProtectedTitle => '보호된 내보내기';

  @override
  String get exportCompleteTitle => '내보내기 완료';

  @override
  String get stillLoadingContacts => '연락처를 로드하는 중입니다. 기다리세요.';

  @override
  String get couldNotLoadContacts => '연락처를 로드할 수 없습니다.';

  @override
  String get passwordChangedSuccess => '비밀번호가 성공적으로 변경되었습니다.';

  @override
  String get passwordProtectionEnabled => '비밀번호 보호가 활성화되었습니다.';

  @override
  String get passwordProtectionRemoved => '비밀번호 보호가 성공적으로 제거되었습니다.';

  @override
  String get removePasswordProtectionButton => '비밀번호 보호 제거';

  @override
  String get changePasswordTitle => '비밀번호 변경';

  @override
  String get setPasswordTitle => '비밀번호 설정';

  @override
  String get passwordSettingsChangeTitle => '비밀번호 변경';

  @override
  String get passwordSettingsSetTitle => '비밀번호 설정';

  @override
  String get privacyPolicy => '개인 정보 보호 정책';

  @override
  String privacyPolicyOpenFailed(String error) {
    return '개인정보 보호정책을 열지 못했습니다: $error';
  }

  @override
  String get resetAppTitle => '앱 재설정';

  @override
  String get resetAppConfirmTitle => '연락처를 모두 삭제하고 앱을 재설정하시겠습니까?';

  @override
  String get resetAppCannotUndo => '이 작업은 취소할 수 없습니다.';

  @override
  String resetAppError(String error) {
    return '앱 재설정 오류: $error';
  }

  @override
  String get photoPickerNewImage => '새 이미지 선택';

  @override
  String get photoPickerRemoveImage => '이미지 삭제';

  @override
  String get onboardingHeadline1 => '누가 귀하의 연락처에 액세스할 수 있나요?';

  @override
  String get onboardingSubline1 =>
      '일부 앱은 이를 클라우드에 업로드합니다. 이로 인해 더 많은 개인 정보 보호 위험이 발생할 수 있습니다.';

  @override
  String get onboardingHeadline2 => '많은 앱에서 연락처 액세스를 요청합니다.';

  @override
  String get onboardingSubline2 => '유용할 수 있지만 중요한 연락처는 비공개로 유지되어야 합니다.';

  @override
  String get onboardingHeadline3 => '민감한 연락처를 별도로 보관하세요';

  @override
  String get onboardingSubline3 =>
      '중요하고 거의 사용하지 않는 연락처를 기본 연락처 앱 외부에 저장하는 것이 좋습니다.';

  @override
  String get onboardingHeadline4 => '중요한 연락처를 보호하세요';

  @override
  String get onboardingSubline4 =>
      'Savelon은 연락처를 기기에 저장하며, 암호화되어 다른 앱으로부터 비공개로 유지됩니다.';

  @override
  String get onboardingGetStarted => '시작하기';

  @override
  String get onboardingNext => '다음';

  @override
  String get activateDemoTitle => '데모 활성화';

  @override
  String get activateDemoCancel => '취소';

  @override
  String demoAccessGranted(String dateTime) {
    return '이제 $dateTime까지 데모에 액세스할 수 있습니다.';
  }

  @override
  String get setupPasswordTitle => '비밀번호 보호 추가';

  @override
  String get setupPasswordShortError => '4자 이상 사용하세요';

  @override
  String get setupPasswordMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get setupPasswordFailedSeed => '시드를 생성하지 못했습니다. 다시 시도해 주세요.';

  @override
  String setupPasswordFailedInit(String error) {
    return '초기화하지 못했습니다. 오류: $error';
  }

  @override
  String get setupPasswordInfo =>
      '연락처는 기기에만 저장되는 긴 비밀 키로 강하게 암호화됩니다. 비밀번호는 여기에 더해지는 추가 보호입니다.';

  @override
  String get setupPasswordLabel => '비밀번호';

  @override
  String get setupPasswordHelper => '최소 4자 이상';

  @override
  String get setupPasswordConfirmLabel => '비밀번호 확인';

  @override
  String get setupPasswordWarning => '이 비밀번호는 복구할 수 없습니다. 꼭 적어서 보관하세요!';

  @override
  String get setupPasswordPageTitle => '비밀번호 생성';

  @override
  String get setupPasswordNext => '다음';

  @override
  String get setupPasswordSkip => '건너뛰기';

  @override
  String get confirmationCheckboxTitle => '내 비밀번호를 복구할 수 없음을 이해합니다.';

  @override
  String get loginWelcomeBack => '돌아온 것을 환영합니다';

  @override
  String get loginPasswordLabel => '비밀번호';

  @override
  String get loginUnlock => '잠금 해제';

  @override
  String get loginPasswordRequired => '비밀번호를 입력하세요';

  @override
  String get loginIncorrectPassword => '잘못된 비밀번호입니다. 다시 시도해 주세요.';

  @override
  String get paywallNoSubscription => '활성 구독을 찾을 수 없습니다. 계속하려면 구매하세요.';

  @override
  String get lifetimeThanksTitle => '함께해 주셔서 감사합니다';

  @override
  String get lifetimeThanksSubtitle => '평생 Pro 이용권을 선물해 드립니다';

  @override
  String get lifetimeThanksGift => '선물';

  @override
  String get lifetimeThanksCta => '평생 이용권 받기';

  @override
  String get paywallNoInternetTitle => '인터넷에 연결되어 있지 않음';

  @override
  String get paywallNoInternetBody =>
      '처음으로 앱에 액세스하려면 인터넷 연결이 필요합니다. 연결한 후 다시 시도해 주세요.';

  @override
  String get paywallStoreUnavailableTitle => '스토어를 사용할 수 없음';

  @override
  String get paywallStoreUnavailableBody => '구독 옵션을 로드할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get subscriptionVerifyTitle => '구독 확인';

  @override
  String get subscriptionSoftWarningTitle => '구독 확인이 필요함';

  @override
  String get subscriptionContinueAnyway => '계속 진행';

  @override
  String subscriptionLastVerified(String date) {
    return '마지막으로 확인된 날짜는 $date입니다.';
  }

  @override
  String get subscriptionNotVerifiedOnline => '온라인으로 구독을 확인할 수 없습니다.';

  @override
  String subscriptionAccessUntil(String date) {
    return '액세스는 $date까지 계속됩니다. 그 전에 연결하여 확인하세요.';
  }

  @override
  String get subscriptionConnectToVerify => '구독을 확인하려면 인터넷에 연결하세요.';

  @override
  String get organizeNoDuplicates => '잠재적인 중복 항목이 발견되지 않았습니다.';

  @override
  String get organizeSkippedShownAgain => '건너뛴 중복 항목이 다시 표시됩니다.';

  @override
  String get organizeShowSkippedTooltip => '건너뛴 중복 그룹을 다시 표시';

  @override
  String organizeFailedToLoad(String error) {
    return '중복 그룹을 로드하지 못했습니다: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count개 중복';
  }

  @override
  String get organizeSubtitlePlaceholder => '세부정보를 보려면 탭하세요.';

  @override
  String get organizeConflictMostlyIdentical => '대부분 동일';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count 변형';
  }

  @override
  String get fieldLabelName => '이름';

  @override
  String get fieldLabelCompany => '회사';

  @override
  String get fieldLabelPhone => '전화';

  @override
  String get fieldLabelEmail => '이메일';

  @override
  String get importErrorUnsupportedSource => '여기서는 가져오기를 사용할 수 없습니다.';

  @override
  String get importErrorPermissionDenied => '연락처를 가져오려면 연락처 권한이 필요합니다.';

  @override
  String get importErrorNoContacts => '가져올 연락처가 없습니다.';

  @override
  String get importErrorUnsupportedFileType => '.vcf 파일 또는 .zip 아카이브를 선택하세요.';

  @override
  String get importErrorInvalidFile => '선택한 파일이 잘못되었거나 읽을 수 없습니다.';

  @override
  String get importErrorWrongPassword => '잘못된 아카이브 비밀번호입니다. 다시 시도해 주세요.';

  @override
  String get importErrorNoVcfInArchive => '선택한 아카이브에서 .vcf 파일을 찾을 수 없습니다.';

  @override
  String importErrorFailed(String detail) {
    return '연락처 가져오기 실패: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => '아직 연락처를 사용할 수 없습니다.';

  @override
  String get exportErrorNoContacts => '내보낼 연락처가 없습니다.';

  @override
  String get exportErrorPasswordRequired => '보호된 내보내기를 위해서는 비밀번호가 필요합니다.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return '보호된 내보내기에는 최소 $min 문자의 비밀번호가 필요합니다.';
  }

  @override
  String exportErrorFailed(String detail) {
    return '내보내기 실패: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => '다운로드가 시작되었습니다.';

  @override
  String get exportNoticeFileSaved => '파일이 성공적으로 저장되었습니다.';

  @override
  String get phoneTypeMobile => '휴대전화';

  @override
  String get phoneTypeHome => '집';

  @override
  String get phoneTypeWork => '직장';

  @override
  String get phoneTypeSchool => '학교';

  @override
  String get phoneTypeOther => '다른';

  @override
  String get emailTypePersonal => '개인의';

  @override
  String get emailTypeWork => '직장';

  @override
  String get emailTypeSchool => '학교';

  @override
  String get emailTypeOther => '다른';

  @override
  String get addressTypeHome => '집';

  @override
  String get addressTypeWork => '직장';

  @override
  String get addressTypeSchool => '학교';

  @override
  String get addressTypeBirth => '출생';

  @override
  String get linkTypeWebsite => '웹사이트';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => '다른';

  @override
  String get dateTypeCreated => '생성됨';

  @override
  String get dateTypeBirthday => '생일';

  @override
  String get dateTypeMet => '만난';

  @override
  String get dateTypeGraduation => '졸업';

  @override
  String get dateTypeMarriage => '결혼';

  @override
  String get dateTypeOther => '다른';

  @override
  String get noNameInList => '(이름 없음)';

  @override
  String get formAddPhone => '전화 추가';

  @override
  String get formAddEmail => '이메일 추가';

  @override
  String get formAddAddress => '주소 추가';

  @override
  String get formAddLink => '링크 추가';

  @override
  String get formAddDate => '날짜 추가';

  @override
  String get formHintPhoneNumber => '전화 번호';

  @override
  String get formHintEmail => '이메일';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => '주소';

  @override
  String get formHintSelectDate => '날짜 선택';

  @override
  String get formHintNotes => '메모 추가';

  @override
  String get formCompany => '회사';

  @override
  String get formDepartment => '부서';

  @override
  String get formJobTitle => '직위';

  @override
  String get formPrefix => '접두사';

  @override
  String get formFirstName => '이름';

  @override
  String get formMiddleName => '중간 이름';

  @override
  String get formLastName => '성';

  @override
  String get formSuffix => '접미사';

  @override
  String get formNickname => '별명';

  @override
  String get contactsListTitle => '연락처';

  @override
  String get contactsListEmpty => '아직 연락처가 없습니다.';

  @override
  String get contactsImportButton => '연락처 가져오기';

  @override
  String get mergeContactsTitle => '연락처 병합';

  @override
  String get mergeContactsSubtitle => '하나로 병합할 연락처를 선택하세요.';

  @override
  String get exportPasswordHint => '비밀번호';

  @override
  String get exportPasswordConfirmHint => '비밀번호 확인';

  @override
  String exportPasswordHelper(int min) {
    return '최소 $min자 이상';
  }

  @override
  String get zipPasswordHint => '아카이브 비밀번호';

  @override
  String get activateDemoAccessCodeLabel => '액세스 코드';

  @override
  String get subscriptionExpiredTitle => '구독이 만료되었습니다';

  @override
  String get subscriptionExpiredBody => '모든 기능을 계속 사용하려면 갱신하세요.';

  @override
  String get contactsLoadError => '연락처를 로드할 수 없습니다.';

  @override
  String get contactsListError => '연락처를 로드할 수 없습니다.';

  @override
  String get contactsSearchNoResults => '연락처를 찾을 수 없음';

  @override
  String get supportPageIntro => '질문, 피드백 또는 문제가 있나요? Savelon 팀이 모든 메시지를 읽습니다.';

  @override
  String get supportCtaMessageTeam => '팀에 메시지 보내기';

  @override
  String get importFromDeviceContacts => '내 연락처에서';

  @override
  String get importFromFileVcfZip => '파일에서(VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => '고유 비밀번호 만들기';

  @override
  String get exportPasswordIrrecoverableHint => '이 비밀번호는 복구할 수 없습니다.';

  @override
  String get exportProtectedArchiveCta => '보호된 보관함 내보내기';

  @override
  String get exportIosSavedFileWarning =>
      '이 파일은 Savelon 폴더에 저장됩니다. 앱을 삭제하면 파일도 삭제됩니다. 보관하려면 다른 위치로 옮기세요.';

  @override
  String importContactsConfirmBody(int count) {
    return '연락처 $count개를 Savelon으로 가져올까요?';
  }

  @override
  String get settingsSetPasswordPageTitle => '비밀번호 설정';

  @override
  String get settingsChangePasswordPageTitle => '비밀번호 변경';

  @override
  String get settingsRemovePasswordPageTitle => '비밀번호 제거';

  @override
  String get settingsNewPasswordLabel => '새 비밀번호';

  @override
  String get settingsConfirmNewPasswordLabel => '새 비밀번호 확인';

  @override
  String get settingsReenterNewPasswordHelper => '새 비밀번호를 다시 입력하세요';

  @override
  String get settingsSetPasswordCta => '비밀번호 설정';

  @override
  String get settingsChangePasswordCta => '비밀번호 변경';

  @override
  String get settingsRemovePasswordCta => '비밀번호 제거';

  @override
  String get settingsCurrentPasswordLabel => '현재 비밀번호';

  @override
  String get settingsEnterCurrentPasswordHelper => '현재 비밀번호를 입력하세요';

  @override
  String get settingsNewPasswordMustDiffer => '새 비밀번호는 현재 비밀번호와 달라야 합니다';

  @override
  String settingsFailedToSetPassword(String error) {
    return '비밀번호를 설정하지 못했습니다: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return '비밀번호를 변경하지 못했습니다: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return '비밀번호를 제거하지 못했습니다: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => '비밀번호가 유효하지 않습니다';

  @override
  String get settingsCurrentPasswordIncorrect => '현재 비밀번호가 올바르지 않습니다';

  @override
  String get settingsCurrentPasswordRequired => '현재 비밀번호가 필요합니다';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      '비밀번호 보호가 켜져 있을 때 비밀번호가 필요합니다';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      '비밀번호 옵션을 켤 때 비밀번호가 필요합니다';

  @override
  String get authPasswordRequiredForAccount => '이 계정에는 비밀번호가 필요합니다';
}

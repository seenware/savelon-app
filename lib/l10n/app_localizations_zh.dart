// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => '加密联系人';

  @override
  String get navContacts => '联系人';

  @override
  String get navOrganize => '组织';

  @override
  String get navSupport => '支持';

  @override
  String get navSettings => '设置';

  @override
  String get settingsTitle => '设置';

  @override
  String get language => '语言';

  @override
  String get languageSystemDefault => '系统默认';

  @override
  String get organizeTitle => '组织';

  @override
  String get supportTitle => '支持';

  @override
  String get search => '搜索';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '删除';

  @override
  String get commonSave => '保存';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonMerge => '合并';

  @override
  String get commonSkip => '跳过';

  @override
  String get commonRetry => '重试';

  @override
  String get commonClose => '关闭';

  @override
  String get commonNext => '下一个';

  @override
  String get commonBack => '返回';

  @override
  String get commonYes => '是';

  @override
  String get commonNo => '否';

  @override
  String get commonContinue => '继续';

  @override
  String get commonTryAgain => '再试一次';

  @override
  String get commonApply => '应用';

  @override
  String get commonDiscard => '丢弃';

  @override
  String get commonUnlock => '解锁';

  @override
  String get commonLoading => '加载中...';

  @override
  String commonErrorWithDetails(String error) {
    return '错误：$error';
  }

  @override
  String get brandSlogan => '您的联系人，只属于您自己。';

  @override
  String get contactNotFound => '未找到联系人';

  @override
  String get contactDeleted => '联系人已删除';

  @override
  String get contactUpdated => '联系人已更新';

  @override
  String get contactSaved => '联系人已保存';

  @override
  String get contactsMerged => '联系人已合并';

  @override
  String get deleteContactTitle => '删除联系人';

  @override
  String deleteContactConfirm(String name) {
    return '您确定要删除$name吗？';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '您确定要删除“$name”吗？';
  }

  @override
  String failedToDelete(String error) {
    return '删除失败：$error';
  }

  @override
  String failedToUpdate(String error) {
    return '更新失败：$error';
  }

  @override
  String failedToSave(String error) {
    return '保存失败：$error';
  }

  @override
  String get noName => '无名';

  @override
  String get noNameTitle => '无名';

  @override
  String get noNameBody => '该联系人没有姓名。还是要保存吗？';

  @override
  String get discardChangesTitle => '放弃更改？';

  @override
  String get discardChangesBody => '您有未保存的更改，这些更改将会丢失。';

  @override
  String get newContact => '新联系人';

  @override
  String get editContact => '编辑联系人';

  @override
  String get addMore => '添加更多';

  @override
  String get addNameFieldsTitle => '添加名称字段';

  @override
  String get call => '拨号';

  @override
  String get sendEmail => '发送电子邮件';

  @override
  String get copy => '复制';

  @override
  String get visit => '访问';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get importContacts => '导入联系人';

  @override
  String get importing => '正在导入...';

  @override
  String importedCount(int count) {
    return '导入$count联系人';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '已导入 $imported 联系人，$skipped 已跳过';
  }

  @override
  String get failedToImportContacts => '导入联系人失败';

  @override
  String get noContactsToImport => '没有要导入的联系人。';

  @override
  String get contactsPermissionRequiredImport => '导入联系人需要联系人权限';

  @override
  String get importDialogTitle => '导入联系人';

  @override
  String get importDialogBody => '从您的设备或文件导入联系人？';

  @override
  String get importSourceTitle => '导入';

  @override
  String get importZipPasswordTitle => '存档密码';

  @override
  String get importZipPasswordChecking => '正在检查...';

  @override
  String get exportContacts => '导出联系人';

  @override
  String get unlockPro => '解锁 Pro';

  @override
  String get exportContactsTitle => '导出联系人';

  @override
  String get exportSubtitle => '选择您想要保存联系人的方式。';

  @override
  String get exportFormatVcfTitle => '另存为.vcf';

  @override
  String get exportFormatVcfSubtitle => '适用于 Apple 联系人、Google 联系人等的一个文件。';

  @override
  String get exportFormatZipTitle => '保存在受密码保护的存档中';

  @override
  String get exportFormatZipSubtitle => '里面有 .vcf 的 .zip — 需要密码才能打开它。';

  @override
  String get exportProtectedTitle => '受保护的导出';

  @override
  String get exportCompleteTitle => '导出完成';

  @override
  String get stillLoadingContacts => '仍在加载联系人。请稍等。';

  @override
  String get couldNotLoadContacts => '无法加载联系人。';

  @override
  String get passwordChangedSuccess => '密码修改成功';

  @override
  String get passwordProtectionEnabled => '密码保护启用成功';

  @override
  String get passwordProtectionRemoved => '密码保护已成功删除';

  @override
  String get removePasswordProtectionButton => '删除密码保护';

  @override
  String get changePasswordTitle => '更改密码';

  @override
  String get setPasswordTitle => '设置密码';

  @override
  String get passwordSettingsChangeTitle => '更改密码';

  @override
  String get passwordSettingsSetTitle => '设置密码';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String privacyPolicyOpenFailed(String error) {
    return '隐私政策打开失败：$error';
  }

  @override
  String get resetAppTitle => '重置应用程序';

  @override
  String get resetAppConfirmTitle => '删除所有联系人并重置应用程序？';

  @override
  String get resetAppCannotUndo => '此操作无法撤消';

  @override
  String resetAppError(String error) {
    return '重置应用程序时出错：$error';
  }

  @override
  String get photoPickerNewImage => '选择新图像';

  @override
  String get photoPickerRemoveImage => '删除图像';

  @override
  String get onboardingHeadline1 => '谁可以访问您的联系人？';

  @override
  String get onboardingSubline1 => '一些应用程序将它们上传到云端。这可能会带来更多的隐私风险。';

  @override
  String get onboardingHeadline2 => '许多应用程序要求联系人访问权限';

  @override
  String get onboardingSubline2 => '它可能很有用，但重要的联系人应该保密。';

  @override
  String get onboardingHeadline3 => '将敏感联系人分开';

  @override
  String get onboardingSubline3 => '我们建议将重要且很少使用的联系人存储在主联系人应用程序之外。';

  @override
  String get onboardingHeadline4 => '保护您的重要联系人';

  @override
  String get onboardingSubline4 => 'Savelon 将联系人保存在您的设备上，加密存储，并对其他应用保密。';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get onboardingNext => '下一个';

  @override
  String get onboardingBenefitsOpenSourceTitle => '开源';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink => '任何人都可以在 ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => ' 查看我们的代码。';

  @override
  String get onboardingBenefitsPrivateTitle => '私密';

  @override
  String get onboardingBenefitsPrivateDescription => '连我们也无法看到你的联系人';

  @override
  String get onboardingBenefitsSandboxTitle => '其他应用无法窥探内部';

  @override
  String get onboardingBenefitsOfflineTitle => '离线';

  @override
  String get onboardingBenefitsOfflineDescription => '让你远离云端、数据经纪人和监控系统';

  @override
  String get activateDemoTitle => '激活演示';

  @override
  String get activateDemoCancel => '取消';

  @override
  String demoAccessGranted(String dateTime) {
    return '您现在可以在 $dateTime 之前访问演示版';
  }

  @override
  String get setupPasswordTitle => '添加密码保护';

  @override
  String get setupPasswordMismatch => '密码不匹配';

  @override
  String get setupPasswordFailedSeed => '无法生成种子。请再试一次。';

  @override
  String setupPasswordFailedInit(String error) {
    return '初始化失败。错误：$error';
  }

  @override
  String get setupPasswordInfo => '您的联系人仍将通过长密钥进行高度加密，仅存储在您的设备上。但密码增加了额外的保护。';

  @override
  String get setupPasswordLabel => '密码';

  @override
  String get setupPasswordConfirmLabel => '确认密码';

  @override
  String get setupPasswordWarning => '该密码无法恢复。写下来并妥善保管！';

  @override
  String get setupPasswordPageTitle => '创建密码';

  @override
  String get setupPasswordNext => '下一个';

  @override
  String get setupPasswordSkip => '跳过';

  @override
  String get setupCreateVaultTitle => '创建你的保险库';

  @override
  String get setupCreateVaultSubtitle => '仅保存在你的设备上。已加密且私密。';

  @override
  String get setupDefaultVaultName => '我的保险库';

  @override
  String setupRandomVaultName(String number) {
    return '保险库$number';
  }

  @override
  String get setupCropPhotoTitle => '裁剪照片';

  @override
  String get setupProtectionTitle => '保护';

  @override
  String get setupEncryption256Label => '256 位加密';

  @override
  String get setupRequirePasswordLabel => '需要密码';

  @override
  String get setupOptionalSuffix => '可选';

  @override
  String get setupCreateVaultButton => '创建保险库';

  @override
  String get setupCreatingVaultTitle => '正在创建保险库';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => '正在创建密钥';

  @override
  String get setupEncryptingDataLabel => '正在加密数据';

  @override
  String get setupCheckingSecurityLabel => '正在检查安全性';

  @override
  String get setupCreatingVaultError => '出现问题，请重试。';

  @override
  String get setupVaultCreatedTitle => '保险库已创建';

  @override
  String get setupVaultCreatedSubtitle => '你的保险库已就绪。已加密且安全。';

  @override
  String get setupOpenVaultButton => '打开保险库';

  @override
  String get setupSavedSecretKeyCheckbox => '我已安全保存我的密钥';

  @override
  String get setupContinue => '继续';

  @override
  String get setupAddPasswordPageTitle => '添加密码';

  @override
  String get setupSavePasswordButton => '保存密码';

  @override
  String get confirmationCheckboxTitle => '我了解我的密码无法恢复';

  @override
  String get loginWelcomeBack => '欢迎回来';

  @override
  String get loginPasswordLabel => '密码';

  @override
  String get loginUnlock => '解锁';

  @override
  String get loginPasswordRequired => '输入您的密码';

  @override
  String get loginIncorrectPassword => '密码不正确。请再试一次。';

  @override
  String get paywallNoSubscription => '未找到有效订阅。请购买以继续。';

  @override
  String get lifetimeThanksTitle => '感谢一路有你';

  @override
  String get lifetimeThanksSubtitle => '我们赠送你终身 Pro 权限';

  @override
  String get lifetimeThanksGift => '赠送';

  @override
  String get lifetimeThanksCta => '领取终身权限';

  @override
  String get paywallNoInternetTitle => '无互联网连接';

  @override
  String get paywallNoInternetBody => '首次访问该应用程序需要互联网连接。请连接并重试。';

  @override
  String get paywallStoreUnavailableTitle => '商店不可用';

  @override
  String get paywallStoreUnavailableBody => '无法加载订阅选项。请再试一次。';

  @override
  String get subscriptionVerifyTitle => '验证订阅';

  @override
  String get subscriptionSoftWarningTitle => '需要订阅验证';

  @override
  String get subscriptionContinueAnyway => '无论如何继续';

  @override
  String subscriptionLastVerified(String date) {
    return '最后验证$date。';
  }

  @override
  String get subscriptionNotVerifiedOnline => '无法在线验证订阅。';

  @override
  String subscriptionAccessUntil(String date) {
    return '您的访问将持续到$date — 在此之前连接以进行验证。';
  }

  @override
  String get subscriptionConnectToVerify => '连接到互联网以验证您的订阅。';

  @override
  String get organizeNoDuplicates => '未发现潜在的重复项';

  @override
  String get organizeSkippedShownAgain => '跳过的重复项会再次显示。';

  @override
  String get organizeShowSkippedTooltip => '再次显示跳过的重复组';

  @override
  String organizeFailedToLoad(String error) {
    return '无法加载重复组：$error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count 个重复项';
  }

  @override
  String get organizeSubtitlePlaceholder => '点击查看详情';

  @override
  String get organizeConflictMostlyIdentical => '大部分相同';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field：$count 变体';
  }

  @override
  String get fieldLabelName => '姓名';

  @override
  String get fieldLabelCompany => '公司';

  @override
  String get fieldLabelPhone => '电话';

  @override
  String get fieldLabelEmail => '电子邮件';

  @override
  String get importErrorUnsupportedSource => '此处无法导入。';

  @override
  String get importErrorPermissionDenied => '导入联系人需要联系人权限。';

  @override
  String get importErrorNoContacts => '没有要导入的联系人。';

  @override
  String get importErrorUnsupportedFileType => '请选择.vcf文件或.zip存档。';

  @override
  String get importErrorInvalidFile => '所选文件无效或不可读。';

  @override
  String get importErrorWrongPassword => '存档密码不正确。请再试一次。';

  @override
  String get importErrorNoVcfInArchive => '在所选存档中未找到 .vcf 文件。';

  @override
  String importErrorFailed(String detail) {
    return '导入联系人失败：$detail';
  }

  @override
  String get exportErrorContactsUnavailable => '联系人暂不可用。';

  @override
  String get exportErrorNoContacts => '没有要导出的联系人。';

  @override
  String get exportErrorPasswordRequired => '受保护的导出需要密码。';

  @override
  String exportErrorPasswordTooShort(int min) {
    return '受保护的导出需要至少包含 $min 个字符的密码。';
  }

  @override
  String exportErrorFailed(String detail) {
    return '导出失败：$detail';
  }

  @override
  String get exportNoticeDownloadStarted => '下载开始。';

  @override
  String get exportNoticeFileSaved => '文件保存成功。';

  @override
  String get phoneTypeMobile => '手机';

  @override
  String get phoneTypeHome => '家';

  @override
  String get phoneTypeWork => '工作';

  @override
  String get phoneTypeSchool => '学校';

  @override
  String get phoneTypeOther => '其他';

  @override
  String get emailTypePersonal => '个人的';

  @override
  String get emailTypeWork => '工作';

  @override
  String get emailTypeSchool => '学校';

  @override
  String get emailTypeOther => '其他';

  @override
  String get addressTypeHome => '家';

  @override
  String get addressTypeWork => '工作';

  @override
  String get addressTypeSchool => '学校';

  @override
  String get addressTypeBirth => '出生';

  @override
  String get linkTypeWebsite => '网站';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => '其他';

  @override
  String get dateTypeCreated => '已创建';

  @override
  String get dateTypeBirthday => '生日';

  @override
  String get dateTypeMet => '相识';

  @override
  String get dateTypeGraduation => '毕业';

  @override
  String get dateTypeMarriage => '婚姻';

  @override
  String get dateTypeOther => '其他';

  @override
  String get noNameInList => '（无名字）';

  @override
  String get formAddPhone => '添加电话';

  @override
  String get formAddEmail => '添加电子邮件';

  @override
  String get formAddAddress => '添加地址';

  @override
  String get formAddLink => '添加链接';

  @override
  String get formAddDate => '添加日期';

  @override
  String get formHintPhoneNumber => '电话号码';

  @override
  String get formHintEmail => '电子邮件';

  @override
  String get formHintUrl => '网址';

  @override
  String get formHintAddress => '地址';

  @override
  String get formHintSelectDate => '选择日期';

  @override
  String get formHintNotes => '添加注释';

  @override
  String get formCompany => '公司';

  @override
  String get formDepartment => '部门';

  @override
  String get formJobTitle => '职称';

  @override
  String get formPrefix => '前缀';

  @override
  String get formFirstName => '名';

  @override
  String get formMiddleName => '中间名字';

  @override
  String get formLastName => '姓';

  @override
  String get formSuffix => '后缀';

  @override
  String get formNickname => '昵称';

  @override
  String get contactsListTitle => '联系人';

  @override
  String get contactsListEmpty => '还没有联系人';

  @override
  String get contactsImportButton => '导入联系人';

  @override
  String get mergeContactsTitle => '合并联系人';

  @override
  String get mergeContactsSubtitle => '选择要合并为一个的联系人';

  @override
  String get exportPasswordHint => '密码';

  @override
  String get exportPasswordConfirmHint => '确认密码';

  @override
  String exportPasswordHelper(int min) {
    return '至少$min个字符';
  }

  @override
  String get zipPasswordHint => '存档密码';

  @override
  String get activateDemoAccessCodeLabel => '访问代码';

  @override
  String get subscriptionExpiredTitle => '订阅已过期';

  @override
  String get subscriptionExpiredBody => '续订即可继续使用所有功能。';

  @override
  String get contactsLoadError => '无法加载联系人。';

  @override
  String get contactsListError => '无法加载联系人。';

  @override
  String get contactsSearchNoResults => '未找到联系人';

  @override
  String get supportPageIntro => '有疑问、反馈或遇到问题？Savelon 团队会阅读每条消息。';

  @override
  String get supportCtaMessageTeam => '联系团队';

  @override
  String get importFromDeviceContacts => '从您的联系人';

  @override
  String get importFromFileVcfZip => '从文件（VCF、ZIP）';

  @override
  String get exportCreateUniquePasswordTitle => '创建唯一密码';

  @override
  String get exportPasswordIrrecoverableHint => '此密码无法找回。';

  @override
  String get exportProtectedArchiveCta => '导出受保护的压缩包';

  @override
  String get exportIosSavedFileWarning =>
      '此文件保存在 Savelon 文件夹中。若删除应用，文件也会被删除。请移到其他位置以保留。';

  @override
  String importContactsConfirmBody(int count) {
    return '将 $count 位联系人导入 Savelon？';
  }

  @override
  String get settingsSetPasswordPageTitle => '设置密码';

  @override
  String get settingsChangePasswordPageTitle => '更改密码';

  @override
  String get settingsRemovePasswordPageTitle => '移除密码';

  @override
  String get settingsNewPasswordLabel => '新密码';

  @override
  String get settingsConfirmNewPasswordLabel => '确认新密码';

  @override
  String get settingsReenterNewPasswordHelper => '再次输入新密码';

  @override
  String get settingsSetPasswordCta => '设置密码';

  @override
  String get settingsChangePasswordCta => '更改密码';

  @override
  String get settingsRemovePasswordCta => '移除密码';

  @override
  String get settingsCurrentPasswordLabel => '当前密码';

  @override
  String get settingsEnterCurrentPasswordHelper => '输入当前密码';

  @override
  String get settingsNewPasswordMustDiffer => '新密码必须与当前密码不同';

  @override
  String settingsFailedToSetPassword(String error) {
    return '无法设置密码：$error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return '无法更改密码：$error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return '无法移除密码：$error';
  }

  @override
  String get settingsPasswordInvalidFallback => '密码无效';

  @override
  String get settingsCurrentPasswordIncorrect => '当前密码不正确';

  @override
  String get settingsCurrentPasswordRequired => '需要当前密码';

  @override
  String get authPasswordRequiredWhenProtectionEnabled => '启用密码保护时需要密码';

  @override
  String get authPasswordRequiredWhenEnablePassword => '启用密码选项时需要密码';

  @override
  String get authPasswordRequiredForAccount => '此账户需要密码';

  @override
  String get loginLoggedInSecurely => '已安全登录';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => '加密联系人';

  @override
  String get navContacts => '联系人';

  @override
  String get navOrganize => '组织';

  @override
  String get navSupport => '支持';

  @override
  String get navSettings => '设置';

  @override
  String get settingsTitle => '设置';

  @override
  String get language => '语言';

  @override
  String get languageSystemDefault => '系统默认';

  @override
  String get organizeTitle => '组织';

  @override
  String get supportTitle => '支持';

  @override
  String get search => '搜索';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '删除';

  @override
  String get commonSave => '保存';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonMerge => '合并';

  @override
  String get commonSkip => '跳过';

  @override
  String get commonRetry => '重试';

  @override
  String get commonClose => '关闭';

  @override
  String get commonNext => '下一个';

  @override
  String get commonBack => '返回';

  @override
  String get commonYes => '是';

  @override
  String get commonNo => '否';

  @override
  String get commonContinue => '继续';

  @override
  String get commonTryAgain => '再试一次';

  @override
  String get commonApply => '应用';

  @override
  String get commonDiscard => '丢弃';

  @override
  String get commonUnlock => '解锁';

  @override
  String get commonLoading => '加载中...';

  @override
  String commonErrorWithDetails(String error) {
    return '错误：$error';
  }

  @override
  String get brandSlogan => '您的联系人，只属于您自己。';

  @override
  String get contactNotFound => '未找到联系人';

  @override
  String get contactDeleted => '联系人已删除';

  @override
  String get contactUpdated => '联系人已更新';

  @override
  String get contactSaved => '联系人已保存';

  @override
  String get contactsMerged => '联系人已合并';

  @override
  String get deleteContactTitle => '删除联系人';

  @override
  String deleteContactConfirm(String name) {
    return '您确定要删除$name吗？';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '您确定要删除“$name”吗？';
  }

  @override
  String failedToDelete(String error) {
    return '删除失败：$error';
  }

  @override
  String failedToUpdate(String error) {
    return '更新失败：$error';
  }

  @override
  String failedToSave(String error) {
    return '保存失败：$error';
  }

  @override
  String get noName => '无名';

  @override
  String get noNameTitle => '无名';

  @override
  String get noNameBody => '该联系人没有姓名。还是要保存吗？';

  @override
  String get discardChangesTitle => '放弃更改？';

  @override
  String get discardChangesBody => '您有未保存的更改，这些更改将会丢失。';

  @override
  String get newContact => '新联系人';

  @override
  String get editContact => '编辑联系人';

  @override
  String get addMore => '添加更多';

  @override
  String get addNameFieldsTitle => '添加名称字段';

  @override
  String get call => '拨号';

  @override
  String get sendEmail => '发送电子邮件';

  @override
  String get copy => '复制';

  @override
  String get visit => '访问';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get importContacts => '导入联系人';

  @override
  String get importing => '正在导入...';

  @override
  String importedCount(int count) {
    return '导入$count联系人';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '已导入 $imported 联系人，$skipped 已跳过';
  }

  @override
  String get failedToImportContacts => '导入联系人失败';

  @override
  String get noContactsToImport => '没有要导入的联系人。';

  @override
  String get contactsPermissionRequiredImport => '导入联系人需要联系人权限';

  @override
  String get importDialogTitle => '导入联系人';

  @override
  String get importDialogBody => '从您的设备或文件导入联系人？';

  @override
  String get importSourceTitle => '导入';

  @override
  String get importZipPasswordTitle => '存档密码';

  @override
  String get importZipPasswordChecking => '正在检查...';

  @override
  String get exportContacts => '导出联系人';

  @override
  String get unlockPro => '解锁 Pro';

  @override
  String get exportContactsTitle => '导出联系人';

  @override
  String get exportSubtitle => '选择您想要保存联系人的方式。';

  @override
  String get exportFormatVcfTitle => '另存为.vcf';

  @override
  String get exportFormatVcfSubtitle => '适用于 Apple 联系人、Google 联系人等的一个文件。';

  @override
  String get exportFormatZipTitle => '保存在受密码保护的存档中';

  @override
  String get exportFormatZipSubtitle => '里面有 .vcf 的 .zip — 需要密码才能打开它。';

  @override
  String get exportProtectedTitle => '受保护的导出';

  @override
  String get exportCompleteTitle => '导出完成';

  @override
  String get stillLoadingContacts => '仍在加载联系人。请稍等。';

  @override
  String get couldNotLoadContacts => '无法加载联系人。';

  @override
  String get passwordChangedSuccess => '密码修改成功';

  @override
  String get passwordProtectionEnabled => '密码保护启用成功';

  @override
  String get passwordProtectionRemoved => '密码保护已成功删除';

  @override
  String get removePasswordProtectionButton => '删除密码保护';

  @override
  String get changePasswordTitle => '更改密码';

  @override
  String get setPasswordTitle => '设置密码';

  @override
  String get passwordSettingsChangeTitle => '更改密码';

  @override
  String get passwordSettingsSetTitle => '设置密码';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String privacyPolicyOpenFailed(String error) {
    return '隐私政策打开失败：$error';
  }

  @override
  String get resetAppTitle => '重置应用程序';

  @override
  String get resetAppConfirmTitle => '删除所有联系人并重置应用程序？';

  @override
  String get resetAppCannotUndo => '此操作无法撤消';

  @override
  String resetAppError(String error) {
    return '重置应用程序时出错：$error';
  }

  @override
  String get photoPickerNewImage => '选择新图像';

  @override
  String get photoPickerRemoveImage => '删除图像';

  @override
  String get onboardingHeadline1 => '谁可以访问您的联系人？';

  @override
  String get onboardingSubline1 => '一些应用程序将它们上传到云端。这可能会带来更多的隐私风险。';

  @override
  String get onboardingHeadline2 => '许多应用程序要求联系人访问权限';

  @override
  String get onboardingSubline2 => '它可能很有用，但重要的联系人应该保密。';

  @override
  String get onboardingHeadline3 => '将敏感联系人分开';

  @override
  String get onboardingSubline3 => '我们建议将重要且很少使用的联系人存储在主联系人应用程序之外。';

  @override
  String get onboardingHeadline4 => '保护您的重要联系人';

  @override
  String get onboardingSubline4 => 'Savelon 将联系人保存在您的设备上，加密存储，并对其他应用保密。';

  @override
  String get onboardingGetStarted => '开始使用';

  @override
  String get onboardingNext => '下一个';

  @override
  String get onboardingBenefitsOpenSourceTitle => '开源';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink => '任何人都可以在 ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => ' 查看我们的代码。';

  @override
  String get onboardingBenefitsPrivateTitle => '私密';

  @override
  String get onboardingBenefitsPrivateDescription => '连我们也无法看到你的联系人';

  @override
  String get onboardingBenefitsSandboxTitle => '其他应用无法窥探内部';

  @override
  String get onboardingBenefitsOfflineTitle => '离线';

  @override
  String get onboardingBenefitsOfflineDescription => '让你远离云端、数据经纪人和监控系统';

  @override
  String get activateDemoTitle => '激活演示';

  @override
  String get activateDemoCancel => '取消';

  @override
  String demoAccessGranted(String dateTime) {
    return '您现在可以在 $dateTime 之前访问演示版';
  }

  @override
  String get setupPasswordTitle => '添加密码保护';

  @override
  String get setupPasswordMismatch => '密码不匹配';

  @override
  String get setupPasswordFailedSeed => '无法生成种子。请再试一次。';

  @override
  String setupPasswordFailedInit(String error) {
    return '初始化失败。错误：$error';
  }

  @override
  String get setupPasswordInfo => '您的联系人仍将通过长密钥进行高度加密，仅存储在您的设备上。但密码增加了额外的保护。';

  @override
  String get setupPasswordLabel => '密码';

  @override
  String get setupPasswordConfirmLabel => '确认密码';

  @override
  String get setupPasswordWarning => '该密码无法恢复。写下来并妥善保管！';

  @override
  String get setupPasswordPageTitle => '创建密码';

  @override
  String get setupPasswordNext => '下一个';

  @override
  String get setupPasswordSkip => '跳过';

  @override
  String get setupCreateVaultTitle => '创建你的保险库';

  @override
  String get setupCreateVaultSubtitle => '仅保存在你的设备上。已加密且私密。';

  @override
  String get setupDefaultVaultName => '我的保险库';

  @override
  String setupRandomVaultName(String number) {
    return '保险库$number';
  }

  @override
  String get setupCropPhotoTitle => '裁剪照片';

  @override
  String get setupProtectionTitle => '保护';

  @override
  String get setupEncryption256Label => '256 位加密';

  @override
  String get setupRequirePasswordLabel => '需要密码';

  @override
  String get setupOptionalSuffix => '可选';

  @override
  String get setupCreateVaultButton => '创建保险库';

  @override
  String get setupCreatingVaultTitle => '正在创建保险库';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => '正在创建密钥';

  @override
  String get setupEncryptingDataLabel => '正在加密数据';

  @override
  String get setupCheckingSecurityLabel => '正在检查安全性';

  @override
  String get setupCreatingVaultError => '出现问题，请重试。';

  @override
  String get setupVaultCreatedTitle => '保险库已创建';

  @override
  String get setupVaultCreatedSubtitle => '你的保险库已就绪。已加密且安全。';

  @override
  String get setupOpenVaultButton => '打开保险库';

  @override
  String get setupSavedSecretKeyCheckbox => '我已安全保存我的密钥';

  @override
  String get setupContinue => '继续';

  @override
  String get setupAddPasswordPageTitle => '添加密码';

  @override
  String get setupSavePasswordButton => '保存密码';

  @override
  String get confirmationCheckboxTitle => '我了解我的密码无法恢复';

  @override
  String get loginWelcomeBack => '欢迎回来';

  @override
  String get loginPasswordLabel => '密码';

  @override
  String get loginUnlock => '解锁';

  @override
  String get loginPasswordRequired => '输入您的密码';

  @override
  String get loginIncorrectPassword => '密码不正确。请再试一次。';

  @override
  String get paywallNoSubscription => '未找到有效订阅。请购买以继续。';

  @override
  String get lifetimeThanksTitle => '感谢一路有你';

  @override
  String get lifetimeThanksSubtitle => '我们赠送你终身 Pro 权限';

  @override
  String get lifetimeThanksGift => '赠送';

  @override
  String get lifetimeThanksCta => '领取终身权限';

  @override
  String get paywallNoInternetTitle => '无互联网连接';

  @override
  String get paywallNoInternetBody => '首次访问该应用程序需要互联网连接。请连接并重试。';

  @override
  String get paywallStoreUnavailableTitle => '商店不可用';

  @override
  String get paywallStoreUnavailableBody => '无法加载订阅选项。请再试一次。';

  @override
  String get subscriptionVerifyTitle => '验证订阅';

  @override
  String get subscriptionSoftWarningTitle => '需要订阅验证';

  @override
  String get subscriptionContinueAnyway => '无论如何继续';

  @override
  String subscriptionLastVerified(String date) {
    return '最后验证$date。';
  }

  @override
  String get subscriptionNotVerifiedOnline => '无法在线验证订阅。';

  @override
  String subscriptionAccessUntil(String date) {
    return '您的访问将持续到$date — 在此之前连接以进行验证。';
  }

  @override
  String get subscriptionConnectToVerify => '连接到互联网以验证您的订阅。';

  @override
  String get organizeNoDuplicates => '未发现潜在的重复项';

  @override
  String get organizeSkippedShownAgain => '跳过的重复项会再次显示。';

  @override
  String get organizeShowSkippedTooltip => '再次显示跳过的重复组';

  @override
  String organizeFailedToLoad(String error) {
    return '无法加载重复组：$error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count 个重复项';
  }

  @override
  String get organizeSubtitlePlaceholder => '点击查看详情';

  @override
  String get organizeConflictMostlyIdentical => '大部分相同';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field：$count 变体';
  }

  @override
  String get fieldLabelName => '姓名';

  @override
  String get fieldLabelCompany => '公司';

  @override
  String get fieldLabelPhone => '电话';

  @override
  String get fieldLabelEmail => '电子邮件';

  @override
  String get importErrorUnsupportedSource => '此处无法导入。';

  @override
  String get importErrorPermissionDenied => '导入联系人需要联系人权限。';

  @override
  String get importErrorNoContacts => '没有要导入的联系人。';

  @override
  String get importErrorUnsupportedFileType => '请选择.vcf文件或.zip存档。';

  @override
  String get importErrorInvalidFile => '所选文件无效或不可读。';

  @override
  String get importErrorWrongPassword => '存档密码不正确。请再试一次。';

  @override
  String get importErrorNoVcfInArchive => '在所选存档中未找到 .vcf 文件。';

  @override
  String importErrorFailed(String detail) {
    return '导入联系人失败：$detail';
  }

  @override
  String get exportErrorContactsUnavailable => '联系人暂不可用。';

  @override
  String get exportErrorNoContacts => '没有要导出的联系人。';

  @override
  String get exportErrorPasswordRequired => '受保护的导出需要密码。';

  @override
  String exportErrorPasswordTooShort(int min) {
    return '受保护的导出需要至少包含 $min 个字符的密码。';
  }

  @override
  String exportErrorFailed(String detail) {
    return '导出失败：$detail';
  }

  @override
  String get exportNoticeDownloadStarted => '下载开始。';

  @override
  String get exportNoticeFileSaved => '文件保存成功。';

  @override
  String get phoneTypeMobile => '手机';

  @override
  String get phoneTypeHome => '家';

  @override
  String get phoneTypeWork => '工作';

  @override
  String get phoneTypeSchool => '学校';

  @override
  String get phoneTypeOther => '其他';

  @override
  String get emailTypePersonal => '个人的';

  @override
  String get emailTypeWork => '工作';

  @override
  String get emailTypeSchool => '学校';

  @override
  String get emailTypeOther => '其他';

  @override
  String get addressTypeHome => '家';

  @override
  String get addressTypeWork => '工作';

  @override
  String get addressTypeSchool => '学校';

  @override
  String get addressTypeBirth => '出生';

  @override
  String get linkTypeWebsite => '网站';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => '其他';

  @override
  String get dateTypeCreated => '已创建';

  @override
  String get dateTypeBirthday => '生日';

  @override
  String get dateTypeMet => '相识';

  @override
  String get dateTypeGraduation => '毕业';

  @override
  String get dateTypeMarriage => '婚姻';

  @override
  String get dateTypeOther => '其他';

  @override
  String get noNameInList => '（无名字）';

  @override
  String get formAddPhone => '添加电话';

  @override
  String get formAddEmail => '添加电子邮件';

  @override
  String get formAddAddress => '添加地址';

  @override
  String get formAddLink => '添加链接';

  @override
  String get formAddDate => '添加日期';

  @override
  String get formHintPhoneNumber => '电话号码';

  @override
  String get formHintEmail => '电子邮件';

  @override
  String get formHintUrl => '网址';

  @override
  String get formHintAddress => '地址';

  @override
  String get formHintSelectDate => '选择日期';

  @override
  String get formHintNotes => '添加注释';

  @override
  String get formCompany => '公司';

  @override
  String get formDepartment => '部门';

  @override
  String get formJobTitle => '职称';

  @override
  String get formPrefix => '前缀';

  @override
  String get formFirstName => '名';

  @override
  String get formMiddleName => '中间名字';

  @override
  String get formLastName => '姓';

  @override
  String get formSuffix => '后缀';

  @override
  String get formNickname => '昵称';

  @override
  String get contactsListTitle => '联系人';

  @override
  String get contactsListEmpty => '还没有联系人';

  @override
  String get contactsImportButton => '导入联系人';

  @override
  String get mergeContactsTitle => '合并联系人';

  @override
  String get mergeContactsSubtitle => '选择要合并为一个的联系人';

  @override
  String get exportPasswordHint => '密码';

  @override
  String get exportPasswordConfirmHint => '确认密码';

  @override
  String exportPasswordHelper(int min) {
    return '至少$min个字符';
  }

  @override
  String get zipPasswordHint => '存档密码';

  @override
  String get activateDemoAccessCodeLabel => '访问代码';

  @override
  String get subscriptionExpiredTitle => '订阅已过期';

  @override
  String get subscriptionExpiredBody => '续订即可继续使用所有功能。';

  @override
  String get contactsLoadError => '无法加载联系人。';

  @override
  String get contactsListError => '无法加载联系人。';

  @override
  String get contactsSearchNoResults => '未找到联系人';

  @override
  String get supportPageIntro => '有疑问、反馈或遇到问题？Savelon 团队会阅读每条消息。';

  @override
  String get supportCtaMessageTeam => '联系团队';

  @override
  String get importFromDeviceContacts => '从您的联系人';

  @override
  String get importFromFileVcfZip => '从文件（VCF、ZIP）';

  @override
  String get exportCreateUniquePasswordTitle => '创建唯一密码';

  @override
  String get exportPasswordIrrecoverableHint => '此密码无法找回。';

  @override
  String get exportProtectedArchiveCta => '导出受保护的压缩包';

  @override
  String get exportIosSavedFileWarning =>
      '此文件保存在 Savelon 文件夹中。若删除应用，文件也会被删除。请移到其他位置以保留。';

  @override
  String importContactsConfirmBody(int count) {
    return '将 $count 位联系人导入 Savelon？';
  }

  @override
  String get settingsSetPasswordPageTitle => '设置密码';

  @override
  String get settingsChangePasswordPageTitle => '更改密码';

  @override
  String get settingsRemovePasswordPageTitle => '移除密码';

  @override
  String get settingsNewPasswordLabel => '新密码';

  @override
  String get settingsConfirmNewPasswordLabel => '确认新密码';

  @override
  String get settingsReenterNewPasswordHelper => '再次输入新密码';

  @override
  String get settingsSetPasswordCta => '设置密码';

  @override
  String get settingsChangePasswordCta => '更改密码';

  @override
  String get settingsRemovePasswordCta => '移除密码';

  @override
  String get settingsCurrentPasswordLabel => '当前密码';

  @override
  String get settingsEnterCurrentPasswordHelper => '输入当前密码';

  @override
  String get settingsNewPasswordMustDiffer => '新密码必须与当前密码不同';

  @override
  String settingsFailedToSetPassword(String error) {
    return '无法设置密码：$error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return '无法更改密码：$error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return '无法移除密码：$error';
  }

  @override
  String get settingsPasswordInvalidFallback => '密码无效';

  @override
  String get settingsCurrentPasswordIncorrect => '当前密码不正确';

  @override
  String get settingsCurrentPasswordRequired => '需要当前密码';

  @override
  String get authPasswordRequiredWhenProtectionEnabled => '启用密码保护时需要密码';

  @override
  String get authPasswordRequiredWhenEnablePassword => '启用密码选项时需要密码';

  @override
  String get authPasswordRequiredForAccount => '此账户需要密码';

  @override
  String get loginLoggedInSecurely => '已安全登录';
}

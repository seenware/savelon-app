// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => '暗号化された連絡先';

  @override
  String get navContacts => '連絡先';

  @override
  String get navDuplicates => '重複';

  @override
  String get navSupport => 'サポート';

  @override
  String get navSettings => '設定';

  @override
  String get settingsTitle => '設定';

  @override
  String get language => '言語';

  @override
  String get languageSystemDefault => 'システムのデフォルト';

  @override
  String get duplicatesTitle => '重複';

  @override
  String get supportTitle => 'サポート';

  @override
  String get search => '検索';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonDelete => '消去';

  @override
  String get commonSave => '保存';

  @override
  String get commonEdit => '編集';

  @override
  String get commonMerge => 'マージ';

  @override
  String get commonSkip => 'スキップ';

  @override
  String get commonRetry => 'リトライ';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonNext => '次';

  @override
  String get commonBack => '戻る';

  @override
  String get commonYes => 'はい';

  @override
  String get commonNo => 'いいえ';

  @override
  String get commonContinue => '続ける';

  @override
  String get commonTryAgain => 'もう一度やり直してください';

  @override
  String get commonApply => '適用する';

  @override
  String get commonDiscard => '破棄';

  @override
  String get commonUnlock => 'ロックを解除する';

  @override
  String get commonLoading => '読み込み中...';

  @override
  String commonErrorWithDetails(String error) {
    return 'エラー: $error';
  }

  @override
  String get brandSlogan => 'あなたの連絡先。あなただけです。';

  @override
  String get contactNotFound => '連絡先が見つかりません';

  @override
  String get contactDeleted => '連絡先が削除されました';

  @override
  String get contactUpdated => '連絡先が更新されました';

  @override
  String get contactSaved => '連絡先が保存されました';

  @override
  String get contactsMerged => '連絡先が統合されました';

  @override
  String get deleteContactTitle => '連絡先の削除';

  @override
  String deleteContactConfirm(String name) {
    return '$name を削除してもよろしいですか?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '「$name」を削除してもよろしいですか?';
  }

  @override
  String failedToDelete(String error) {
    return '削除できませんでした: $error';
  }

  @override
  String failedToUpdate(String error) {
    return '更新に失敗しました: $error';
  }

  @override
  String failedToSave(String error) {
    return '保存に失敗しました: $error';
  }

  @override
  String get noName => 'ノーネーム';

  @override
  String get noNameTitle => 'ノーネーム';

  @override
  String get noNameBody => 'この連絡先には名前がありません。このまま保存しますか？';

  @override
  String get discardChangesTitle => '変更を破棄しますか?';

  @override
  String get discardChangesBody => '保存されていない変更は失われます。';

  @override
  String get newContact => '新しい連絡先';

  @override
  String get editContact => '連絡先の編集';

  @override
  String get addMore => 'さらに追加';

  @override
  String get addNameFieldsTitle => '名前フィールドの追加';

  @override
  String get call => '電話';

  @override
  String get sendEmail => 'メールを送信';

  @override
  String get copy => 'コピー';

  @override
  String get visit => '開く';

  @override
  String get copiedToClipboard => 'クリップボードにコピーされました';

  @override
  String get importContacts => '連絡先のインポート';

  @override
  String get importing => 'インポート中...';

  @override
  String importedCount(int count) {
    return '$count件の連絡先をインポートしました';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported 連絡先をインポートしました、$skipped はスキップされました';
  }

  @override
  String get failedToImportContacts => '連絡先のインポートに失敗しました';

  @override
  String get noContactsToImport => 'インポートする連絡先がありません。';

  @override
  String get contactsPermissionRequiredImport => '連絡先をインポートするには連絡先の許可が必要です';

  @override
  String get importDialogTitle => '連絡先のインポート';

  @override
  String get importDialogBody => 'デバイスまたはファイルから連絡先をインポートしますか?';

  @override
  String get importSourceTitle => 'インポート';

  @override
  String get importZipPasswordTitle => 'アーカイブパスワード';

  @override
  String get importZipPasswordChecking => '確認中...';

  @override
  String get exportContacts => '連絡先のエクスポート';

  @override
  String get unlockPro => 'Pro をアンロック';

  @override
  String get exportContactsTitle => '連絡先のエクスポート';

  @override
  String get exportSubtitle => '連絡先を保存する方法を選択します。';

  @override
  String get exportFormatVcfTitle => '.vcf として保存';

  @override
  String get exportFormatVcfSubtitle => 'Apple 連絡先、Google 連絡先などで機能する 1 つのファイル。';

  @override
  String get exportFormatZipTitle => 'パスワードで保護されたアーカイブに保存する';

  @override
  String get exportFormatZipSubtitle => '.vcf が入った .zip — 開くにはパスワードが必要です。';

  @override
  String get exportProtectedTitle => '保護されたエクスポート';

  @override
  String get exportCompleteTitle => 'エクスポートが完了しました';

  @override
  String get stillLoadingContacts => 'まだ連絡先を読み込み中です。お待ちください。';

  @override
  String get couldNotLoadContacts => '連絡先をロードできませんでした。';

  @override
  String get passwordChangedSuccess => 'パスワードが正常に変更されました';

  @override
  String get passwordProtectionEnabled => 'パスワード保護が正常に有効になりました';

  @override
  String get passwordProtectionRemoved => 'パスワード保護が正常に削除されました';

  @override
  String get removePasswordProtectionButton => 'パスワード保護を削除する';

  @override
  String get changePasswordTitle => 'パスワードを変更する';

  @override
  String get setPasswordTitle => 'パスワードを設定する';

  @override
  String get passwordSettingsChangeTitle => 'パスワードを変更する';

  @override
  String get passwordSettingsSetTitle => 'パスワードを設定する';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'プライバシー ポリシーを開けませんでした: $error';
  }

  @override
  String get resetAppTitle => 'アプリをリセットする';

  @override
  String get resetAppConfirmTitle => 'すべての連絡先を削除して、アプリをリセットしますか?';

  @override
  String get resetAppCannotUndo => 'これは元に戻すことはできません';

  @override
  String resetAppError(String error) {
    return 'アプリのリセット中にエラーが発生しました: $error';
  }

  @override
  String get photoPickerNewImage => '新しい画像を選択';

  @override
  String get photoPickerRemoveImage => '画像を削除';

  @override
  String get onboardingHeadline1 => 'あなたの連絡先にアクセスできるのは誰ですか?';

  @override
  String get onboardingSubline1 =>
      '一部のアプリはそれらをクラウドにアップロードします。これにより、プライバシーのリスクがさらに高まる可能性があります。';

  @override
  String get onboardingHeadline2 => '多くのアプリは連絡先へのアクセスを要求します';

  @override
  String get onboardingSubline2 => 'それは便利ですが、重要な連絡先は非公開にしておく必要があります。';

  @override
  String get onboardingHeadline3 => '敏感な連絡先を隔離しておいてください';

  @override
  String get onboardingSubline3 =>
      '重要でめったに使用されない連絡先は、メインの連絡先アプリの外部に保存することをお勧めします。';

  @override
  String get onboardingHeadline4 => '大切な連絡先を保護する';

  @override
  String get onboardingSubline4 =>
      'Savelon は、それらを暗号化して他のアプリから非公開にしてデバイスに保存します。';

  @override
  String get onboardingGetStarted => '始めましょう';

  @override
  String get onboardingNext => '次';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'オープンソース';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink => '誰でも ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => ' でコードを確認できます。';

  @override
  String get onboardingBenefitsPrivateTitle => '非公開';

  @override
  String get onboardingBenefitsPrivateDescription => '私たちにもあなたの連絡先は見えません';

  @override
  String get onboardingBenefitsSandboxTitle => '他のアプリの中身を覗けません';

  @override
  String get onboardingBenefitsOfflineTitle => 'オフライン';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'クラウド、データ仲介業者、監視システムからあなたを遠ざけます';

  @override
  String get activateDemoTitle => 'デモをアクティブ化する';

  @override
  String get activateDemoCancel => 'キャンセル';

  @override
  String demoAccessGranted(String dateTime) {
    return '$dateTime までデモにアクセスできるようになりました';
  }

  @override
  String get setupPasswordTitle => 'パスワード保護を追加する';

  @override
  String get setupPasswordMismatch => 'パスワードが一致しません';

  @override
  String get setupPasswordFailedSeed => 'シードの生成に失敗しました。もう一度試してください。';

  @override
  String setupPasswordFailedInit(String error) {
    return '初期化に失敗しました。エラー: $error';
  }

  @override
  String get setupPasswordInfo =>
      '連絡先は、デバイスにのみ保存される長い秘密キーによって強力に暗号化されます。ただし、パスワードを使用するとさらに保護が強化されます。';

  @override
  String get setupPasswordLabel => 'パスワード';

  @override
  String get setupPasswordConfirmLabel => 'パスワード（確認）';

  @override
  String get setupPasswordWarning => 'このパスワードは回復できません。書き留めて安全に保管してください。';

  @override
  String get setupPasswordPageTitle => 'パスワードの作成';

  @override
  String get setupPasswordNext => '次';

  @override
  String get setupPasswordSkip => 'スキップ';

  @override
  String get setupCreateVaultTitle => '金庫を作成';

  @override
  String get setupCreateVaultSubtitle => 'お使いの端末にのみ保存。暗号化されプライベートです。';

  @override
  String get setupDefaultVaultName => 'マイ金庫';

  @override
  String setupRandomVaultName(String number) {
    return '金庫$number';
  }

  @override
  String get setupCropPhotoTitle => '写真を切り抜く';

  @override
  String get setupProtectionTitle => '保護';

  @override
  String get setupEncryption256Label => '256ビット暗号化';

  @override
  String get setupRequirePasswordLabel => 'パスワードを必須にする';

  @override
  String get setupCreateVaultButton => '金庫を作成';

  @override
  String get setupCreatingVaultTitle => '金庫を作成しています';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => '鍵を作成しています';

  @override
  String get setupEncryptingDataLabel => 'データを暗号化しています';

  @override
  String get setupCheckingSecurityLabel => 'セキュリティを確認しています';

  @override
  String get setupCreatingVaultError => '問題が発生しました。もう一度お試しください。';

  @override
  String get setupVaultCreatedTitle => '金庫が作成されました';

  @override
  String get setupVaultCreatedSubtitle => '金庫の準備ができました。暗号化され安全です。';

  @override
  String get setupOpenVaultButton => '金庫を開く';

  @override
  String get setupSavedSecretKeyCheckbox => '秘密鍵を安全に保存しました';

  @override
  String get setupContinue => '続ける';

  @override
  String get setupAddPasswordPageTitle => 'パスワードを追加';

  @override
  String get setupSavePasswordButton => 'パスワードを保存';

  @override
  String get confirmationCheckboxTitle => 'パスワードを回復できないことを理解しています';

  @override
  String get loginWelcomeBack => 'おかえり';

  @override
  String get loginPasswordLabel => 'パスワード';

  @override
  String get loginUnlock => 'ロックを解除する';

  @override
  String get loginPasswordRequired => 'パスワードを入力してください';

  @override
  String get loginIncorrectPassword => 'パスワードが間違っています。もう一度試してください。';

  @override
  String get paywallNoSubscription => 'アクティブなサブスクリプションが見つかりません。続行するには購入してください。';

  @override
  String get lifetimeThanksTitle => '私たちと一緒にいてくれてありがとうございます';

  @override
  String get lifetimeThanksSubtitle => '生涯 Pro アクセスをプレゼントします';

  @override
  String get lifetimeThanksGift => 'ギフト';

  @override
  String get lifetimeThanksCta => '生涯アクセスを受け取る';

  @override
  String get paywallNoInternetTitle => 'インターネット接続なし';

  @override
  String get paywallNoInternetBody =>
      'アプリに初めてアクセスするには、インターネット接続が必要です。接続してもう一度お試しください。';

  @override
  String get paywallStoreUnavailableTitle => 'ストアが利用できません';

  @override
  String get paywallStoreUnavailableBody =>
      'サブスクリプション オプションを読み込めません。もう一度試してください。';

  @override
  String get subscriptionVerifyTitle => 'サブスクリプションの確認';

  @override
  String get subscriptionSoftWarningTitle => 'サブスクリプションの検証が必要です';

  @override
  String get subscriptionContinueAnyway => 'とにかく続行';

  @override
  String subscriptionLastVerified(String date) {
    return '最後に確認した日: $date。';
  }

  @override
  String get subscriptionNotVerifiedOnline => 'サブスクリプションをオンラインで確認できませんでした。';

  @override
  String subscriptionAccessUntil(String date) {
    return 'アクセスは $date まで続きます。確認するには、それまでに接続してください。';
  }

  @override
  String get subscriptionConnectToVerify =>
      'サブスクリプションを確認するには、インターネットに接続してください。';

  @override
  String get duplicatesNoDuplicates => '潜在的な重複は見つかりませんでした';

  @override
  String get duplicatesSkippedShownAgain => 'スキップされた重複が再度表示されます。';

  @override
  String get duplicatesShowSkippedTooltip => 'スキップされた重複グループを再度表示します';

  @override
  String duplicatesFailedToLoad(String error) {
    return '重複したグループのロードに失敗しました: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count 件の重複';
  }

  @override
  String get duplicatesSubtitlePlaceholder => 'タップして詳細を表示';

  @override
  String get duplicatesConflictMostlyIdentical => 'ほとんど同一';

  @override
  String duplicatesConflictFieldVariants(String field, int count) {
    return '$field: $count 種類';
  }

  @override
  String get fieldLabelName => '名前';

  @override
  String get fieldLabelCompany => '会社';

  @override
  String get fieldLabelPhone => '電話';

  @override
  String get fieldLabelEmail => '電子メール';

  @override
  String get importErrorUnsupportedSource => 'ここではインポートは利用できません。';

  @override
  String get importErrorPermissionDenied => '連絡先をインポートするには、連絡先の許可が必要です。';

  @override
  String get importErrorNoContacts => 'インポートする連絡先がありません。';

  @override
  String get importErrorUnsupportedFileType =>
      '.vcf ファイルまたは .zip アーカイブを選択してください。';

  @override
  String get importErrorInvalidFile => '選択したファイルは無効であるか、読み取ることができません。';

  @override
  String get importErrorWrongPassword => 'アーカイブのパスワードが正しくありません。もう一度試してください。';

  @override
  String get importErrorNoVcfInArchive => '選択したアーカイブには .vcf ファイルが見つかりませんでした。';

  @override
  String importErrorFailed(String detail) {
    return '連絡先のインポートに失敗しました: $detail';
  }

  @override
  String get exportErrorContactsUnavailable => '連絡先はまだ利用できません。';

  @override
  String get exportErrorNoContacts => 'エクスポートする連絡先がありません。';

  @override
  String get exportErrorPasswordRequired => '保護されたエクスポートにはパスワードが必要です。';

  @override
  String exportErrorPasswordTooShort(int min) {
    return '保護されたエクスポートには、少なくとも $min 文字のパスワードが必要です。';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'エクスポートに失敗しました: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'ダウンロードが開始されました。';

  @override
  String get exportNoticeFileSaved => 'ファイルは正常に保存されました。';

  @override
  String get phoneTypeMobile => '携帯';

  @override
  String get phoneTypeHome => '自宅';

  @override
  String get phoneTypeWork => '仕事';

  @override
  String get phoneTypeSchool => '学校';

  @override
  String get phoneTypeOther => 'その他';

  @override
  String get emailTypePersonal => '個人';

  @override
  String get emailTypeWork => '仕事';

  @override
  String get emailTypeSchool => '学校';

  @override
  String get emailTypeOther => 'その他';

  @override
  String get addressTypeHome => '家';

  @override
  String get addressTypeWork => '仕事';

  @override
  String get addressTypeSchool => '学校';

  @override
  String get addressTypeBirth => '誕生';

  @override
  String get linkTypeWebsite => 'Webサイト';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'その他';

  @override
  String get dateTypeCreated => '作成日';

  @override
  String get dateTypeBirthday => '誕生日';

  @override
  String get dateTypeMet => '出会い';

  @override
  String get dateTypeGraduation => '卒業';

  @override
  String get dateTypeMarriage => '結婚';

  @override
  String get dateTypeOther => 'その他';

  @override
  String get noNameInList => '(名前なし)';

  @override
  String get formAddPhone => '電話を追加';

  @override
  String get formAddEmail => 'メールアドレスを追加';

  @override
  String get formAddAddress => '住所を追加';

  @override
  String get formAddLink => 'リンクを追加';

  @override
  String get formAddDate => '日付を追加';

  @override
  String get formHintPhoneNumber => '電話番号';

  @override
  String get formHintEmail => '電子メール';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => '住所';

  @override
  String get formHintSelectDate => '日付を選択してください';

  @override
  String get formHintNotes => 'メモを追加する';

  @override
  String get formCompany => '会社';

  @override
  String get formDepartment => '部門';

  @override
  String get formJobTitle => '役職';

  @override
  String get formPrefix => 'プレフィックス';

  @override
  String get formFirstName => 'ファーストネーム';

  @override
  String get formMiddleName => 'ミドルネーム';

  @override
  String get formLastName => '苗字';

  @override
  String get formSuffix => 'サフィックス';

  @override
  String get formNickname => 'ニックネーム';

  @override
  String get contactsListTitle => '連絡先';

  @override
  String get contactsListEmpty => 'まだ連絡先がありません';

  @override
  String get contactsImportButton => '連絡先のインポート';

  @override
  String get mergeContactsTitle => '連絡先を統合する';

  @override
  String get mergeContactsSubtitle => '1 つに結合する連絡先を選択してください';

  @override
  String get exportPasswordHint => 'パスワード';

  @override
  String get exportPasswordConfirmHint => 'パスワード（確認）';

  @override
  String exportPasswordHelper(int min) {
    return '少なくとも $min 文字';
  }

  @override
  String get zipPasswordHint => 'アーカイブパスワード';

  @override
  String get activateDemoAccessCodeLabel => 'アクセスコード';

  @override
  String get subscriptionExpiredTitle => 'サブスクリプションの有効期限が切れました';

  @override
  String get subscriptionExpiredBody => 'すべての機能を引き続き使用するには更新してください。';

  @override
  String get contactsLoadError => '連絡先をロードできませんでした。';

  @override
  String get contactsListError => '連絡先をロードできませんでした。';

  @override
  String get contactsSearchNoResults => '連絡先が見つかりません';

  @override
  String get supportPageIntro =>
      'ご質問、フィードバック、または不具合がありますか？Savelonチームがすべてのメッセージを読みます。';

  @override
  String get supportCtaMessageTeam => 'チームに連絡';

  @override
  String get importFromDeviceContacts => '連絡先から';

  @override
  String get importFromFileVcfZip => 'ファイルから（VCF、ZIP）';

  @override
  String get exportCreateUniquePasswordTitle => '固有のパスワードを作成';

  @override
  String get exportPasswordIrrecoverableHint => 'このパスワードは復元できません。';

  @override
  String get exportProtectedArchiveCta => '保護されたアーカイブを書き出す';

  @override
  String get exportIosSavedFileWarning =>
      'このファイルはSavelonフォルダに保存されます。アプリを削除するとファイルも削除されます。保持する場合は別の場所に移動してください。';

  @override
  String importContactsConfirmBody(int count) {
    return '$count件の連絡先をSavelonにインポートしますか？';
  }

  @override
  String get settingsSetPasswordPageTitle => 'パスワードを設定';

  @override
  String get settingsChangePasswordPageTitle => 'パスワードを変更';

  @override
  String get settingsRemovePasswordPageTitle => 'パスワードを削除';

  @override
  String get settingsNewPasswordLabel => '新しいパスワード';

  @override
  String get settingsConfirmNewPasswordLabel => '新しいパスワードを確認';

  @override
  String get settingsReenterNewPasswordHelper => '新しいパスワードを再入力';

  @override
  String get settingsSetPasswordCta => 'パスワードを設定';

  @override
  String get settingsChangePasswordCta => 'パスワードを変更';

  @override
  String get settingsRemovePasswordCta => 'パスワードを削除';

  @override
  String get settingsCurrentPasswordLabel => '現在のパスワード';

  @override
  String get settingsEnterCurrentPasswordHelper => '現在のパスワードを入力';

  @override
  String get settingsNewPasswordMustDiffer => '新しいパスワードは現在のパスワードと異なる必要があります';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'パスワードを設定できませんでした: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'パスワードを変更できませんでした: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'パスワードを削除できませんでした: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'パスワードが無効です';

  @override
  String get settingsCurrentPasswordIncorrect => '現在のパスワードが正しくありません';

  @override
  String get settingsCurrentPasswordRequired => '現在のパスワードが必要です';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'パスワード保護が有効なときはパスワードが必要です';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'パスワードオプションを有効にするときはパスワードが必要です';

  @override
  String get authPasswordRequiredForAccount => 'このアカウントにはパスワードが必要です';

  @override
  String get loginLoggedInSecurely => '安全にログインしました';
}

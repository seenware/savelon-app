// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Зашифрованные контакты';

  @override
  String get navContacts => 'Контакты';

  @override
  String get navOrganize => 'Дубликаты';

  @override
  String get navSupport => 'Поддержка';

  @override
  String get navSettings => 'Настройки';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get languageSystemDefault => 'Система по умолчанию';

  @override
  String get organizeTitle => 'Дубликаты';

  @override
  String get supportTitle => 'Поддержка';

  @override
  String get search => 'Поиск';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonEdit => 'Редактировать';

  @override
  String get commonMerge => 'Объединить';

  @override
  String get commonSkip => 'Пропустить';

  @override
  String get commonRetry => 'Повторить попытку';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonNext => 'Далее';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonYes => 'Да';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonContinue => 'Продолжить';

  @override
  String get commonTryAgain => 'Попробуйте еще раз';

  @override
  String get commonApply => 'Применить';

  @override
  String get commonDiscard => 'Удалить';

  @override
  String get commonUnlock => 'Разблокировать';

  @override
  String get commonLoading => 'Загрузка...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get brandSlogan => 'Ваши контакты. Только ваши.';

  @override
  String get contactNotFound => 'Контакт не найден';

  @override
  String get contactDeleted => 'Контакт удален';

  @override
  String get contactUpdated => 'Контакт обновлен';

  @override
  String get contactSaved => 'Контакт сохранен.';

  @override
  String get contactsMerged => 'Контакты объединены';

  @override
  String get deleteContactTitle => 'Удалить контакт';

  @override
  String deleteContactConfirm(String name) {
    return 'Вы уверены, что хотите удалить $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Вы уверены, что хотите удалить «$name»?';
  }

  @override
  String failedToDelete(String error) {
    return 'Не удалось удалить: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Не удалось обновить: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get noName => 'Без имени';

  @override
  String get noNameTitle => 'Без имени';

  @override
  String get noNameBody => 'У этого контакта нет имени. Все равно сохранить?';

  @override
  String get discardChangesTitle => 'Удалить изменения?';

  @override
  String get discardChangesBody =>
      'У вас есть несохраненные изменения, которые будут потеряны.';

  @override
  String get newContact => 'Новый контакт';

  @override
  String get editContact => 'Редактировать контакт';

  @override
  String get addMore => 'Добавить еще';

  @override
  String get addNameFieldsTitle => 'Добавить поля имени';

  @override
  String get call => 'Вызов';

  @override
  String get sendEmail => 'Отправить электронное письмо';

  @override
  String get copy => 'Копировать';

  @override
  String get visit => 'Открыть';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get importContacts => 'Импортировать контакты';

  @override
  String get importing => 'Импорт...';

  @override
  String importedCount(int count) {
    return 'Импортированные контакты $count';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Импортированы контакты $imported, $skipped пропущены.';
  }

  @override
  String get failedToImportContacts => 'Не удалось импортировать контакты';

  @override
  String get noContactsToImport => 'Нет контактов для импорта.';

  @override
  String get contactsPermissionRequiredImport =>
      'Для импорта контактов требуется разрешение контактов.';

  @override
  String get importDialogTitle => 'Импортировать контакты';

  @override
  String get importDialogBody =>
      'Импортировать контакты с устройства или из файла?';

  @override
  String get importSourceTitle => 'Импорт';

  @override
  String get importZipPasswordTitle => 'Пароль архива';

  @override
  String get importZipPasswordChecking => 'Проверка...';

  @override
  String get exportContacts => 'Экспортировать контаты';

  @override
  String get unlockPro => 'Открыть Pro';

  @override
  String get exportContactsTitle => 'Экспортировать контаты';

  @override
  String get exportSubtitle => 'Выберите, как вы хотите сохранить контакты.';

  @override
  String get exportFormatVcfTitle => 'Сохранить как .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Один файл, который работает с контактами Apple, контактами Google и другими.';

  @override
  String get exportFormatZipTitle => 'Сохранить в архиве, защищенном паролем.';

  @override
  String get exportFormatZipSubtitle =>
      '.zip с вашим .vcf внутри — для открытия требуется пароль.';

  @override
  String get exportProtectedTitle => 'Защищенный экспорт';

  @override
  String get exportCompleteTitle => 'Экспорт завершен';

  @override
  String get stillLoadingContacts =>
      'Продолжаем загружать контакты. Пожалуйста, подождите.';

  @override
  String get couldNotLoadContacts => 'Не удалось загрузить контакты.';

  @override
  String get passwordChangedSuccess => 'Пароль успешно изменен';

  @override
  String get passwordProtectionEnabled => 'Защита паролем успешно включена';

  @override
  String get passwordProtectionRemoved => 'Защита паролем успешно удалена';

  @override
  String get removePasswordProtectionButton => 'Удалить защиту паролем';

  @override
  String get changePasswordTitle => 'Изменить пароль';

  @override
  String get setPasswordTitle => 'Установить пароль';

  @override
  String get passwordSettingsChangeTitle => 'Изменить пароль';

  @override
  String get passwordSettingsSetTitle => 'Установить пароль';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Не удалось открыть политику конфиденциальности: $error.';
  }

  @override
  String get resetAppTitle => 'Сбросить приложение';

  @override
  String get resetAppConfirmTitle =>
      'Удалить все контакты и сбросить приложение?';

  @override
  String get resetAppCannotUndo => 'Это нельзя отменить';

  @override
  String resetAppError(String error) {
    return 'Ошибка сброса приложения: $error';
  }

  @override
  String get photoPickerNewImage => 'Выбрать новое изображение';

  @override
  String get photoPickerRemoveImage => 'Удалить изображение';

  @override
  String get onboardingHeadline1 =>
      'Кто может получить доступ к вашим контактам?';

  @override
  String get onboardingSubline1 =>
      'Некоторые приложения загружают их в облако. Это может создать больше рисков для конфиденциальности.';

  @override
  String get onboardingHeadline2 =>
      'Многие приложения запрашивают доступ к контактам';

  @override
  String get onboardingSubline2 =>
      'Это может быть полезно, но важные контакты должны оставаться конфиденциальными.';

  @override
  String get onboardingHeadline3 =>
      'Храните конфиденциальные контакты отдельно';

  @override
  String get onboardingSubline3 =>
      'Мы рекомендуем хранить важные и редко используемые контакты за пределами основного приложения контактов.';

  @override
  String get onboardingHeadline4 => 'Защитите свои важные контакты';

  @override
  String get onboardingSubline4 =>
      'Savelon хранит их на вашем устройстве в зашифрованном виде и конфиденциально для других приложений.';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'Открытый код';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'Любой может посмотреть наш код на ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => '.';

  @override
  String get onboardingBenefitsPrivateTitle => 'Приватность';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'Даже мы не видим ваши контакты';

  @override
  String get onboardingBenefitsSandboxTitle =>
      'Другие приложения не могут заглянуть внутрь';

  @override
  String get onboardingBenefitsOfflineTitle => 'Офлайн';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'Это держит вас подальше от облака, брокеров данных и систем слежки';

  @override
  String get activateDemoTitle => 'Активировать демо';

  @override
  String get activateDemoCancel => 'Отмена';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Теперь у вас есть демо-доступ до $dateTime.';
  }

  @override
  String get setupPasswordTitle => 'Добавить защиту паролем';

  @override
  String get setupPasswordMismatch => 'Пароли не совпадают';

  @override
  String get setupPasswordFailedSeed =>
      'Не удалось создать начальное значение. Пожалуйста, попробуйте еще раз.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Не удалось инициализировать. Ошибка: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Ваши контакты по-прежнему будут надежно зашифрованы длинным секретным ключом, хранящимся только на вашем устройстве. Но пароль добавляет дополнительную защиту.';

  @override
  String get setupPasswordLabel => 'Пароль';

  @override
  String get setupPasswordConfirmLabel => 'Подтвердите пароль';

  @override
  String get setupPasswordWarning =>
      'Этот пароль невозможно восстановить. Запишите его и храните в безопасности!';

  @override
  String get setupPasswordPageTitle => 'Создать пароль';

  @override
  String get setupPasswordNext => 'Далее';

  @override
  String get setupPasswordSkip => 'Пропускать';

  @override
  String get setupCreateVaultTitle => 'Создайте хранилище';

  @override
  String get setupCreateVaultSubtitle =>
      'Только на вашем устройстве. Зашифровано и конфиденциально.';

  @override
  String get setupDefaultVaultName => 'Моё хранилище';

  @override
  String setupRandomVaultName(String number) {
    return 'Хранилище$number';
  }

  @override
  String get setupCropPhotoTitle => 'Обрезать фото';

  @override
  String get setupProtectionTitle => 'Защита';

  @override
  String get setupEncryption256Label => 'Шифрование 256 бит';

  @override
  String get setupRequirePasswordLabel => 'Требовать пароль';

  @override
  String get setupOptionalSuffix => 'необязательно';

  @override
  String get setupCreateVaultButton => 'Создать хранилище';

  @override
  String get setupCreatingVaultTitle => 'Создаём хранилище';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'Создаём ключ';

  @override
  String get setupEncryptingDataLabel => 'Шифруем данные';

  @override
  String get setupCheckingSecurityLabel => 'Проверяем безопасность';

  @override
  String get setupCreatingVaultError =>
      'Что-то пошло не так. Попробуйте снова.';

  @override
  String get setupVaultCreatedTitle => 'Хранилище создано';

  @override
  String get setupVaultCreatedSubtitle =>
      'Ваше хранилище готово. Оно зашифровано и надёжно защищено.';

  @override
  String get setupOpenVaultButton => 'Открыть хранилище';

  @override
  String get setupSavedSecretKeyCheckbox => 'Я надёжно сохранил секретный ключ';

  @override
  String get setupContinue => 'Продолжить';

  @override
  String get setupAddPasswordPageTitle => 'Добавить пароль';

  @override
  String get setupSavePasswordButton => 'Сохранить пароль';

  @override
  String get confirmationCheckboxTitle =>
      'Я понимаю, что мой пароль невозможно восстановить';

  @override
  String get loginWelcomeBack => 'Добро пожаловать';

  @override
  String get loginPasswordLabel => 'Пароль';

  @override
  String get loginUnlock => 'Разблокировать';

  @override
  String get loginPasswordRequired => 'Введите свой пароль';

  @override
  String get loginIncorrectPassword =>
      'Неправильный пароль. Пожалуйста, попробуйте еще раз.';

  @override
  String get paywallNoSubscription =>
      'Активная подписка не найдена. Пожалуйста, купите, чтобы продолжить.';

  @override
  String get lifetimeThanksTitle => 'Спасибо, что вы с нами';

  @override
  String get lifetimeThanksSubtitle => 'Мы дарим вам пожизненный доступ Pro';

  @override
  String get lifetimeThanksGift => 'подарок';

  @override
  String get lifetimeThanksCta => 'Получить пожизненный доступ';

  @override
  String get paywallNoInternetTitle => 'Нет подключения к Интернету';

  @override
  String get paywallNoInternetBody =>
      'Для первого доступа к приложению требуется подключение к Интернету. Пожалуйста, подключитесь и повторите попытку.';

  @override
  String get paywallStoreUnavailableTitle => 'Магазин недоступен';

  @override
  String get paywallStoreUnavailableBody =>
      'Не удалось загрузить варианты подписки. Пожалуйста, попробуйте еще раз.';

  @override
  String get subscriptionVerifyTitle => 'Подтвердить подписку';

  @override
  String get subscriptionSoftWarningTitle => 'Требуется подтверждение подписки';

  @override
  String get subscriptionContinueAnyway => 'Продолжить в любом случае';

  @override
  String subscriptionLastVerified(String date) {
    return 'Последняя проверка $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Подписку не удалось подтвердить онлайн.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Ваш доступ продолжается до $date — подключитесь до этого момента, чтобы подтвердить.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Подключитесь к Интернету, чтобы подтвердить подписку.';

  @override
  String get organizeNoDuplicates => 'Потенциальные дубликаты не найдены';

  @override
  String get organizeSkippedShownAgain =>
      'Пропущенные дубликаты отображаются снова.';

  @override
  String get organizeShowSkippedTooltip =>
      'Снова показать пропущенные повторяющиеся группы';

  @override
  String organizeFailedToLoad(String error) {
    return 'Не удалось загрузить повторяющиеся группы: $error.';
  }

  @override
  String duplicatesCount(int count) {
    return '$count дубликата';
  }

  @override
  String get organizeSubtitlePlaceholder =>
      'Нажмите, чтобы просмотреть подробности';

  @override
  String get organizeConflictMostlyIdentical => 'В основном идентичны';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: варианты $count';
  }

  @override
  String get fieldLabelName => 'имя';

  @override
  String get fieldLabelCompany => 'компания';

  @override
  String get fieldLabelPhone => 'телефон';

  @override
  String get fieldLabelEmail => 'электронная почта';

  @override
  String get importErrorUnsupportedSource => 'Импорт здесь недоступен.';

  @override
  String get importErrorPermissionDenied =>
      'Для импорта контактов требуется разрешение контактов.';

  @override
  String get importErrorNoContacts => 'Нет контактов для импорта.';

  @override
  String get importErrorUnsupportedFileType =>
      'Пожалуйста, выберите файл .vcf или архив .zip.';

  @override
  String get importErrorInvalidFile =>
      'Выбранный файл недействителен или нечитаем.';

  @override
  String get importErrorWrongPassword =>
      'Неправильный пароль архива. Пожалуйста, попробуйте еще раз.';

  @override
  String get importErrorNoVcfInArchive =>
      'В выбранном архиве не обнаружено файлов .vcf.';

  @override
  String importErrorFailed(String detail) {
    return 'Не удалось импортировать контакты: $detail.';
  }

  @override
  String get exportErrorContactsUnavailable => 'Контакты пока недоступны.';

  @override
  String get exportErrorNoContacts => 'Нет контактов для экспорта.';

  @override
  String get exportErrorPasswordRequired =>
      'Для защищенного экспорта требуется пароль.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Для защищенного экспорта требуется пароль длиной не менее $min символов.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Не удалось экспортировать: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Загрузка началась.';

  @override
  String get exportNoticeFileSaved => 'Файл успешно сохранен.';

  @override
  String get phoneTypeMobile => 'Мобильный';

  @override
  String get phoneTypeHome => 'Домашний';

  @override
  String get phoneTypeWork => 'Рабочий';

  @override
  String get phoneTypeSchool => 'Школьный';

  @override
  String get phoneTypeOther => 'Другой';

  @override
  String get emailTypePersonal => 'Личная';

  @override
  String get emailTypeWork => 'Рабочая';

  @override
  String get emailTypeSchool => 'Школьная';

  @override
  String get emailTypeOther => 'Другая';

  @override
  String get addressTypeHome => 'Дом';

  @override
  String get addressTypeWork => 'Работа';

  @override
  String get addressTypeSchool => 'Школа';

  @override
  String get addressTypeBirth => 'Родился';

  @override
  String get linkTypeWebsite => 'Веб-сайт';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Другая';

  @override
  String get dateTypeCreated => 'Созданный';

  @override
  String get dateTypeBirthday => 'День рождения';

  @override
  String get dateTypeMet => 'Познакомились';

  @override
  String get dateTypeGraduation => 'Выпускной';

  @override
  String get dateTypeMarriage => 'Свадьба';

  @override
  String get dateTypeOther => 'Другая';

  @override
  String get noNameInList => '(Без имени)';

  @override
  String get formAddPhone => 'Добавить телефон';

  @override
  String get formAddEmail => 'Добавить электронную почту';

  @override
  String get formAddAddress => 'Добавить адрес';

  @override
  String get formAddLink => 'Добавить ссылку';

  @override
  String get formAddDate => 'Добавить дату';

  @override
  String get formHintPhoneNumber => 'Номер телефона';

  @override
  String get formHintEmail => 'Электронная почта';

  @override
  String get formHintUrl => 'URL-адрес';

  @override
  String get formHintAddress => 'Адрес';

  @override
  String get formHintSelectDate => 'Выберите дату';

  @override
  String get formHintNotes => 'Добавить заметки';

  @override
  String get formCompany => 'Компания';

  @override
  String get formDepartment => 'Отдел';

  @override
  String get formJobTitle => 'Должность';

  @override
  String get formPrefix => 'Префикс';

  @override
  String get formFirstName => 'Имя';

  @override
  String get formMiddleName => 'Отчество';

  @override
  String get formLastName => 'Фамилия';

  @override
  String get formSuffix => 'Суффикс';

  @override
  String get formNickname => 'Псевдоним';

  @override
  String get contactsListTitle => 'Контакты';

  @override
  String get contactsListEmpty => 'Пока нет контактов';

  @override
  String get contactsImportButton => 'Импортировать контакты';

  @override
  String get mergeContactsTitle => 'Объединить контакты';

  @override
  String get mergeContactsSubtitle =>
      'Выберите контакты для объединения в один';

  @override
  String get exportPasswordHint => 'Пароль';

  @override
  String get exportPasswordConfirmHint => 'Подтвердите пароль';

  @override
  String exportPasswordHelper(int min) {
    return 'Не менее $min символов';
  }

  @override
  String get zipPasswordHint => 'Пароль архива';

  @override
  String get activateDemoAccessCodeLabel => 'Код доступа';

  @override
  String get subscriptionExpiredTitle => 'Срок подписки истек';

  @override
  String get subscriptionExpiredBody =>
      'Продлите подписку, чтобы продолжить использовать все функции.';

  @override
  String get contactsLoadError => 'Не удалось загрузить контакты.';

  @override
  String get contactsListError => 'Не удалось загрузить контакты.';

  @override
  String get contactsSearchNoResults => 'Контакты не найдены';

  @override
  String get supportPageIntro =>
      'Вопросы, отзывы или что-то не работает? Команда Savelon читает каждое сообщение.';

  @override
  String get supportCtaMessageTeam => 'Написать команде';

  @override
  String get importFromDeviceContacts => 'Из ваших контактов';

  @override
  String get importFromFileVcfZip => 'Из файла (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Создать уникальный пароль';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Этот пароль нельзя восстановить.';

  @override
  String get exportProtectedArchiveCta => 'Экспорт защищённого архива';

  @override
  String get exportIosSavedFileWarning =>
      'Этот файл сохраняется в папке Savelon. Если удалить приложение, файл тоже будет удалён. Переместите его в другое место, чтобы сохранить.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Импортировать $count контактов в Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Задать пароль';

  @override
  String get settingsChangePasswordPageTitle => 'Изменить пароль';

  @override
  String get settingsRemovePasswordPageTitle => 'Удалить пароль';

  @override
  String get settingsNewPasswordLabel => 'Новый пароль';

  @override
  String get settingsConfirmNewPasswordLabel => 'Подтвердите новый пароль';

  @override
  String get settingsReenterNewPasswordHelper => 'Введите новый пароль ещё раз';

  @override
  String get settingsSetPasswordCta => 'Задать пароль';

  @override
  String get settingsChangePasswordCta => 'Изменить пароль';

  @override
  String get settingsRemovePasswordCta => 'Удалить пароль';

  @override
  String get settingsCurrentPasswordLabel => 'Текущий пароль';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Введите текущий пароль';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Новый пароль должен отличаться от текущего';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Не удалось задать пароль: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Не удалось изменить пароль: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Не удалось удалить пароль: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Недопустимый пароль';

  @override
  String get settingsCurrentPasswordIncorrect => 'Неверный текущий пароль';

  @override
  String get settingsCurrentPasswordRequired => 'Требуется текущий пароль';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Пароль требуется при включённой защите паролем';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Пароль требуется при включении опции пароля';

  @override
  String get authPasswordRequiredForAccount =>
      'Для этой учётной записи требуется пароль';
}

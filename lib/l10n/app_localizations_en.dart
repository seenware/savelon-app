// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Encrypted Contacts';

  @override
  String get navContacts => 'Contacts';

  @override
  String get navOrganize => 'Organize';

  @override
  String get navSupport => 'Support';

  @override
  String get navSettings => 'Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSystemDefault => 'System default';

  @override
  String get organizeTitle => 'Organize';

  @override
  String get supportTitle => 'Support';

  @override
  String get search => 'Search';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonSave => 'Save';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonMerge => 'Merge';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonClose => 'Close';

  @override
  String get commonNext => 'Next';

  @override
  String get commonBack => 'Go Back';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonTryAgain => 'Try Again';

  @override
  String get commonApply => 'Apply';

  @override
  String get commonDiscard => 'Discard';

  @override
  String get commonUnlock => 'Unlock';

  @override
  String get commonLoading => 'Loading...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Error: $error';
  }

  @override
  String get brandSlogan => 'Your Contacts. Yours Alone.';

  @override
  String get contactNotFound => 'Contact not found';

  @override
  String get contactDeleted => 'Contact deleted';

  @override
  String get contactUpdated => 'Contact updated';

  @override
  String get contactSaved => 'Contact saved';

  @override
  String get contactsMerged => 'Contacts merged';

  @override
  String get deleteContactTitle => 'Delete Contact';

  @override
  String deleteContactConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'Failed to delete: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Failed to update: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get noName => 'No Name';

  @override
  String get noNameTitle => 'No Name';

  @override
  String get noNameBody => 'This contact has no name. Save anyway?';

  @override
  String get discardChangesTitle => 'Discard changes?';

  @override
  String get discardChangesBody =>
      'You have unsaved changes that will be lost.';

  @override
  String get newContact => 'New Contact';

  @override
  String get editContact => 'Edit Contact';

  @override
  String get addMore => 'Add more';

  @override
  String get addNameFieldsTitle => 'Add Name Fields';

  @override
  String get call => 'Call';

  @override
  String get sendEmail => 'Send Email';

  @override
  String get copy => 'Copy';

  @override
  String get visit => 'Visit';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get importContacts => 'Import Contacts';

  @override
  String get importing => 'Importing...';

  @override
  String importedCount(int count) {
    return 'Imported $count contacts';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Imported $imported contacts, $skipped skipped';
  }

  @override
  String get failedToImportContacts => 'Failed to import contacts';

  @override
  String get noContactsToImport => 'There are no contacts to import.';

  @override
  String get contactsPermissionRequiredImport =>
      'Contacts permission is required to import contacts';

  @override
  String get importDialogTitle => 'Import Contacts';

  @override
  String get importDialogBody => 'Import contacts from your device or a file?';

  @override
  String get importSourceTitle => 'Import';

  @override
  String get importZipPasswordTitle => 'Archive password';

  @override
  String get importZipPasswordChecking => 'Checking...';

  @override
  String get exportContacts => 'Export Contacts';

  @override
  String get unlockPro => 'Unlock Pro';

  @override
  String get exportContactsTitle => 'Export contacts';

  @override
  String get exportSubtitle => 'Pick how you want to save your contacts.';

  @override
  String get exportFormatVcfTitle => 'Save as .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'One file that works with Apple Contacts, Google Contacts, and more.';

  @override
  String get exportFormatZipTitle => 'Save in password-protected archive';

  @override
  String get exportFormatZipSubtitle =>
      'A .zip with your .vcf inside — requires a password to open it.';

  @override
  String get exportProtectedTitle => 'Protected export';

  @override
  String get exportCompleteTitle => 'Export complete';

  @override
  String get stillLoadingContacts => 'Still loading contacts. Please wait.';

  @override
  String get couldNotLoadContacts => 'Could not load contacts.';

  @override
  String get passwordChangedSuccess => 'Password changed successfully';

  @override
  String get passwordProtectionEnabled =>
      'Password protection enabled successfully';

  @override
  String get passwordProtectionRemoved =>
      'Password protection removed successfully';

  @override
  String get removePasswordProtectionButton => 'Remove Password Protection';

  @override
  String get changePasswordTitle => 'Change Password';

  @override
  String get setPasswordTitle => 'Set Password';

  @override
  String get passwordSettingsChangeTitle => 'Change Password';

  @override
  String get passwordSettingsSetTitle => 'Set Password';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Failed to open privacy policy: $error';
  }

  @override
  String get resetAppTitle => 'Reset the app';

  @override
  String get resetAppConfirmTitle => 'Delete all contacts, and reset the app?';

  @override
  String get resetAppCannotUndo => 'This cannot be undone';

  @override
  String resetAppError(String error) {
    return 'Error resetting app: $error';
  }

  @override
  String get photoPickerNewImage => 'Select new image';

  @override
  String get photoPickerRemoveImage => 'Remove image';

  @override
  String get onboardingHeadline1 => 'Who can access your contacts?';

  @override
  String get onboardingSubline1 =>
      'Some apps upload them to the cloud. This can create more privacy risks.';

  @override
  String get onboardingHeadline2 => 'Many apps ask for contact access';

  @override
  String get onboardingSubline2 =>
      'It can be useful — but important contacts should stay private.';

  @override
  String get onboardingHeadline3 => 'Keep sensitive contacts separate';

  @override
  String get onboardingSubline3 =>
      'We recommend to store important and rarely used contacts outside your main contacts app.';

  @override
  String get onboardingHeadline4 => 'Protect your important contacts';

  @override
  String get onboardingSubline4 =>
      'Savelon stores them on your device, encrypted and private from other apps.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'Open source';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'Anyone can check our code on ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => '.';

  @override
  String get onboardingBenefitsPrivateTitle => 'Private';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'Even we cannot see your contacts';

  @override
  String get onboardingBenefitsSandboxTitle => 'Other apps cannot look inside';

  @override
  String get onboardingBenefitsOfflineTitle => 'Offline';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'Keeps you away from the cloud, data brokers, and surveillance systems';

  @override
  String get activateDemoTitle => 'Activate Demo';

  @override
  String get activateDemoCancel => 'Cancel';

  @override
  String demoAccessGranted(String dateTime) {
    return 'You now have demo access until $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Add password protection';

  @override
  String get setupPasswordMismatch => 'Passwords do not match';

  @override
  String get setupPasswordFailedSeed =>
      'Failed to generate seed. Please try again.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Failed to initialize. Error: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Your contacts will still be strongly encrypted by a long secret key, stored on your device only. But password adds extra protection.';

  @override
  String get setupPasswordLabel => 'Password';

  @override
  String get setupPasswordConfirmLabel => 'Confirm Password';

  @override
  String get setupPasswordWarning =>
      'This password cannot be recovered. Write it down and keep it safe!';

  @override
  String get setupPasswordPageTitle => 'Create Password';

  @override
  String get setupPasswordNext => 'Next';

  @override
  String get setupPasswordSkip => 'Skip';

  @override
  String get setupCreateVaultTitle => 'Create your vault';

  @override
  String get setupCreateVaultSubtitle =>
      'Stored on your device only. Encrypted and private.';

  @override
  String get setupDefaultVaultName => 'My vault';

  @override
  String setupRandomVaultName(String number) {
    return 'Vault$number';
  }

  @override
  String get setupCropPhotoTitle => 'Crop photo';

  @override
  String get setupProtectionTitle => 'Protection';

  @override
  String get setupEncryption256Label => '256-bit encryption';

  @override
  String get setupRequirePasswordLabel => 'Require password';

  @override
  String get setupOptionalSuffix => 'optional';

  @override
  String get setupCreateVaultButton => 'Create vault';

  @override
  String get setupCreatingVaultTitle => 'Creating your vault';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent%';
  }

  @override
  String get setupCreatingKeyLabel => 'Creating your key';

  @override
  String get setupEncryptingDataLabel => 'Encrypting your data';

  @override
  String get setupCheckingSecurityLabel => 'Checking security';

  @override
  String get setupCreatingVaultError =>
      'Something went wrong. Please try again.';

  @override
  String get setupVaultCreatedTitle => 'Vault created';

  @override
  String get setupVaultCreatedSubtitle =>
      'Your vault is ready. It is encrypted and secure.';

  @override
  String get setupOpenVaultButton => 'Open vault';

  @override
  String get setupSavedSecretKeyCheckbox => 'I saved my secret key safely';

  @override
  String get setupContinue => 'Continue';

  @override
  String get setupAddPasswordPageTitle => 'Add password';

  @override
  String get setupSavePasswordButton => 'Save password';

  @override
  String get confirmationCheckboxTitle =>
      'I understand my password cannot be recovered';

  @override
  String get loginWelcomeBack => 'Welcome Back';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginUnlock => 'Unlock';

  @override
  String get loginPasswordRequired => 'Enter your password';

  @override
  String get loginIncorrectPassword => 'Incorrect password. Please try again.';

  @override
  String get paywallNoSubscription =>
      'No active subscription found. Please purchase to continue.';

  @override
  String get lifetimeThanksTitle => 'Thank you for being with us';

  @override
  String get lifetimeThanksSubtitle => 'We gift you lifetime pro access';

  @override
  String get lifetimeThanksGift => 'gift';

  @override
  String get lifetimeThanksCta => 'Claim lifetime access';

  @override
  String get paywallNoInternetTitle => 'No Internet Connection';

  @override
  String get paywallNoInternetBody =>
      'An internet connection is required to access the app for the first time. Please connect and try again.';

  @override
  String get paywallStoreUnavailableTitle => 'Store Unavailable';

  @override
  String get paywallStoreUnavailableBody =>
      'Unable to load subscription options. Please try again.';

  @override
  String get subscriptionVerifyTitle => 'Verify Subscription';

  @override
  String get subscriptionSoftWarningTitle => 'Subscription Verification Needed';

  @override
  String get subscriptionContinueAnyway => 'Continue Anyway';

  @override
  String subscriptionLastVerified(String date) {
    return 'Last verified $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'Subscription could not be verified online.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Your access continues until $date — connect before then to verify.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Connect to the internet to verify your subscription.';

  @override
  String get organizeNoDuplicates => 'No potential duplicates found';

  @override
  String get organizeSkippedShownAgain => 'Skipped duplicates are shown again.';

  @override
  String get organizeShowSkippedTooltip =>
      'Show skipped duplicate groups again';

  @override
  String organizeFailedToLoad(String error) {
    return 'Failed to load duplicate groups: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicates';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Tap to view details';

  @override
  String get organizeConflictMostlyIdentical => 'Mostly identical';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count variants';
  }

  @override
  String get fieldLabelName => 'name';

  @override
  String get fieldLabelCompany => 'company';

  @override
  String get fieldLabelPhone => 'phone';

  @override
  String get fieldLabelEmail => 'email';

  @override
  String get importErrorUnsupportedSource => 'Import is not available here.';

  @override
  String get importErrorPermissionDenied =>
      'Contacts permission is required to import contacts.';

  @override
  String get importErrorNoContacts => 'There are no contacts to import.';

  @override
  String get importErrorUnsupportedFileType =>
      'Please select a .vcf file or a .zip archive.';

  @override
  String get importErrorInvalidFile =>
      'The selected file is invalid or unreadable.';

  @override
  String get importErrorWrongPassword =>
      'Incorrect archive password. Please try again.';

  @override
  String get importErrorNoVcfInArchive =>
      'No .vcf files were found in the selected archive.';

  @override
  String importErrorFailed(String detail) {
    return 'Failed to import contacts: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Contacts are not available yet.';

  @override
  String get exportErrorNoContacts => 'No contacts to export.';

  @override
  String get exportErrorPasswordRequired =>
      'Password is required for a protected export.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'Protected export requires a password of at least $min characters.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Export failed: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Download started.';

  @override
  String get exportNoticeFileSaved => 'File saved successfully.';

  @override
  String get phoneTypeMobile => 'mobile';

  @override
  String get phoneTypeHome => 'home';

  @override
  String get phoneTypeWork => 'work';

  @override
  String get phoneTypeSchool => 'school';

  @override
  String get phoneTypeOther => 'other';

  @override
  String get emailTypePersonal => 'personal';

  @override
  String get emailTypeWork => 'work';

  @override
  String get emailTypeSchool => 'school';

  @override
  String get emailTypeOther => 'other';

  @override
  String get addressTypeHome => 'Home';

  @override
  String get addressTypeWork => 'Work';

  @override
  String get addressTypeSchool => 'School';

  @override
  String get addressTypeBirth => 'Birth';

  @override
  String get linkTypeWebsite => 'Website';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Other';

  @override
  String get dateTypeCreated => 'Created';

  @override
  String get dateTypeBirthday => 'Birthday';

  @override
  String get dateTypeMet => 'Met';

  @override
  String get dateTypeGraduation => 'Graduation';

  @override
  String get dateTypeMarriage => 'Marriage';

  @override
  String get dateTypeOther => 'Other';

  @override
  String get noNameInList => '(No name)';

  @override
  String get formAddPhone => 'Add phone';

  @override
  String get formAddEmail => 'Add email';

  @override
  String get formAddAddress => 'Add address';

  @override
  String get formAddLink => 'Add link';

  @override
  String get formAddDate => 'Add date';

  @override
  String get formHintPhoneNumber => 'Phone number';

  @override
  String get formHintEmail => 'Email';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Address';

  @override
  String get formHintSelectDate => 'Select date';

  @override
  String get formHintNotes => 'Add notes';

  @override
  String get formCompany => 'Company';

  @override
  String get formDepartment => 'Department';

  @override
  String get formJobTitle => 'Job Title';

  @override
  String get formPrefix => 'Prefix';

  @override
  String get formFirstName => 'First Name';

  @override
  String get formMiddleName => 'Middle Name';

  @override
  String get formLastName => 'Last Name';

  @override
  String get formSuffix => 'Suffix';

  @override
  String get formNickname => 'Nickname';

  @override
  String get contactsListTitle => 'Contacts';

  @override
  String get contactsListEmpty => 'No contacts yet';

  @override
  String get contactsImportButton => 'Import Contacts';

  @override
  String get mergeContactsTitle => 'Merge contacts';

  @override
  String get mergeContactsSubtitle => 'Select contacts to merge into one';

  @override
  String get exportPasswordHint => 'Password';

  @override
  String get exportPasswordConfirmHint => 'Confirm password';

  @override
  String exportPasswordHelper(int min) {
    return 'At least $min characters';
  }

  @override
  String get zipPasswordHint => 'Archive password';

  @override
  String get activateDemoAccessCodeLabel => 'Access code';

  @override
  String get subscriptionExpiredTitle => 'Subscription expired';

  @override
  String get subscriptionExpiredBody => 'Renew to continue using all features.';

  @override
  String get contactsLoadError => 'Could not load contacts.';

  @override
  String get contactsListError => 'Could not load contacts.';

  @override
  String get contactsSearchNoResults => 'No contacts found';

  @override
  String get supportPageIntro =>
      'Questions, feedback, or something not working? The Savelon team reads every message.';

  @override
  String get supportCtaMessageTeam => 'Message the team';

  @override
  String get importFromDeviceContacts => 'From your contacts';

  @override
  String get importFromFileVcfZip => 'From a file (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Create unique password';

  @override
  String get exportPasswordIrrecoverableHint =>
      'This password can\'t be recovered.';

  @override
  String get exportProtectedArchiveCta => 'Export protected archive';

  @override
  String get exportIosSavedFileWarning =>
      'This file is saved in the Savelon folder. If you delete the app, the file will be deleted too. Move it to another location to keep it.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Import $count contacts to Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Set Password';

  @override
  String get settingsChangePasswordPageTitle => 'Change Password';

  @override
  String get settingsRemovePasswordPageTitle => 'Remove Password';

  @override
  String get settingsNewPasswordLabel => 'New Password';

  @override
  String get settingsConfirmNewPasswordLabel => 'Confirm New Password';

  @override
  String get settingsReenterNewPasswordHelper => 'Re-enter your new password';

  @override
  String get settingsSetPasswordCta => 'Set Password';

  @override
  String get settingsChangePasswordCta => 'Change Password';

  @override
  String get settingsRemovePasswordCta => 'Remove Password';

  @override
  String get settingsCurrentPasswordLabel => 'Current Password';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Enter your current password';

  @override
  String get settingsNewPasswordMustDiffer =>
      'New password must be different from current password';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Failed to set password: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Failed to change password: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Failed to remove password: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Password is invalid';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'Current password is incorrect';

  @override
  String get settingsCurrentPasswordRequired => 'Current password is required';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Password required when password protection is enabled';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Password required when enablePassword is true';

  @override
  String get authPasswordRequiredForAccount =>
      'Password required for this account';
}

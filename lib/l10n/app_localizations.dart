import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'CN'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Savelon'**
  String get appTitle;

  /// No description provided for @encryptedContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Encrypted Contacts'**
  String get encryptedContactsTitle;

  /// No description provided for @navContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get navContacts;

  /// No description provided for @navOrganize.
  ///
  /// In en, this message translates to:
  /// **'Organize'**
  String get navOrganize;

  /// No description provided for @navSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get navSupport;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystemDefault;

  /// No description provided for @organizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Organize'**
  String get organizeTitle;

  /// No description provided for @supportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportTitle;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonMerge.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get commonMerge;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get commonBack;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get commonTryAgain;

  /// No description provided for @commonApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get commonApply;

  /// No description provided for @commonDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get commonDiscard;

  /// No description provided for @commonUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get commonUnlock;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get commonLoading;

  /// No description provided for @commonErrorWithDetails.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String commonErrorWithDetails(String error);

  /// No description provided for @brandSlogan.
  ///
  /// In en, this message translates to:
  /// **'Your Contacts. Yours Alone.'**
  String get brandSlogan;

  /// No description provided for @contactNotFound.
  ///
  /// In en, this message translates to:
  /// **'Contact not found'**
  String get contactNotFound;

  /// No description provided for @contactDeleted.
  ///
  /// In en, this message translates to:
  /// **'Contact deleted'**
  String get contactDeleted;

  /// No description provided for @contactUpdated.
  ///
  /// In en, this message translates to:
  /// **'Contact updated'**
  String get contactUpdated;

  /// No description provided for @contactSaved.
  ///
  /// In en, this message translates to:
  /// **'Contact saved'**
  String get contactSaved;

  /// No description provided for @contactsMerged.
  ///
  /// In en, this message translates to:
  /// **'Contacts merged'**
  String get contactsMerged;

  /// No description provided for @deleteContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Contact'**
  String get deleteContactTitle;

  /// No description provided for @deleteContactConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String deleteContactConfirm(String name);

  /// No description provided for @deleteContactConfirmQuoted.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteContactConfirmQuoted(String name);

  /// No description provided for @failedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete: {error}'**
  String failedToDelete(String error);

  /// No description provided for @failedToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Failed to update: {error}'**
  String failedToUpdate(String error);

  /// No description provided for @failedToSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String failedToSave(String error);

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get noName;

  /// No description provided for @noNameTitle.
  ///
  /// In en, this message translates to:
  /// **'No Name'**
  String get noNameTitle;

  /// No description provided for @noNameBody.
  ///
  /// In en, this message translates to:
  /// **'This contact has no name. Save anyway?'**
  String get noNameBody;

  /// No description provided for @discardChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get discardChangesTitle;

  /// No description provided for @discardChangesBody.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes that will be lost.'**
  String get discardChangesBody;

  /// No description provided for @newContact.
  ///
  /// In en, this message translates to:
  /// **'New Contact'**
  String get newContact;

  /// No description provided for @editContact.
  ///
  /// In en, this message translates to:
  /// **'Edit Contact'**
  String get editContact;

  /// No description provided for @addMore.
  ///
  /// In en, this message translates to:
  /// **'Add more'**
  String get addMore;

  /// No description provided for @addNameFieldsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Name Fields'**
  String get addNameFieldsTitle;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @sendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get sendEmail;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @visit.
  ///
  /// In en, this message translates to:
  /// **'Visit'**
  String get visit;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @importContacts.
  ///
  /// In en, this message translates to:
  /// **'Import Contacts'**
  String get importContacts;

  /// No description provided for @importing.
  ///
  /// In en, this message translates to:
  /// **'Importing...'**
  String get importing;

  /// No description provided for @importedCount.
  ///
  /// In en, this message translates to:
  /// **'Imported {count} contacts'**
  String importedCount(int count);

  /// No description provided for @importedCountWithSkipped.
  ///
  /// In en, this message translates to:
  /// **'Imported {imported} contacts, {skipped} skipped'**
  String importedCountWithSkipped(int imported, int skipped);

  /// No description provided for @failedToImportContacts.
  ///
  /// In en, this message translates to:
  /// **'Failed to import contacts'**
  String get failedToImportContacts;

  /// No description provided for @noContactsToImport.
  ///
  /// In en, this message translates to:
  /// **'There are no contacts to import.'**
  String get noContactsToImport;

  /// No description provided for @contactsPermissionRequiredImport.
  ///
  /// In en, this message translates to:
  /// **'Contacts permission is required to import contacts'**
  String get contactsPermissionRequiredImport;

  /// No description provided for @importDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Contacts'**
  String get importDialogTitle;

  /// No description provided for @importDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Import contacts from your device or a file?'**
  String get importDialogBody;

  /// No description provided for @importSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importSourceTitle;

  /// No description provided for @importZipPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive password'**
  String get importZipPasswordTitle;

  /// No description provided for @importZipPasswordChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get importZipPasswordChecking;

  /// No description provided for @exportContacts.
  ///
  /// In en, this message translates to:
  /// **'Export Contacts'**
  String get exportContacts;

  /// No description provided for @unlockPro.
  ///
  /// In en, this message translates to:
  /// **'Unlock Pro'**
  String get unlockPro;

  /// No description provided for @exportContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Export contacts'**
  String get exportContactsTitle;

  /// No description provided for @exportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick how you want to save your contacts.'**
  String get exportSubtitle;

  /// No description provided for @exportFormatVcfTitle.
  ///
  /// In en, this message translates to:
  /// **'Save as .vcf'**
  String get exportFormatVcfTitle;

  /// No description provided for @exportFormatVcfSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One file that works with Apple Contacts, Google Contacts, and more.'**
  String get exportFormatVcfSubtitle;

  /// No description provided for @exportFormatZipTitle.
  ///
  /// In en, this message translates to:
  /// **'Save in password-protected archive'**
  String get exportFormatZipTitle;

  /// No description provided for @exportFormatZipSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A .zip with your .vcf inside — requires a password to open it.'**
  String get exportFormatZipSubtitle;

  /// No description provided for @exportProtectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Protected export'**
  String get exportProtectedTitle;

  /// No description provided for @exportCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Export complete'**
  String get exportCompleteTitle;

  /// No description provided for @stillLoadingContacts.
  ///
  /// In en, this message translates to:
  /// **'Still loading contacts. Please wait.'**
  String get stillLoadingContacts;

  /// No description provided for @couldNotLoadContacts.
  ///
  /// In en, this message translates to:
  /// **'Could not load contacts.'**
  String get couldNotLoadContacts;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccess;

  /// No description provided for @passwordProtectionEnabled.
  ///
  /// In en, this message translates to:
  /// **'Password protection enabled successfully'**
  String get passwordProtectionEnabled;

  /// No description provided for @passwordProtectionRemoved.
  ///
  /// In en, this message translates to:
  /// **'Password protection removed successfully'**
  String get passwordProtectionRemoved;

  /// No description provided for @removePasswordProtectionButton.
  ///
  /// In en, this message translates to:
  /// **'Remove Password Protection'**
  String get removePasswordProtectionButton;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordTitle;

  /// No description provided for @setPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get setPasswordTitle;

  /// No description provided for @passwordSettingsChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get passwordSettingsChangeTitle;

  /// No description provided for @passwordSettingsSetTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get passwordSettingsSetTitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to open privacy policy: {error}'**
  String privacyPolicyOpenFailed(String error);

  /// No description provided for @resetAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset the app'**
  String get resetAppTitle;

  /// No description provided for @resetAppConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all contacts, and reset the app?'**
  String get resetAppConfirmTitle;

  /// No description provided for @resetAppCannotUndo.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone'**
  String get resetAppCannotUndo;

  /// No description provided for @resetAppError.
  ///
  /// In en, this message translates to:
  /// **'Error resetting app: {error}'**
  String resetAppError(String error);

  /// No description provided for @photoPickerNewImage.
  ///
  /// In en, this message translates to:
  /// **'Select new image'**
  String get photoPickerNewImage;

  /// No description provided for @photoPickerRemoveImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get photoPickerRemoveImage;

  /// No description provided for @onboardingHeadline1.
  ///
  /// In en, this message translates to:
  /// **'Who can access your contacts?'**
  String get onboardingHeadline1;

  /// No description provided for @onboardingSubline1.
  ///
  /// In en, this message translates to:
  /// **'Some apps upload them to the cloud. This can create more privacy risks.'**
  String get onboardingSubline1;

  /// No description provided for @onboardingHeadline2.
  ///
  /// In en, this message translates to:
  /// **'Many apps ask for contact access'**
  String get onboardingHeadline2;

  /// No description provided for @onboardingSubline2.
  ///
  /// In en, this message translates to:
  /// **'It can be useful — but important contacts should stay private.'**
  String get onboardingSubline2;

  /// No description provided for @onboardingHeadline3.
  ///
  /// In en, this message translates to:
  /// **'Keep sensitive contacts separate'**
  String get onboardingHeadline3;

  /// No description provided for @onboardingSubline3.
  ///
  /// In en, this message translates to:
  /// **'We recommend to store important and rarely used contacts outside your main contacts app.'**
  String get onboardingSubline3;

  /// No description provided for @onboardingHeadline4.
  ///
  /// In en, this message translates to:
  /// **'Protect your important contacts'**
  String get onboardingHeadline4;

  /// No description provided for @onboardingSubline4.
  ///
  /// In en, this message translates to:
  /// **'Savelon stores them on your device, encrypted and private from other apps.'**
  String get onboardingSubline4;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @activateDemoTitle.
  ///
  /// In en, this message translates to:
  /// **'Activate Demo'**
  String get activateDemoTitle;

  /// No description provided for @activateDemoCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get activateDemoCancel;

  /// No description provided for @demoAccessGranted.
  ///
  /// In en, this message translates to:
  /// **'You now have demo access until {dateTime}'**
  String demoAccessGranted(String dateTime);

  /// No description provided for @setupPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Add password protection'**
  String get setupPasswordTitle;

  /// No description provided for @setupPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get setupPasswordMismatch;

  /// No description provided for @setupPasswordFailedSeed.
  ///
  /// In en, this message translates to:
  /// **'Failed to generate seed. Please try again.'**
  String get setupPasswordFailedSeed;

  /// No description provided for @setupPasswordFailedInit.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize. Error: {error}'**
  String setupPasswordFailedInit(String error);

  /// No description provided for @setupPasswordInfo.
  ///
  /// In en, this message translates to:
  /// **'Your contacts will still be strongly encrypted by a long secret key, stored on your device only. But password adds extra protection.'**
  String get setupPasswordInfo;

  /// No description provided for @setupPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get setupPasswordLabel;

  /// No description provided for @setupPasswordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get setupPasswordConfirmLabel;

  /// No description provided for @setupPasswordWarning.
  ///
  /// In en, this message translates to:
  /// **'This password cannot be recovered. Write it down and keep it safe!'**
  String get setupPasswordWarning;

  /// No description provided for @setupPasswordPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get setupPasswordPageTitle;

  /// No description provided for @setupPasswordNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get setupPasswordNext;

  /// No description provided for @setupPasswordSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get setupPasswordSkip;

  /// No description provided for @confirmationCheckboxTitle.
  ///
  /// In en, this message translates to:
  /// **'I understand my password cannot be recovered'**
  String get confirmationCheckboxTitle;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginWelcomeBack;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get loginUnlock;

  /// No description provided for @loginPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordRequired;

  /// No description provided for @loginIncorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password. Please try again.'**
  String get loginIncorrectPassword;

  /// No description provided for @paywallNoSubscription.
  ///
  /// In en, this message translates to:
  /// **'No active subscription found. Please purchase to continue.'**
  String get paywallNoSubscription;

  /// No description provided for @lifetimeThanksTitle.
  ///
  /// In en, this message translates to:
  /// **'Thank you for being with us'**
  String get lifetimeThanksTitle;

  /// No description provided for @lifetimeThanksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We gift you lifetime pro access'**
  String get lifetimeThanksSubtitle;

  /// No description provided for @lifetimeThanksGift.
  ///
  /// In en, this message translates to:
  /// **'gift'**
  String get lifetimeThanksGift;

  /// No description provided for @lifetimeThanksCta.
  ///
  /// In en, this message translates to:
  /// **'Claim lifetime access'**
  String get lifetimeThanksCta;

  /// No description provided for @paywallNoInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get paywallNoInternetTitle;

  /// No description provided for @paywallNoInternetBody.
  ///
  /// In en, this message translates to:
  /// **'An internet connection is required to access the app for the first time. Please connect and try again.'**
  String get paywallNoInternetBody;

  /// No description provided for @paywallStoreUnavailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Store Unavailable'**
  String get paywallStoreUnavailableTitle;

  /// No description provided for @paywallStoreUnavailableBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to load subscription options. Please try again.'**
  String get paywallStoreUnavailableBody;

  /// No description provided for @subscriptionVerifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Subscription'**
  String get subscriptionVerifyTitle;

  /// No description provided for @subscriptionSoftWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscription Verification Needed'**
  String get subscriptionSoftWarningTitle;

  /// No description provided for @subscriptionContinueAnyway.
  ///
  /// In en, this message translates to:
  /// **'Continue Anyway'**
  String get subscriptionContinueAnyway;

  /// No description provided for @subscriptionLastVerified.
  ///
  /// In en, this message translates to:
  /// **'Last verified {date}.'**
  String subscriptionLastVerified(String date);

  /// No description provided for @subscriptionNotVerifiedOnline.
  ///
  /// In en, this message translates to:
  /// **'Subscription could not be verified online.'**
  String get subscriptionNotVerifiedOnline;

  /// No description provided for @subscriptionAccessUntil.
  ///
  /// In en, this message translates to:
  /// **'Your access continues until {date} — connect before then to verify.'**
  String subscriptionAccessUntil(String date);

  /// No description provided for @subscriptionConnectToVerify.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to verify your subscription.'**
  String get subscriptionConnectToVerify;

  /// No description provided for @organizeNoDuplicates.
  ///
  /// In en, this message translates to:
  /// **'No potential duplicates found'**
  String get organizeNoDuplicates;

  /// No description provided for @organizeSkippedShownAgain.
  ///
  /// In en, this message translates to:
  /// **'Skipped duplicates are shown again.'**
  String get organizeSkippedShownAgain;

  /// No description provided for @organizeShowSkippedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Show skipped duplicate groups again'**
  String get organizeShowSkippedTooltip;

  /// No description provided for @organizeFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load duplicate groups: {error}'**
  String organizeFailedToLoad(String error);

  /// No description provided for @duplicatesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} duplicates'**
  String duplicatesCount(int count);

  /// No description provided for @organizeSubtitlePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details'**
  String get organizeSubtitlePlaceholder;

  /// No description provided for @organizeConflictMostlyIdentical.
  ///
  /// In en, this message translates to:
  /// **'Mostly identical'**
  String get organizeConflictMostlyIdentical;

  /// No description provided for @organizeConflictFieldVariants.
  ///
  /// In en, this message translates to:
  /// **'{field}: {count} variants'**
  String organizeConflictFieldVariants(String field, int count);

  /// No description provided for @fieldLabelName.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get fieldLabelName;

  /// No description provided for @fieldLabelCompany.
  ///
  /// In en, this message translates to:
  /// **'company'**
  String get fieldLabelCompany;

  /// No description provided for @fieldLabelPhone.
  ///
  /// In en, this message translates to:
  /// **'phone'**
  String get fieldLabelPhone;

  /// No description provided for @fieldLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get fieldLabelEmail;

  /// No description provided for @importErrorUnsupportedSource.
  ///
  /// In en, this message translates to:
  /// **'Import is not available here.'**
  String get importErrorUnsupportedSource;

  /// No description provided for @importErrorPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Contacts permission is required to import contacts.'**
  String get importErrorPermissionDenied;

  /// No description provided for @importErrorNoContacts.
  ///
  /// In en, this message translates to:
  /// **'There are no contacts to import.'**
  String get importErrorNoContacts;

  /// No description provided for @importErrorUnsupportedFileType.
  ///
  /// In en, this message translates to:
  /// **'Please select a .vcf file or a .zip archive.'**
  String get importErrorUnsupportedFileType;

  /// No description provided for @importErrorInvalidFile.
  ///
  /// In en, this message translates to:
  /// **'The selected file is invalid or unreadable.'**
  String get importErrorInvalidFile;

  /// No description provided for @importErrorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect archive password. Please try again.'**
  String get importErrorWrongPassword;

  /// No description provided for @importErrorNoVcfInArchive.
  ///
  /// In en, this message translates to:
  /// **'No .vcf files were found in the selected archive.'**
  String get importErrorNoVcfInArchive;

  /// No description provided for @importErrorFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to import contacts: {detail}'**
  String importErrorFailed(String detail);

  /// No description provided for @exportErrorContactsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Contacts are not available yet.'**
  String get exportErrorContactsUnavailable;

  /// No description provided for @exportErrorNoContacts.
  ///
  /// In en, this message translates to:
  /// **'No contacts to export.'**
  String get exportErrorNoContacts;

  /// No description provided for @exportErrorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required for a protected export.'**
  String get exportErrorPasswordRequired;

  /// No description provided for @exportErrorPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Protected export requires a password of at least {min} characters.'**
  String exportErrorPasswordTooShort(int min);

  /// No description provided for @exportErrorFailed.
  ///
  /// In en, this message translates to:
  /// **'Export failed: {detail}'**
  String exportErrorFailed(String detail);

  /// No description provided for @exportNoticeDownloadStarted.
  ///
  /// In en, this message translates to:
  /// **'Download started.'**
  String get exportNoticeDownloadStarted;

  /// No description provided for @exportNoticeFileSaved.
  ///
  /// In en, this message translates to:
  /// **'File saved successfully.'**
  String get exportNoticeFileSaved;

  /// No description provided for @phoneTypeMobile.
  ///
  /// In en, this message translates to:
  /// **'mobile'**
  String get phoneTypeMobile;

  /// No description provided for @phoneTypeHome.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get phoneTypeHome;

  /// No description provided for @phoneTypeWork.
  ///
  /// In en, this message translates to:
  /// **'work'**
  String get phoneTypeWork;

  /// No description provided for @phoneTypeSchool.
  ///
  /// In en, this message translates to:
  /// **'school'**
  String get phoneTypeSchool;

  /// No description provided for @phoneTypeOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get phoneTypeOther;

  /// No description provided for @emailTypePersonal.
  ///
  /// In en, this message translates to:
  /// **'personal'**
  String get emailTypePersonal;

  /// No description provided for @emailTypeWork.
  ///
  /// In en, this message translates to:
  /// **'work'**
  String get emailTypeWork;

  /// No description provided for @emailTypeSchool.
  ///
  /// In en, this message translates to:
  /// **'school'**
  String get emailTypeSchool;

  /// No description provided for @emailTypeOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get emailTypeOther;

  /// No description provided for @addressTypeHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get addressTypeHome;

  /// No description provided for @addressTypeWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get addressTypeWork;

  /// No description provided for @addressTypeSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get addressTypeSchool;

  /// No description provided for @addressTypeBirth.
  ///
  /// In en, this message translates to:
  /// **'Birth'**
  String get addressTypeBirth;

  /// No description provided for @linkTypeWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get linkTypeWebsite;

  /// No description provided for @linkTypeLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkTypeLinkedIn;

  /// No description provided for @linkTypeX.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get linkTypeX;

  /// No description provided for @linkTypeFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get linkTypeFacebook;

  /// No description provided for @linkTypeInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get linkTypeInstagram;

  /// No description provided for @linkTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get linkTypeOther;

  /// No description provided for @dateTypeCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get dateTypeCreated;

  /// No description provided for @dateTypeBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get dateTypeBirthday;

  /// No description provided for @dateTypeMet.
  ///
  /// In en, this message translates to:
  /// **'Met'**
  String get dateTypeMet;

  /// No description provided for @dateTypeGraduation.
  ///
  /// In en, this message translates to:
  /// **'Graduation'**
  String get dateTypeGraduation;

  /// No description provided for @dateTypeMarriage.
  ///
  /// In en, this message translates to:
  /// **'Marriage'**
  String get dateTypeMarriage;

  /// No description provided for @dateTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get dateTypeOther;

  /// No description provided for @noNameInList.
  ///
  /// In en, this message translates to:
  /// **'(No name)'**
  String get noNameInList;

  /// No description provided for @formAddPhone.
  ///
  /// In en, this message translates to:
  /// **'Add phone'**
  String get formAddPhone;

  /// No description provided for @formAddEmail.
  ///
  /// In en, this message translates to:
  /// **'Add email'**
  String get formAddEmail;

  /// No description provided for @formAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get formAddAddress;

  /// No description provided for @formAddLink.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get formAddLink;

  /// No description provided for @formAddDate.
  ///
  /// In en, this message translates to:
  /// **'Add date'**
  String get formAddDate;

  /// No description provided for @formHintPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get formHintPhoneNumber;

  /// No description provided for @formHintEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get formHintEmail;

  /// No description provided for @formHintUrl.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get formHintUrl;

  /// No description provided for @formHintAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get formHintAddress;

  /// No description provided for @formHintSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get formHintSelectDate;

  /// No description provided for @formHintNotes.
  ///
  /// In en, this message translates to:
  /// **'Add notes'**
  String get formHintNotes;

  /// No description provided for @formCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get formCompany;

  /// No description provided for @formDepartment.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get formDepartment;

  /// No description provided for @formJobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get formJobTitle;

  /// No description provided for @formPrefix.
  ///
  /// In en, this message translates to:
  /// **'Prefix'**
  String get formPrefix;

  /// No description provided for @formFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get formFirstName;

  /// No description provided for @formMiddleName.
  ///
  /// In en, this message translates to:
  /// **'Middle Name'**
  String get formMiddleName;

  /// No description provided for @formLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get formLastName;

  /// No description provided for @formSuffix.
  ///
  /// In en, this message translates to:
  /// **'Suffix'**
  String get formSuffix;

  /// No description provided for @formNickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get formNickname;

  /// No description provided for @contactsListTitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contactsListTitle;

  /// No description provided for @contactsListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No contacts yet'**
  String get contactsListEmpty;

  /// No description provided for @contactsImportButton.
  ///
  /// In en, this message translates to:
  /// **'Import Contacts'**
  String get contactsImportButton;

  /// No description provided for @mergeContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Merge contacts'**
  String get mergeContactsTitle;

  /// No description provided for @mergeContactsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select contacts to merge into one'**
  String get mergeContactsSubtitle;

  /// No description provided for @exportPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get exportPasswordHint;

  /// No description provided for @exportPasswordConfirmHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get exportPasswordConfirmHint;

  /// No description provided for @exportPasswordHelper.
  ///
  /// In en, this message translates to:
  /// **'At least {min} characters'**
  String exportPasswordHelper(int min);

  /// No description provided for @zipPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Archive password'**
  String get zipPasswordHint;

  /// No description provided for @activateDemoAccessCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Access code'**
  String get activateDemoAccessCodeLabel;

  /// No description provided for @subscriptionExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscription expired'**
  String get subscriptionExpiredTitle;

  /// No description provided for @subscriptionExpiredBody.
  ///
  /// In en, this message translates to:
  /// **'Renew to continue using all features.'**
  String get subscriptionExpiredBody;

  /// No description provided for @contactsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load contacts.'**
  String get contactsLoadError;

  /// No description provided for @contactsListError.
  ///
  /// In en, this message translates to:
  /// **'Could not load contacts.'**
  String get contactsListError;

  /// No description provided for @contactsSearchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No contacts found'**
  String get contactsSearchNoResults;

  /// No description provided for @supportPageIntro.
  ///
  /// In en, this message translates to:
  /// **'Questions, feedback, or something not working? The Savelon team reads every message.'**
  String get supportPageIntro;

  /// No description provided for @supportCtaMessageTeam.
  ///
  /// In en, this message translates to:
  /// **'Message the team'**
  String get supportCtaMessageTeam;

  /// No description provided for @importFromDeviceContacts.
  ///
  /// In en, this message translates to:
  /// **'From your contacts'**
  String get importFromDeviceContacts;

  /// No description provided for @importFromFileVcfZip.
  ///
  /// In en, this message translates to:
  /// **'From a file (VCF, ZIP)'**
  String get importFromFileVcfZip;

  /// No description provided for @exportCreateUniquePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Create unique password'**
  String get exportCreateUniquePasswordTitle;

  /// No description provided for @exportPasswordIrrecoverableHint.
  ///
  /// In en, this message translates to:
  /// **'This password can\'t be recovered.'**
  String get exportPasswordIrrecoverableHint;

  /// No description provided for @exportProtectedArchiveCta.
  ///
  /// In en, this message translates to:
  /// **'Export protected archive'**
  String get exportProtectedArchiveCta;

  /// No description provided for @exportIosSavedFileWarning.
  ///
  /// In en, this message translates to:
  /// **'This file is saved in the Savelon folder. If you delete the app, the file will be deleted too. Move it to another location to keep it.'**
  String get exportIosSavedFileWarning;

  /// No description provided for @importContactsConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Import {count} contacts to Savelon?'**
  String importContactsConfirmBody(int count);

  /// No description provided for @settingsSetPasswordPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get settingsSetPasswordPageTitle;

  /// No description provided for @settingsChangePasswordPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePasswordPageTitle;

  /// No description provided for @settingsRemovePasswordPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Password'**
  String get settingsRemovePasswordPageTitle;

  /// No description provided for @settingsNewPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get settingsNewPasswordLabel;

  /// No description provided for @settingsConfirmNewPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get settingsConfirmNewPasswordLabel;

  /// No description provided for @settingsReenterNewPasswordHelper.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your new password'**
  String get settingsReenterNewPasswordHelper;

  /// No description provided for @settingsSetPasswordCta.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get settingsSetPasswordCta;

  /// No description provided for @settingsChangePasswordCta.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePasswordCta;

  /// No description provided for @settingsRemovePasswordCta.
  ///
  /// In en, this message translates to:
  /// **'Remove Password'**
  String get settingsRemovePasswordCta;

  /// No description provided for @settingsCurrentPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get settingsCurrentPasswordLabel;

  /// No description provided for @settingsEnterCurrentPasswordHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password'**
  String get settingsEnterCurrentPasswordHelper;

  /// No description provided for @settingsNewPasswordMustDiffer.
  ///
  /// In en, this message translates to:
  /// **'New password must be different from current password'**
  String get settingsNewPasswordMustDiffer;

  /// No description provided for @settingsFailedToSetPassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to set password: {error}'**
  String settingsFailedToSetPassword(String error);

  /// No description provided for @settingsFailedToChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password: {error}'**
  String settingsFailedToChangePassword(String error);

  /// No description provided for @settingsFailedToRemovePassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove password: {error}'**
  String settingsFailedToRemovePassword(String error);

  /// No description provided for @settingsPasswordInvalidFallback.
  ///
  /// In en, this message translates to:
  /// **'Password is invalid'**
  String get settingsPasswordInvalidFallback;

  /// No description provided for @settingsCurrentPasswordIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Current password is incorrect'**
  String get settingsCurrentPasswordIncorrect;

  /// No description provided for @settingsCurrentPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Current password is required'**
  String get settingsCurrentPasswordRequired;

  /// No description provided for @authPasswordRequiredWhenProtectionEnabled.
  ///
  /// In en, this message translates to:
  /// **'Password required when password protection is enabled'**
  String get authPasswordRequiredWhenProtectionEnabled;

  /// No description provided for @authPasswordRequiredWhenEnablePassword.
  ///
  /// In en, this message translates to:
  /// **'Password required when enablePassword is true'**
  String get authPasswordRequiredWhenEnablePassword;

  /// No description provided for @authPasswordRequiredForAccount.
  ///
  /// In en, this message translates to:
  /// **'Password required for this account'**
  String get authPasswordRequiredForAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

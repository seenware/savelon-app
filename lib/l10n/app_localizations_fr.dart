// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contacts chiffrés';

  @override
  String get navContacts => 'Contacts';

  @override
  String get navOrganize => 'Organiser';

  @override
  String get navSupport => 'Assistance';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get languageSystemDefault => 'Valeur par défaut du système';

  @override
  String get organizeTitle => 'Organiser';

  @override
  String get supportTitle => 'Assistance';

  @override
  String get search => 'Recherche';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonMerge => 'Fusionner';

  @override
  String get commonSkip => 'Sauter';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonNext => 'Suivant';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonYes => 'Oui';

  @override
  String get commonNo => 'Non';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get commonTryAgain => 'Essayer à nouveau';

  @override
  String get commonApply => 'Appliquer';

  @override
  String get commonDiscard => 'Ne pas enregistrer';

  @override
  String get commonUnlock => 'Déverrouiller';

  @override
  String get commonLoading => 'Chargement...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Erreur : $error';
  }

  @override
  String get brandSlogan => 'Vos contacts. Les vôtres uniquement.';

  @override
  String get contactNotFound => 'Contact introuvable';

  @override
  String get contactDeleted => 'Contact supprimé';

  @override
  String get contactUpdated => 'Contact mis à jour';

  @override
  String get contactSaved => 'Contact enregistré';

  @override
  String get contactsMerged => 'Contacts fusionnés';

  @override
  String get deleteContactTitle => 'Supprimer le contact';

  @override
  String deleteContactConfirm(String name) {
    return 'Êtes-vous sûr de vouloir supprimer $name ?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Êtes-vous sûr de vouloir supprimer « $name » ?';
  }

  @override
  String failedToDelete(String error) {
    return 'Échec de la suppression : $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Échec de la mise à jour : $error';
  }

  @override
  String failedToSave(String error) {
    return 'Échec de l\'enregistrement : $error';
  }

  @override
  String get noName => 'Pas de nom';

  @override
  String get noNameTitle => 'Pas de nom';

  @override
  String get noNameBody =>
      'Ce contact n\'a pas de nom. Enregistrer quand même ?';

  @override
  String get discardChangesTitle => 'Ne pas enregistrer les modifications ?';

  @override
  String get discardChangesBody =>
      'Vous avez des modifications non enregistrées qui seront perdues.';

  @override
  String get newContact => 'Nouveau contact';

  @override
  String get editContact => 'Modifier le contact';

  @override
  String get addMore => 'Ajouter plus';

  @override
  String get addNameFieldsTitle => 'Ajouter des champs de nom';

  @override
  String get call => 'Appeler';

  @override
  String get sendEmail => 'Envoyer un e-mail';

  @override
  String get copy => 'Copier';

  @override
  String get visit => 'Visiter';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get importContacts => 'Importer des contacts';

  @override
  String get importing => 'Importation...';

  @override
  String importedCount(int count) {
    return 'Contacts $count importés';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return 'Contacts $imported importés, $skipped ignorés';
  }

  @override
  String get failedToImportContacts => 'Échec de l\'importation des contacts';

  @override
  String get noContactsToImport => 'Il n\'y a aucun contact à importer.';

  @override
  String get contactsPermissionRequiredImport =>
      'L\'autorisation des contacts est requise pour importer des contacts';

  @override
  String get importDialogTitle => 'Importer des contacts';

  @override
  String get importDialogBody =>
      'Importer des contacts depuis votre appareil ou un fichier ?';

  @override
  String get importSourceTitle => 'Importer';

  @override
  String get importZipPasswordTitle => 'Mot de passe de l\'archive';

  @override
  String get importZipPasswordChecking => 'Vérification...';

  @override
  String get exportContacts => 'Exporter les contacts';

  @override
  String get unlockPro => 'Débloquer Pro';

  @override
  String get exportContactsTitle => 'Exporter les contacts';

  @override
  String get exportSubtitle =>
      'Choisissez comment vous souhaitez enregistrer vos contacts.';

  @override
  String get exportFormatVcfTitle => 'Enregistrer sous .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Un fichier qui fonctionne avec les contacts Apple, les contacts Google et plus encore.';

  @override
  String get exportFormatZipTitle =>
      'Enregistrer dans une archive protégée par mot de passe';

  @override
  String get exportFormatZipSubtitle =>
      'Un .zip avec votre .vcf à l\'intérieur — nécessite un mot de passe pour l\'ouvrir.';

  @override
  String get exportProtectedTitle => 'Exportation protégée';

  @override
  String get exportCompleteTitle => 'Exportation terminée';

  @override
  String get stillLoadingContacts =>
      'Toujours en train de charger les contacts. S\'il vous plaît, attendez.';

  @override
  String get couldNotLoadContacts => 'Impossible de charger les contacts.';

  @override
  String get passwordChangedSuccess => 'Mot de passe modifié avec succès';

  @override
  String get passwordProtectionEnabled =>
      'La protection par mot de passe a été activée avec succès';

  @override
  String get passwordProtectionRemoved =>
      'La protection par mot de passe a été supprimée avec succès';

  @override
  String get removePasswordProtectionButton =>
      'Supprimer la protection par mot de passe';

  @override
  String get changePasswordTitle => 'Changer le mot de passe';

  @override
  String get setPasswordTitle => 'Définir le mot de passe';

  @override
  String get passwordSettingsChangeTitle => 'Changer le mot de passe';

  @override
  String get passwordSettingsSetTitle => 'Définir le mot de passe';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Échec de l\'ouverture de la politique de confidentialité : $error';
  }

  @override
  String get resetAppTitle => 'Réinitialiser l\'application';

  @override
  String get resetAppConfirmTitle =>
      'Supprimer tous les contacts et réinitialiser l\'application ?';

  @override
  String get resetAppCannotUndo => 'Cela ne peut pas être annulé';

  @override
  String resetAppError(String error) {
    return 'Erreur lors de la réinitialisation de l\'application : $error';
  }

  @override
  String get photoPickerNewImage => 'Sélectionnez une nouvelle image';

  @override
  String get photoPickerRemoveImage => 'Supprimer l\'image';

  @override
  String get onboardingHeadline1 => 'Qui peut accéder à vos contacts ?';

  @override
  String get onboardingSubline1 =>
      'Certaines applications les envoient dans le cloud. Cela peut créer davantage de risques pour la vie privée.';

  @override
  String get onboardingHeadline2 =>
      'De nombreuses applications demandent l\'accès aux contacts';

  @override
  String get onboardingSubline2 =>
      'Cela peut être utile, mais les contacts importants doivent rester privés.';

  @override
  String get onboardingHeadline3 => 'Gardez les contacts sensibles séparés';

  @override
  String get onboardingSubline3 =>
      'Nous vous recommandons de stocker les contacts importants et rarement utilisés en dehors de votre application de contacts principale.';

  @override
  String get onboardingHeadline4 => 'Protégez vos contacts importants';

  @override
  String get onboardingSubline4 =>
      'Savelon les stocke sur votre appareil, chiffrés et inaccessibles aux autres applications.';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingBenefitsOpenSourceTitle => 'Open source';

  @override
  String get onboardingBenefitsOpenSourceBeforeLink =>
      'Tout le monde peut consulter notre code sur ';

  @override
  String get onboardingBenefitsOpenSourceAfterLink => '.';

  @override
  String get onboardingBenefitsPrivateTitle => 'Privé';

  @override
  String get onboardingBenefitsPrivateDescription =>
      'Même nous ne pouvons pas voir vos contacts';

  @override
  String get onboardingBenefitsSandboxTitle =>
      'Les autres applications ne peuvent pas voir à l’intérieur';

  @override
  String get onboardingBenefitsOfflineTitle => 'Hors ligne';

  @override
  String get onboardingBenefitsOfflineDescription =>
      'Vous éloigne du cloud, des courtiers en données et des systèmes de surveillance';

  @override
  String get activateDemoTitle => 'Activer la démo';

  @override
  String get activateDemoCancel => 'Annuler';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Vous avez désormais accès à la démo jusqu\'au $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Ajouter une protection par mot de passe';

  @override
  String get setupPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get setupPasswordFailedSeed =>
      'Échec de la génération de la graine. Veuillez réessayer.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Échec de l\'initialisation. Erreur : $error';
  }

  @override
  String get setupPasswordInfo =>
      'Vos contacts restent fortement chiffrés par une longue clé secrète, stockée uniquement sur votre appareil. Le mot de passe ajoute une protection supplémentaire.';

  @override
  String get setupPasswordLabel => 'Mot de passe';

  @override
  String get setupPasswordConfirmLabel => 'Confirmez le mot de passe';

  @override
  String get setupPasswordWarning =>
      'Ce mot de passe ne peut pas être récupéré. Écrivez-le et conservez-le en sécurité !';

  @override
  String get setupPasswordPageTitle => 'Créer un mot de passe';

  @override
  String get setupPasswordNext => 'Suivant';

  @override
  String get setupPasswordSkip => 'Sauter';

  @override
  String get setupCreateVaultTitle => 'Créer votre coffre';

  @override
  String get setupCreateVaultSubtitle =>
      'Stocké uniquement sur votre appareil. Chiffré et privé.';

  @override
  String get setupDefaultVaultName => 'Mon coffre';

  @override
  String setupRandomVaultName(String number) {
    return 'Coffre$number';
  }

  @override
  String get setupCropPhotoTitle => 'Recadrer la photo';

  @override
  String get setupProtectionTitle => 'Protection';

  @override
  String get setupEncryption256Label => 'Chiffrement 256 bits';

  @override
  String get setupRequirePasswordLabel => 'Exiger un mot de passe';

  @override
  String get setupOptionalSuffix => 'facultatif';

  @override
  String get setupCreateVaultButton => 'Créer le coffre';

  @override
  String get setupCreatingVaultTitle => 'Création de votre coffre';

  @override
  String setupCreatingVaultPercent(int percent) {
    return '$percent %';
  }

  @override
  String get setupCreatingKeyLabel => 'Création de votre clé';

  @override
  String get setupEncryptingDataLabel => 'Chiffrement de vos données';

  @override
  String get setupCheckingSecurityLabel => 'Vérification de la sécurité';

  @override
  String get setupCreatingVaultError =>
      'Une erreur s’est produite. Veuillez réessayer.';

  @override
  String get setupVaultCreatedTitle => 'Coffre créé';

  @override
  String get setupVaultCreatedSubtitle =>
      'Votre coffre est prêt. Il est chiffré et sécurisé.';

  @override
  String get setupOpenVaultButton => 'Ouvrir le coffre';

  @override
  String get setupSavedSecretKeyCheckbox =>
      'J’ai conservé ma clé secrète en lieu sûr';

  @override
  String get setupContinue => 'Continuer';

  @override
  String get setupAddPasswordPageTitle => 'Ajouter un mot de passe';

  @override
  String get setupSavePasswordButton => 'Enregistrer le mot de passe';

  @override
  String get confirmationCheckboxTitle =>
      'Je comprends que mon mot de passe ne peut pas être récupéré';

  @override
  String get loginWelcomeBack => 'Bon retour';

  @override
  String get loginPasswordLabel => 'Mot de passe';

  @override
  String get loginUnlock => 'Déverrouiller';

  @override
  String get loginPasswordRequired => 'Entrez votre mot de passe';

  @override
  String get loginIncorrectPassword =>
      'Mot de passe incorrect. Veuillez réessayer.';

  @override
  String get paywallNoSubscription =>
      'Aucun abonnement actif trouvé. Veuillez acheter pour continuer.';

  @override
  String get lifetimeThanksTitle => 'Merci d\'être avec nous';

  @override
  String get lifetimeThanksSubtitle => 'Nous vous offrons un accès Pro à vie';

  @override
  String get lifetimeThanksGift => 'cadeau';

  @override
  String get lifetimeThanksCta => 'Obtenir l\'accès à vie';

  @override
  String get paywallNoInternetTitle => 'Pas de connexion Internet';

  @override
  String get paywallNoInternetBody =>
      'Une connexion Internet est requise pour accéder à l\'application pour la première fois. Veuillez vous connecter et réessayer.';

  @override
  String get paywallStoreUnavailableTitle => 'Magasin indisponible';

  @override
  String get paywallStoreUnavailableBody =>
      'Impossible de charger les options d\'abonnement. Veuillez réessayer.';

  @override
  String get subscriptionVerifyTitle => 'Vérifier l\'abonnement';

  @override
  String get subscriptionSoftWarningTitle =>
      'Vérification de l\'abonnement requise';

  @override
  String get subscriptionContinueAnyway => 'Continuer quand même';

  @override
  String subscriptionLastVerified(String date) {
    return 'Dernière vérification $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'L\'abonnement n\'a pas pu être vérifié en ligne.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Votre accès se poursuit jusqu\'au $date — connectez-vous avant cette date pour vérifier.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Connectez-vous à Internet pour vérifier votre abonnement.';

  @override
  String get organizeNoDuplicates => 'Aucun doublon potentiel trouvé';

  @override
  String get organizeSkippedShownAgain =>
      'Les doublons ignorés sont à nouveau affichés.';

  @override
  String get organizeShowSkippedTooltip =>
      'Afficher à nouveau les groupes en double ignorés';

  @override
  String organizeFailedToLoad(String error) {
    return 'Échec du chargement des groupes en double : $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count doublons';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Appuyez pour afficher les détails';

  @override
  String get organizeConflictMostlyIdentical => 'Presque identique';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field : $count variantes';
  }

  @override
  String get fieldLabelName => 'nom';

  @override
  String get fieldLabelCompany => 'entreprise';

  @override
  String get fieldLabelPhone => 'téléphone';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'L\'importation n\'est pas disponible ici.';

  @override
  String get importErrorPermissionDenied =>
      'L\'autorisation des contacts est requise pour importer des contacts.';

  @override
  String get importErrorNoContacts => 'Il n\'y a aucun contact à importer.';

  @override
  String get importErrorUnsupportedFileType =>
      'Veuillez sélectionner un fichier .vcf ou une archive .zip.';

  @override
  String get importErrorInvalidFile =>
      'Le fichier sélectionné est invalide ou illisible.';

  @override
  String get importErrorWrongPassword =>
      'Mot de passe d\'archive incorrect. Veuillez réessayer.';

  @override
  String get importErrorNoVcfInArchive =>
      'Aucun fichier .vcf n\'a été trouvé dans l\'archive sélectionnée.';

  @override
  String importErrorFailed(String detail) {
    return 'Échec de l\'importation des contacts : $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Les contacts ne sont pas encore disponibles.';

  @override
  String get exportErrorNoContacts => 'Aucun contact à exporter.';

  @override
  String get exportErrorPasswordRequired =>
      'Un mot de passe est requis pour une exportation protégée.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'L\'exportation protégée nécessite un mot de passe d\'au moins $min caractères.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Échec de l\'exportation : $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Le téléchargement a commencé.';

  @override
  String get exportNoticeFileSaved => 'Fichier enregistré avec succès.';

  @override
  String get phoneTypeMobile => 'mobile';

  @override
  String get phoneTypeHome => 'maison';

  @override
  String get phoneTypeWork => 'travail';

  @override
  String get phoneTypeSchool => 'école';

  @override
  String get phoneTypeOther => 'autre';

  @override
  String get emailTypePersonal => 'personnel';

  @override
  String get emailTypeWork => 'travail';

  @override
  String get emailTypeSchool => 'école';

  @override
  String get emailTypeOther => 'autre';

  @override
  String get addressTypeHome => 'Maison';

  @override
  String get addressTypeWork => 'Travail';

  @override
  String get addressTypeSchool => 'École';

  @override
  String get addressTypeBirth => 'Naissance';

  @override
  String get linkTypeWebsite => 'Site web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Autre';

  @override
  String get dateTypeCreated => 'Créé';

  @override
  String get dateTypeBirthday => 'Anniversaire';

  @override
  String get dateTypeMet => 'Rencontre';

  @override
  String get dateTypeGraduation => 'Diplôme';

  @override
  String get dateTypeMarriage => 'Mariage';

  @override
  String get dateTypeOther => 'Autre';

  @override
  String get noNameInList => '(Pas de nom)';

  @override
  String get formAddPhone => 'Ajouter un téléphone';

  @override
  String get formAddEmail => 'Ajouter un e-mail';

  @override
  String get formAddAddress => 'Ajouter une adresse';

  @override
  String get formAddLink => 'Ajouter un lien';

  @override
  String get formAddDate => 'Ajouter une date';

  @override
  String get formHintPhoneNumber => 'Numéro de téléphone';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Adresse';

  @override
  String get formHintSelectDate => 'Sélectionnez une date';

  @override
  String get formHintNotes => 'Ajouter des notes';

  @override
  String get formCompany => 'Entreprise';

  @override
  String get formDepartment => 'Département';

  @override
  String get formJobTitle => 'Titre d\'emploi';

  @override
  String get formPrefix => 'Préfixe';

  @override
  String get formFirstName => 'Prénom';

  @override
  String get formMiddleName => 'Deuxième prénom';

  @override
  String get formLastName => 'Nom de famille';

  @override
  String get formSuffix => 'Suffixe';

  @override
  String get formNickname => 'Surnom';

  @override
  String get contactsListTitle => 'Contacts';

  @override
  String get contactsListEmpty => 'Aucun contact pour l\'instant';

  @override
  String get contactsImportButton => 'Importer des contacts';

  @override
  String get mergeContactsTitle => 'Fusionner les contacts';

  @override
  String get mergeContactsSubtitle =>
      'Sélectionnez les contacts à fusionner en un seul';

  @override
  String get exportPasswordHint => 'Mot de passe';

  @override
  String get exportPasswordConfirmHint => 'Confirmez le mot de passe';

  @override
  String exportPasswordHelper(int min) {
    return 'Au moins $min caractères';
  }

  @override
  String get zipPasswordHint => 'Mot de passe de l\'archive';

  @override
  String get activateDemoAccessCodeLabel => 'Code d\'accès';

  @override
  String get subscriptionExpiredTitle => 'Abonnement expiré';

  @override
  String get subscriptionExpiredBody =>
      'Renouvelez pour continuer à utiliser toutes les fonctionnalités.';

  @override
  String get contactsLoadError => 'Impossible de charger les contacts.';

  @override
  String get contactsListError => 'Impossible de charger les contacts.';

  @override
  String get contactsSearchNoResults => 'Aucun contact trouvé';

  @override
  String get supportPageIntro =>
      'Une question, un commentaire ou un problème ? L\'équipe Savelon lit chaque message.';

  @override
  String get supportCtaMessageTeam => 'Écrire à l\'équipe';

  @override
  String get importFromDeviceContacts => 'Depuis vos contacts';

  @override
  String get importFromFileVcfZip => 'Depuis un fichier (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Créer un mot de passe unique';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Ce mot de passe ne peut pas être récupéré.';

  @override
  String get exportProtectedArchiveCta => 'Exporter l\'archive protégée';

  @override
  String get exportIosSavedFileWarning =>
      'Ce fichier est enregistré dans le dossier Savelon. Si vous supprimez l\'application, le fichier sera aussi supprimé. Déplacez-le ailleurs pour le conserver.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Importer $count contacts dans Savelon ?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Définir le mot de passe';

  @override
  String get settingsChangePasswordPageTitle => 'Modifier le mot de passe';

  @override
  String get settingsRemovePasswordPageTitle => 'Supprimer le mot de passe';

  @override
  String get settingsNewPasswordLabel => 'Nouveau mot de passe';

  @override
  String get settingsConfirmNewPasswordLabel =>
      'Confirmer le nouveau mot de passe';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Saisissez à nouveau votre nouveau mot de passe';

  @override
  String get settingsSetPasswordCta => 'Définir le mot de passe';

  @override
  String get settingsChangePasswordCta => 'Modifier le mot de passe';

  @override
  String get settingsRemovePasswordCta => 'Supprimer le mot de passe';

  @override
  String get settingsCurrentPasswordLabel => 'Mot de passe actuel';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Saisissez votre mot de passe actuel';

  @override
  String get settingsNewPasswordMustDiffer =>
      'Le nouveau mot de passe doit être différent de l\'actuel';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Échec de la définition du mot de passe : $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Échec de la modification du mot de passe : $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Échec de la suppression du mot de passe : $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'Le mot de passe est invalide';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'Le mot de passe actuel est incorrect';

  @override
  String get settingsCurrentPasswordRequired =>
      'Le mot de passe actuel est requis';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Mot de passe requis lorsque la protection par mot de passe est activée';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Mot de passe requis lorsque l\'option mot de passe est activée';

  @override
  String get authPasswordRequiredForAccount =>
      'Mot de passe requis pour ce compte';

  @override
  String get loginLoggedInSecurely => 'Connecté en toute sécurité';
}

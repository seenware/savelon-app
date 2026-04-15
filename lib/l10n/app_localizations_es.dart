// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contactos cifrados';

  @override
  String get navContacts => 'Contactos';

  @override
  String get navOrganize => 'Organizar';

  @override
  String get navSupport => 'Soporte';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystemDefault => 'Valor predeterminado del sistema';

  @override
  String get organizeTitle => 'Organizar';

  @override
  String get supportTitle => 'Soporte';

  @override
  String get search => 'Buscar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Borrar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonMerge => 'Unir';

  @override
  String get commonSkip => 'Saltar';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonNext => 'Próximo';

  @override
  String get commonBack => 'Volver';

  @override
  String get commonYes => 'Sí';

  @override
  String get commonNo => 'No';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonTryAgain => 'Intentar otra vez';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get commonDiscard => 'Desechar';

  @override
  String get commonUnlock => 'Desbloquear';

  @override
  String get commonLoading => 'Cargando...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Error: $error';
  }

  @override
  String get brandSlogan => 'Tus contactos. Solo tuyos.';

  @override
  String get contactNotFound => 'Contacto no encontrado';

  @override
  String get contactDeleted => 'Contacto eliminado';

  @override
  String get contactUpdated => 'Contacto actualizado';

  @override
  String get contactSaved => 'Contacto guardado';

  @override
  String get contactsMerged => 'Contactos fusionados';

  @override
  String get deleteContactTitle => 'Eliminar contacto';

  @override
  String deleteContactConfirm(String name) {
    return '¿Está seguro de que desea eliminar $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return '¿Está seguro de que desea eliminar \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'No se pudo eliminar: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'No se pudo actualizar: $error';
  }

  @override
  String failedToSave(String error) {
    return 'No se pudo guardar: $error';
  }

  @override
  String get noName => 'Sin nombre';

  @override
  String get noNameTitle => 'Sin nombre';

  @override
  String get noNameBody =>
      'Este contacto no tiene nombre. ¿Guardar de todos modos?';

  @override
  String get discardChangesTitle => '¿Descartar cambios?';

  @override
  String get discardChangesBody =>
      'Tienes cambios no guardados que se perderán.';

  @override
  String get newContact => 'Nuevo contacto';

  @override
  String get editContact => 'Editar contacto';

  @override
  String get addMore => 'Añadir más';

  @override
  String get addNameFieldsTitle => 'Agregar campos de nombre';

  @override
  String get call => 'Llamar';

  @override
  String get sendEmail => 'Enviar correo electrónico';

  @override
  String get copy => 'Copiar';

  @override
  String get visit => 'Visitar';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get importContacts => 'Importar contactos';

  @override
  String get importing => 'Importando...';

  @override
  String importedCount(int count) {
    return '$count contactos importados';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported contactos importados, $skipped omitidos';
  }

  @override
  String get failedToImportContacts => 'No se pudieron importar contactos';

  @override
  String get noContactsToImport => 'No hay contactos para importar.';

  @override
  String get contactsPermissionRequiredImport =>
      'Se requiere permiso de contactos para importar contactos';

  @override
  String get importDialogTitle => 'Importar contactos';

  @override
  String get importDialogBody =>
      '¿Importar contactos desde su dispositivo o un archivo?';

  @override
  String get importSourceTitle => 'Importar';

  @override
  String get importZipPasswordTitle => 'Contraseña de archivo';

  @override
  String get importZipPasswordChecking => 'Comprobando...';

  @override
  String get exportContacts => 'Exportar contactos';

  @override
  String get unlockPro => 'Desbloquear Pro';

  @override
  String get exportContactsTitle => 'Exportar contactos';

  @override
  String get exportSubtitle => 'Elija cómo desea guardar sus contactos.';

  @override
  String get exportFormatVcfTitle => 'Guardar como .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Un archivo que funciona con Contactos Apple, Contactos Google y más.';

  @override
  String get exportFormatZipTitle =>
      'Guardar en un archivo protegido con contraseña';

  @override
  String get exportFormatZipSubtitle =>
      'Un .zip con su .vcf dentro: requiere una contraseña para abrirlo.';

  @override
  String get exportProtectedTitle => 'Exportación protegida';

  @override
  String get exportCompleteTitle => 'Exportación completa';

  @override
  String get stillLoadingContacts =>
      'Todavía cargando contactos. Espere por favor.';

  @override
  String get couldNotLoadContacts => 'No se pudieron cargar los contactos.';

  @override
  String get passwordChangedSuccess => 'La contraseña se cambió correctamente';

  @override
  String get passwordProtectionEnabled =>
      'Protección con contraseña habilitada exitosamente';

  @override
  String get passwordProtectionRemoved =>
      'La protección con contraseña se eliminó correctamente';

  @override
  String get removePasswordProtectionButton =>
      'Eliminar la protección con contraseña';

  @override
  String get changePasswordTitle => 'Cambiar la contraseña';

  @override
  String get setPasswordTitle => 'Establecer contraseña';

  @override
  String get passwordSettingsChangeTitle => 'Cambiar la contraseña';

  @override
  String get passwordSettingsSetTitle => 'Establecer contraseña';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'No se pudo abrir la política de privacidad: $error';
  }

  @override
  String get resetAppTitle => 'Restablecer la aplicación';

  @override
  String get resetAppConfirmTitle =>
      '¿Eliminar todos los contactos y restablecer la aplicación?';

  @override
  String get resetAppCannotUndo => 'Esto no se puede deshacer';

  @override
  String resetAppError(String error) {
    return 'Error al restablecer la aplicación: $error';
  }

  @override
  String get photoPickerNewImage => 'Seleccionar nueva imagen';

  @override
  String get photoPickerRemoveImage => 'Quitar imagen';

  @override
  String get onboardingHeadline1 => '¿Quién puede acceder a tus contactos?';

  @override
  String get onboardingSubline1 =>
      'Algunas aplicaciones los suben a la nube. Esto puede crear más riesgos para la privacidad.';

  @override
  String get onboardingHeadline2 =>
      'Muchas aplicaciones solicitan acceso a los contactos';

  @override
  String get onboardingSubline2 =>
      'Puede resultar útil, pero los contactos importantes deben permanecer en privado.';

  @override
  String get onboardingHeadline3 => 'Mantén los contactos sensibles separados';

  @override
  String get onboardingSubline3 =>
      'Recomendamos guardar los contactos importantes que usas poco fuera de tu aplicación de contactos principal.';

  @override
  String get onboardingHeadline4 => 'Protege tus contactos importantes';

  @override
  String get onboardingSubline4 =>
      'Savelon los almacena en su dispositivo, cifrados y privados de otras aplicaciones.';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get activateDemoTitle => 'Activar demostración';

  @override
  String get activateDemoCancel => 'Cancelar';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Ahora tienes acceso de demostración hasta $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Agregar protección con contraseña';

  @override
  String get setupPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get setupPasswordFailedSeed =>
      'No se pudo generar semilla. Por favor inténtalo de nuevo.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'No se pudo inicializar. Error: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Sus contactos seguirán estando fuertemente cifrados mediante una clave secreta larga, almacenada únicamente en su dispositivo. Pero la contraseña añade protección adicional.';

  @override
  String get setupPasswordLabel => 'Contraseña';

  @override
  String get setupPasswordConfirmLabel => 'Confirmar contraseña';

  @override
  String get setupPasswordWarning =>
      'Esta contraseña no se puede recuperar. Escríbela y guárdala en un lugar seguro.';

  @override
  String get setupPasswordPageTitle => 'Crear contraseña';

  @override
  String get setupPasswordNext => 'Próximo';

  @override
  String get setupPasswordSkip => 'Saltar';

  @override
  String get confirmationCheckboxTitle =>
      'Entiendo que mi contraseña no se puede recuperar';

  @override
  String get loginWelcomeBack => 'Bienvenido de nuevo';

  @override
  String get loginPasswordLabel => 'Contraseña';

  @override
  String get loginUnlock => 'Desbloquear';

  @override
  String get loginPasswordRequired => 'Introduce tu contraseña';

  @override
  String get loginIncorrectPassword =>
      'Contraseña incorrecta. Por favor inténtalo de nuevo.';

  @override
  String get paywallNoSubscription =>
      'No se encontró ninguna suscripción activa. Por favor compre para continuar.';

  @override
  String get lifetimeThanksTitle => 'Gracias por estar con nosotros';

  @override
  String get lifetimeThanksSubtitle => 'Te regalamos acceso Pro de por vida';

  @override
  String get lifetimeThanksGift => 'regalo';

  @override
  String get lifetimeThanksCta => 'Reclamar acceso de por vida';

  @override
  String get paywallNoInternetTitle => 'Sin conexión a Internet';

  @override
  String get paywallNoInternetBody =>
      'Se requiere una conexión a Internet para acceder a la aplicación por primera vez. Por favor, conéctate e inténtalo de nuevo.';

  @override
  String get paywallStoreUnavailableTitle => 'Tienda no disponible';

  @override
  String get paywallStoreUnavailableBody =>
      'No se pueden cargar las opciones de suscripción. Por favor inténtalo de nuevo.';

  @override
  String get subscriptionVerifyTitle => 'Verificar suscripción';

  @override
  String get subscriptionSoftWarningTitle =>
      'Se necesita verificación de suscripción';

  @override
  String get subscriptionContinueAnyway => 'Continuar de todos modos';

  @override
  String subscriptionLastVerified(String date) {
    return 'Última verificación $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'La suscripción no se pudo verificar en línea.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Su acceso continúa hasta $date; conéctese antes para verificar.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Conéctese a Internet para verificar su suscripción.';

  @override
  String get organizeNoDuplicates => 'No se encontraron posibles duplicados';

  @override
  String get organizeSkippedShownAgain =>
      'Los duplicados omitidos se muestran nuevamente.';

  @override
  String get organizeShowSkippedTooltip =>
      'Mostrar nuevamente los grupos duplicados omitidos';

  @override
  String organizeFailedToLoad(String error) {
    return 'No se pudieron cargar grupos duplicados: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicados';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Toca para ver detalles';

  @override
  String get organizeConflictMostlyIdentical => 'Mayormente idéntico';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count variantes';
  }

  @override
  String get fieldLabelName => 'nombre';

  @override
  String get fieldLabelCompany => 'compañía';

  @override
  String get fieldLabelPhone => 'teléfono';

  @override
  String get fieldLabelEmail => 'correo electrónico';

  @override
  String get importErrorUnsupportedSource =>
      'La importación no está disponible aquí.';

  @override
  String get importErrorPermissionDenied =>
      'Se requiere permiso de contactos para importar contactos.';

  @override
  String get importErrorNoContacts => 'No hay contactos para importar.';

  @override
  String get importErrorUnsupportedFileType =>
      'Seleccione un archivo .vcf o un archivo .zip.';

  @override
  String get importErrorInvalidFile =>
      'El archivo seleccionado no es válido o ilegible.';

  @override
  String get importErrorWrongPassword =>
      'Contraseña de archivo incorrecta. Por favor inténtalo de nuevo.';

  @override
  String get importErrorNoVcfInArchive =>
      'No se encontraron archivos .vcf en el archivo seleccionado.';

  @override
  String importErrorFailed(String detail) {
    return 'No se pudieron importar contactos: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Los contactos aún no están disponibles.';

  @override
  String get exportErrorNoContacts => 'No hay contactos para exportar.';

  @override
  String get exportErrorPasswordRequired =>
      'Se requiere contraseña para una exportación protegida.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'La exportación protegida requiere una contraseña de al menos $min caracteres.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Error al exportar: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Descarga iniciada.';

  @override
  String get exportNoticeFileSaved => 'Archivo guardado exitosamente.';

  @override
  String get phoneTypeMobile => 'móvil';

  @override
  String get phoneTypeHome => 'hogar';

  @override
  String get phoneTypeWork => 'trabajo';

  @override
  String get phoneTypeSchool => 'escuela';

  @override
  String get phoneTypeOther => 'otro';

  @override
  String get emailTypePersonal => 'personal';

  @override
  String get emailTypeWork => 'trabajo';

  @override
  String get emailTypeSchool => 'escuela';

  @override
  String get emailTypeOther => 'otro';

  @override
  String get addressTypeHome => 'Hogar';

  @override
  String get addressTypeWork => 'Trabajo';

  @override
  String get addressTypeSchool => 'Escuela';

  @override
  String get addressTypeBirth => 'Nacimiento';

  @override
  String get linkTypeWebsite => 'Sitio web';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Otro';

  @override
  String get dateTypeCreated => 'Creado';

  @override
  String get dateTypeBirthday => 'Cumpleaños';

  @override
  String get dateTypeMet => 'Primer encuentro';

  @override
  String get dateTypeGraduation => 'Graduación';

  @override
  String get dateTypeMarriage => 'Casamiento';

  @override
  String get dateTypeOther => 'Otro';

  @override
  String get noNameInList => '(Sin nombre)';

  @override
  String get formAddPhone => 'Agregar teléfono';

  @override
  String get formAddEmail => 'Agregar correo electrónico';

  @override
  String get formAddAddress => 'Agregar dirección';

  @override
  String get formAddLink => 'Agregar enlace';

  @override
  String get formAddDate => 'Agregar fecha';

  @override
  String get formHintPhoneNumber => 'Número de teléfono';

  @override
  String get formHintEmail => 'Correo electrónico';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Dirección';

  @override
  String get formHintSelectDate => 'Seleccionar fecha';

  @override
  String get formHintNotes => 'Agregar notas';

  @override
  String get formCompany => 'Compañía';

  @override
  String get formDepartment => 'Departamento';

  @override
  String get formJobTitle => 'Título profesional';

  @override
  String get formPrefix => 'Prefijo';

  @override
  String get formFirstName => 'Nombre de pila';

  @override
  String get formMiddleName => 'Segundo nombre';

  @override
  String get formLastName => 'Apellido';

  @override
  String get formSuffix => 'Sufijo';

  @override
  String get formNickname => 'Apodo';

  @override
  String get contactsListTitle => 'Contactos';

  @override
  String get contactsListEmpty => 'Aún no hay contactos';

  @override
  String get contactsImportButton => 'Importar contactos';

  @override
  String get mergeContactsTitle => 'Fusionar contactos';

  @override
  String get mergeContactsSubtitle =>
      'Seleccione contactos para fusionarlos en uno';

  @override
  String get exportPasswordHint => 'Contraseña';

  @override
  String get exportPasswordConfirmHint => 'Confirmar Contraseña';

  @override
  String exportPasswordHelper(int min) {
    return 'Al menos $min caracteres';
  }

  @override
  String get zipPasswordHint => 'Contraseña de archivo';

  @override
  String get activateDemoAccessCodeLabel => 'Código de acceso';

  @override
  String get subscriptionExpiredTitle => 'Suscripción caducada';

  @override
  String get subscriptionExpiredBody =>
      'Renueva para seguir usando todas las funciones.';

  @override
  String get contactsLoadError => 'No se pudieron cargar los contactos.';

  @override
  String get contactsListError => 'No se pudieron cargar los contactos.';

  @override
  String get contactsSearchNoResults => 'No se encontraron contactos';

  @override
  String get supportPageIntro =>
      '¿Preguntas, comentarios o algo no funciona? El equipo de Savelon lee cada mensaje.';

  @override
  String get supportCtaMessageTeam => 'Escribir al equipo';

  @override
  String get importFromDeviceContacts => 'Desde tus contactos';

  @override
  String get importFromFileVcfZip => 'Desde un archivo (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Crear contraseña única';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Esta contraseña no se puede recuperar.';

  @override
  String get exportProtectedArchiveCta => 'Exportar archivo protegido';

  @override
  String get exportIosSavedFileWarning =>
      'Este archivo se guarda en la carpeta de Savelon. Si eliminas la app, el archivo también se borrará. Muévelo a otra ubicación para conservarlo.';

  @override
  String importContactsConfirmBody(int count) {
    return '¿Importar $count contactos a Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Establecer contraseña';

  @override
  String get settingsChangePasswordPageTitle => 'Cambiar contraseña';

  @override
  String get settingsRemovePasswordPageTitle => 'Eliminar contraseña';

  @override
  String get settingsNewPasswordLabel => 'Nueva contraseña';

  @override
  String get settingsConfirmNewPasswordLabel => 'Confirmar nueva contraseña';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Vuelve a escribir tu nueva contraseña';

  @override
  String get settingsSetPasswordCta => 'Establecer contraseña';

  @override
  String get settingsChangePasswordCta => 'Cambiar contraseña';

  @override
  String get settingsRemovePasswordCta => 'Eliminar contraseña';

  @override
  String get settingsCurrentPasswordLabel => 'Contraseña actual';

  @override
  String get settingsEnterCurrentPasswordHelper =>
      'Introduce tu contraseña actual';

  @override
  String get settingsNewPasswordMustDiffer =>
      'La nueva contraseña debe ser distinta de la actual';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'No se pudo establecer la contraseña: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'No se pudo cambiar la contraseña: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'No se pudo eliminar la contraseña: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'La contraseña no es válida';

  @override
  String get settingsCurrentPasswordIncorrect =>
      'La contraseña actual es incorrecta';

  @override
  String get settingsCurrentPasswordRequired =>
      'Se requiere la contraseña actual';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Se requiere contraseña cuando la protección por contraseña está activada';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Se requiere contraseña al activar la opción de contraseña';

  @override
  String get authPasswordRequiredForAccount =>
      'Se requiere contraseña para esta cuenta';
}

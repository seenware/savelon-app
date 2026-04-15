// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contatos criptografados';

  @override
  String get navContacts => 'Contatos';

  @override
  String get navOrganize => 'Organizar';

  @override
  String get navSupport => 'Suporte';

  @override
  String get navSettings => 'Configurações';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystemDefault => 'Padrão do sistema';

  @override
  String get organizeTitle => 'Organizar';

  @override
  String get supportTitle => 'Suporte';

  @override
  String get search => 'Procurar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonMerge => 'Mesclar';

  @override
  String get commonSkip => 'Pular';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonNext => 'Próximo';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonYes => 'Sim';

  @override
  String get commonNo => 'Não';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonTryAgain => 'Tente novamente';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get commonDiscard => 'Descartar';

  @override
  String get commonUnlock => 'Desbloquear';

  @override
  String get commonLoading => 'Carregando...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Erro: $error';
  }

  @override
  String get brandSlogan => 'Seus contatos. Só seus.';

  @override
  String get contactNotFound => 'Contato não encontrado';

  @override
  String get contactDeleted => 'Contato excluído';

  @override
  String get contactUpdated => 'Contato atualizado';

  @override
  String get contactSaved => 'Contato salvo';

  @override
  String get contactsMerged => 'Contatos mesclados';

  @override
  String get deleteContactTitle => 'Excluir contato';

  @override
  String deleteContactConfirm(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Tem certeza de que deseja excluir \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'Falha ao excluir: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Falha ao atualizar: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get noName => 'Sem nome';

  @override
  String get noNameTitle => 'Sem nome';

  @override
  String get noNameBody => 'Este contato não tem nome. Salvar mesmo assim?';

  @override
  String get discardChangesTitle => 'Descartar alterações?';

  @override
  String get discardChangesBody =>
      'Você tem alterações não salvas que serão perdidas.';

  @override
  String get newContact => 'Novo contato';

  @override
  String get editContact => 'Editar contato';

  @override
  String get addMore => 'Adicionar mais';

  @override
  String get addNameFieldsTitle => 'Adicionar campos de nome';

  @override
  String get call => 'Chamar';

  @override
  String get sendEmail => 'Enviar e-mail';

  @override
  String get copy => 'Copiar';

  @override
  String get visit => 'Visitar';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get importContacts => 'Importar contatos';

  @override
  String get importing => 'Importando...';

  @override
  String importedCount(int count) {
    return '$count contatos importados';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported contatos importados, $skipped ignorados';
  }

  @override
  String get failedToImportContacts => 'Falha ao importar contatos';

  @override
  String get noContactsToImport => 'Não há contatos para importar.';

  @override
  String get contactsPermissionRequiredImport =>
      'A permissão de contatos é necessária para importar contatos';

  @override
  String get importDialogTitle => 'Importar contatos';

  @override
  String get importDialogBody =>
      'Importar contatos do seu dispositivo ou de um arquivo?';

  @override
  String get importSourceTitle => 'Importar';

  @override
  String get importZipPasswordTitle => 'Senha do arquivo';

  @override
  String get importZipPasswordChecking => 'Verificando...';

  @override
  String get exportContacts => 'Exportar contatos';

  @override
  String get unlockPro => 'Desbloquear Pro';

  @override
  String get exportContactsTitle => 'Exportar contatos';

  @override
  String get exportSubtitle => 'Escolha como deseja salvar seus contatos.';

  @override
  String get exportFormatVcfTitle => 'Salvar como .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Um arquivo que funciona com Contatos da Apple, Google Contatos e muito mais.';

  @override
  String get exportFormatZipTitle => 'Salvar em arquivo protegido por senha';

  @override
  String get exportFormatZipSubtitle =>
      'Um .zip com seu .vcf dentro — requer uma senha para abri-lo.';

  @override
  String get exportProtectedTitle => 'Exportação protegida';

  @override
  String get exportCompleteTitle => 'Exportação concluída';

  @override
  String get stillLoadingContacts =>
      'Ainda carregando contatos. Por favor, aguarde.';

  @override
  String get couldNotLoadContacts => 'Não foi possível carregar os contatos.';

  @override
  String get passwordChangedSuccess => 'Senha alterada com sucesso';

  @override
  String get passwordProtectionEnabled =>
      'Proteção por senha ativada com sucesso';

  @override
  String get passwordProtectionRemoved =>
      'Proteção por senha removida com sucesso';

  @override
  String get removePasswordProtectionButton => 'Remover proteção por senha';

  @override
  String get changePasswordTitle => 'Alterar a senha';

  @override
  String get setPasswordTitle => 'Definir senha';

  @override
  String get passwordSettingsChangeTitle => 'Alterar a senha';

  @override
  String get passwordSettingsSetTitle => 'Definir senha';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Falha ao abrir a política de privacidade: $error';
  }

  @override
  String get resetAppTitle => 'Redefinir o aplicativo';

  @override
  String get resetAppConfirmTitle =>
      'Excluir todos os contatos e redefinir o aplicativo?';

  @override
  String get resetAppCannotUndo => 'Isso não pode ser desfeito';

  @override
  String resetAppError(String error) {
    return 'Erro ao redefinir o aplicativo: $error';
  }

  @override
  String get photoPickerNewImage => 'Selecione uma nova imagem';

  @override
  String get photoPickerRemoveImage => 'Remover imagem';

  @override
  String get onboardingHeadline1 => 'Quem pode acessar seus contatos?';

  @override
  String get onboardingSubline1 =>
      'Alguns aplicativos os carregam para a nuvem. Isso pode criar mais riscos de privacidade.';

  @override
  String get onboardingHeadline2 => 'Muitos apps pedem acesso aos contatos';

  @override
  String get onboardingSubline2 =>
      'Pode ser útil – mas os contatos importantes devem permanecer privados.';

  @override
  String get onboardingHeadline3 =>
      'Mantenha os contatos confidenciais separados';

  @override
  String get onboardingSubline3 =>
      'Recomendamos armazenar contatos importantes e raramente usados ​​fora do aplicativo de contatos principal.';

  @override
  String get onboardingHeadline4 => 'Proteja seus contatos importantes';

  @override
  String get onboardingSubline4 =>
      'Savelon os armazena em seu dispositivo, criptografados e privados de outros aplicativos.';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get activateDemoTitle => 'Ativar demonstração';

  @override
  String get activateDemoCancel => 'Cancelar';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Agora você tem acesso de demonstração até $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Adicionar proteção por senha';

  @override
  String get setupPasswordMismatch => 'As senhas não coincidem';

  @override
  String get setupPasswordFailedSeed =>
      'Falha ao gerar semente. Por favor, tente novamente.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Falha ao inicializar. Erro: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Seus contatos ainda serão fortemente criptografados por uma chave secreta longa, armazenada apenas no seu dispositivo. Mas a senha adiciona proteção extra.';

  @override
  String get setupPasswordLabel => 'Senha';

  @override
  String get setupPasswordConfirmLabel => 'Confirme sua senha';

  @override
  String get setupPasswordWarning =>
      'Esta senha não pode ser recuperada. Anote-a e mantenha-a em segurança!';

  @override
  String get setupPasswordPageTitle => 'Criar senha';

  @override
  String get setupPasswordNext => 'Próximo';

  @override
  String get setupPasswordSkip => 'Pular';

  @override
  String get confirmationCheckboxTitle =>
      'Entendo que minha senha não pode ser recuperada';

  @override
  String get loginWelcomeBack => 'Bem-vindo de volta';

  @override
  String get loginPasswordLabel => 'Senha';

  @override
  String get loginUnlock => 'Desbloquear';

  @override
  String get loginPasswordRequired => 'Digite sua senha';

  @override
  String get loginIncorrectPassword =>
      'Senha incorreta. Por favor, tente novamente.';

  @override
  String get paywallNoSubscription =>
      'Não foi encontrada uma assinatura ativa. Compre para continuar.';

  @override
  String get lifetimeThanksTitle => 'Obrigado por estar com a gente';

  @override
  String get lifetimeThanksSubtitle =>
      'Estamos te presenteando com acesso Pro vitalício';

  @override
  String get lifetimeThanksGift => 'presente';

  @override
  String get lifetimeThanksCta => 'Resgatar acesso vitalício';

  @override
  String get paywallNoInternetTitle => 'Sem conexão com a Internet';

  @override
  String get paywallNoInternetBody =>
      'É necessária uma conexão com a Internet para acessar o aplicativo pela primeira vez. Conecte-se e tente novamente.';

  @override
  String get paywallStoreUnavailableTitle => 'Loja indisponível';

  @override
  String get paywallStoreUnavailableBody =>
      'Não foi possível carregar as opções de assinatura. Por favor, tente novamente.';

  @override
  String get subscriptionVerifyTitle => 'Verificar assinatura';

  @override
  String get subscriptionSoftWarningTitle =>
      'Verificação de assinatura necessária';

  @override
  String get subscriptionContinueAnyway => 'Continuar mesmo assim';

  @override
  String subscriptionLastVerified(String date) {
    return 'Última verificação $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'A assinatura não pôde ser verificada on-line.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Seu acesso continua até $date — conecte-se antes disso para verificar.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Conecte-se à Internet para verificar sua assinatura.';

  @override
  String get organizeNoDuplicates => 'Nenhuma duplicata potencial encontrada';

  @override
  String get organizeSkippedShownAgain =>
      'Duplicatas ignoradas são mostradas novamente.';

  @override
  String get organizeShowSkippedTooltip =>
      'Mostrar novamente grupos duplicados ignorados';

  @override
  String organizeFailedToLoad(String error) {
    return 'Falha ao carregar grupos duplicados: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicatas';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Toque para ver detalhes';

  @override
  String get organizeConflictMostlyIdentical => 'Praticamente idêntico';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count variantes';
  }

  @override
  String get fieldLabelName => 'nome';

  @override
  String get fieldLabelCompany => 'empresa';

  @override
  String get fieldLabelPhone => 'telefone';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'A importação não está disponível aqui.';

  @override
  String get importErrorPermissionDenied =>
      'A permissão de contatos é necessária para importar contatos.';

  @override
  String get importErrorNoContacts => 'Não há contatos para importar.';

  @override
  String get importErrorUnsupportedFileType =>
      'Selecione um arquivo .vcf ou um arquivo .zip.';

  @override
  String get importErrorInvalidFile =>
      'O arquivo selecionado é inválido ou ilegível.';

  @override
  String get importErrorWrongPassword =>
      'Senha de arquivo incorreta. Por favor, tente novamente.';

  @override
  String get importErrorNoVcfInArchive =>
      'Nenhum arquivo .vcf foi encontrado no arquivo selecionado.';

  @override
  String importErrorFailed(String detail) {
    return 'Falha ao importar contatos: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Os contatos ainda não estão disponíveis.';

  @override
  String get exportErrorNoContacts => 'Nenhum contato para exportar.';

  @override
  String get exportErrorPasswordRequired =>
      'A senha é necessária para uma exportação protegida.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'A exportação protegida requer uma senha de pelo menos $min caracteres.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Falha na exportação: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Download iniciado.';

  @override
  String get exportNoticeFileSaved => 'Arquivo salvo com sucesso.';

  @override
  String get phoneTypeMobile => 'móvel';

  @override
  String get phoneTypeHome => 'Casa';

  @override
  String get phoneTypeWork => 'Trabalho';

  @override
  String get phoneTypeSchool => 'escola';

  @override
  String get phoneTypeOther => 'outro';

  @override
  String get emailTypePersonal => 'pessoal';

  @override
  String get emailTypeWork => 'Trabalho';

  @override
  String get emailTypeSchool => 'escola';

  @override
  String get emailTypeOther => 'outro';

  @override
  String get addressTypeHome => 'Casa';

  @override
  String get addressTypeWork => 'Trabalho';

  @override
  String get addressTypeSchool => 'Escola';

  @override
  String get addressTypeBirth => 'Nascimento';

  @override
  String get linkTypeWebsite => 'Site';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Outro';

  @override
  String get dateTypeCreated => 'Criado';

  @override
  String get dateTypeBirthday => 'Aniversário';

  @override
  String get dateTypeMet => 'Encontro';

  @override
  String get dateTypeGraduation => 'Graduação';

  @override
  String get dateTypeMarriage => 'Casamento';

  @override
  String get dateTypeOther => 'Outro';

  @override
  String get noNameInList => '(Sem nome)';

  @override
  String get formAddPhone => 'Adicionar telefone';

  @override
  String get formAddEmail => 'Adicionar e-mail';

  @override
  String get formAddAddress => 'Adicionar endereço';

  @override
  String get formAddLink => 'Adicionar link';

  @override
  String get formAddDate => 'Adicionar data';

  @override
  String get formHintPhoneNumber => 'Número de telefone';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Endereço';

  @override
  String get formHintSelectDate => 'Selecione a data';

  @override
  String get formHintNotes => 'Adicionar notas';

  @override
  String get formCompany => 'Empresa';

  @override
  String get formDepartment => 'Departamento';

  @override
  String get formJobTitle => 'Cargo';

  @override
  String get formPrefix => 'Prefixo';

  @override
  String get formFirstName => 'Primeiro nome';

  @override
  String get formMiddleName => 'Nome do meio';

  @override
  String get formLastName => 'Sobrenome';

  @override
  String get formSuffix => 'Sufixo';

  @override
  String get formNickname => 'Apelido';

  @override
  String get contactsListTitle => 'Contatos';

  @override
  String get contactsListEmpty => 'Nenhum contato ainda';

  @override
  String get contactsImportButton => 'Importar contatos';

  @override
  String get mergeContactsTitle => 'Mesclar contatos';

  @override
  String get mergeContactsSubtitle => 'Selecione contatos para mesclar em um';

  @override
  String get exportPasswordHint => 'Senha';

  @override
  String get exportPasswordConfirmHint => 'Confirme sua senha';

  @override
  String exportPasswordHelper(int min) {
    return 'Pelo menos $min caracteres';
  }

  @override
  String get zipPasswordHint => 'Senha do arquivo';

  @override
  String get activateDemoAccessCodeLabel => 'Código de acesso';

  @override
  String get subscriptionExpiredTitle => 'A assinatura expirou';

  @override
  String get subscriptionExpiredBody =>
      'Renove para continuar usando todos os recursos.';

  @override
  String get contactsLoadError => 'Não foi possível carregar os contatos.';

  @override
  String get contactsListError => 'Não foi possível carregar os contatos.';

  @override
  String get contactsSearchNoResults => 'Nenhum contato encontrado';

  @override
  String get supportPageIntro =>
      'Dúvidas, feedback ou algo não está funcionando? A equipe do Savelon lê todas as mensagens.';

  @override
  String get supportCtaMessageTeam => 'Enviar mensagem à equipe';

  @override
  String get importFromDeviceContacts => 'Dos seus contatos';

  @override
  String get importFromFileVcfZip => 'De um arquivo (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Criar senha exclusiva';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Esta senha não pode ser recuperada.';

  @override
  String get exportProtectedArchiveCta => 'Exportar arquivo protegido';

  @override
  String get exportIosSavedFileWarning =>
      'Este arquivo é salvo na pasta do Savelon. Se você excluir o app, o arquivo também será excluído. Mova-o para outro local para mantê-lo.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Importar $count contatos para o Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Definir senha';

  @override
  String get settingsChangePasswordPageTitle => 'Alterar senha';

  @override
  String get settingsRemovePasswordPageTitle => 'Remover senha';

  @override
  String get settingsNewPasswordLabel => 'Nova senha';

  @override
  String get settingsConfirmNewPasswordLabel => 'Confirmar nova senha';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Digite novamente a nova senha';

  @override
  String get settingsSetPasswordCta => 'Definir senha';

  @override
  String get settingsChangePasswordCta => 'Alterar senha';

  @override
  String get settingsRemovePasswordCta => 'Remover senha';

  @override
  String get settingsCurrentPasswordLabel => 'Senha atual';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Digite sua senha atual';

  @override
  String get settingsNewPasswordMustDiffer =>
      'A nova senha deve ser diferente da atual';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Não foi possível definir a senha: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Não foi possível alterar a senha: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Não foi possível remover a senha: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'A senha é inválida';

  @override
  String get settingsCurrentPasswordIncorrect => 'A senha atual está incorreta';

  @override
  String get settingsCurrentPasswordRequired => 'A senha atual é obrigatória';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Senha necessária quando a proteção por senha está ativada';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Senha necessária ao ativar a opção de senha';

  @override
  String get authPasswordRequiredForAccount =>
      'Senha necessária para esta conta';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Savelon';

  @override
  String get encryptedContactsTitle => 'Contatos criptografados';

  @override
  String get navContacts => 'Contatos';

  @override
  String get navOrganize => 'Organizar';

  @override
  String get navSupport => 'Suporte';

  @override
  String get navSettings => 'Configurações';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystemDefault => 'Padrão do sistema';

  @override
  String get organizeTitle => 'Organizar';

  @override
  String get supportTitle => 'Suporte';

  @override
  String get search => 'Procurar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonMerge => 'Mesclar';

  @override
  String get commonSkip => 'Pular';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonNext => 'Próximo';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonYes => 'Sim';

  @override
  String get commonNo => 'Não';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonTryAgain => 'Tente novamente';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get commonDiscard => 'Descartar';

  @override
  String get commonUnlock => 'Desbloquear';

  @override
  String get commonLoading => 'Carregando...';

  @override
  String commonErrorWithDetails(String error) {
    return 'Erro: $error';
  }

  @override
  String get brandSlogan => 'Seus contatos. Só seus.';

  @override
  String get contactNotFound => 'Contato não encontrado';

  @override
  String get contactDeleted => 'Contato excluído';

  @override
  String get contactUpdated => 'Contato atualizado';

  @override
  String get contactSaved => 'Contato salvo';

  @override
  String get contactsMerged => 'Contatos mesclados';

  @override
  String get deleteContactTitle => 'Excluir contato';

  @override
  String deleteContactConfirm(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String deleteContactConfirmQuoted(String name) {
    return 'Tem certeza de que deseja excluir \"$name\"?';
  }

  @override
  String failedToDelete(String error) {
    return 'Falha ao excluir: $error';
  }

  @override
  String failedToUpdate(String error) {
    return 'Falha ao atualizar: $error';
  }

  @override
  String failedToSave(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get noName => 'Sem nome';

  @override
  String get noNameTitle => 'Sem nome';

  @override
  String get noNameBody => 'Este contato não tem nome. Salvar mesmo assim?';

  @override
  String get discardChangesTitle => 'Descartar alterações?';

  @override
  String get discardChangesBody =>
      'Você tem alterações não salvas que serão perdidas.';

  @override
  String get newContact => 'Novo contato';

  @override
  String get editContact => 'Editar contato';

  @override
  String get addMore => 'Adicionar mais';

  @override
  String get addNameFieldsTitle => 'Adicionar campos de nome';

  @override
  String get call => 'Chamar';

  @override
  String get sendEmail => 'Enviar e-mail';

  @override
  String get copy => 'Copiar';

  @override
  String get visit => 'Visitar';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get importContacts => 'Importar contatos';

  @override
  String get importing => 'Importando...';

  @override
  String importedCount(int count) {
    return '$count contatos importados';
  }

  @override
  String importedCountWithSkipped(int imported, int skipped) {
    return '$imported contatos importados, $skipped ignorados';
  }

  @override
  String get failedToImportContacts => 'Falha ao importar contatos';

  @override
  String get noContactsToImport => 'Não há contatos para importar.';

  @override
  String get contactsPermissionRequiredImport =>
      'A permissão de contatos é necessária para importar contatos';

  @override
  String get importDialogTitle => 'Importar contatos';

  @override
  String get importDialogBody =>
      'Importar contatos do seu dispositivo ou de um arquivo?';

  @override
  String get importSourceTitle => 'Importar';

  @override
  String get importZipPasswordTitle => 'Senha do arquivo';

  @override
  String get importZipPasswordChecking => 'Verificando...';

  @override
  String get exportContacts => 'Exportar contatos';

  @override
  String get unlockPro => 'Desbloquear Pro';

  @override
  String get exportContactsTitle => 'Exportar contatos';

  @override
  String get exportSubtitle => 'Escolha como deseja salvar seus contatos.';

  @override
  String get exportFormatVcfTitle => 'Salvar como .vcf';

  @override
  String get exportFormatVcfSubtitle =>
      'Um arquivo que funciona com Contatos da Apple, Google Contatos e muito mais.';

  @override
  String get exportFormatZipTitle => 'Salvar em arquivo protegido por senha';

  @override
  String get exportFormatZipSubtitle =>
      'Um .zip com seu .vcf dentro — requer uma senha para abri-lo.';

  @override
  String get exportProtectedTitle => 'Exportação protegida';

  @override
  String get exportCompleteTitle => 'Exportação concluída';

  @override
  String get stillLoadingContacts =>
      'Ainda carregando contatos. Por favor, aguarde.';

  @override
  String get couldNotLoadContacts => 'Não foi possível carregar os contatos.';

  @override
  String get passwordChangedSuccess => 'Senha alterada com sucesso';

  @override
  String get passwordProtectionEnabled =>
      'Proteção por senha ativada com sucesso';

  @override
  String get passwordProtectionRemoved =>
      'Proteção por senha removida com sucesso';

  @override
  String get removePasswordProtectionButton => 'Remover proteção por senha';

  @override
  String get changePasswordTitle => 'Alterar a senha';

  @override
  String get setPasswordTitle => 'Definir senha';

  @override
  String get passwordSettingsChangeTitle => 'Alterar a senha';

  @override
  String get passwordSettingsSetTitle => 'Definir senha';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String privacyPolicyOpenFailed(String error) {
    return 'Falha ao abrir a política de privacidade: $error';
  }

  @override
  String get resetAppTitle => 'Redefinir o aplicativo';

  @override
  String get resetAppConfirmTitle =>
      'Excluir todos os contatos e redefinir o aplicativo?';

  @override
  String get resetAppCannotUndo => 'Isso não pode ser desfeito';

  @override
  String resetAppError(String error) {
    return 'Erro ao redefinir o aplicativo: $error';
  }

  @override
  String get photoPickerNewImage => 'Selecione uma nova imagem';

  @override
  String get photoPickerRemoveImage => 'Remover imagem';

  @override
  String get onboardingHeadline1 => 'Quem pode acessar seus contatos?';

  @override
  String get onboardingSubline1 =>
      'Alguns aplicativos os carregam para a nuvem. Isso pode criar mais riscos de privacidade.';

  @override
  String get onboardingHeadline2 => 'Muitos apps pedem acesso aos contatos';

  @override
  String get onboardingSubline2 =>
      'Pode ser útil – mas os contatos importantes devem permanecer privados.';

  @override
  String get onboardingHeadline3 =>
      'Mantenha os contatos confidenciais separados';

  @override
  String get onboardingSubline3 =>
      'Recomendamos armazenar contatos importantes e raramente usados ​​fora do aplicativo de contatos principal.';

  @override
  String get onboardingHeadline4 => 'Proteja seus contatos importantes';

  @override
  String get onboardingSubline4 =>
      'Savelon os armazena em seu dispositivo, criptografados e privados de outros aplicativos.';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get activateDemoTitle => 'Ativar demonstração';

  @override
  String get activateDemoCancel => 'Cancelar';

  @override
  String demoAccessGranted(String dateTime) {
    return 'Agora você tem acesso de demonstração até $dateTime';
  }

  @override
  String get setupPasswordTitle => 'Adicionar proteção por senha';

  @override
  String get setupPasswordMismatch => 'As senhas não coincidem';

  @override
  String get setupPasswordFailedSeed =>
      'Falha ao gerar semente. Por favor, tente novamente.';

  @override
  String setupPasswordFailedInit(String error) {
    return 'Falha ao inicializar. Erro: $error';
  }

  @override
  String get setupPasswordInfo =>
      'Seus contatos ainda serão fortemente criptografados por uma chave secreta longa, armazenada apenas no seu dispositivo. Mas a senha adiciona proteção extra.';

  @override
  String get setupPasswordLabel => 'Senha';

  @override
  String get setupPasswordConfirmLabel => 'Confirme sua senha';

  @override
  String get setupPasswordWarning =>
      'Esta senha não pode ser recuperada. Anote-a e mantenha-a em segurança!';

  @override
  String get setupPasswordPageTitle => 'Criar senha';

  @override
  String get setupPasswordNext => 'Próximo';

  @override
  String get setupPasswordSkip => 'Pular';

  @override
  String get confirmationCheckboxTitle =>
      'Entendo que minha senha não pode ser recuperada';

  @override
  String get loginWelcomeBack => 'Bem-vindo de volta';

  @override
  String get loginPasswordLabel => 'Senha';

  @override
  String get loginUnlock => 'Desbloquear';

  @override
  String get loginPasswordRequired => 'Digite sua senha';

  @override
  String get loginIncorrectPassword =>
      'Senha incorreta. Por favor, tente novamente.';

  @override
  String get paywallNoSubscription =>
      'Não foi encontrada uma assinatura ativa. Compre para continuar.';

  @override
  String get lifetimeThanksTitle => 'Obrigado por estar com a gente';

  @override
  String get lifetimeThanksSubtitle =>
      'Estamos te presenteando com acesso Pro vitalício';

  @override
  String get lifetimeThanksGift => 'presente';

  @override
  String get lifetimeThanksCta => 'Resgatar acesso vitalício';

  @override
  String get paywallNoInternetTitle => 'Sem conexão com a Internet';

  @override
  String get paywallNoInternetBody =>
      'É necessária uma conexão com a Internet para acessar o aplicativo pela primeira vez. Conecte-se e tente novamente.';

  @override
  String get paywallStoreUnavailableTitle => 'Loja indisponível';

  @override
  String get paywallStoreUnavailableBody =>
      'Não foi possível carregar as opções de assinatura. Por favor, tente novamente.';

  @override
  String get subscriptionVerifyTitle => 'Verificar assinatura';

  @override
  String get subscriptionSoftWarningTitle =>
      'Verificação de assinatura necessária';

  @override
  String get subscriptionContinueAnyway => 'Continuar mesmo assim';

  @override
  String subscriptionLastVerified(String date) {
    return 'Última verificação $date.';
  }

  @override
  String get subscriptionNotVerifiedOnline =>
      'A assinatura não pôde ser verificada on-line.';

  @override
  String subscriptionAccessUntil(String date) {
    return 'Seu acesso continua até $date — conecte-se antes disso para verificar.';
  }

  @override
  String get subscriptionConnectToVerify =>
      'Conecte-se à Internet para verificar sua assinatura.';

  @override
  String get organizeNoDuplicates => 'Nenhuma duplicata potencial encontrada';

  @override
  String get organizeSkippedShownAgain =>
      'Duplicatas ignoradas são mostradas novamente.';

  @override
  String get organizeShowSkippedTooltip =>
      'Mostrar novamente grupos duplicados ignorados';

  @override
  String organizeFailedToLoad(String error) {
    return 'Falha ao carregar grupos duplicados: $error';
  }

  @override
  String duplicatesCount(int count) {
    return '$count duplicatas';
  }

  @override
  String get organizeSubtitlePlaceholder => 'Toque para ver detalhes';

  @override
  String get organizeConflictMostlyIdentical => 'Praticamente idêntico';

  @override
  String organizeConflictFieldVariants(String field, int count) {
    return '$field: $count variantes';
  }

  @override
  String get fieldLabelName => 'nome';

  @override
  String get fieldLabelCompany => 'empresa';

  @override
  String get fieldLabelPhone => 'telefone';

  @override
  String get fieldLabelEmail => 'e-mail';

  @override
  String get importErrorUnsupportedSource =>
      'A importação não está disponível aqui.';

  @override
  String get importErrorPermissionDenied =>
      'A permissão de contatos é necessária para importar contatos.';

  @override
  String get importErrorNoContacts => 'Não há contatos para importar.';

  @override
  String get importErrorUnsupportedFileType =>
      'Selecione um arquivo .vcf ou um arquivo .zip.';

  @override
  String get importErrorInvalidFile =>
      'O arquivo selecionado é inválido ou ilegível.';

  @override
  String get importErrorWrongPassword =>
      'Senha de arquivo incorreta. Por favor, tente novamente.';

  @override
  String get importErrorNoVcfInArchive =>
      'Nenhum arquivo .vcf foi encontrado no arquivo selecionado.';

  @override
  String importErrorFailed(String detail) {
    return 'Falha ao importar contatos: $detail';
  }

  @override
  String get exportErrorContactsUnavailable =>
      'Os contatos ainda não estão disponíveis.';

  @override
  String get exportErrorNoContacts => 'Nenhum contato para exportar.';

  @override
  String get exportErrorPasswordRequired =>
      'A senha é necessária para uma exportação protegida.';

  @override
  String exportErrorPasswordTooShort(int min) {
    return 'A exportação protegida requer uma senha de pelo menos $min caracteres.';
  }

  @override
  String exportErrorFailed(String detail) {
    return 'Falha na exportação: $detail';
  }

  @override
  String get exportNoticeDownloadStarted => 'Download iniciado.';

  @override
  String get exportNoticeFileSaved => 'Arquivo salvo com sucesso.';

  @override
  String get phoneTypeMobile => 'móvel';

  @override
  String get phoneTypeHome => 'Casa';

  @override
  String get phoneTypeWork => 'Trabalho';

  @override
  String get phoneTypeSchool => 'escola';

  @override
  String get phoneTypeOther => 'outro';

  @override
  String get emailTypePersonal => 'pessoal';

  @override
  String get emailTypeWork => 'Trabalho';

  @override
  String get emailTypeSchool => 'escola';

  @override
  String get emailTypeOther => 'outro';

  @override
  String get addressTypeHome => 'Casa';

  @override
  String get addressTypeWork => 'Trabalho';

  @override
  String get addressTypeSchool => 'Escola';

  @override
  String get addressTypeBirth => 'Nascimento';

  @override
  String get linkTypeWebsite => 'Site';

  @override
  String get linkTypeLinkedIn => 'LinkedIn';

  @override
  String get linkTypeX => 'X';

  @override
  String get linkTypeFacebook => 'Facebook';

  @override
  String get linkTypeInstagram => 'Instagram';

  @override
  String get linkTypeOther => 'Outro';

  @override
  String get dateTypeCreated => 'Criado';

  @override
  String get dateTypeBirthday => 'Aniversário';

  @override
  String get dateTypeMet => 'Encontro';

  @override
  String get dateTypeGraduation => 'Graduação';

  @override
  String get dateTypeMarriage => 'Casamento';

  @override
  String get dateTypeOther => 'Outro';

  @override
  String get noNameInList => '(Sem nome)';

  @override
  String get formAddPhone => 'Adicionar telefone';

  @override
  String get formAddEmail => 'Adicionar e-mail';

  @override
  String get formAddAddress => 'Adicionar endereço';

  @override
  String get formAddLink => 'Adicionar link';

  @override
  String get formAddDate => 'Adicionar data';

  @override
  String get formHintPhoneNumber => 'Número de telefone';

  @override
  String get formHintEmail => 'E-mail';

  @override
  String get formHintUrl => 'URL';

  @override
  String get formHintAddress => 'Endereço';

  @override
  String get formHintSelectDate => 'Selecione a data';

  @override
  String get formHintNotes => 'Adicionar notas';

  @override
  String get formCompany => 'Empresa';

  @override
  String get formDepartment => 'Departamento';

  @override
  String get formJobTitle => 'Cargo';

  @override
  String get formPrefix => 'Prefixo';

  @override
  String get formFirstName => 'Primeiro nome';

  @override
  String get formMiddleName => 'Nome do meio';

  @override
  String get formLastName => 'Sobrenome';

  @override
  String get formSuffix => 'Sufixo';

  @override
  String get formNickname => 'Apelido';

  @override
  String get contactsListTitle => 'Contatos';

  @override
  String get contactsListEmpty => 'Nenhum contato ainda';

  @override
  String get contactsImportButton => 'Importar contatos';

  @override
  String get mergeContactsTitle => 'Mesclar contatos';

  @override
  String get mergeContactsSubtitle => 'Selecione contatos para mesclar em um';

  @override
  String get exportPasswordHint => 'Senha';

  @override
  String get exportPasswordConfirmHint => 'Confirme sua senha';

  @override
  String exportPasswordHelper(int min) {
    return 'Pelo menos $min caracteres';
  }

  @override
  String get zipPasswordHint => 'Senha do arquivo';

  @override
  String get activateDemoAccessCodeLabel => 'Código de acesso';

  @override
  String get subscriptionExpiredTitle => 'A assinatura expirou';

  @override
  String get subscriptionExpiredBody =>
      'Renove para continuar usando todos os recursos.';

  @override
  String get contactsLoadError => 'Não foi possível carregar os contatos.';

  @override
  String get contactsListError => 'Não foi possível carregar os contatos.';

  @override
  String get contactsSearchNoResults => 'Nenhum contato encontrado';

  @override
  String get supportPageIntro =>
      'Dúvidas, feedback ou algo não está funcionando? A equipe do Savelon lê todas as mensagens.';

  @override
  String get supportCtaMessageTeam => 'Enviar mensagem à equipe';

  @override
  String get importFromDeviceContacts => 'Dos seus contatos';

  @override
  String get importFromFileVcfZip => 'De um arquivo (VCF, ZIP)';

  @override
  String get exportCreateUniquePasswordTitle => 'Criar senha exclusiva';

  @override
  String get exportPasswordIrrecoverableHint =>
      'Esta senha não pode ser recuperada.';

  @override
  String get exportProtectedArchiveCta => 'Exportar arquivo protegido';

  @override
  String get exportIosSavedFileWarning =>
      'Este arquivo é salvo na pasta do Savelon. Se você excluir o app, o arquivo também será excluído. Mova-o para outro local para mantê-lo.';

  @override
  String importContactsConfirmBody(int count) {
    return 'Importar $count contatos para o Savelon?';
  }

  @override
  String get settingsSetPasswordPageTitle => 'Definir senha';

  @override
  String get settingsChangePasswordPageTitle => 'Alterar senha';

  @override
  String get settingsRemovePasswordPageTitle => 'Remover senha';

  @override
  String get settingsNewPasswordLabel => 'Nova senha';

  @override
  String get settingsConfirmNewPasswordLabel => 'Confirmar nova senha';

  @override
  String get settingsReenterNewPasswordHelper =>
      'Digite novamente a nova senha';

  @override
  String get settingsSetPasswordCta => 'Definir senha';

  @override
  String get settingsChangePasswordCta => 'Alterar senha';

  @override
  String get settingsRemovePasswordCta => 'Remover senha';

  @override
  String get settingsCurrentPasswordLabel => 'Senha atual';

  @override
  String get settingsEnterCurrentPasswordHelper => 'Digite sua senha atual';

  @override
  String get settingsNewPasswordMustDiffer =>
      'A nova senha deve ser diferente da atual';

  @override
  String settingsFailedToSetPassword(String error) {
    return 'Não foi possível definir a senha: $error';
  }

  @override
  String settingsFailedToChangePassword(String error) {
    return 'Não foi possível alterar a senha: $error';
  }

  @override
  String settingsFailedToRemovePassword(String error) {
    return 'Não foi possível remover a senha: $error';
  }

  @override
  String get settingsPasswordInvalidFallback => 'A senha é inválida';

  @override
  String get settingsCurrentPasswordIncorrect => 'A senha atual está incorreta';

  @override
  String get settingsCurrentPasswordRequired => 'A senha atual é obrigatória';

  @override
  String get authPasswordRequiredWhenProtectionEnabled =>
      'Senha necessária quando a proteção por senha está ativada';

  @override
  String get authPasswordRequiredWhenEnablePassword =>
      'Senha necessária ao ativar a opção de senha';

  @override
  String get authPasswordRequiredForAccount =>
      'Senha necessária para esta conta';
}

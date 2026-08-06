// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Nome de utilizador';

  @override
  String get commonDisplayNameLabel => 'Nome de exibição';

  @override
  String get commonPasswordLabel => 'Palavra-passe';

  @override
  String get commonConfirmPasswordLabel => 'Confirmar palavra-passe';

  @override
  String get commonPasswordMismatch => 'As palavras-passe não coincidem';

  @override
  String get commonUsernameTaken => 'Este nome de utilizador já está em uso';

  @override
  String get commonChoosePassword => 'Escolha uma palavra-passe';

  @override
  String get commonRequiredFields => 'Nome e utilizador são obrigatórios';

  @override
  String get passwordFieldShow => 'Mostrar';

  @override
  String get passwordFieldHide => 'Ocultar';

  @override
  String loginWelcomeBack(String name) {
    return 'Bem-vindo de volta, $name';
  }

  @override
  String get loginTitle => 'Iniciar sessão';

  @override
  String get loginVerifying => 'A verificar…';

  @override
  String get loginUnlockTouchId => 'Desbloquear com Touch ID';

  @override
  String get loginUnlockWindowsHello => 'Déverrouiller avec Windows Hello';

  @override
  String get loginOr => 'ou';

  @override
  String get loginRequiredFields => 'Utilizador e palavra-passe obrigatórios';

  @override
  String get loginInvalidCredentials =>
      'Utilizador ou palavra-passe incorretos';

  @override
  String get loginSubmit => 'Iniciar sessão';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get loginEnableBiometricsTitle => 'Déverrouillage par empreinte ?';

  @override
  String get loginEnableBiometricsDetail =>
      'Voulez-vous utiliser l’empreinte / Windows Hello pour ouvrir le CRM sans retaper le mot de passe sur cet appareil ?';

  @override
  String get loginEnableBiometricsYes => 'Oui, activer';

  @override
  String get loginEnableBiometricsNo => 'Non, merci';

  @override
  String get loginEnableBiometricsButton => 'Activer l’empreinte';

  @override
  String get loginDisableBiometricsButton => 'Désactiver l’empreinte';

  @override
  String get loginBiometricsUnavailable =>
      'Windows Hello / empreinte non disponible. Activez un PIN ou une empreinte dans les paramètres Windows.';

  @override
  String get loginBiometricsEnabled => 'Empreinte activée pour ce compte.';

  @override
  String get loginBiometricsDisabled => 'Empreinte désactivée.';

  @override
  String get bootstrapWelcome => 'Bem-vindo';

  @override
  String get bootstrapSubtitle =>
      'Crie a conta de administrador para proteger o seu CRM.';

  @override
  String get bootstrapSubmit => 'Criar conta de administrador';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonCreate => 'Criar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonNoName => '(sem nome)';

  @override
  String get commonNotesLabel => 'Notas';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Telefone';

  @override
  String get commonFirstNameLabel => 'Nome próprio';

  @override
  String get commonLastNameLabel => 'Apelido';

  @override
  String get commonCompanyNameLabel => 'Nome da empresa';

  @override
  String messagingCannotOpen(String target) {
    return 'Não é possível abrir $target.';
  }

  @override
  String get messagingEmailAppLabel => 'a aplicação de email';

  @override
  String get messagingPhoneAppLabel => 'a aplicação de telefone';

  @override
  String messagingIncompleteId(String label) {
    return 'Identificador incompleto para abrir $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Não é possível abrir $label — a aplicação está instalada?';
  }

  @override
  String get messagingWechatNote =>
      'O WeChat não expõe uma ligação pública a um contacto específico — a aplicação abre-se, mas terá de escolher a conversa manualmente.';

  @override
  String get messagingKakaotalkNote =>
      'O KakaoTalk não expõe uma ligação pública a um contacto específico — a aplicação abre-se, mas terá de escolher a conversa manualmente.';

  @override
  String get messagingPhoneCallLabel => 'Chamada telefónica';

  @override
  String get companyDeleteOpportunityConfirm => 'Eliminar esta oportunidade?';

  @override
  String get companyDeleteContactConfirm => 'Eliminar este contacto?';

  @override
  String get companyDeleteTaskConfirm => 'Eliminar esta tarefa?';

  @override
  String get companyDeleteConfirmTitle => 'Eliminar este cliente?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — os seus contactos, oportunidades, tarefas e histórico serão eliminados com ele.';
  }

  @override
  String get companyNewNoteTitle => 'Nova nota';

  @override
  String get companyNoteFieldLabel => 'Nota (ou dite-a)';

  @override
  String get companyTabOverview => 'Resumo';

  @override
  String get companyTabActivity => 'Atividade';

  @override
  String get companyTabTasks => 'Tarefas';

  @override
  String get companyTabDeals => 'Oportunidades';

  @override
  String get companyContactsTitle => 'Contactos';

  @override
  String get companyNoContacts => 'Sem contactos';

  @override
  String get companyNoActivity => 'Sem atividade — adicione uma nota.';

  @override
  String get companyNoTasks => 'Sem tarefas';

  @override
  String get companyNoDeals => 'Sem oportunidades';

  @override
  String get companyNoteButtonLabel => 'Nota';

  @override
  String get companyNewClientTitle => 'Novo cliente';

  @override
  String get companyEditClientTitle => 'Editar cliente';

  @override
  String get companyWebsiteLabel => 'Sítio web';

  @override
  String get companyPeppolLabel => 'Identificador Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Etiquetas (separadas por vírgulas)';

  @override
  String get companyNewContactTitle => 'Novo contacto';

  @override
  String get companyEditContactTitle => 'Editar contacto';

  @override
  String get companyAppLabel => 'Aplicação';

  @override
  String get companyIdentifierNumberLabel => 'Identificador / número';

  @override
  String get companyOpenTooltip => 'Abrir';

  @override
  String get companyRemoveTooltip => 'Remover';

  @override
  String get companyRoleFieldLabel => 'Função (ex. Comprador)';

  @override
  String get companyMessagingTitle => 'Mensagens';

  @override
  String get companyNoMessagingHint =>
      'Nenhum canal de mensagens adicionado — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Ainda sem informação de contacto.';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsSubtitle => 'Configuração única da aplicação.';

  @override
  String get settingsLanguagesTitle => 'Idiomas e moeda';

  @override
  String get settingsAppLanguageLabel => 'Idioma da aplicação';

  @override
  String get settingsDictationLanguageLabel => 'Idioma de ditado';

  @override
  String get settingsCurrencyLabel => 'Moeda';

  @override
  String get settingsFormatsHint =>
      'Valores apresentados como 1,234.56 (vírgula = milhares, ponto = decimais) e datas como dd/mm/aaaa, independentemente do idioma da interface.';

  @override
  String get settingsCompanyTitle => 'Empresa';

  @override
  String get settingsCompanySubtitle =>
      'Identidade da empresa que utiliza este CRM — reutilizada mais tarde no cabeçalho (marca branca) e nos cabeçalhos dos documentos PDF.';

  @override
  String get settingsSyncTitle => 'Sincronização';

  @override
  String get settingsSyncSubtitle =>
      'Por predefinição, todos os dados permanecem locais (SQLite) neste dispositivo.';

  @override
  String get settingsSyncLocalTitle => 'Autónomo (apenas local)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Nenhum dado enviado para fora deste dispositivo';

  @override
  String get settingsSyncRemoteTitle => 'Base de dados partilhada (remota)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Sincroniza com um servidor PHP + SQLite (ver server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Servidor';

  @override
  String get settingsAccountLabel => 'Conta';

  @override
  String get settingsSyncPasswordHint =>
      'Guardado no chaveiro seguro do dispositivo — nunca na base de dados.';

  @override
  String get settingsSyncNowButton => 'Sincronizar agora';

  @override
  String get settingsSyncPollHint =>
      'Extração automática a cada 25 s em segundo plano; envio imediato após cada alteração (modo remoto ativo). Sem extração durante a escrita.';

  @override
  String get settingsSyncMissingFields =>
      'Servidor, conta e palavra-passe obrigatórios';

  @override
  String get settingsModulesTitle => 'Módulos';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Scanner, Sync… — teste de 7 dias ou ativação de licença.';

  @override
  String get settingsBrowseModules => 'Explorar módulos';

  @override
  String get settingsImportExportTitle => 'Importar / exportar';

  @override
  String get settingsImportExportSubtitle =>
      'Clientes, contactos e oportunidades em CSV; contactos de vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Personalize as etapas e as respetivas etiquetas.';

  @override
  String get settingsConfigureStages => 'Configurar etapas';

  @override
  String get settingsBackupTitle => 'Cópia de segurança local';

  @override
  String get settingsBackupSubtitle =>
      'Exporta uma cópia da sua base de dados SQLite — útil antes de uma atualização ou para arquivo.';

  @override
  String get settingsExportDbButton => 'Exportar base de dados (.db)';

  @override
  String get settingsBackupShareText => 'Cópia de segurança EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get settingsUsersTitle => 'Utilizadores';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Contas, funções e palavras-passe — administrador e utilizador.';

  @override
  String get settingsUsersSubtitleLocked => 'Apenas administradores.';

  @override
  String get settingsManageUsersButton => 'Gerir utilizadores';

  @override
  String get settingsUsersLockedHint =>
      'Inicie sessão com uma conta de administrador para ver ou editar utilizadores e as respetivas palavras-passe.';

  @override
  String get settingsSaveKeychainError =>
      'Definições guardadas, mas o chaveiro seguro não está disponível — a palavra-passe de sincronização não pôde ser guardada (reinicie a app após uma recompilação completa).';

  @override
  String get settingsSaved => 'Definições guardadas';

  @override
  String get settingsLogoutConfirmTitle => 'Terminar sessão?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Terá de introduzir a sua palavra-passe (ou Touch ID) para voltar.';

  @override
  String get settingsLogoutButton => 'Terminar sessão';

  @override
  String get settingsLogoTitle => 'Logótipo da empresa';

  @override
  String get settingsLogoSubtitle =>
      'Apresentado no topo da aplicação e na faixa.';

  @override
  String get settingsLogoEmpty => 'Sem logótipo — adicione o da sua empresa';

  @override
  String get settingsLogoChoose => 'Escolher uma imagem';

  @override
  String get settingsLogoChange => 'Alterar logótipo';

  @override
  String get usersDeleteSelfError => 'Não pode eliminar a sua própria conta';

  @override
  String get usersDeleteConfirmTitle => 'Eliminar este utilizador?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) perderá o acesso ao CRM.';
  }

  @override
  String get usersTitle => 'Utilizadores';

  @override
  String get usersSubtitle => 'Contas, funções e palavras-passe.';

  @override
  String get usersAddButton => 'Utilizador';

  @override
  String get usersEmptyTitle => 'Sem utilizadores';

  @override
  String get usersEmptySubtitle =>
      'Crie a primeira conta — será administrador.';

  @override
  String get usersEmptyAction => 'Novo utilizador';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (você)';
  }

  @override
  String get usersNewTitle => 'Novo utilizador';

  @override
  String get usersEditTitle => 'Editar utilizador';

  @override
  String get usersLoginIdLabel => 'ID de acesso';

  @override
  String get usersRoleLabel => 'Função';

  @override
  String get usersNewPasswordLabel =>
      'Nova palavra-passe (deixe em branco para não alterar)';

  @override
  String get usersTouchIdTitle => 'Touch ID neste dispositivo';

  @override
  String get usersTouchIdSubtitle =>
      'Desbloquear sem voltar a escrever a palavra-passe, apenas neste dispositivo.';

  @override
  String get roleAdministrator => 'Administrador';

  @override
  String get roleUser => 'Utilizador';

  @override
  String get dashboardTitleEmbedded => 'Painel';

  @override
  String get dashboardTitle => 'Hoje';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ações a tratar',
      one: '$countString ação a tratar',
    );
    return '$_temp0';
  }

  @override
  String dashboardMoreAgendaItems(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$countString mais — ver tudo',
      one: '+$countString mais — ver tudo',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Todos os comerciais';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (eu)';
  }

  @override
  String get dashboardEmptyTitle => 'O seu CRM está pronto';

  @override
  String get dashboardEmptySubtitle =>
      'Adicione o seu primeiro cliente, importe um ficheiro CSV ou explore os próximos módulos.';

  @override
  String get dashboardNothingScheduled =>
      'Nada agendado — os seus seguimentos aparecerão aqui.';

  @override
  String get dashboardBucketOverdue => 'Em atraso';

  @override
  String get dashboardBucketToday => 'Hoje';

  @override
  String get dashboardBucketWeek => 'Esta semana';

  @override
  String get dashboardBucketLater => 'Mais tarde';

  @override
  String get dashboardContactedButton => 'Contactado';

  @override
  String get dashboardDoneButton => 'Concluído';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Melhores clientes (pipeline aberto)';

  @override
  String get dashboardPipelineByStage => 'Pipeline por etapa';

  @override
  String get dashboardNoOpportunitiesYet => 'Ainda sem oportunidades';

  @override
  String get dashboardWonLostByMonth => 'Ganhos / Perdidos por mês';

  @override
  String get dashboardNoClosuresYet => 'Ainda sem fechos registados.';

  @override
  String get dashboardRecentActivity => 'Atividade recente';

  @override
  String get dashboardNoActivityYet => 'Sem atividade por agora.';

  @override
  String get metricClients => 'Clientes';

  @override
  String get metricOpportunities => 'Oportunidades';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Previsão';

  @override
  String get metricTasks => 'Tarefas';

  @override
  String get metricOverdue => 'Em atraso';

  @override
  String get productTagline => 'Poupe tempo desde o primeiro dia.';

  @override
  String get placeholderDashboardHint =>
      'Resumo: pipeline, seguimentos e atividade recente.';

  @override
  String get placeholderTodayTitle => 'O seu dia';

  @override
  String get placeholderTodayHint =>
      'Escolha um seguimento à esquerda.\nO cliente abre-se aqui — sem mudar de ecrã.';

  @override
  String get placeholderClientsTitle => 'Ficha do cliente';

  @override
  String get placeholderClientsHint =>
      'Selecione um cliente da lista,\nou crie um com o botão +.';

  @override
  String get placeholderPipelineHint =>
      'Arraste um cartão entre colunas.\nClique para abrir a ficha do cliente.';

  @override
  String get placeholderTasksHint =>
      'Selecione uma tarefa para ver o cliente relacionado.';

  @override
  String get modulesSubtitleAppStore =>
      'Assine através da App Store ou ative uma assinatura já comprada em eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Avaliação gratuita, compra em eastmarkhk.com — a mesma assinatura do aplicativo EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Ativo — App Store';

  @override
  String get modulesStatusActiveWeb => 'Ativo — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Avaliação — $countString dias restantes',
      one: 'Avaliação — $countString dia restante',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Ativo';

  @override
  String get modulesStatusAvailable => 'Disponível';

  @override
  String get modulesBuyFailed =>
      'Não foi possível iniciar a compra. Tente novamente ou restaure suas compras.';

  @override
  String get modulesRestoreDone => 'Restauração concluída.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name ativado no aplicativo instalado.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licença não encontrada automaticamente. Abra EastmarkHK e-Invoicing → Configurações, copie seu código de ativação e escolha \'Ativar um código da web\'.';

  @override
  String get modulesRenewalNote =>
      'Renovação automática via App Store. Gerencie a assinatura em Configurações → Apple ID → Assinaturas.';

  @override
  String get modulesWebStoreNote =>
      'Ou assine em eastmarkhk.com e ative com o código recebido por e-mail.';

  @override
  String get modulesHaveEinvoicing => 'Já tenho EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Experimentar 7 dias';

  @override
  String get modulesSubscribe => 'Assinar';

  @override
  String get modulesRestore => 'Restaurar compras';

  @override
  String get modulesWebSubscription => 'Assinatura eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Ativar um código da web';

  @override
  String get modulesUseInCrm => 'Usar no CRM';

  @override
  String get modulesDontUseInCrm => 'Não usar no CRM';

  @override
  String get modulesBuyOnAppStore => 'Comprar na App Store';

  @override
  String get modulesStoreUnavailable =>
      'A App Store não está disponível nesta versão. Use uma versão da App Store, ou ative uma subscrição eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'A verificar compras da App Store e eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'A verificar compras da App Store…';

  @override
  String get modulesPerMonth => '/ mês';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Assinou em eastmarkhk.com? Cole o código recebido por e-mail. No iPhone/iPad, a compra inicial é feita pela App Store ou pelo site antes da ativação.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Assine em eastmarkhk.com e cole o código de ativação vinculado a este dispositivo.';

  @override
  String get modulesMachineId => 'ID da máquina';

  @override
  String get modulesCopy => 'Copiar';

  @override
  String get modulesSubscriptionEmailLabel => 'E-mail da assinatura';

  @override
  String get modulesActivationCodeLabel => 'Código de ativação';

  @override
  String get modulesActivationCodeHint =>
      'Cole o código recebido após a compra';

  @override
  String get modulesActivate => 'Ativar';

  @override
  String get modulesBuyOnWebsite => 'Comprar em eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Solicitar um código por e-mail';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name ativado via eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID da máquina copiado';

  @override
  String get modulesEmailRequired => 'Digite seu e-mail de assinatura';

  @override
  String get invNewQuote => 'New quote';

  @override
  String get invNewInvoice => 'New invoice';

  @override
  String get invSectionQuote => 'Quote';

  @override
  String get invSectionInvoice => 'Invoice';

  @override
  String get invFieldClient => 'Client';

  @override
  String get invPickClientTitle => 'Escolher um cliente';

  @override
  String get invPickClientSearch => 'Pesquisar por nome, NIF, país…';

  @override
  String get invPickClientEmpty => 'Nenhum cliente correspondente.';

  @override
  String get invPickClientButton => 'Escolher cliente';

  @override
  String get invClientRequired => 'Escolha um cliente antes de guardar.';

  @override
  String get invFieldDate => 'Date';

  @override
  String get invFieldDueDate => 'Due date';

  @override
  String get invFieldValidUntil => 'Valid until';

  @override
  String get invFieldStatus => 'Status';

  @override
  String get invFieldVatPercent => 'VAT %';

  @override
  String get invStatusDraft => 'Draft';

  @override
  String get invStatusSent => 'Sent';

  @override
  String get invStatusAccepted => 'Accepted';

  @override
  String get invStatusRejected => 'Rejected';

  @override
  String get invStatusInvoiced => 'Invoiced';

  @override
  String get invStatusPartial => 'Partial';

  @override
  String get invStatusPaid => 'Paid';

  @override
  String get invStatusOverdue => 'Overdue';

  @override
  String get invStatusCancelled => 'Cancelled';

  @override
  String get invLinesTitle => 'Lines';

  @override
  String get invNotesTitle => 'Notes';

  @override
  String get invCreate => 'Create';

  @override
  String get invCreating => 'Creating…';

  @override
  String get invSave => 'Guardar';

  @override
  String get invSaving => 'A guardar…';

  @override
  String invEditQuote(String number) {
    return 'Editar orçamento $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Editar fatura $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number guardado.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Não foi possível guardar: $error';
  }

  @override
  String get invEditDocument => 'Editar';

  @override
  String get invAddFromCatalog => 'Add from catalog';

  @override
  String get invAddFreeLine => 'Add a line';

  @override
  String get invEmptyLines =>
      'No lines — add a catalog product or a free line.';

  @override
  String get invUpdateProductTooltip => 'Update product';

  @override
  String get invAddToCatalogTooltip => 'Add to catalog';

  @override
  String get invDeleteLineTooltip => 'Delete line';

  @override
  String get invChangePhotoTooltip => 'Change photo';

  @override
  String get invAddPhotoTooltip => 'Add a photo';

  @override
  String get invProductUpdated => 'Product updated (price and photos).';

  @override
  String get invProductSaved => 'Line saved to the catalog (with photos).';

  @override
  String get invClientLinkedHint =>
      'The CRM client is already linked: the document will be created in e-Invoicing for the same client.';

  @override
  String get invFooterHint =>
      'The document is created in EastmarkHK e-Invoicing — layout, PDF, sending and follow-up are done in the e-Invoicing app.';

  @override
  String get invNeedLines => 'Add at least one line with a description.';

  @override
  String get invSubtotalHt => 'Subtotal excl. tax';

  @override
  String get invVat => 'VAT';

  @override
  String get invTotalTtc => 'Total incl. tax';

  @override
  String get invCatalogTitle => 'Product catalog';

  @override
  String get invCatalogSearch => 'Search a product…';

  @override
  String get invCatalogEmpty => 'No products — create them in e-Invoicing.';

  @override
  String get invHomeSubtitle =>
      'Orçamentos e faturas — dados do EastmarkHK e-Invoicing (recibos e lembretes: aplicação autónoma)';

  @override
  String get invOpenStandalone => 'Abrir e-Invoicing';

  @override
  String get invLaunchStandalone => 'Iniciar e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Ligação remota';

  @override
  String invTabQuotes(int count) {
    return 'Orçamentos ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Faturas ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Sem orçamentos — crie um a partir de uma oportunidade ganha ou do botão acima.';

  @override
  String get invEmptyInvoices => 'Sem faturas.';

  @override
  String get invEmptyCompanyDocs => 'Sem orçamentos nem faturas.';

  @override
  String get invQuotesSection => 'ORÇAMENTOS';

  @override
  String get invInvoicesSection => 'FATURAS';

  @override
  String get invCompanyFooter =>
      'Os documentos são geridos pelo EastmarkHK e-Invoicing — envio, PDF, recibos e lembretes na aplicação autónoma.';

  @override
  String get invRemoteNotConfigured =>
      'O e-Invoicing está em modo remoto — ligação não configurada.';

  @override
  String get invConfigure => 'Configurar';

  @override
  String get invAppNotDetected =>
      'Aplicação e-Invoicing não detetada — instale/inicie o EastmarkHK e-Invoicing para criar orçamentos e faturas a partir deste registo.';

  @override
  String get invRemoteSetupBody =>
      'O EastmarkHK e-Invoicing está configurado para armazenamento remoto. Introduza aqui as mesmas credenciais para ligar o CRM à mesma API — os mesmos valores que em e-Invoicing → Definições → Armazenamento remoto.';

  @override
  String get invLaunchOnceBody =>
      'Inicie o EastmarkHK e-Invoicing uma vez para inicializar a base de dados partilhada e depois volte aqui.';

  @override
  String get invAcquireAppStoreBody =>
      'Este módulo utiliza o EastmarkHK e-Invoicing. Transfira e subscreva através da App Store, inicie-o uma vez e depois volte aqui.';

  @override
  String get invAcquireWebBody =>
      'Este módulo utiliza o EastmarkHK e-Invoicing. Transfira e subscreva em eastmarkhk.com, inicie-o uma vez e depois volte aqui.';

  @override
  String get invConfigureRemote => 'Configurar ligação remota';

  @override
  String get invViewOnAppStore => 'Ver na App Store';

  @override
  String get invViewOnWebsite => 'Ver em eastmarkhk.com';

  @override
  String get invRetry => 'Tentar novamente';

  @override
  String get invDocInvoice => 'Fatura';

  @override
  String get invDocQuote => 'Orçamento';

  @override
  String get invDocClient => 'Cliente';

  @override
  String get invDocStatus => 'Estado';

  @override
  String get invDocDate => 'Data';

  @override
  String get invOpenInStandalone => 'Abrir no e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Não foi possível abrir o e-Invoicing — verifique se está instalado.';

  @override
  String get invCreateInvoiceFromQuote => 'Criar fatura';

  @override
  String get invCreatingInvoice => 'A criar fatura…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Fatura $number criada a partir do orçamento.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Este orçamento já foi faturado.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Não foi possível criar a fatura: $error';
  }

  @override
  String get invLinkMenu => 'Ligação e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Cliente e-Invoicing associado';

  @override
  String get invLinkStatusNone => 'Nenhuma ligação e-Invoicing guardada';

  @override
  String get invUnlinkCustomer => 'Desassociar cliente e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Desassociar cliente?';

  @override
  String get invUnlinkConfirmBody =>
      'O próximo orçamento ou fatura pedirá novamente para escolher ou criar o cliente no e-Invoicing.';

  @override
  String get invUnlinkDone => 'Ligação e-Invoicing removida.';

  @override
  String get invAppStoreUrlMissing =>
      'O e-Invoicing ainda não está listado na App Store para esta versão. Use eastmarkhk.com ou inicie uma aplicação já instalada.';

  @override
  String get shellModuleTitle => 'Module';

  @override
  String get shellFollowupTitle => 'Follow-up';

  @override
  String get shellClientTitle => 'Client';

  @override
  String get shellModulesTooltip => 'Modules';

  @override
  String get shellAgendaLabel => 'Agenda';

  @override
  String get shellClientsLabel => 'Clients';

  @override
  String get shellTasksLabel => 'Follow-ups';

  @override
  String get shellNewFollowup => 'Follow-up';

  @override
  String get shellNewClient => 'Client';

  @override
  String get shellModulesLabel => 'Modules';

  @override
  String get shellSettingsLabel => 'Settings';

  @override
  String get tasksSelectPrompt => 'Select a task';

  @override
  String dashOverviewSubtitle(String month) {
    return 'Overview · $month';
  }

  @override
  String get dashOpenFollowups => 'Open follow-ups';

  @override
  String get dashOverdue => 'Overdue';

  @override
  String get dashToApprove => 'To approve';

  @override
  String get dashProspects => 'Prospects';

  @override
  String get dashActiveClients => 'Active clients';

  @override
  String get dashInactive => 'Inactive / lost';

  @override
  String get dashQuotes => 'Quotes';

  @override
  String get dashOpenInvoices => 'Open invoices';

  @override
  String get dashPaidInvoices => 'Paid invoices';

  @override
  String get dashRecentActions => 'Recent actions';

  @override
  String get dashNoRecentActions =>
      'No recent actions — follow-ups, calls, emails and documents will appear here.';

  @override
  String get dashRecentDone => 'Recently completed';

  @override
  String get dashNoClosed => 'No closed follow-ups yet.';

  @override
  String get dashModules => 'Modules';

  @override
  String get dashOpenCaHint =>
      'Open revenue: unpaid invoices (see e-Invoicing for details).';

  @override
  String get dashDoneBadge => 'Done';

  @override
  String get dashPassedBadge => 'Passed';

  @override
  String get clientEmptyTitle => 'Select a client';

  @override
  String get clientEmptySubtitle => 'Or create one to start tracking.';

  @override
  String get clientEinvoiceBadge => 'E-invoice / Peppol';

  @override
  String get clientNoContactsHint =>
      'Add at least one contact (with a role) for this company.';

  @override
  String get clientFollowupsTitle => 'Follow-up / tasks';

  @override
  String get clientPlanAction => 'Schedule';

  @override
  String get clientNoTasksHint =>
      'Plan the phases: first contact, follow-up, meeting…';

  @override
  String clientEinvoiceError(String error) {
    return 'E-invoicing unavailable: $error';
  }

  @override
  String get clientPrimaryBadge => 'Primary';

  @override
  String get tasksTitle => 'Tasks';

  @override
  String get tasksNewButton => 'New task';

  @override
  String tasksOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open',
      one: '1 open',
    );
    return '$_temp0';
  }

  @override
  String get tasksAllReps => 'All salespeople';

  @override
  String get tasksAllDoneTitle => 'All done!';

  @override
  String get tasksAllDoneSubtitle => 'Add a task — or dictate it after a call.';

  @override
  String get tasksClientLabel => 'Client';

  @override
  String get tasksClientOptional => 'Client (optional)';

  @override
  String get tasksClientRequired => 'Client *';

  @override
  String get tasksNoClient => 'Without a client (e.g. personal task)';

  @override
  String get tasksMessageHint =>
      'Message (e.g. Call the client, run an errand…)';

  @override
  String get tasksDueLabel => 'Due date';

  @override
  String get tasksNoDue => 'No due date';

  @override
  String dueLabelOverdue(int days, String date) {
    return 'Atrasado · $days d · $date';
  }

  @override
  String dueLabelToday(String date) {
    return 'Hoje · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return 'Amanhã · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · em $days d';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return 'Hoje · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return 'Amanhã · $date';
  }

  @override
  String dueGroupWeekWithDate(String date) {
    return 'Esta semana · $date';
  }

  @override
  String dueGroupWeekWithRange(String from, String to) {
    return 'Esta semana · $from → $to';
  }

  @override
  String dueGroupLaterWithDate(String date) {
    return 'Mais tarde · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return 'Mais tarde · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip =>
      'Sincronização não ativada — toque para configurar';

  @override
  String get bannerSyncInProgressTooltip => 'A sincronizar…';

  @override
  String get bannerSyncErrorTooltip =>
      'Erro de sync — toque para tentar de novo';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return 'Última sync: $date';
  }

  @override
  String get bannerSyncIdleTooltip => 'Sincronizar';

  @override
  String get bannerCompanyPlaceholder => 'A sua empresa';

  @override
  String get tasksDateButton => 'Date';

  @override
  String get tasksTimeButton => 'Time';

  @override
  String get tasksClearButton => 'Clear';

  @override
  String get tasksAssignedTo => 'Assigned to';

  @override
  String get tasksUnassigned => 'Unassigned';

  @override
  String get tasksNewTaskTitle => 'New task';

  @override
  String get pipelineNewOpportunity => 'New opportunity';

  @override
  String get pipelineTitleLabel => 'Title';

  @override
  String get pipelineAmountLabel => 'Amount';

  @override
  String get pipelineMoveTooltip => 'Move';

  @override
  String get pipelineTitle => 'Pipeline';

  @override
  String get pipelineNoOpen => 'No open opportunity';

  @override
  String pipelineOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open opportunities',
      one: '1 open opportunity',
    );
    return '$_temp0';
  }

  @override
  String get pipelineEmptyTitle => 'Your pipeline is empty';

  @override
  String get pipelineEmptySubtitle =>
      'Create an opportunity, then drag it from stage to stage.';

  @override
  String get pipelineBoardEmptyTitle => 'Empty pipeline';

  @override
  String get pipelineBoardEmptySubtitle =>
      'Create an opportunity, then drag it between stages.';

  @override
  String get pipelineDragHint => 'Drag to move';

  @override
  String pipelineCreatedOn(String date) {
    return 'Created on $date';
  }

  @override
  String pipelineStageSince(String date) {
    return 'Stage since $date';
  }

  @override
  String get agendaTitle => 'Agenda';

  @override
  String get agendaToday => 'Today';

  @override
  String get agendaUpcoming => 'Upcoming days';

  @override
  String get agendaEmptyToday => 'Nothing scheduled today. Plan a follow-up.';

  @override
  String get agendaEmptyUpcoming => 'No tasks scheduled soon.';

  @override
  String agendaPendingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tasks awaiting approval',
      one: '1 task awaiting approval',
    );
    return '$_temp0';
  }

  @override
  String get taskEditTooltip => 'Edit';

  @override
  String get taskCloseTooltip => 'Close';

  @override
  String get taskClientSubtitle => 'Client';

  @override
  String get taskDueSubtitle => 'Due date';

  @override
  String get taskValidationTitle => 'Validation';

  @override
  String get taskInfoHint =>
      'This entry is informational. Mark it as passed once acknowledged.';

  @override
  String get taskActionHint =>
      'Mark as executed, then approve to confirm it’s done.';

  @override
  String get taskHistoryTitle => 'History';

  @override
  String get taskNoHistory =>
      'No events yet. Quotes, invoices and status changes will appear here.';

  @override
  String get taskDoneByUs => 'Executed by us';

  @override
  String get taskInfoOnly => 'Info only — passed';

  @override
  String get taskApprove => 'Approve — confirmed done';

  @override
  String get taskReopen => 'Reopen';

  @override
  String get taskReopenTask => 'Reopen task';

  @override
  String get taskDeleteTitle => 'Delete this task?';

  @override
  String get taskViewDocument => 'View document';

  @override
  String taskInvoiceTitle(String number) {
    return 'Invoice $number';
  }

  @override
  String taskQuoteTitle(String number) {
    return 'Quote $number';
  }

  @override
  String logContactedTitle(String title) {
    return 'Contacted — $title';
  }

  @override
  String get logTypeLabel => 'Contact type';

  @override
  String get logNoteLabel => 'Note (optional, or dictate it)';

  @override
  String get logNextFollowup => 'Next follow-up';

  @override
  String get logCustom => 'Custom';

  @override
  String logReplacesHint(String date) {
    return 'Replaces the follow-up already scheduled on $date.';
  }

  @override
  String get logTomorrow => 'Tomorrow';

  @override
  String get log3Days => '3 days';

  @override
  String get log1Week => '1 week';

  @override
  String get log2Weeks => '2 weeks';

  @override
  String get logTypeField => 'Type';

  @override
  String get logContentLabel => 'Content';

  @override
  String get logDeleteTitle => 'Delete this entry?';

  @override
  String get logDeleteBody => 'This action is permanent.';

  @override
  String logRelanceTitle(String title) {
    return 'Follow up: $title';
  }

  @override
  String get logKindNote => 'Note';

  @override
  String get logKindQuoteSent => 'Quote sent';

  @override
  String get logKindEmail => 'Email';

  @override
  String get logKindCall => 'Call';

  @override
  String get logKindMeeting => 'Meeting';

  @override
  String get logKindReply => 'Client reply';

  @override
  String get logKindRemark => 'Remark';

  @override
  String get addressMultipleCities => 'Multiple cities found';

  @override
  String get addressCnpj => 'CNPJ';

  @override
  String get addressAddress => 'Address';

  @override
  String get addressCountry => 'Country';

  @override
  String get addressZip => 'Postal code';

  @override
  String get addressState => 'State';

  @override
  String get addressCity => 'City';

  @override
  String get loginResetPasswordTitle => 'Reset password';

  @override
  String get loginResetHint =>
      'This device only — the password is not shared by sync. Choose a local account and set a new password.';

  @override
  String get loginAccountLabel => 'Account';

  @override
  String get loginNewPasswordLabel => 'New password';

  @override
  String get loginConfirmLabel => 'Confirm';

  @override
  String get loginTooShort => 'Password too short (min. 4 characters).';

  @override
  String get loginMismatch => 'Passwords do not match.';

  @override
  String get loginResetButton => 'Reset';

  @override
  String get currencySearchHint => 'Search currency…';

  @override
  String get currencyNone => 'No currency found';

  @override
  String get systemLanguage => 'System language';

  @override
  String get noLanguage => 'No language found';

  @override
  String get dictationUnavailable => 'Dictation unavailable on this device.';

  @override
  String get companyDeleteTitle => 'Delete this client?';

  @override
  String get companyListTitle => 'Clients';

  @override
  String companyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count companies',
      one: '1 company',
    );
    return '$_temp0';
  }

  @override
  String get companyNewButton => 'New client';

  @override
  String get companySearchHint => 'Filter by name, notes…';

  @override
  String get companyColumnClient => 'Client';

  @override
  String get companyColumnModified => 'Modified';

  @override
  String get companyEmptyNoName => 'No clients';

  @override
  String get companyEmptyNoResult => 'No results';

  @override
  String get companyEmptySubtitle =>
      'Add your first client — or dictate it with the mic.';

  @override
  String get companyEmptySearchSubtitle => 'Try another term.';

  @override
  String get taskEditorNewTitle => 'Schedule a follow-up';

  @override
  String get taskEditorEditTitle => 'Edit follow-up';

  @override
  String get taskEditorClientSection => 'Client';

  @override
  String get taskEditorClientOfTask => 'Follow-up client';

  @override
  String get taskEditorNoClient => 'Without a client (internal)';

  @override
  String get taskEditorChoose => 'Choose…';

  @override
  String get taskEditorTypeSection => 'Type';

  @override
  String get taskEditorTitleField => 'Title *';

  @override
  String get taskEditorTitleHint => 'Follow up the quote, call…';

  @override
  String get taskEditorWhatSection => 'What to do?';

  @override
  String get taskEditorActionHint => 'Choose the concrete action to perform.';

  @override
  String get taskEditorMessaging => 'Messaging';

  @override
  String get taskEditorNeedClient =>
      'First choose a client to show the number or email.';

  @override
  String get taskEditorPhaseSection => 'Phase & due date';

  @override
  String get taskEditorPhaseLabel => 'Deal phase';

  @override
  String get taskEditorChooseDue => 'Choose date and time';

  @override
  String get taskEditorSaveShortcut => 'Save (⌘S)';

  @override
  String get taskEditorNeedMessaging => 'Choose the messaging app to use.';

  @override
  String get taskEditorNeedDue => 'Choose the date and time of the follow-up.';

  @override
  String get taskEditorNeedTitle => 'The task title is required.';

  @override
  String get taskEditorSearchHint => 'Search…';

  @override
  String get taskSuggestedMessage => 'Send a message';

  @override
  String taskSuggestedPlatformMessage(String platform) {
    return 'Message $platform';
  }

  @override
  String get taskSuggestedCall => 'Call';

  @override
  String get taskSuggestedEmail => 'Send an email';

  @override
  String get taskSuggestedMeeting => 'Meeting';

  @override
  String get taskSuggestedFollowup => 'Follow-up';

  @override
  String get importTargetClient => 'Target client';

  @override
  String get importCsvButton => 'Import CSV';

  @override
  String get importModulesSoon => 'Modules (coming soon)';

  @override
  String get importExportCsvTitle => 'CSV export';

  @override
  String get importExportClients => 'Clients';

  @override
  String get importExportContacts => 'Contacts';

  @override
  String get importExportOpportunities => 'Opportunities';

  @override
  String get importTitle => 'Import';

  @override
  String get importClientsCsv => 'Clients CSV';

  @override
  String get importContactsCsv => 'Contacts CSV';

  @override
  String get importOpportunitiesCsv => 'Opportunities CSV';

  @override
  String get importContactsVCard => 'Contacts vCard';

  @override
  String importExported(String path) {
    return 'Exported: $path';
  }

  @override
  String importExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String importResult(String label, int imported, int skipped) {
    return '$label: $imported imported, $skipped skipped.';
  }

  @override
  String importFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String get importNeedClientFirst =>
      'First create a client to attach the vCard contacts.';

  @override
  String importVcardResult(int count) {
    return 'vCard: $count contact(s) imported.';
  }

  @override
  String importVcardFailed(String error) {
    return 'vCard import failed: $error';
  }

  @override
  String get cmdSearchHint => 'Search or type a command…';

  @override
  String get cmdSectionNavigation => 'Navigation';

  @override
  String get cmdGoDashboard => 'Go to Dashboard';

  @override
  String get cmdGoToday => 'Go to Today';

  @override
  String get cmdGoClients => 'Go to Clients';

  @override
  String get cmdGoPipeline => 'Go to Pipeline';

  @override
  String get cmdGoTasks => 'Go to Tasks';

  @override
  String get cmdSectionCreate => 'Create';

  @override
  String get cmdNewClient => 'New client';

  @override
  String get cmdNewTask => 'New task';

  @override
  String get cmdSectionClients => 'Clients';

  @override
  String get cmdSectionContacts => 'Contacts';

  @override
  String get cmdSectionOpportunities => 'Opportunities';

  @override
  String get cmdSectionTasks => 'Tasks';

  @override
  String get cmdSectionNotes => 'Notes & activities';

  @override
  String get cmdNoResults => 'No results';

  @override
  String get pipelineSettingsTitle => 'Pipeline stages';

  @override
  String get pipelineSettingsHint =>
      'Customize labels and order of open stages. Won and Lost stay at the end.';

  @override
  String get pipelineMoveUp => 'Move up';

  @override
  String get pipelineMoveDown => 'Move down';

  @override
  String pipelineStepLabel(int index) {
    return 'Step $index';
  }

  @override
  String get pipelineNewStage => 'New stage';

  @override
  String get pipelineAddStage => 'Add a stage';

  @override
  String get pipelineWon => 'Won';

  @override
  String get pipelineLost => 'Lost';

  @override
  String get pipelineReset => 'Reset';

  @override
  String get oppNotFound => 'Opportunity not found.';

  @override
  String get oppHistoryTitle => 'HISTORY';

  @override
  String get oppEmptyTimeline =>
      'Nothing yet — notes, calls, tasks and quotes/invoices related to this deal will appear here.';

  @override
  String get oppTaskLabel => 'Task';

  @override
  String oppTaskDue(String date) {
    return 'Task · due $date';
  }

  @override
  String get oppTaskMarkDone => 'Mark done';

  @override
  String get oppWon => 'Won';

  @override
  String get oppLost => 'Lost';

  @override
  String oppProbability(int value) {
    return 'Probability: $value%';
  }

  @override
  String oppClosePlanned(String date) {
    return 'Expected close: $date';
  }

  @override
  String get eiProductsTitle => 'Products';

  @override
  String get eiProductsSubtitle => 'EastmarkHK e-Invoicing catalog';

  @override
  String get eiNewProduct => 'New product';

  @override
  String get eiProductSearch => 'Search a product…';

  @override
  String get eiNoProducts => 'No products yet.';

  @override
  String eiSaveFailed(String error) {
    return 'Save failed: $error';
  }

  @override
  String get eiDeleteProductTitle => 'Delete this product?';

  @override
  String eiDeleteFailed(String error) {
    return 'Delete failed: $error';
  }

  @override
  String get eiInfoSection => 'Information';

  @override
  String get eiPriceSection => 'Price and tax';

  @override
  String get eiSellPrice => 'Sale price (incl. tax)';

  @override
  String get eiNfeSection => 'Brazil NF-e tax classification';

  @override
  String get eiPhotosSection => 'Photos';

  @override
  String get eiCustomerTitle => 'e-Invoicing client';

  @override
  String get eiUseExisting => 'Use existing';

  @override
  String get eiOptional => 'Optional';

  @override
  String get eiImagesLabel => 'Images';

  @override
  String get eiTakePhoto => 'Take a photo';

  @override
  String get eiChooseLibrary => 'Choose from library';

  @override
  String get eiBrowseFiles => 'Browse files';

  @override
  String get eiPhotoSaveFailed => 'Unable to save the photo.';

  @override
  String get eiProductLabel => 'Product';

  @override
  String get eiRemoteTitle => 'Connect to e-Invoicing (remote mode)';

  @override
  String get eiRemoteUrl => 'Base URL';

  @override
  String get eiRemoteLogin => 'Login';

  @override
  String get invModuleTitle => 'e-Invoicing';

  @override
  String get queueDeleteTitle => 'Delete this reminder?';

  @override
  String get queueEmpty => 'No reminders';

  @override
  String get tasksListDeleteTitle => 'Delete this task?';

  @override
  String get tasksListTitle => 'Tasks';

  @override
  String tasksListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open',
      one: '1 open',
    );
    return '$_temp0';
  }

  @override
  String get clientsListTitle => 'Clients';

  @override
  String clientsListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count companies',
      one: '1 company',
    );
    return '$_temp0';
  }

  @override
  String get colWiden => 'Widen';

  @override
  String get colNarrow => 'Narrow';

  @override
  String get bannerTaskLabel => 'Task';

  @override
  String get activityInfoAdded => 'Info added to the file';

  @override
  String get activityFollowupCreated => 'Follow-up created';

  @override
  String get activityDuePlanned => 'Due date scheduled';

  @override
  String get activityFollowupUpdated => 'Follow-up updated';

  @override
  String get activityMarkedDone => 'Marked executed';

  @override
  String get activityApproved => 'Approved — confirmed done';

  @override
  String get activityPassed => 'Passed / info only';

  @override
  String get activityReopened => 'Reopened';

  @override
  String get tasksOpenTitle => 'Open tasks';

  @override
  String get tasksPlanButton => 'Schedule';

  @override
  String get tasksNoneOpenTitle => 'No open tasks';

  @override
  String get tasksNoneOpenSubtitle =>
      'Plan what needs to be done — today or later.';

  @override
  String get activityContactAdded => 'Contact added to the file';

  @override
  String get activityContactUpdated => 'Contact updated';

  @override
  String get activityPendingApproval => 'Awaiting approval';

  @override
  String settingsSyncOk(String message) {
    return 'OK — $message';
  }

  @override
  String settingsSyncError(String message) {
    return 'Error — $message';
  }

  @override
  String settingsSyncConnected(String message) {
    return 'Connection OK — $message';
  }

  @override
  String get settingsFtpPassword => 'FTP password';

  @override
  String get settingsTestConnection => 'Test connection';

  @override
  String get settingsNoModules =>
      'No module activated. Browse the store to try or activate EastmarkHK e-Invoicing.';

  @override
  String settingsTrialRemaining(int days) {
    return 'Trial — $days days left';
  }

  @override
  String get settingsActiveInCrm => 'Active — Use in CRM';

  @override
  String get settingsEinvoiceDisplay => 'e-Invoicing — display';

  @override
  String get settingsEinvoiceDisplaySubtitle =>
      'Quotes and invoices also created outside CRM: choose what appears here.';

  @override
  String get settingsLinkedToCrm => 'Linked to CRM';

  @override
  String get settingsAllEinvoicing => 'All e-Invoicing';

  @override
  String get settingsCrmOnlyDesc =>
      'Shows only documents from CRM-linked clients (recommended).';

  @override
  String get settingsAllDocsDesc =>
      'Also shows documents created only in the e-Invoicing app.';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsBuild => 'Build';

  @override
  String get settingsPrivacyReport => 'Privacy Report';

  @override
  String get settingsPrivacyReportSubtitle => 'EastmarkHK CRM — privacy report';

  @override
  String get companyColumnNotes => 'Notes';

  @override
  String get companyWithoutName => '(No name)';

  @override
  String get clientsSearchHint => 'Search for a client…';

  @override
  String get clientsNewButton => 'New';

  @override
  String get clientsEmptyTitle => 'No clients yet';

  @override
  String get clientsEmptySubtitle =>
      'First create the client (prospect or company) to track a deal.';

  @override
  String get clientsEmptyCreateButton => 'Create a client';

  @override
  String get clientsNoCountry => 'Country not provided';

  @override
  String get clientsPanelSearch => 'Name, notes…';

  @override
  String get clientsPanelNew => '+ New';

  @override
  String get clientNameRequired => 'The company name is required.';

  @override
  String get clientEditNewTitle => 'New client';

  @override
  String get clientEditModifyTitle => 'Edit client';

  @override
  String get companyNameLabel => 'Company';

  @override
  String get companyNameRequiredLabel => 'Company name *';

  @override
  String get formRequired => 'Required';

  @override
  String get clientContactPerson => 'Contact person';

  @override
  String get clientEinvoicingSection => 'E-invoicing';

  @override
  String get clientEinvoicingPeppol => 'Receive via e-invoice / Peppol';

  @override
  String get clientEinvoicingPeppolHint =>
      'If disabled, invoices remain email/PDF for this client.';

  @override
  String get clientPeppolIdLabel => 'Peppol ID';

  @override
  String get clientPeppolVerify => 'Peppol check — via the e-Invoicing module.';

  @override
  String get peppolVerify => 'Check Peppol registration';

  @override
  String get nfeTitle => 'Electronic invoice (NF-e)';

  @override
  String get clientNfeHint =>
      'Brazil — no Peppol. Documents follow the NF-e / CNPJ regime.';

  @override
  String get clientNotesSection => 'Notes';

  @override
  String get clientNotesHint => 'Free notes about this client…';

  @override
  String get clientEditSaveShortcut => 'Save (⌘S)';

  @override
  String get contactNameRequired => 'Enter at least a first or last name.';

  @override
  String get contactNewTitle => 'New contact';

  @override
  String get contactEditTitle => 'Edit contact';

  @override
  String get contactIdentitySection => 'Identity';

  @override
  String get contactFirstName => 'First name';

  @override
  String get contactLastName => 'Last name';

  @override
  String get contactRoleLabel => 'Role in the company';

  @override
  String get contactRoleHint => 'Buyer, CEO, Accounting…';

  @override
  String get contactPrimary => 'Primary contact';

  @override
  String get contactPrimaryHint => 'Shown first on the client profile';

  @override
  String get contactDetailsSection => 'Contact details';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Phone';

  @override
  String contactPhoneFormat(String country) {
    return 'Format for $country';
  }

  @override
  String get contactNotesSection => 'Notes';

  @override
  String get contactSaveShortcut => 'Save (⌘S)';

  @override
  String get oppEditTitle => 'Edit opportunity';

  @override
  String get oppStageLabel => 'Stage';

  @override
  String get oppClosePlannedLabel => 'Expected close';

  @override
  String get oppNotSet => 'Not set';

  @override
  String get oppFollowupScheduled => 'Follow-up scheduled';

  @override
  String get oppFollowupReminder => 'Follow-up reminder';

  @override
  String get oppFollowupOptional => 'Optional — schedule a client follow-up';

  @override
  String get oppRemoveFollowup => 'Remove follow-up';

  @override
  String get oppSchedule => 'Schedule';

  @override
  String get oppDetailsHint =>
      'Details (product, Incoterms, payment terms, table…)';

  @override
  String get oppStageChanged => 'Stage changed';

  @override
  String get oppCreated => 'Opportunity created';

  @override
  String get oppWonTitle => 'Opportunity won';

  @override
  String get oppCreateQuotePrompt =>
      'Create a pre-filled quote for this client?';

  @override
  String get oppLater => 'Later';

  @override
  String get oppCreateQuoteButton => 'Create the quote';

  @override
  String get oppQuoteButton => 'Quote';

  @override
  String get oppInvoiceButton => 'Invoice';

  @override
  String get stageContacted => 'Contacted';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get aiGenerating => 'Generating…';

  @override
  String get aiGenerateButton => 'Generate';

  @override
  String get aiUnavailable =>
      'AI Assistant unavailable — requires Apple Intelligence (macOS 26+, Apple Silicon). Manual entry possible.';

  @override
  String get aiPromptHint =>
      'Describe the client need in natural language — Apple’s on-device AI prepares the title, notes, amount and probability. Nothing is saved without your validation.';

  @override
  String get aiPromptExample =>
      'E.g.: “20,000 RFID tags for Acme, FOB Shenzhen price, delivery before November, client already visited the trade show”';

  @override
  String get taskNotesTitle => 'Notes';

  @override
  String get taskEditorNotesTitle => 'Notes';

  @override
  String get taskTileToApprove => 'To approve';

  @override
  String get taskTileInfo => 'Info';

  @override
  String reachCallWithSource(String source) {
    return 'Call · $source';
  }

  @override
  String taskEmailClientRef(String ref) {
    return 'Open email client (ref. $ref)';
  }

  @override
  String get reachNoPhone => 'No number on this client — add it to the file.';

  @override
  String get reachNoEmail => 'No email on this client — add it to the file.';

  @override
  String get reachCallLaunched => 'Call launched';

  @override
  String get reachEmailLabel => 'email';

  @override
  String reachEmailOpened(String ref) {
    return 'Email opened · $ref';
  }

  @override
  String get queueGroupOverdue => 'Overdue';

  @override
  String get queueGroupToday => 'Today';

  @override
  String get queueGroupTomorrow => 'Tomorrow';

  @override
  String get queueGroupWeek => 'This week';

  @override
  String get queueGroupLater => 'Later';

  @override
  String queueDeleteBody(String title) {
    return '“$title”';
  }

  @override
  String get queueNothingScheduled => 'Nothing scheduled';

  @override
  String queueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count follow-ups',
      one: '1 follow-up',
    );
    return '$_temp0';
  }

  @override
  String get queuePersonal => 'Personal';

  @override
  String get queueEmptySubtitle =>
      'Add clients and opportunities — reminders will appear here.';

  @override
  String queueRemoveBody(String title) {
    return '“$title” will be removed from your queue.';
  }

  @override
  String get linkClientTitle => 'Link to a client';

  @override
  String get linkClientButton => 'Link to a client';

  @override
  String get linkClientLabel => 'Client';

  @override
  String get actionNotFound => 'Follow-up not found';

  @override
  String get actionMessage => 'Message';

  @override
  String get actionContact => 'Contact';

  @override
  String get contactedReschedule => 'Contacted — reschedule';

  @override
  String get actionNotLinked => 'Not linked';

  @override
  String get viewFullProfile => 'View full profile';

  @override
  String get actionNoContact => 'No contact — add one from the client profile.';

  @override
  String get actionEmailLabel => 'email';

  @override
  String get commonPhone => 'phone';

  @override
  String get boardNoOpenOpps => 'No open opportunities';

  @override
  String boardOpenCount(int count) {
    return '$count open';
  }

  @override
  String get colWidthLabel => 'Width of this column';

  @override
  String tasksListDeleteBody(String title) {
    return '“$title”';
  }

  @override
  String tasksListOpenCount(int count) {
    return '$count open';
  }

  @override
  String get tasksListNew => '+ Task';

  @override
  String get tasksListEmpty => 'No tasks';

  @override
  String get tasksListNoClient => 'Without a client';

  @override
  String get listFilterHint => 'Filter…';

  @override
  String get cmdNoName => '(no name)';

  @override
  String shellSyncError(String error) {
    return 'Sync: $error';
  }

  @override
  String get shellOk => 'OK';

  @override
  String get shellSyncNeedsPassword =>
      'Base de dados partilhada: introduza a palavra-passe de sincronização em Definições para reconectar este dispositivo.';

  @override
  String get shellSearch => 'Search';

  @override
  String get shellDashboard => 'Dashboard';

  @override
  String get loginPasskeyNotConfigured =>
      'Passkey not configured — sign in once with the password.';

  @override
  String get loginPasskeyRefused =>
      'Passkey / biometrics refused — use the password or reset it.';

  @override
  String get loginNoAccount => 'No account on this device.';

  @override
  String get loginAccountNotFound => 'Account not found.';

  @override
  String get loginResetDone =>
      'Password reset — sign in again with the new password.';

  @override
  String get loginForgotPassword => 'Forgot password — reset';

  @override
  String get dictationStop => 'Stop dictation';

  @override
  String get dictationStart => 'Dictate — long-press to change language';

  @override
  String get joditLoadFailed =>
      'The editor could not load. Retry, or check that the Jodit files are included in the app assets.';

  @override
  String get languagePickerTitle => 'App language';

  @override
  String get languageSearchHint => 'Search for a language…';

  @override
  String get dictationLanguageSearchHint => 'Search for a language…';

  @override
  String get dictationDesktopHint =>
      'On desktop, native dictation may be limited; the choice is remembered for mobile devices.';

  @override
  String get currencyPickerTitle => 'Currency';

  @override
  String get addressDistrict => 'District';

  @override
  String get addressPhone => 'Phone';

  @override
  String get addressEmail => 'Email';

  @override
  String eiPriceHt(String amount) {
    return '$amount ex. tax';
  }

  @override
  String eiRefAlreadyUsed(String ref) {
    return 'The reference “$ref” is already used by another product.';
  }

  @override
  String get eiEditProductTitle => 'Edit product';

  @override
  String eiTaxRate(String rate) {
    return '$rate %';
  }

  @override
  String get eiRefLabel => 'Reference';

  @override
  String get eiRefHint => 'Leave empty to generate automatically (unique)';

  @override
  String get eiNameLabel => 'Name';

  @override
  String get eiNameRequired => 'Enter a product name.';

  @override
  String get eiDescriptionLabel => 'Description';

  @override
  String get eiPriceExclTax => 'Sale price (excl. tax)';

  @override
  String get eiTaxNote => 'Tax note (e.g. ICMS per state)';

  @override
  String get eiHsInfo =>
      'The HS/NCM code is informational (customs). The product rate is the item reference (VAT, ICMS…). Quotes/invoices keep a single document-level rate for totals.';

  @override
  String get eiCfop => 'CFOP';

  @override
  String get eiCfopHint => 'e.g. 5102 / 6102';

  @override
  String get eiIcmsCst => 'ICMS CST/CSOSN';

  @override
  String get eiIcmsCstHint => 'e.g. 40, 60, 102';

  @override
  String get eiPisCofins => 'PIS/COFINS CST';

  @override
  String get eiPisCofinsHint => 'e.g. 07, 08, 99';

  @override
  String get eiNfeOverrideHint =>
      'Optional — overrides the company’s default NF-e values (Settings) for this item only. Leave empty to use defaults. Validate with your accountant before using in production.';

  @override
  String get eiNotesSection => 'Notes';

  @override
  String get eiSaveShortcut => 'Save (⌘S)';

  @override
  String get eiRemoteBody =>
      'e-Invoicing is set to remote storage. Enter here the same credentials as in e-Invoicing → Settings → Remote storage, so the CRM can create quotes/invoices via the same API.';

  @override
  String get eiRemoteIndexHint =>
      'On the new hosting, the /index.php path is required (no rewrite to /einvoicing/…).';

  @override
  String get eiRemoteSuccess => 'Connection successful.';

  @override
  String eiRemoteFail(String error) {
    return 'Failure: $error';
  }

  @override
  String get eiRemoteTesting => 'Testing…';

  @override
  String get invModuleDisplayName => 'EastmarkHK e-Invoicing';

  @override
  String get invModuleDescription =>
      'Quotes and invoices created from your CRM clients and opportunities, managed by the EastmarkHK e-Invoicing app (included — App Store). Receipts, follow-ups and sending are handled in the e-Invoicing app.';

  @override
  String get invModulePrice => '€5.99/month';

  @override
  String get invInvoiceCreated => 'Invoice created';

  @override
  String get invQuoteCreated => 'Quote created';

  @override
  String get invModuleAppNotFound =>
      'e-Invoicing app not found — install it from the App Store, launch it once, then retry.';

  @override
  String eiCustomerCheckFailed(String error) {
    return 'Client check failed: $error';
  }

  @override
  String get quoteCreatedFromEinvoice => 'Created from e-Invoicing';

  @override
  String quoteCreatedSnackbar(String type, String number) {
    return '$type $number created in e-Invoicing';
  }

  @override
  String quoteCreateFailed(String error) {
    return 'Creation failed: $error';
  }

  @override
  String get syncServerOk => 'server reachable, credentials accepted';

  @override
  String get syncInvalidResponse => 'Invalid server response';

  @override
  String get syncCancelled => 'Sync cancelled';

  @override
  String get syncInProgress => 'Sync already in progress';

  @override
  String get syncUpToDate => 'Up to date';

  @override
  String syncReceived(int count) {
    return '$count item(s) received';
  }

  @override
  String get syncSentNothingNew => 'Sent (nothing new)';

  @override
  String syncSent(int count) {
    return '$count item(s) sent';
  }

  @override
  String syncSentPart(int count) {
    return '$count sent';
  }

  @override
  String syncReceivedPart(int count) {
    return '$count received';
  }

  @override
  String get syncPullFailed => 'Pull failed';

  @override
  String get syncPushFailed => 'Push failed';

  @override
  String get sync401 =>
      '401 — credentials rejected (wrong account or password)';

  @override
  String syncServerStatus(int code) {
    return 'The server responded $code';
  }

  @override
  String get syncTimeout => 'The server is not responding (timeout)';

  @override
  String syncConnectError(String error) {
    return 'Connection failed: $error';
  }

  @override
  String get taskKindAction => 'To do';

  @override
  String get taskKindInfo => 'Info';

  @override
  String get taskActionMessage => 'Chat message';

  @override
  String get taskActionCall => 'Call';

  @override
  String get taskActionEmail => 'Email';

  @override
  String get taskActionMeeting => 'Meeting';

  @override
  String get taskActionOther => 'Other';

  @override
  String get taskStatusOpen => 'Open';

  @override
  String get taskStatusToApprove => 'To approve';

  @override
  String get taskStatusApproved => 'Approved';

  @override
  String get taskStatusPassed => 'Passed';

  @override
  String get phaseProspect => 'Prospect';

  @override
  String get phaseFirstContact => 'First contact';

  @override
  String get phaseContacted => 'Contacted';

  @override
  String get phaseQualification => 'Qualification';

  @override
  String get phaseQuote => 'Quote';

  @override
  String get phaseNegotiation => 'Negotiation';

  @override
  String get phaseClosing => 'Closing';

  @override
  String get phaseWon => 'Won';

  @override
  String get phaseLost => 'Lost';

  @override
  String get phaseAfterSales => 'Post-sale follow-up';

  @override
  String get clientStatusProspect => 'Prospect';

  @override
  String get clientStatusClient => 'Client';

  @override
  String get clientStatusInactive => 'Inactive';

  @override
  String get contactNoName => 'No name';

  @override
  String get contactRoleDirector => 'Director / CEO';

  @override
  String get contactRoleManager => 'Manager';

  @override
  String get contactRoleBuyer => 'Buyer';

  @override
  String get contactRoleSales => 'Sales';

  @override
  String get contactRoleAccounting => 'Accounting';

  @override
  String get contactRoleTechnical => 'Technical';

  @override
  String get contactRoleAssistant => 'Assistant';

  @override
  String get contactRoleDecisionMaker => 'Decision maker';

  @override
  String get contactRoleOther => 'Other';

  @override
  String get eiDocumentNotFound => 'Document not found in e-Invoicing.';

  @override
  String get invLicenseActiveSite => 'Active subscription — eastmarkhk.com';

  @override
  String get invLicenseActiveAppStore => 'Active subscription — App Store';

  @override
  String get invLicenseTrial => 'Free trial';

  @override
  String invOpenInvoicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open invoices',
      one: '1 open invoice',
    );
    return '$_temp0';
  }

  @override
  String get lineQty => 'Qty';

  @override
  String get lineUnitPriceHt => 'Unit price ex. tax';

  @override
  String get lineUnitPriceVat => 'Unit price incl. tax';

  @override
  String get lineTotalVat => 'Total incl. tax';

  @override
  String get eiCreateClient => 'Create the client';

  @override
  String get eiCreateNew => 'Create a new one';

  @override
  String get eiContinue => 'Continue';

  @override
  String eiClientCrm(String name) {
    return 'CRM client: $name';
  }

  @override
  String get eiNoTaxCountry =>
      'This country does not use tax IDs on documents (e.g. Hong Kong). Linking is done by email, phone, name, or a remembered link after the first association.';

  @override
  String eiTaxIdMissing(String taxId) {
    return '$taxId missing on the CRM record. Recommended for e-invoicing and to avoid duplicates. Enter it below or continue without.';
  }

  @override
  String eiSameTaxIdDifferentName(
    String taxId,
    String vatNumber,
    String eiName,
    String crmName,
  ) {
    return 'Same $taxId ($vatNumber) found in e-Invoicing, but the name differs:\n• e-Invoicing: $eiName\n• CRM: $crmName\n\nUse the existing client, or create a new one?';
  }

  @override
  String eiNameOnlyMatch(String name) {
    return 'Name-only match (“$name”). Without a common tax ID / email / phone, confirm “Use existing” or create a new client (the link will be remembered next time).';
  }

  @override
  String get eiNoMatchNew =>
      'No matching client in e-Invoicing. A new client will be created from the CRM record.';

  @override
  String get eiNoMatchNewGeneric =>
      'No matching client (email / phone / name). A new client will be created in e-Invoicing and the link will be remembered on this CRM record.';

  @override
  String eiClientFound(String name, String detail) {
    return 'Client found in e-Invoicing: $name$detail.';
  }

  @override
  String eiHitEmail(String email) {
    return ' — email $email';
  }

  @override
  String eiHitPhone(String phone) {
    return ' — phone $phone';
  }

  @override
  String get eiHitName => ' — name';

  @override
  String get eiHitLinked => ' — already linked';

  @override
  String get dictationLanguageTitle => 'Dictation language';

  @override
  String get eiAddPhoto => 'Add a photo';

  @override
  String openExternalError(String label) {
    return 'Unable to open$label.';
  }

  @override
  String get syncPushFailedShort => 'Push failed';

  @override
  String get reachEmailSent => 'Email opened';

  @override
  String get countryPickerTitle => 'Choose a country';

  @override
  String get countryPickerSearchHint => 'Search for a country…';

  @override
  String alarmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reminders',
      one: 'Task reminder',
    );
    return '$_temp0';
  }

  @override
  String get alarmMarkDone => 'Mark done';

  @override
  String get alarmPostpone15 => '+15 min';

  @override
  String get alarmPostpone1h => '+1 h';

  @override
  String get alarmClose1min => 'Close — reminder in 1 min';

  @override
  String get richColorPickerTitle => 'Text color';

  @override
  String get eiHitEmailPlain => ' — email';

  @override
  String get eiHitPhonePlain => ' — phone';

  @override
  String get tasksEditTaskTitle => 'Edit task';

  @override
  String get activityTaskCreated => 'Tarefa criada';

  @override
  String get dictationOfflineTip =>
      'Ditado offline — capta frequentemente o ruído (TV) em vez da sua voz. Ative o «reconhecimento de voz online» em Definições do Windows → Privacidade → Voz, reduza o ruído e tente novamente.';

  @override
  String get dictationLanguageFallbackTip =>
      'Esta variante de idioma não está instalada no Windows — é usada uma variante próxima. Instale o pacote de voz em Definições → Hora e idioma → Voz.';

  @override
  String get dictationStarting => 'A iniciar o ditado…';

  @override
  String get invChooseLinePhotoTitle => 'Choose photo for the PDF';

  @override
  String get invChooseNewPhoto => 'Choose another file…';

  @override
  String get invNoPhoto => 'No photo';

  @override
  String get modulesBuyOnMicrosoftStore => 'Get on Microsoft Store';

  @override
  String get modulesMicrosoftStoreNote =>
      'Download EastmarkHK e-Invoicing from the Microsoft Store, then return here to enable it in the CRM.';

  @override
  String get invAcquireMicrosoftStoreBody =>
      'This module uses EastmarkHK e-Invoicing. Download it from the Microsoft Store, launch it once, then return here.';

  @override
  String get invViewOnMicrosoftStore => 'View on Microsoft Store';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Nome de usuário';

  @override
  String get commonDisplayNameLabel => 'Nome de exibição';

  @override
  String get commonPasswordLabel => 'Senha';

  @override
  String get commonConfirmPasswordLabel => 'Confirmar senha';

  @override
  String get commonPasswordMismatch => 'As senhas não coincidem';

  @override
  String get commonUsernameTaken => 'Este nome de usuário já está em uso';

  @override
  String get commonChoosePassword => 'Escolha uma senha';

  @override
  String get commonRequiredFields => 'Nome e usuário são obrigatórios';

  @override
  String get passwordFieldShow => 'Mostrar';

  @override
  String get passwordFieldHide => 'Ocultar';

  @override
  String loginWelcomeBack(String name) {
    return 'Bem-vindo de volta, $name';
  }

  @override
  String get loginTitle => 'Iniciar sessão';

  @override
  String get loginVerifying => 'A verificar…';

  @override
  String get loginUnlockTouchId => 'Desbloquear com Touch ID';

  @override
  String get loginOr => 'ou';

  @override
  String get loginRequiredFields => 'Usuário e senha obrigatórios';

  @override
  String get loginInvalidCredentials => 'Usuário ou senha incorretos';

  @override
  String get loginSubmit => 'Iniciar sessão';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Bem-vindo';

  @override
  String get bootstrapSubtitle =>
      'Crie a conta de administrador para proteger o seu CRM.';

  @override
  String get bootstrapSubmit => 'Criar conta de administrador';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonCreate => 'Criar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonNoName => '(sem nome)';

  @override
  String get commonNotesLabel => 'Notas';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Telefone';

  @override
  String get commonFirstNameLabel => 'Nome próprio';

  @override
  String get commonLastNameLabel => 'Apelido';

  @override
  String get commonCompanyNameLabel => 'Nome da empresa';

  @override
  String messagingCannotOpen(String target) {
    return 'Não é possível abrir $target.';
  }

  @override
  String get messagingEmailAppLabel => 'a aplicação de email';

  @override
  String get messagingPhoneAppLabel => 'a aplicação de telefone';

  @override
  String messagingIncompleteId(String label) {
    return 'Identificador incompleto para abrir $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Não é possível abrir $label — a aplicação está instalada?';
  }

  @override
  String get messagingWechatNote =>
      'O WeChat não expõe uma ligação pública a um contacto específico — a aplicação abre-se, mas terá de escolher a conversa manualmente.';

  @override
  String get messagingKakaotalkNote =>
      'O KakaoTalk não expõe uma ligação pública a um contacto específico — a aplicação abre-se, mas terá de escolher a conversa manualmente.';

  @override
  String get messagingPhoneCallLabel => 'Chamada telefónica';

  @override
  String get companyDeleteOpportunityConfirm => 'Excluir esta oportunidade?';

  @override
  String get companyDeleteContactConfirm => 'Excluir este contacto?';

  @override
  String get companyDeleteTaskConfirm => 'Excluir esta tarefa?';

  @override
  String get companyDeleteConfirmTitle => 'Excluir este cliente?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — os seus contactos, oportunidades, tarefas e histórico serão eliminados com ele.';
  }

  @override
  String get companyNewNoteTitle => 'Nova nota';

  @override
  String get companyNoteFieldLabel => 'Nota (ou dite-a)';

  @override
  String get companyTabOverview => 'Resumo';

  @override
  String get companyTabActivity => 'Atividade';

  @override
  String get companyTabTasks => 'Tarefas';

  @override
  String get companyTabDeals => 'Oportunidades';

  @override
  String get companyContactsTitle => 'Contactos';

  @override
  String get companyNoContacts => 'Sem contactos';

  @override
  String get companyNoActivity => 'Sem atividade — adicione uma nota.';

  @override
  String get companyNoTasks => 'Sem tarefas';

  @override
  String get companyNoDeals => 'Sem oportunidades';

  @override
  String get companyNoteButtonLabel => 'Nota';

  @override
  String get companyNewClientTitle => 'Novo cliente';

  @override
  String get companyEditClientTitle => 'Editar cliente';

  @override
  String get companyWebsiteLabel => 'Sítio web';

  @override
  String get companyPeppolLabel => 'Identificador Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Etiquetas (separadas por vírgulas)';

  @override
  String get companyNewContactTitle => 'Novo contacto';

  @override
  String get companyEditContactTitle => 'Editar contacto';

  @override
  String get companyAppLabel => 'Aplicação';

  @override
  String get companyIdentifierNumberLabel => 'Identificador / número';

  @override
  String get companyOpenTooltip => 'Abrir';

  @override
  String get companyRemoveTooltip => 'Remover';

  @override
  String get companyRoleFieldLabel => 'Função (ex. Comprador)';

  @override
  String get companyMessagingTitle => 'Mensagens';

  @override
  String get companyNoMessagingHint =>
      'Nenhum canal de mensagens adicionado — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Ainda sem informação de contacto.';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsSubtitle => 'Configuração única da aplicação.';

  @override
  String get settingsLanguagesTitle => 'Idiomas e moeda';

  @override
  String get settingsAppLanguageLabel => 'Idioma da aplicação';

  @override
  String get settingsDictationLanguageLabel => 'Idioma de ditado';

  @override
  String get settingsCurrencyLabel => 'Moeda';

  @override
  String get settingsFormatsHint =>
      'Valores apresentados como 1,234.56 (vírgula = milhares, ponto = decimais) e datas como dd/mm/aaaa, independentemente do idioma da interface.';

  @override
  String get settingsCompanyTitle => 'Empresa';

  @override
  String get settingsCompanySubtitle =>
      'Identidade da empresa que utiliza este CRM — reutilizada mais tarde no cabeçalho (marca branca) e nos cabeçalhos dos documentos PDF.';

  @override
  String get settingsSyncTitle => 'Sincronização';

  @override
  String get settingsSyncSubtitle =>
      'Por predefinição, todos os dados permanecem locais (SQLite) neste dispositivo.';

  @override
  String get settingsSyncLocalTitle => 'Autónomo (apenas local)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Nenhum dado enviado para fora deste dispositivo';

  @override
  String get settingsSyncRemoteTitle => 'Base de dados partilhada (remota)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Sincroniza com um servidor PHP + SQLite (ver server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Servidor';

  @override
  String get settingsAccountLabel => 'Conta';

  @override
  String get settingsSyncPasswordHint =>
      'Guardado no chaveiro seguro do dispositivo — nunca na base de dados.';

  @override
  String get settingsSyncNowButton => 'Sincronizar agora';

  @override
  String get settingsSyncPollHint =>
      'Extração automática a cada 25 s em segundo plano; envio imediato após cada alteração (modo remoto ativo). Sem extração durante a escrita.';

  @override
  String get settingsSyncMissingFields =>
      'Servidor, conta e senha obrigatórios';

  @override
  String get settingsModulesTitle => 'Módulos';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Scanner, Sync… — teste de 7 dias ou ativação de licença.';

  @override
  String get settingsBrowseModules => 'Explorar módulos';

  @override
  String get settingsImportExportTitle => 'Importar / exportar';

  @override
  String get settingsImportExportSubtitle =>
      'Clientes, contactos e oportunidades em CSV; contactos de vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Personalize as etapas e as respetivas etiquetas.';

  @override
  String get settingsConfigureStages => 'Configurar etapas';

  @override
  String get settingsBackupTitle => 'Cópia de segurança local';

  @override
  String get settingsBackupSubtitle =>
      'Exporta uma cópia da sua base de dados SQLite — útil antes de uma atualização ou para arquivo.';

  @override
  String get settingsExportDbButton => 'Exportar base de dados (.db)';

  @override
  String get settingsBackupShareText => 'Cópia de segurança EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get settingsUsersTitle => 'Usuárioes';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Contas, funções e senhas — administrador e usuário.';

  @override
  String get settingsUsersSubtitleLocked => 'Apenas administradores.';

  @override
  String get settingsManageUsersButton => 'Gerir usuárioes';

  @override
  String get settingsUsersLockedHint =>
      'Inicie sessão com uma conta de administrador para ver ou editar usuárioes e as respetivas senhas.';

  @override
  String get settingsSaveKeychainError =>
      'Definições guardadas, mas o chaveiro seguro não está disponível — a senha de sincronização não pôde ser guardada (reinicie a app após uma recompilação completa).';

  @override
  String get settingsSaved => 'Definições guardadas';

  @override
  String get settingsLogoutConfirmTitle => 'Terminar sessão?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Terá de introduzir a sua senha (ou Touch ID) para voltar.';

  @override
  String get settingsLogoutButton => 'Terminar sessão';

  @override
  String get settingsLogoTitle => 'Logótipo da empresa';

  @override
  String get settingsLogoSubtitle =>
      'Apresentado no topo da aplicação e na faixa.';

  @override
  String get settingsLogoEmpty => 'Sem logótipo — adicione o da sua empresa';

  @override
  String get settingsLogoChoose => 'Escolher uma imagem';

  @override
  String get settingsLogoChange => 'Alterar logótipo';

  @override
  String get usersDeleteSelfError => 'Não pode eliminar a sua própria conta';

  @override
  String get usersDeleteConfirmTitle => 'Excluir este usuário?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) perderá o acesso ao CRM.';
  }

  @override
  String get usersTitle => 'Usuárioes';

  @override
  String get usersSubtitle => 'Contas, funções e senhas.';

  @override
  String get usersAddButton => 'Usuário';

  @override
  String get usersEmptyTitle => 'Sem usuárioes';

  @override
  String get usersEmptySubtitle =>
      'Crie a primeira conta — será administrador.';

  @override
  String get usersEmptyAction => 'Novo usuário';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (você)';
  }

  @override
  String get usersNewTitle => 'Novo usuário';

  @override
  String get usersEditTitle => 'Editar usuário';

  @override
  String get usersLoginIdLabel => 'ID de acesso';

  @override
  String get usersRoleLabel => 'Função';

  @override
  String get usersNewPasswordLabel =>
      'Nova senha (deixe em branco para não alterar)';

  @override
  String get usersTouchIdTitle => 'Touch ID neste dispositivo';

  @override
  String get usersTouchIdSubtitle =>
      'Desbloquear sem voltar a escrever a senha, apenas neste dispositivo.';

  @override
  String get roleAdministrator => 'Administrador';

  @override
  String get roleUser => 'Usuário';

  @override
  String get dashboardTitleEmbedded => 'Painel';

  @override
  String get dashboardTitle => 'Hoje';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ações a tratar',
      one: '$countString ação a tratar',
    );
    return '$_temp0';
  }

  @override
  String dashboardMoreAgendaItems(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$countString mais — ver tudo',
      one: '+$countString mais — ver tudo',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Todos os comerciais';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (eu)';
  }

  @override
  String get dashboardEmptyTitle => 'O seu CRM está pronto';

  @override
  String get dashboardEmptySubtitle =>
      'Adicione o seu primeiro cliente, importe um arquivo CSV ou explore os próximos módulos.';

  @override
  String get dashboardNothingScheduled =>
      'Nada agendado — os seus seguimentos aparecerão aqui.';

  @override
  String get dashboardBucketOverdue => 'Em atraso';

  @override
  String get dashboardBucketToday => 'Hoje';

  @override
  String get dashboardBucketWeek => 'Esta semana';

  @override
  String get dashboardBucketLater => 'Mais tarde';

  @override
  String get dashboardContactedButton => 'Contactado';

  @override
  String get dashboardDoneButton => 'Concluído';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Melhores clientes (pipeline aberto)';

  @override
  String get dashboardPipelineByStage => 'Pipeline por etapa';

  @override
  String get dashboardNoOpportunitiesYet => 'Ainda sem oportunidades';

  @override
  String get dashboardWonLostByMonth => 'Ganhos / Perdidos por mês';

  @override
  String get dashboardNoClosuresYet => 'Ainda sem fechos registados.';

  @override
  String get dashboardRecentActivity => 'Atividade recente';

  @override
  String get dashboardNoActivityYet => 'Sem atividade por agora.';

  @override
  String get metricClients => 'Clientes';

  @override
  String get metricOpportunities => 'Oportunidades';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Previsão';

  @override
  String get metricTasks => 'Tarefas';

  @override
  String get metricOverdue => 'Em atraso';

  @override
  String get productTagline => 'Poupe tempo desde o primeiro dia.';

  @override
  String get placeholderDashboardHint =>
      'Resumo: pipeline, seguimentos e atividade recente.';

  @override
  String get placeholderTodayTitle => 'O seu dia';

  @override
  String get placeholderTodayHint =>
      'Escolha um seguimento à esquerda.\nO cliente abre-se aqui — sem mudar de ecrã.';

  @override
  String get placeholderClientsTitle => 'Ficha do cliente';

  @override
  String get placeholderClientsHint =>
      'Selecione um cliente da lista,\nou crie um com o botão +.';

  @override
  String get placeholderPipelineHint =>
      'Arraste um cartão entre colunas.\nClique para abrir a ficha do cliente.';

  @override
  String get placeholderTasksHint =>
      'Selecione uma tarefa para ver o cliente relacionado.';

  @override
  String get modulesSubtitleAppStore =>
      'Assine através da App Store ou ative uma assinatura já comprada em eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Avaliação gratuita, compra em eastmarkhk.com — a mesma assinatura do aplicativo EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Ativo — App Store';

  @override
  String get modulesStatusActiveWeb => 'Ativo — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Avaliação — $countString dias restantes',
      one: 'Avaliação — $countString dia restante',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Ativo';

  @override
  String get modulesStatusAvailable => 'Disponível';

  @override
  String get modulesBuyFailed =>
      'Não foi possível iniciar a compra. Tente novamente ou restaure suas compras.';

  @override
  String get modulesRestoreDone => 'Restauração concluída.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name ativado no aplicativo instalado.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licença não encontrada automaticamente. Abra EastmarkHK e-Invoicing → Configurações, copie seu código de ativação e escolha \'Ativar um código da web\'.';

  @override
  String get modulesRenewalNote =>
      'Renovação automática via App Store. Gerencie a assinatura em Configurações → Apple ID → Assinaturas.';

  @override
  String get modulesWebStoreNote =>
      'Ou assine em eastmarkhk.com e ative com o código recebido por e-mail.';

  @override
  String get modulesHaveEinvoicing => 'Já tenho EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Experimentar 7 dias';

  @override
  String get modulesSubscribe => 'Assinar';

  @override
  String get modulesRestore => 'Restaurar compras';

  @override
  String get modulesWebSubscription => 'Assinatura eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Ativar um código da web';

  @override
  String get modulesUseInCrm => 'Usar no CRM';

  @override
  String get modulesDontUseInCrm => 'Não usar no CRM';

  @override
  String get modulesBuyOnAppStore => 'Comprar na App Store';

  @override
  String get modulesStoreUnavailable =>
      'A App Store não está disponível nesta versão. Use uma versão da App Store, ou ative uma assinatura eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Verificando compras da App Store e eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Verificando compras da App Store…';

  @override
  String get modulesPerMonth => '/ mês';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Assinou em eastmarkhk.com? Cole o código recebido por e-mail. No iPhone/iPad, a compra inicial é feita pela App Store ou pelo site antes da ativação.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Assine em eastmarkhk.com e cole o código de ativação vinculado a este dispositivo.';

  @override
  String get modulesMachineId => 'ID da máquina';

  @override
  String get modulesCopy => 'Copiar';

  @override
  String get modulesSubscriptionEmailLabel => 'E-mail da assinatura';

  @override
  String get modulesActivationCodeLabel => 'Código de ativação';

  @override
  String get modulesActivationCodeHint =>
      'Cole o código recebido após a compra';

  @override
  String get modulesActivate => 'Ativar';

  @override
  String get modulesBuyOnWebsite => 'Comprar em eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Solicitar um código por e-mail';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name ativado via eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID da máquina copiado';

  @override
  String get modulesEmailRequired => 'Digite seu e-mail de assinatura';

  @override
  String get invNewQuote => 'New quote';

  @override
  String get invNewInvoice => 'New invoice';

  @override
  String get invSectionQuote => 'Quote';

  @override
  String get invSectionInvoice => 'Invoice';

  @override
  String get invFieldClient => 'Client';

  @override
  String get invPickClientTitle => 'Escolher um cliente';

  @override
  String get invPickClientSearch => 'Buscar por nome, CNPJ/CPF, país…';

  @override
  String get invPickClientEmpty => 'Nenhum cliente correspondente.';

  @override
  String get invPickClientButton => 'Escolher cliente';

  @override
  String get invClientRequired => 'Escolha um cliente antes de salvar.';

  @override
  String get invFieldDate => 'Date';

  @override
  String get invFieldDueDate => 'Due date';

  @override
  String get invFieldValidUntil => 'Valid until';

  @override
  String get invFieldStatus => 'Status';

  @override
  String get invFieldVatPercent => 'VAT %';

  @override
  String get invStatusDraft => 'Draft';

  @override
  String get invStatusSent => 'Sent';

  @override
  String get invStatusAccepted => 'Accepted';

  @override
  String get invStatusRejected => 'Rejected';

  @override
  String get invStatusInvoiced => 'Invoiced';

  @override
  String get invStatusPartial => 'Partial';

  @override
  String get invStatusPaid => 'Paid';

  @override
  String get invStatusOverdue => 'Overdue';

  @override
  String get invStatusCancelled => 'Cancelled';

  @override
  String get invLinesTitle => 'Lines';

  @override
  String get invNotesTitle => 'Notes';

  @override
  String get invCreate => 'Create';

  @override
  String get invCreating => 'Creating…';

  @override
  String get invSave => 'Salvar';

  @override
  String get invSaving => 'Salvando…';

  @override
  String invEditQuote(String number) {
    return 'Editar orçamento $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Editar fatura $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number salvo.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Não foi possível salvar: $error';
  }

  @override
  String get invEditDocument => 'Editar';

  @override
  String get invAddFromCatalog => 'Add from catalog';

  @override
  String get invAddFreeLine => 'Add a line';

  @override
  String get invEmptyLines =>
      'No lines — add a catalog product or a free line.';

  @override
  String get invUpdateProductTooltip => 'Update product';

  @override
  String get invAddToCatalogTooltip => 'Add to catalog';

  @override
  String get invDeleteLineTooltip => 'Delete line';

  @override
  String get invChangePhotoTooltip => 'Change photo';

  @override
  String get invAddPhotoTooltip => 'Add a photo';

  @override
  String get invProductUpdated => 'Product updated (price and photos).';

  @override
  String get invProductSaved => 'Line saved to the catalog (with photos).';

  @override
  String get invClientLinkedHint =>
      'The CRM client is already linked: the document will be created in e-Invoicing for the same client.';

  @override
  String get invFooterHint =>
      'The document is created in EastmarkHK e-Invoicing — layout, PDF, sending and follow-up are done in the e-Invoicing app.';

  @override
  String get invNeedLines => 'Add at least one line with a description.';

  @override
  String get invSubtotalHt => 'Subtotal excl. tax';

  @override
  String get invVat => 'VAT';

  @override
  String get invTotalTtc => 'Total incl. tax';

  @override
  String get invCatalogTitle => 'Product catalog';

  @override
  String get invCatalogSearch => 'Search a product…';

  @override
  String get invCatalogEmpty => 'No products — create them in e-Invoicing.';

  @override
  String get invHomeSubtitle =>
      'Orçamentos e faturas — dados do EastmarkHK e-Invoicing (recibos e lembretes: aplicativo independente)';

  @override
  String get invOpenStandalone => 'Abrir e-Invoicing';

  @override
  String get invLaunchStandalone => 'Iniciar e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Conexão remota';

  @override
  String invTabQuotes(int count) {
    return 'Orçamentos ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Faturas ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Nenhum orçamento — crie um a partir de uma oportunidade ganha ou do botão acima.';

  @override
  String get invEmptyInvoices => 'Nenhuma fatura.';

  @override
  String get invEmptyCompanyDocs => 'Nenhum orçamento nem fatura.';

  @override
  String get invQuotesSection => 'ORÇAMENTOS';

  @override
  String get invInvoicesSection => 'FATURAS';

  @override
  String get invCompanyFooter =>
      'Os documentos são gerenciados pelo EastmarkHK e-Invoicing — envio, PDF, recibos e lembretes no aplicativo independente.';

  @override
  String get invRemoteNotConfigured =>
      'O e-Invoicing está em modo remoto — conexão não configurada.';

  @override
  String get invConfigure => 'Configurar';

  @override
  String get invAppNotDetected =>
      'Aplicativo e-Invoicing não detectado — instale/inicie o EastmarkHK e-Invoicing para criar orçamentos e faturas a partir deste registro.';

  @override
  String get invRemoteSetupBody =>
      'O EastmarkHK e-Invoicing está configurado para armazenamento remoto. Digite aqui as mesmas credenciais para conectar o CRM à mesma API — os mesmos valores que em e-Invoicing → Configurações → Armazenamento remoto.';

  @override
  String get invLaunchOnceBody =>
      'Inicie o EastmarkHK e-Invoicing uma vez para inicializar o banco de dados compartilhado e depois volte aqui.';

  @override
  String get invAcquireAppStoreBody =>
      'Este módulo usa o EastmarkHK e-Invoicing. Baixe e assine pela App Store, inicie-o uma vez e depois volte aqui.';

  @override
  String get invAcquireWebBody =>
      'Este módulo usa o EastmarkHK e-Invoicing. Baixe e assine em eastmarkhk.com, inicie-o uma vez e depois volte aqui.';

  @override
  String get invConfigureRemote => 'Configurar conexão remota';

  @override
  String get invViewOnAppStore => 'Ver na App Store';

  @override
  String get invViewOnWebsite => 'Ver em eastmarkhk.com';

  @override
  String get invRetry => 'Tentar novamente';

  @override
  String get invDocInvoice => 'Fatura';

  @override
  String get invDocQuote => 'Orçamento';

  @override
  String get invDocClient => 'Cliente';

  @override
  String get invDocStatus => 'Status';

  @override
  String get invDocDate => 'Data';

  @override
  String get invOpenInStandalone => 'Abrir no e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Não foi possível abrir o e-Invoicing — verifique se está instalado.';

  @override
  String get invCreateInvoiceFromQuote => 'Criar fatura';

  @override
  String get invCreatingInvoice => 'Criando fatura…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Fatura $number criada a partir do orçamento.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Este orçamento já foi faturado.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Não foi possível criar a fatura: $error';
  }

  @override
  String get invLinkMenu => 'Vínculo com e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Cliente e-Invoicing vinculado';

  @override
  String get invLinkStatusNone => 'Nenhum vínculo com e-Invoicing salvo';

  @override
  String get invUnlinkCustomer => 'Desvincular cliente do e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Desvincular o cliente?';

  @override
  String get invUnlinkConfirmBody =>
      'O próximo orçamento ou fatura pedirá novamente para escolher ou criar o cliente no e-Invoicing.';

  @override
  String get invUnlinkDone => 'Vínculo com e-Invoicing removido.';

  @override
  String get invAppStoreUrlMissing =>
      'O e-Invoicing ainda não está listado na App Store para esta versão. Use eastmarkhk.com ou inicie um aplicativo já instalado.';

  @override
  String get shellModuleTitle => 'Module';

  @override
  String get shellFollowupTitle => 'Follow-up';

  @override
  String get shellClientTitle => 'Client';

  @override
  String get shellModulesTooltip => 'Modules';

  @override
  String get shellAgendaLabel => 'Agenda';

  @override
  String get shellClientsLabel => 'Clients';

  @override
  String get shellTasksLabel => 'Follow-ups';

  @override
  String get shellNewFollowup => 'Follow-up';

  @override
  String get shellNewClient => 'Client';

  @override
  String get shellModulesLabel => 'Modules';

  @override
  String get shellSettingsLabel => 'Settings';

  @override
  String get tasksSelectPrompt => 'Select a task';

  @override
  String dashOverviewSubtitle(String month) {
    return 'Overview · $month';
  }

  @override
  String get dashOpenFollowups => 'Open follow-ups';

  @override
  String get dashOverdue => 'Overdue';

  @override
  String get dashToApprove => 'To approve';

  @override
  String get dashProspects => 'Prospects';

  @override
  String get dashActiveClients => 'Active clients';

  @override
  String get dashInactive => 'Inactive / lost';

  @override
  String get dashQuotes => 'Quotes';

  @override
  String get dashOpenInvoices => 'Open invoices';

  @override
  String get dashPaidInvoices => 'Paid invoices';

  @override
  String get dashRecentActions => 'Recent actions';

  @override
  String get dashNoRecentActions =>
      'No recent actions — follow-ups, calls, emails and documents will appear here.';

  @override
  String get dashRecentDone => 'Recently completed';

  @override
  String get dashNoClosed => 'No closed follow-ups yet.';

  @override
  String get dashModules => 'Modules';

  @override
  String get dashOpenCaHint =>
      'Open revenue: unpaid invoices (see e-Invoicing for details).';

  @override
  String get dashDoneBadge => 'Done';

  @override
  String get dashPassedBadge => 'Passed';

  @override
  String get clientEmptyTitle => 'Select a client';

  @override
  String get clientEmptySubtitle => 'Or create one to start tracking.';

  @override
  String get clientEinvoiceBadge => 'E-invoice / Peppol';

  @override
  String get clientNoContactsHint =>
      'Add at least one contact (with a role) for this company.';

  @override
  String get clientFollowupsTitle => 'Follow-up / tasks';

  @override
  String get clientPlanAction => 'Schedule';

  @override
  String get clientNoTasksHint =>
      'Plan the phases: first contact, follow-up, meeting…';

  @override
  String clientEinvoiceError(String error) {
    return 'E-invoicing unavailable: $error';
  }

  @override
  String get clientPrimaryBadge => 'Primary';

  @override
  String get tasksTitle => 'Tasks';

  @override
  String get tasksNewButton => 'New task';

  @override
  String tasksOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open',
      one: '1 open',
    );
    return '$_temp0';
  }

  @override
  String get tasksAllReps => 'All salespeople';

  @override
  String get tasksAllDoneTitle => 'All done!';

  @override
  String get tasksAllDoneSubtitle => 'Add a task — or dictate it after a call.';

  @override
  String get tasksClientLabel => 'Client';

  @override
  String get tasksClientOptional => 'Client (optional)';

  @override
  String get tasksClientRequired => 'Client *';

  @override
  String get tasksNoClient => 'Without a client (e.g. personal task)';

  @override
  String get tasksMessageHint =>
      'Message (e.g. Call the client, run an errand…)';

  @override
  String get tasksDueLabel => 'Due date';

  @override
  String get tasksNoDue => 'No due date';

  @override
  String dueLabelOverdue(int days, String date) {
    return 'Atrasado · $days d · $date';
  }

  @override
  String dueLabelToday(String date) {
    return 'Hoje · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return 'Amanhã · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · em $days d';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return 'Hoje · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return 'Amanhã · $date';
  }

  @override
  String dueGroupWeekWithDate(String date) {
    return 'Esta semana · $date';
  }

  @override
  String dueGroupWeekWithRange(String from, String to) {
    return 'Esta semana · $from → $to';
  }

  @override
  String dueGroupLaterWithDate(String date) {
    return 'Mais tarde · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return 'Mais tarde · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip =>
      'Sincronização não ativada — toque para configurar';

  @override
  String get bannerSyncInProgressTooltip => 'A sincronizar…';

  @override
  String get bannerSyncErrorTooltip =>
      'Erro de sync — toque para tentar de novo';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return 'Última sync: $date';
  }

  @override
  String get bannerSyncIdleTooltip => 'Sincronizar';

  @override
  String get bannerCompanyPlaceholder => 'A sua empresa';

  @override
  String get tasksDateButton => 'Date';

  @override
  String get tasksTimeButton => 'Time';

  @override
  String get tasksClearButton => 'Clear';

  @override
  String get tasksAssignedTo => 'Assigned to';

  @override
  String get tasksUnassigned => 'Unassigned';

  @override
  String get tasksNewTaskTitle => 'New task';

  @override
  String get pipelineNewOpportunity => 'New opportunity';

  @override
  String get pipelineTitleLabel => 'Title';

  @override
  String get pipelineAmountLabel => 'Amount';

  @override
  String get pipelineMoveTooltip => 'Move';

  @override
  String get pipelineTitle => 'Pipeline';

  @override
  String get pipelineNoOpen => 'No open opportunity';

  @override
  String pipelineOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open opportunities',
      one: '1 open opportunity',
    );
    return '$_temp0';
  }

  @override
  String get pipelineEmptyTitle => 'Your pipeline is empty';

  @override
  String get pipelineEmptySubtitle =>
      'Create an opportunity, then drag it from stage to stage.';

  @override
  String get pipelineBoardEmptyTitle => 'Empty pipeline';

  @override
  String get pipelineBoardEmptySubtitle =>
      'Create an opportunity, then drag it between stages.';

  @override
  String get pipelineDragHint => 'Drag to move';

  @override
  String pipelineCreatedOn(String date) {
    return 'Created on $date';
  }

  @override
  String pipelineStageSince(String date) {
    return 'Stage since $date';
  }

  @override
  String get agendaTitle => 'Agenda';

  @override
  String get agendaToday => 'Today';

  @override
  String get agendaUpcoming => 'Upcoming days';

  @override
  String get agendaEmptyToday => 'Nothing scheduled today. Plan a follow-up.';

  @override
  String get agendaEmptyUpcoming => 'No tasks scheduled soon.';

  @override
  String agendaPendingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tasks awaiting approval',
      one: '1 task awaiting approval',
    );
    return '$_temp0';
  }

  @override
  String get taskEditTooltip => 'Edit';

  @override
  String get taskCloseTooltip => 'Close';

  @override
  String get taskClientSubtitle => 'Client';

  @override
  String get taskDueSubtitle => 'Due date';

  @override
  String get taskValidationTitle => 'Validation';

  @override
  String get taskInfoHint =>
      'This entry is informational. Mark it as passed once acknowledged.';

  @override
  String get taskActionHint =>
      'Mark as executed, then approve to confirm it’s done.';

  @override
  String get taskHistoryTitle => 'History';

  @override
  String get taskNoHistory =>
      'No events yet. Quotes, invoices and status changes will appear here.';

  @override
  String get taskDoneByUs => 'Executed by us';

  @override
  String get taskInfoOnly => 'Info only — passed';

  @override
  String get taskApprove => 'Approve — confirmed done';

  @override
  String get taskReopen => 'Reopen';

  @override
  String get taskReopenTask => 'Reopen task';

  @override
  String get taskDeleteTitle => 'Delete this task?';

  @override
  String get taskViewDocument => 'View document';

  @override
  String taskInvoiceTitle(String number) {
    return 'Invoice $number';
  }

  @override
  String taskQuoteTitle(String number) {
    return 'Quote $number';
  }

  @override
  String logContactedTitle(String title) {
    return 'Contacted — $title';
  }

  @override
  String get logTypeLabel => 'Contact type';

  @override
  String get logNoteLabel => 'Note (optional, or dictate it)';

  @override
  String get logNextFollowup => 'Next follow-up';

  @override
  String get logCustom => 'Custom';

  @override
  String logReplacesHint(String date) {
    return 'Replaces the follow-up already scheduled on $date.';
  }

  @override
  String get logTomorrow => 'Tomorrow';

  @override
  String get log3Days => '3 days';

  @override
  String get log1Week => '1 week';

  @override
  String get log2Weeks => '2 weeks';

  @override
  String get logTypeField => 'Type';

  @override
  String get logContentLabel => 'Content';

  @override
  String get logDeleteTitle => 'Delete this entry?';

  @override
  String get logDeleteBody => 'This action is permanent.';

  @override
  String logRelanceTitle(String title) {
    return 'Follow up: $title';
  }

  @override
  String get logKindNote => 'Note';

  @override
  String get logKindQuoteSent => 'Quote sent';

  @override
  String get logKindEmail => 'Email';

  @override
  String get logKindCall => 'Call';

  @override
  String get logKindMeeting => 'Meeting';

  @override
  String get logKindReply => 'Client reply';

  @override
  String get logKindRemark => 'Remark';

  @override
  String get addressMultipleCities => 'Multiple cities found';

  @override
  String get addressCnpj => 'CNPJ';

  @override
  String get addressAddress => 'Address';

  @override
  String get addressCountry => 'Country';

  @override
  String get addressZip => 'Postal code';

  @override
  String get addressState => 'State';

  @override
  String get addressCity => 'City';

  @override
  String get loginResetPasswordTitle => 'Reset password';

  @override
  String get loginResetHint =>
      'This device only — the password is not shared by sync. Choose a local account and set a new password.';

  @override
  String get loginAccountLabel => 'Account';

  @override
  String get loginNewPasswordLabel => 'New password';

  @override
  String get loginConfirmLabel => 'Confirm';

  @override
  String get loginTooShort => 'Password too short (min. 4 characters).';

  @override
  String get loginMismatch => 'Passwords do not match.';

  @override
  String get loginResetButton => 'Reset';

  @override
  String get currencySearchHint => 'Search currency…';

  @override
  String get currencyNone => 'No currency found';

  @override
  String get systemLanguage => 'System language';

  @override
  String get noLanguage => 'No language found';

  @override
  String get dictationUnavailable => 'Dictation unavailable on this device.';

  @override
  String get companyDeleteTitle => 'Delete this client?';

  @override
  String get companyListTitle => 'Clients';

  @override
  String companyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count companies',
      one: '1 company',
    );
    return '$_temp0';
  }

  @override
  String get companyNewButton => 'New client';

  @override
  String get companySearchHint => 'Filter by name, notes…';

  @override
  String get companyColumnClient => 'Client';

  @override
  String get companyColumnModified => 'Modified';

  @override
  String get companyEmptyNoName => 'No clients';

  @override
  String get companyEmptyNoResult => 'No results';

  @override
  String get companyEmptySubtitle =>
      'Add your first client — or dictate it with the mic.';

  @override
  String get companyEmptySearchSubtitle => 'Try another term.';

  @override
  String get taskEditorNewTitle => 'Schedule a follow-up';

  @override
  String get taskEditorEditTitle => 'Edit follow-up';

  @override
  String get taskEditorClientSection => 'Client';

  @override
  String get taskEditorClientOfTask => 'Follow-up client';

  @override
  String get taskEditorNoClient => 'Without a client (internal)';

  @override
  String get taskEditorChoose => 'Choose…';

  @override
  String get taskEditorTypeSection => 'Type';

  @override
  String get taskEditorTitleField => 'Title *';

  @override
  String get taskEditorTitleHint => 'Follow up the quote, call…';

  @override
  String get taskEditorWhatSection => 'What to do?';

  @override
  String get taskEditorActionHint => 'Choose the concrete action to perform.';

  @override
  String get taskEditorMessaging => 'Messaging';

  @override
  String get taskEditorNeedClient =>
      'First choose a client to show the number or email.';

  @override
  String get taskEditorPhaseSection => 'Phase & due date';

  @override
  String get taskEditorPhaseLabel => 'Deal phase';

  @override
  String get taskEditorChooseDue => 'Choose date and time';

  @override
  String get taskEditorSaveShortcut => 'Save (⌘S)';

  @override
  String get taskEditorNeedMessaging => 'Choose the messaging app to use.';

  @override
  String get taskEditorNeedDue => 'Choose the date and time of the follow-up.';

  @override
  String get taskEditorNeedTitle => 'The task title is required.';

  @override
  String get taskEditorSearchHint => 'Search…';

  @override
  String get taskSuggestedMessage => 'Send a message';

  @override
  String taskSuggestedPlatformMessage(String platform) {
    return 'Message $platform';
  }

  @override
  String get taskSuggestedCall => 'Call';

  @override
  String get taskSuggestedEmail => 'Send an email';

  @override
  String get taskSuggestedMeeting => 'Meeting';

  @override
  String get taskSuggestedFollowup => 'Follow-up';

  @override
  String get importTargetClient => 'Target client';

  @override
  String get importCsvButton => 'Import CSV';

  @override
  String get importModulesSoon => 'Modules (coming soon)';

  @override
  String get importExportCsvTitle => 'CSV export';

  @override
  String get importExportClients => 'Clients';

  @override
  String get importExportContacts => 'Contacts';

  @override
  String get importExportOpportunities => 'Opportunities';

  @override
  String get importTitle => 'Import';

  @override
  String get importClientsCsv => 'Clients CSV';

  @override
  String get importContactsCsv => 'Contacts CSV';

  @override
  String get importOpportunitiesCsv => 'Opportunities CSV';

  @override
  String get importContactsVCard => 'Contacts vCard';

  @override
  String importExported(String path) {
    return 'Exported: $path';
  }

  @override
  String importExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String importResult(String label, int imported, int skipped) {
    return '$label: $imported imported, $skipped skipped.';
  }

  @override
  String importFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String get importNeedClientFirst =>
      'First create a client to attach the vCard contacts.';

  @override
  String importVcardResult(int count) {
    return 'vCard: $count contact(s) imported.';
  }

  @override
  String importVcardFailed(String error) {
    return 'vCard import failed: $error';
  }

  @override
  String get cmdSearchHint => 'Search or type a command…';

  @override
  String get cmdSectionNavigation => 'Navigation';

  @override
  String get cmdGoDashboard => 'Go to Dashboard';

  @override
  String get cmdGoToday => 'Go to Today';

  @override
  String get cmdGoClients => 'Go to Clients';

  @override
  String get cmdGoPipeline => 'Go to Pipeline';

  @override
  String get cmdGoTasks => 'Go to Tasks';

  @override
  String get cmdSectionCreate => 'Create';

  @override
  String get cmdNewClient => 'New client';

  @override
  String get cmdNewTask => 'New task';

  @override
  String get cmdSectionClients => 'Clients';

  @override
  String get cmdSectionContacts => 'Contacts';

  @override
  String get cmdSectionOpportunities => 'Opportunities';

  @override
  String get cmdSectionTasks => 'Tasks';

  @override
  String get cmdSectionNotes => 'Notes & activities';

  @override
  String get cmdNoResults => 'No results';

  @override
  String get pipelineSettingsTitle => 'Pipeline stages';

  @override
  String get pipelineSettingsHint =>
      'Customize labels and order of open stages. Won and Lost stay at the end.';

  @override
  String get pipelineMoveUp => 'Move up';

  @override
  String get pipelineMoveDown => 'Move down';

  @override
  String pipelineStepLabel(int index) {
    return 'Step $index';
  }

  @override
  String get pipelineNewStage => 'New stage';

  @override
  String get pipelineAddStage => 'Add a stage';

  @override
  String get pipelineWon => 'Won';

  @override
  String get pipelineLost => 'Lost';

  @override
  String get pipelineReset => 'Reset';

  @override
  String get oppNotFound => 'Opportunity not found.';

  @override
  String get oppHistoryTitle => 'HISTORY';

  @override
  String get oppEmptyTimeline =>
      'Nothing yet — notes, calls, tasks and quotes/invoices related to this deal will appear here.';

  @override
  String get oppTaskLabel => 'Task';

  @override
  String oppTaskDue(String date) {
    return 'Task · due $date';
  }

  @override
  String get oppTaskMarkDone => 'Mark done';

  @override
  String get oppWon => 'Won';

  @override
  String get oppLost => 'Lost';

  @override
  String oppProbability(int value) {
    return 'Probability: $value%';
  }

  @override
  String oppClosePlanned(String date) {
    return 'Expected close: $date';
  }

  @override
  String get eiProductsTitle => 'Products';

  @override
  String get eiProductsSubtitle => 'EastmarkHK e-Invoicing catalog';

  @override
  String get eiNewProduct => 'New product';

  @override
  String get eiProductSearch => 'Search a product…';

  @override
  String get eiNoProducts => 'No products yet.';

  @override
  String eiSaveFailed(String error) {
    return 'Save failed: $error';
  }

  @override
  String get eiDeleteProductTitle => 'Delete this product?';

  @override
  String eiDeleteFailed(String error) {
    return 'Delete failed: $error';
  }

  @override
  String get eiInfoSection => 'Information';

  @override
  String get eiPriceSection => 'Price and tax';

  @override
  String get eiSellPrice => 'Sale price (incl. tax)';

  @override
  String get eiNfeSection => 'Brazil NF-e tax classification';

  @override
  String get eiPhotosSection => 'Photos';

  @override
  String get eiCustomerTitle => 'e-Invoicing client';

  @override
  String get eiUseExisting => 'Use existing';

  @override
  String get eiOptional => 'Optional';

  @override
  String get eiImagesLabel => 'Images';

  @override
  String get eiTakePhoto => 'Take a photo';

  @override
  String get eiChooseLibrary => 'Choose from library';

  @override
  String get eiBrowseFiles => 'Browse files';

  @override
  String get eiPhotoSaveFailed => 'Unable to save the photo.';

  @override
  String get eiProductLabel => 'Product';

  @override
  String get eiRemoteTitle => 'Connect to e-Invoicing (remote mode)';

  @override
  String get eiRemoteUrl => 'Base URL';

  @override
  String get eiRemoteLogin => 'Login';

  @override
  String get invModuleTitle => 'e-Invoicing';

  @override
  String get queueDeleteTitle => 'Delete this reminder?';

  @override
  String get queueEmpty => 'No reminders';

  @override
  String get tasksListDeleteTitle => 'Delete this task?';

  @override
  String get tasksListTitle => 'Tasks';

  @override
  String tasksListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open',
      one: '1 open',
    );
    return '$_temp0';
  }

  @override
  String get clientsListTitle => 'Clients';

  @override
  String clientsListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count companies',
      one: '1 company',
    );
    return '$_temp0';
  }

  @override
  String get colWiden => 'Widen';

  @override
  String get colNarrow => 'Narrow';

  @override
  String get bannerTaskLabel => 'Task';

  @override
  String get activityInfoAdded => 'Info added to the file';

  @override
  String get activityFollowupCreated => 'Follow-up created';

  @override
  String get activityDuePlanned => 'Due date scheduled';

  @override
  String get activityFollowupUpdated => 'Follow-up updated';

  @override
  String get activityMarkedDone => 'Marked executed';

  @override
  String get activityApproved => 'Approved — confirmed done';

  @override
  String get activityPassed => 'Passed / info only';

  @override
  String get activityReopened => 'Reopened';

  @override
  String get tasksOpenTitle => 'Open tasks';

  @override
  String get tasksPlanButton => 'Schedule';

  @override
  String get tasksNoneOpenTitle => 'No open tasks';

  @override
  String get tasksNoneOpenSubtitle =>
      'Plan what needs to be done — today or later.';

  @override
  String get activityContactAdded => 'Contact added to the file';

  @override
  String get activityContactUpdated => 'Contact updated';

  @override
  String get activityPendingApproval => 'Awaiting approval';

  @override
  String settingsSyncOk(String message) {
    return 'OK — $message';
  }

  @override
  String settingsSyncError(String message) {
    return 'Error — $message';
  }

  @override
  String settingsSyncConnected(String message) {
    return 'Connection OK — $message';
  }

  @override
  String get settingsFtpPassword => 'FTP password';

  @override
  String get settingsTestConnection => 'Test connection';

  @override
  String get settingsNoModules =>
      'No module activated. Browse the store to try or activate EastmarkHK e-Invoicing.';

  @override
  String settingsTrialRemaining(int days) {
    return 'Trial — $days days left';
  }

  @override
  String get settingsActiveInCrm => 'Active — Use in CRM';

  @override
  String get settingsEinvoiceDisplay => 'e-Invoicing — display';

  @override
  String get settingsEinvoiceDisplaySubtitle =>
      'Quotes and invoices also created outside CRM: choose what appears here.';

  @override
  String get settingsLinkedToCrm => 'Linked to CRM';

  @override
  String get settingsAllEinvoicing => 'All e-Invoicing';

  @override
  String get settingsCrmOnlyDesc =>
      'Shows only documents from CRM-linked clients (recommended).';

  @override
  String get settingsAllDocsDesc =>
      'Also shows documents created only in the e-Invoicing app.';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsBuild => 'Build';

  @override
  String get settingsPrivacyReport => 'Privacy Report';

  @override
  String get settingsPrivacyReportSubtitle => 'EastmarkHK CRM — privacy report';

  @override
  String get companyColumnNotes => 'Notes';

  @override
  String get companyWithoutName => '(No name)';

  @override
  String get clientsSearchHint => 'Search for a client…';

  @override
  String get clientsNewButton => 'New';

  @override
  String get clientsEmptyTitle => 'No clients yet';

  @override
  String get clientsEmptySubtitle =>
      'First create the client (prospect or company) to track a deal.';

  @override
  String get clientsEmptyCreateButton => 'Create a client';

  @override
  String get clientsNoCountry => 'Country not provided';

  @override
  String get clientsPanelSearch => 'Name, notes…';

  @override
  String get clientsPanelNew => '+ New';

  @override
  String get clientNameRequired => 'The company name is required.';

  @override
  String get clientEditNewTitle => 'New client';

  @override
  String get clientEditModifyTitle => 'Edit client';

  @override
  String get companyNameLabel => 'Company';

  @override
  String get companyNameRequiredLabel => 'Company name *';

  @override
  String get formRequired => 'Required';

  @override
  String get clientContactPerson => 'Contact person';

  @override
  String get clientEinvoicingSection => 'E-invoicing';

  @override
  String get clientEinvoicingPeppol => 'Receive via e-invoice / Peppol';

  @override
  String get clientEinvoicingPeppolHint =>
      'If disabled, invoices remain email/PDF for this client.';

  @override
  String get clientPeppolIdLabel => 'Peppol ID';

  @override
  String get clientPeppolVerify => 'Peppol check — via the e-Invoicing module.';

  @override
  String get peppolVerify => 'Check Peppol registration';

  @override
  String get nfeTitle => 'Electronic invoice (NF-e)';

  @override
  String get clientNfeHint =>
      'Brazil — no Peppol. Documents follow the NF-e / CNPJ regime.';

  @override
  String get clientNotesSection => 'Notes';

  @override
  String get clientNotesHint => 'Free notes about this client…';

  @override
  String get clientEditSaveShortcut => 'Save (⌘S)';

  @override
  String get contactNameRequired => 'Enter at least a first or last name.';

  @override
  String get contactNewTitle => 'New contact';

  @override
  String get contactEditTitle => 'Edit contact';

  @override
  String get contactIdentitySection => 'Identity';

  @override
  String get contactFirstName => 'First name';

  @override
  String get contactLastName => 'Last name';

  @override
  String get contactRoleLabel => 'Role in the company';

  @override
  String get contactRoleHint => 'Buyer, CEO, Accounting…';

  @override
  String get contactPrimary => 'Primary contact';

  @override
  String get contactPrimaryHint => 'Shown first on the client profile';

  @override
  String get contactDetailsSection => 'Contact details';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Phone';

  @override
  String contactPhoneFormat(String country) {
    return 'Format for $country';
  }

  @override
  String get contactNotesSection => 'Notes';

  @override
  String get contactSaveShortcut => 'Save (⌘S)';

  @override
  String get oppEditTitle => 'Edit opportunity';

  @override
  String get oppStageLabel => 'Stage';

  @override
  String get oppClosePlannedLabel => 'Expected close';

  @override
  String get oppNotSet => 'Not set';

  @override
  String get oppFollowupScheduled => 'Follow-up scheduled';

  @override
  String get oppFollowupReminder => 'Follow-up reminder';

  @override
  String get oppFollowupOptional => 'Optional — schedule a client follow-up';

  @override
  String get oppRemoveFollowup => 'Remove follow-up';

  @override
  String get oppSchedule => 'Schedule';

  @override
  String get oppDetailsHint =>
      'Details (product, Incoterms, payment terms, table…)';

  @override
  String get oppStageChanged => 'Stage changed';

  @override
  String get oppCreated => 'Opportunity created';

  @override
  String get oppWonTitle => 'Opportunity won';

  @override
  String get oppCreateQuotePrompt =>
      'Create a pre-filled quote for this client?';

  @override
  String get oppLater => 'Later';

  @override
  String get oppCreateQuoteButton => 'Create the quote';

  @override
  String get oppQuoteButton => 'Quote';

  @override
  String get oppInvoiceButton => 'Invoice';

  @override
  String get stageContacted => 'Contacted';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get aiGenerating => 'Generating…';

  @override
  String get aiGenerateButton => 'Generate';

  @override
  String get aiUnavailable =>
      'AI Assistant unavailable — requires Apple Intelligence (macOS 26+, Apple Silicon). Manual entry possible.';

  @override
  String get aiPromptHint =>
      'Describe the client need in natural language — Apple’s on-device AI prepares the title, notes, amount and probability. Nothing is saved without your validation.';

  @override
  String get aiPromptExample =>
      'E.g.: “20,000 RFID tags for Acme, FOB Shenzhen price, delivery before November, client already visited the trade show”';

  @override
  String get taskNotesTitle => 'Notes';

  @override
  String get taskEditorNotesTitle => 'Notes';

  @override
  String get taskTileToApprove => 'To approve';

  @override
  String get taskTileInfo => 'Info';

  @override
  String reachCallWithSource(String source) {
    return 'Call · $source';
  }

  @override
  String taskEmailClientRef(String ref) {
    return 'Open email client (ref. $ref)';
  }

  @override
  String get reachNoPhone => 'No number on this client — add it to the file.';

  @override
  String get reachNoEmail => 'No email on this client — add it to the file.';

  @override
  String get reachCallLaunched => 'Call launched';

  @override
  String get reachEmailLabel => 'email';

  @override
  String reachEmailOpened(String ref) {
    return 'Email opened · $ref';
  }

  @override
  String get queueGroupOverdue => 'Overdue';

  @override
  String get queueGroupToday => 'Today';

  @override
  String get queueGroupTomorrow => 'Tomorrow';

  @override
  String get queueGroupWeek => 'This week';

  @override
  String get queueGroupLater => 'Later';

  @override
  String queueDeleteBody(String title) {
    return '“$title”';
  }

  @override
  String get queueNothingScheduled => 'Nothing scheduled';

  @override
  String queueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count follow-ups',
      one: '1 follow-up',
    );
    return '$_temp0';
  }

  @override
  String get queuePersonal => 'Personal';

  @override
  String get queueEmptySubtitle =>
      'Add clients and opportunities — reminders will appear here.';

  @override
  String queueRemoveBody(String title) {
    return '“$title” will be removed from your queue.';
  }

  @override
  String get linkClientTitle => 'Link to a client';

  @override
  String get linkClientButton => 'Link to a client';

  @override
  String get linkClientLabel => 'Client';

  @override
  String get actionNotFound => 'Follow-up not found';

  @override
  String get actionMessage => 'Message';

  @override
  String get actionContact => 'Contact';

  @override
  String get contactedReschedule => 'Contacted — reschedule';

  @override
  String get actionNotLinked => 'Not linked';

  @override
  String get viewFullProfile => 'View full profile';

  @override
  String get actionNoContact => 'No contact — add one from the client profile.';

  @override
  String get actionEmailLabel => 'email';

  @override
  String get commonPhone => 'phone';

  @override
  String get boardNoOpenOpps => 'No open opportunities';

  @override
  String boardOpenCount(int count) {
    return '$count open';
  }

  @override
  String get colWidthLabel => 'Width of this column';

  @override
  String tasksListDeleteBody(String title) {
    return '“$title”';
  }

  @override
  String tasksListOpenCount(int count) {
    return '$count open';
  }

  @override
  String get tasksListNew => '+ Task';

  @override
  String get tasksListEmpty => 'No tasks';

  @override
  String get tasksListNoClient => 'Without a client';

  @override
  String get listFilterHint => 'Filter…';

  @override
  String get cmdNoName => '(no name)';

  @override
  String shellSyncError(String error) {
    return 'Sync: $error';
  }

  @override
  String get shellOk => 'OK';

  @override
  String get shellSyncNeedsPassword =>
      'Banco de dados compartilhado: digite a senha de sincronização em Configurações para reconectar este dispositivo.';

  @override
  String get shellSearch => 'Search';

  @override
  String get shellDashboard => 'Dashboard';

  @override
  String get loginPasskeyNotConfigured =>
      'Passkey not configured — sign in once with the password.';

  @override
  String get loginPasskeyRefused =>
      'Passkey / biometrics refused — use the password or reset it.';

  @override
  String get loginNoAccount => 'No account on this device.';

  @override
  String get loginAccountNotFound => 'Account not found.';

  @override
  String get loginResetDone =>
      'Password reset — sign in again with the new password.';

  @override
  String get loginForgotPassword => 'Forgot password — reset';

  @override
  String get dictationStop => 'Stop dictation';

  @override
  String get dictationStart => 'Dictate — long-press to change language';

  @override
  String get joditLoadFailed =>
      'The editor could not load. Retry, or check that the Jodit files are included in the app assets.';

  @override
  String get languagePickerTitle => 'App language';

  @override
  String get languageSearchHint => 'Search for a language…';

  @override
  String get dictationLanguageSearchHint => 'Search for a language…';

  @override
  String get dictationDesktopHint =>
      'On desktop, native dictation may be limited; the choice is remembered for mobile devices.';

  @override
  String get currencyPickerTitle => 'Currency';

  @override
  String get addressDistrict => 'District';

  @override
  String get addressPhone => 'Phone';

  @override
  String get addressEmail => 'Email';

  @override
  String eiPriceHt(String amount) {
    return '$amount ex. tax';
  }

  @override
  String eiRefAlreadyUsed(String ref) {
    return 'The reference “$ref” is already used by another product.';
  }

  @override
  String get eiEditProductTitle => 'Edit product';

  @override
  String eiTaxRate(String rate) {
    return '$rate %';
  }

  @override
  String get eiRefLabel => 'Reference';

  @override
  String get eiRefHint => 'Leave empty to generate automatically (unique)';

  @override
  String get eiNameLabel => 'Name';

  @override
  String get eiNameRequired => 'Enter a product name.';

  @override
  String get eiDescriptionLabel => 'Description';

  @override
  String get eiPriceExclTax => 'Sale price (excl. tax)';

  @override
  String get eiTaxNote => 'Tax note (e.g. ICMS per state)';

  @override
  String get eiHsInfo =>
      'The HS/NCM code is informational (customs). The product rate is the item reference (VAT, ICMS…). Quotes/invoices keep a single document-level rate for totals.';

  @override
  String get eiCfop => 'CFOP';

  @override
  String get eiCfopHint => 'e.g. 5102 / 6102';

  @override
  String get eiIcmsCst => 'ICMS CST/CSOSN';

  @override
  String get eiIcmsCstHint => 'e.g. 40, 60, 102';

  @override
  String get eiPisCofins => 'PIS/COFINS CST';

  @override
  String get eiPisCofinsHint => 'e.g. 07, 08, 99';

  @override
  String get eiNfeOverrideHint =>
      'Optional — overrides the company’s default NF-e values (Settings) for this item only. Leave empty to use defaults. Validate with your accountant before using in production.';

  @override
  String get eiNotesSection => 'Notes';

  @override
  String get eiSaveShortcut => 'Save (⌘S)';

  @override
  String get eiRemoteBody =>
      'e-Invoicing is set to remote storage. Enter here the same credentials as in e-Invoicing → Settings → Remote storage, so the CRM can create quotes/invoices via the same API.';

  @override
  String get eiRemoteIndexHint =>
      'On the new hosting, the /index.php path is required (no rewrite to /einvoicing/…).';

  @override
  String get eiRemoteSuccess => 'Connection successful.';

  @override
  String eiRemoteFail(String error) {
    return 'Failure: $error';
  }

  @override
  String get eiRemoteTesting => 'Testing…';

  @override
  String get invModuleDisplayName => 'EastmarkHK e-Invoicing';

  @override
  String get invModuleDescription =>
      'Quotes and invoices created from your CRM clients and opportunities, managed by the EastmarkHK e-Invoicing app (included — App Store). Receipts, follow-ups and sending are handled in the e-Invoicing app.';

  @override
  String get invModulePrice => '€5.99/month';

  @override
  String get invInvoiceCreated => 'Invoice created';

  @override
  String get invQuoteCreated => 'Quote created';

  @override
  String get invModuleAppNotFound =>
      'e-Invoicing app not found — install it from the App Store, launch it once, then retry.';

  @override
  String eiCustomerCheckFailed(String error) {
    return 'Client check failed: $error';
  }

  @override
  String get quoteCreatedFromEinvoice => 'Created from e-Invoicing';

  @override
  String quoteCreatedSnackbar(String type, String number) {
    return '$type $number created in e-Invoicing';
  }

  @override
  String quoteCreateFailed(String error) {
    return 'Creation failed: $error';
  }

  @override
  String get syncServerOk => 'server reachable, credentials accepted';

  @override
  String get syncInvalidResponse => 'Invalid server response';

  @override
  String get syncCancelled => 'Sync cancelled';

  @override
  String get syncInProgress => 'Sync already in progress';

  @override
  String get syncUpToDate => 'Up to date';

  @override
  String syncReceived(int count) {
    return '$count item(s) received';
  }

  @override
  String get syncSentNothingNew => 'Sent (nothing new)';

  @override
  String syncSent(int count) {
    return '$count item(s) sent';
  }

  @override
  String syncSentPart(int count) {
    return '$count sent';
  }

  @override
  String syncReceivedPart(int count) {
    return '$count received';
  }

  @override
  String get syncPullFailed => 'Pull failed';

  @override
  String get syncPushFailed => 'Push failed';

  @override
  String get sync401 =>
      '401 — credentials rejected (wrong account or password)';

  @override
  String syncServerStatus(int code) {
    return 'The server responded $code';
  }

  @override
  String get syncTimeout => 'The server is not responding (timeout)';

  @override
  String syncConnectError(String error) {
    return 'Connection failed: $error';
  }

  @override
  String get taskKindAction => 'To do';

  @override
  String get taskKindInfo => 'Info';

  @override
  String get taskActionMessage => 'Chat message';

  @override
  String get taskActionCall => 'Call';

  @override
  String get taskActionEmail => 'Email';

  @override
  String get taskActionMeeting => 'Meeting';

  @override
  String get taskActionOther => 'Other';

  @override
  String get taskStatusOpen => 'Open';

  @override
  String get taskStatusToApprove => 'To approve';

  @override
  String get taskStatusApproved => 'Approved';

  @override
  String get taskStatusPassed => 'Passed';

  @override
  String get phaseProspect => 'Prospect';

  @override
  String get phaseFirstContact => 'First contact';

  @override
  String get phaseContacted => 'Contacted';

  @override
  String get phaseQualification => 'Qualification';

  @override
  String get phaseQuote => 'Quote';

  @override
  String get phaseNegotiation => 'Negotiation';

  @override
  String get phaseClosing => 'Closing';

  @override
  String get phaseWon => 'Won';

  @override
  String get phaseLost => 'Lost';

  @override
  String get phaseAfterSales => 'Post-sale follow-up';

  @override
  String get clientStatusProspect => 'Prospect';

  @override
  String get clientStatusClient => 'Client';

  @override
  String get clientStatusInactive => 'Inactive';

  @override
  String get contactNoName => 'No name';

  @override
  String get contactRoleDirector => 'Director / CEO';

  @override
  String get contactRoleManager => 'Manager';

  @override
  String get contactRoleBuyer => 'Buyer';

  @override
  String get contactRoleSales => 'Sales';

  @override
  String get contactRoleAccounting => 'Accounting';

  @override
  String get contactRoleTechnical => 'Technical';

  @override
  String get contactRoleAssistant => 'Assistant';

  @override
  String get contactRoleDecisionMaker => 'Decision maker';

  @override
  String get contactRoleOther => 'Other';

  @override
  String get eiDocumentNotFound => 'Document not found in e-Invoicing.';

  @override
  String get invLicenseActiveSite => 'Active subscription — eastmarkhk.com';

  @override
  String get invLicenseActiveAppStore => 'Active subscription — App Store';

  @override
  String get invLicenseTrial => 'Free trial';

  @override
  String invOpenInvoicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open invoices',
      one: '1 open invoice',
    );
    return '$_temp0';
  }

  @override
  String get lineQty => 'Qty';

  @override
  String get lineUnitPriceHt => 'Unit price ex. tax';

  @override
  String get lineUnitPriceVat => 'Unit price incl. tax';

  @override
  String get lineTotalVat => 'Total incl. tax';

  @override
  String get eiCreateClient => 'Create the client';

  @override
  String get eiCreateNew => 'Create a new one';

  @override
  String get eiContinue => 'Continue';

  @override
  String eiClientCrm(String name) {
    return 'CRM client: $name';
  }

  @override
  String get eiNoTaxCountry =>
      'This country does not use tax IDs on documents (e.g. Hong Kong). Linking is done by email, phone, name, or a remembered link after the first association.';

  @override
  String eiTaxIdMissing(String taxId) {
    return '$taxId missing on the CRM record. Recommended for e-invoicing and to avoid duplicates. Enter it below or continue without.';
  }

  @override
  String eiSameTaxIdDifferentName(
    String taxId,
    String vatNumber,
    String eiName,
    String crmName,
  ) {
    return 'Same $taxId ($vatNumber) found in e-Invoicing, but the name differs:\n• e-Invoicing: $eiName\n• CRM: $crmName\n\nUse the existing client, or create a new one?';
  }

  @override
  String eiNameOnlyMatch(String name) {
    return 'Name-only match (“$name”). Without a common tax ID / email / phone, confirm “Use existing” or create a new client (the link will be remembered next time).';
  }

  @override
  String get eiNoMatchNew =>
      'No matching client in e-Invoicing. A new client will be created from the CRM record.';

  @override
  String get eiNoMatchNewGeneric =>
      'No matching client (email / phone / name). A new client will be created in e-Invoicing and the link will be remembered on this CRM record.';

  @override
  String eiClientFound(String name, String detail) {
    return 'Client found in e-Invoicing: $name$detail.';
  }

  @override
  String eiHitEmail(String email) {
    return ' — email $email';
  }

  @override
  String eiHitPhone(String phone) {
    return ' — phone $phone';
  }

  @override
  String get eiHitName => ' — name';

  @override
  String get eiHitLinked => ' — already linked';

  @override
  String get dictationLanguageTitle => 'Dictation language';

  @override
  String get eiAddPhoto => 'Add a photo';

  @override
  String openExternalError(String label) {
    return 'Unable to open$label.';
  }

  @override
  String get syncPushFailedShort => 'Push failed';

  @override
  String get reachEmailSent => 'Email opened';

  @override
  String get countryPickerTitle => 'Choose a country';

  @override
  String get countryPickerSearchHint => 'Search for a country…';

  @override
  String alarmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reminders',
      one: 'Task reminder',
    );
    return '$_temp0';
  }

  @override
  String get alarmMarkDone => 'Mark done';

  @override
  String get alarmPostpone15 => '+15 min';

  @override
  String get alarmPostpone1h => '+1 h';

  @override
  String get alarmClose1min => 'Close — reminder in 1 min';

  @override
  String get richColorPickerTitle => 'Text color';

  @override
  String get eiHitEmailPlain => ' — email';

  @override
  String get eiHitPhonePlain => ' — phone';

  @override
  String get tasksEditTaskTitle => 'Edit task';

  @override
  String get activityTaskCreated => 'Tarefa criada';

  @override
  String get dictationOfflineTip =>
      'Ditado offline — costuma captar o ruído (TV) em vez da sua voz. Ative o «reconhecimento de fala online» em Configurações do Windows → Privacidade → Fala, reduza o ruído e tente de novo.';

  @override
  String get dictationLanguageFallbackTip =>
      'Esta variante de idioma não está instalada no Windows — uma variante próxima é usada. Instale o pacote de fala em Configurações → Hora e idioma → Fala.';

  @override
  String get dictationStarting => 'Iniciando o ditado…';

  @override
  String get invChooseLinePhotoTitle => 'Choose photo for the PDF';

  @override
  String get invChooseNewPhoto => 'Choose another file…';

  @override
  String get invNoPhoto => 'No photo';

  @override
  String get modulesBuyOnMicrosoftStore => 'Get on Microsoft Store';

  @override
  String get modulesMicrosoftStoreNote =>
      'Download EastmarkHK e-Invoicing from the Microsoft Store, then return here to enable it in the CRM.';

  @override
  String get invAcquireMicrosoftStoreBody =>
      'This module uses EastmarkHK e-Invoicing. Download it from the Microsoft Store, launch it once, then return here.';

  @override
  String get invViewOnMicrosoftStore => 'View on Microsoft Store';
}

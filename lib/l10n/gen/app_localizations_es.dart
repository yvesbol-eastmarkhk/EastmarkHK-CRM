// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

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
  String get commonUsernameLabel => 'Usuario';

  @override
  String get commonDisplayNameLabel => 'Nombre para mostrar';

  @override
  String get commonPasswordLabel => 'Contraseña';

  @override
  String get commonConfirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get commonPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get commonUsernameTaken => 'Este nombre de usuario ya está en uso';

  @override
  String get commonChoosePassword => 'Elija una contraseña';

  @override
  String get commonRequiredFields => 'El nombre y el usuario son obligatorios';

  @override
  String get passwordFieldShow => 'Mostrar';

  @override
  String get passwordFieldHide => 'Ocultar';

  @override
  String loginWelcomeBack(String name) {
    return 'Bienvenido de nuevo, $name';
  }

  @override
  String get loginTitle => 'Iniciar sesión';

  @override
  String get loginVerifying => 'Verificando…';

  @override
  String get loginUnlockTouchId => 'Desbloquear con Touch ID';

  @override
  String get loginUnlockWindowsHello => 'Déverrouiller avec Windows Hello';

  @override
  String get loginOr => 'o';

  @override
  String get loginRequiredFields => 'Usuario y contraseña obligatorios';

  @override
  String get loginInvalidCredentials => 'Usuario o contraseña incorrectos';

  @override
  String get loginSubmit => 'Iniciar sesión';

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
  String get bootstrapWelcome => 'Bienvenido';

  @override
  String get bootstrapSubtitle =>
      'Cree la cuenta de administrador para proteger su CRM.';

  @override
  String get bootstrapSubmit => 'Crear cuenta de administrador';

  @override
  String get commonAdd => 'Añadir';

  @override
  String get commonCreate => 'Crear';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonNoName => '(sin nombre)';

  @override
  String get commonNotesLabel => 'Notas';

  @override
  String get commonEmailLabel => 'Correo electrónico';

  @override
  String get commonPhoneLabel => 'Teléfono';

  @override
  String get commonFirstNameLabel => 'Nombre';

  @override
  String get commonLastNameLabel => 'Apellido';

  @override
  String get commonCompanyNameLabel => 'Nombre de la empresa';

  @override
  String messagingCannotOpen(String target) {
    return 'No se puede abrir $target.';
  }

  @override
  String get messagingEmailAppLabel => 'la aplicación de correo';

  @override
  String get messagingPhoneAppLabel => 'la aplicación de teléfono';

  @override
  String messagingIncompleteId(String label) {
    return 'Identificador incompleto para abrir $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'No se puede abrir $label: ¿está instalada la aplicación?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat no expone un enlace público a un contacto concreto — la aplicación se abre, pero deberás elegir la conversación manualmente.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk no expone un enlace público a un contacto concreto — la aplicación se abre, pero deberás elegir la conversación manualmente.';

  @override
  String get messagingPhoneCallLabel => 'Llamada telefónica';

  @override
  String get companyDeleteOpportunityConfirm => '¿Eliminar esta oportunidad?';

  @override
  String get companyDeleteContactConfirm => '¿Eliminar este contacto?';

  @override
  String get companyDeleteTaskConfirm => '¿Eliminar esta tarea?';

  @override
  String get companyDeleteConfirmTitle => '¿Eliminar este cliente?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — sus contactos, oportunidades, tareas e historial se eliminarán con él.';
  }

  @override
  String get companyNewNoteTitle => 'Nueva nota';

  @override
  String get companyNoteFieldLabel => 'Nota (o dictarla)';

  @override
  String get companyTabOverview => 'Resumen';

  @override
  String get companyTabActivity => 'Actividad';

  @override
  String get companyTabTasks => 'Tareas';

  @override
  String get companyTabDeals => 'Oportunidades';

  @override
  String get companyContactsTitle => 'Contactos';

  @override
  String get companyNoContacts => 'Sin contactos';

  @override
  String get companyNoActivity => 'Sin actividad — añade una nota.';

  @override
  String get companyNoTasks => 'Sin tareas';

  @override
  String get companyNoDeals => 'Sin oportunidades';

  @override
  String get companyNoteButtonLabel => 'Nota';

  @override
  String get companyNewClientTitle => 'Nuevo cliente';

  @override
  String get companyEditClientTitle => 'Editar cliente';

  @override
  String get companyWebsiteLabel => 'Sitio web';

  @override
  String get companyPeppolLabel => 'Identificador Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Etiquetas (separadas por comas)';

  @override
  String get companyNewContactTitle => 'Nuevo contacto';

  @override
  String get companyEditContactTitle => 'Editar contacto';

  @override
  String get companyAppLabel => 'Aplicación';

  @override
  String get companyIdentifierNumberLabel => 'Identificador / número';

  @override
  String get companyOpenTooltip => 'Abrir';

  @override
  String get companyRemoveTooltip => 'Quitar';

  @override
  String get companyRoleFieldLabel => 'Función (p. ej. Comprador)';

  @override
  String get companyMessagingTitle => 'Mensajería';

  @override
  String get companyNoMessagingHint =>
      'Sin canal de mensajería añadido — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Aún no hay información de contacto.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSubtitle => 'Configuración única de la aplicación.';

  @override
  String get settingsLanguagesTitle => 'Idiomas y moneda';

  @override
  String get settingsAppLanguageLabel => 'Idioma de la aplicación';

  @override
  String get settingsDictationLanguageLabel => 'Idioma de dictado';

  @override
  String get settingsCurrencyLabel => 'Moneda';

  @override
  String get settingsFormatsHint =>
      'Importes mostrados como 1,234.56 (coma = miles, punto = decimales) y fechas como dd/mm/aaaa, sea cual sea el idioma de la interfaz.';

  @override
  String get settingsCompanyTitle => 'Empresa';

  @override
  String get settingsCompanySubtitle =>
      'Identidad de la empresa que usa este CRM — se reutiliza más adelante en la cabecera (marca blanca) y en los documentos PDF.';

  @override
  String get settingsSyncTitle => 'Sincronización';

  @override
  String get settingsSyncSubtitle =>
      'Por defecto, todos los datos permanecen en local (SQLite) en este dispositivo.';

  @override
  String get settingsSyncLocalTitle => 'Independiente (solo local)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Ningún dato se envía fuera de este dispositivo';

  @override
  String get settingsSyncRemoteTitle => 'Base de datos compartida (remota)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Se sincroniza con un servidor PHP + SQLite (ver server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Servidor';

  @override
  String get settingsAccountLabel => 'Cuenta';

  @override
  String get settingsSyncPasswordHint =>
      'Almacenado en el llavero seguro del dispositivo — nunca en la base de datos.';

  @override
  String get settingsSyncNowButton => 'Sincronizar ahora';

  @override
  String get settingsSyncPollHint =>
      'Extracción automática cada 25 s en segundo plano; envío inmediato tras cada cambio (modo remoto activo). Sin extracción durante la escritura.';

  @override
  String get settingsSyncMissingFields =>
      'Se requieren servidor, cuenta y contraseña';

  @override
  String get settingsModulesTitle => 'Módulos';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Escáner, Sincronización… — prueba de 7 días o activación de licencia.';

  @override
  String get settingsBrowseModules => 'Explorar módulos';

  @override
  String get settingsImportExportTitle => 'Importar / exportar';

  @override
  String get settingsImportExportSubtitle =>
      'Clientes, contactos y oportunidades en CSV; contactos desde vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Personaliza las etapas y sus nombres.';

  @override
  String get settingsConfigureStages => 'Configurar etapas';

  @override
  String get settingsBackupTitle => 'Copia de seguridad local';

  @override
  String get settingsBackupSubtitle =>
      'Exporta una copia de tu base de datos SQLite — útil antes de una actualización o para archivar.';

  @override
  String get settingsExportDbButton => 'Exportar base de datos (.db)';

  @override
  String get settingsBackupShareText => 'Copia de seguridad de EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Error al exportar: $error';
  }

  @override
  String get settingsUsersTitle => 'Usuarios';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Cuentas, roles y contraseñas — administrador y usuario.';

  @override
  String get settingsUsersSubtitleLocked => 'Solo para administradores.';

  @override
  String get settingsManageUsersButton => 'Gestionar usuarios';

  @override
  String get settingsUsersLockedHint =>
      'Inicia sesión con una cuenta de administrador para ver o editar usuarios y sus contraseñas.';

  @override
  String get settingsSaveKeychainError =>
      'Ajustes guardados, pero el llavero seguro no está disponible — no se pudo guardar la contraseña de sincronización (reinicia la app tras una recompilación completa).';

  @override
  String get settingsSaved => 'Ajustes guardados';

  @override
  String get settingsLogoutConfirmTitle => '¿Cerrar sesión?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Deberás introducir tu contraseña (o Touch ID) para volver.';

  @override
  String get settingsLogoutButton => 'Cerrar sesión';

  @override
  String get settingsLogoTitle => 'Logotipo de la empresa';

  @override
  String get settingsLogoSubtitle =>
      'Se muestra en la parte superior de la aplicación y en el banner.';

  @override
  String get settingsLogoEmpty => 'Sin logotipo — añade el de tu empresa';

  @override
  String get settingsLogoChoose => 'Elegir una imagen';

  @override
  String get settingsLogoChange => 'Cambiar logotipo';

  @override
  String get usersDeleteSelfError => 'No puedes eliminar tu propia cuenta';

  @override
  String get usersDeleteConfirmTitle => '¿Eliminar este usuario?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) perderá el acceso al CRM.';
  }

  @override
  String get usersTitle => 'Usuarios';

  @override
  String get usersSubtitle => 'Cuentas, roles y contraseñas.';

  @override
  String get usersAddButton => 'Usuario';

  @override
  String get usersEmptyTitle => 'Sin usuarios';

  @override
  String get usersEmptySubtitle =>
      'Crea la primera cuenta — será administrador.';

  @override
  String get usersEmptyAction => 'Nuevo usuario';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (tú)';
  }

  @override
  String get usersNewTitle => 'Nuevo usuario';

  @override
  String get usersEditTitle => 'Editar usuario';

  @override
  String get usersLoginIdLabel => 'Identificador de acceso';

  @override
  String get usersRoleLabel => 'Rol';

  @override
  String get usersNewPasswordLabel =>
      'Nueva contraseña (déjalo en blanco para no cambiarla)';

  @override
  String get usersTouchIdTitle => 'Touch ID en este dispositivo';

  @override
  String get usersTouchIdSubtitle =>
      'Desbloquear sin volver a escribir la contraseña, solo en este dispositivo.';

  @override
  String get roleAdministrator => 'Administrador';

  @override
  String get roleUser => 'Usuario';

  @override
  String get dashboardTitleEmbedded => 'Panel';

  @override
  String get dashboardTitle => 'Hoy';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString acciones por procesar',
      one: '$countString acción por procesar',
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
      other: '+$countString más — ver todo',
      one: '+$countString más — ver todo',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Todos los comerciales';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (yo)';
  }

  @override
  String get dashboardEmptyTitle => 'Tu CRM está listo';

  @override
  String get dashboardEmptySubtitle =>
      'Añade tu primer cliente, importa un archivo CSV o explora los próximos módulos.';

  @override
  String get dashboardNothingScheduled =>
      'Nada programado — tus seguimientos aparecerán aquí.';

  @override
  String get dashboardBucketOverdue => 'Atrasado';

  @override
  String get dashboardBucketToday => 'Hoy';

  @override
  String get dashboardBucketWeek => 'Esta semana';

  @override
  String get dashboardBucketLater => 'Más tarde';

  @override
  String get dashboardContactedButton => 'Contactado';

  @override
  String get dashboardDoneButton => 'Hecho';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Mejores clientes (pipeline abierto)';

  @override
  String get dashboardPipelineByStage => 'Pipeline por etapa';

  @override
  String get dashboardNoOpportunitiesYet => 'Aún no hay oportunidades';

  @override
  String get dashboardWonLostByMonth => 'Ganado / Perdido por mes';

  @override
  String get dashboardNoClosuresYet => 'Aún no hay cierres registrados.';

  @override
  String get dashboardRecentActivity => 'Actividad reciente';

  @override
  String get dashboardNoActivityYet => 'Sin actividad por el momento.';

  @override
  String get metricClients => 'Clientes';

  @override
  String get metricOpportunities => 'Oportunidades';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Previsión';

  @override
  String get metricTasks => 'Tareas';

  @override
  String get metricOverdue => 'Atrasado';

  @override
  String get productTagline => 'Ahorra tiempo desde el primer día.';

  @override
  String get placeholderDashboardHint =>
      'Resumen: pipeline, seguimientos y actividad reciente.';

  @override
  String get placeholderTodayTitle => 'Tu día';

  @override
  String get placeholderTodayHint =>
      'Elige un seguimiento a la izquierda.\nEl cliente se abre aquí, sin cambiar de pantalla.';

  @override
  String get placeholderClientsTitle => 'Ficha del cliente';

  @override
  String get placeholderClientsHint =>
      'Selecciona un cliente de la lista,\no crea uno con el botón +.';

  @override
  String get placeholderPipelineHint =>
      'Arrastra una tarjeta entre columnas.\nHaz clic para abrir la ficha del cliente.';

  @override
  String get placeholderTasksHint =>
      'Selecciona una tarea para ver el cliente relacionado.';

  @override
  String get modulesSubtitleAppStore =>
      'Suscríbase a través de la App Store o active una suscripción ya comprada en eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Prueba gratuita, compra en eastmarkhk.com — la misma suscripción que la app EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Activo — App Store';

  @override
  String get modulesStatusActiveWeb => 'Activo — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prueba — quedan $countString días',
      one: 'Prueba — queda $countString día',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Activo';

  @override
  String get modulesStatusAvailable => 'Disponible';

  @override
  String get modulesBuyFailed =>
      'No se pudo iniciar la compra. Inténtelo de nuevo o restaure sus compras.';

  @override
  String get modulesRestoreDone => 'Restauración completada.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name activado desde la app instalada.';
  }

  @override
  String get modulesLicenseNotFound =>
      'No se encontró la licencia automáticamente. Abra EastmarkHK e-Invoicing → Ajustes, copie su código de activación y elija «Activar un código web».';

  @override
  String get modulesRenewalNote =>
      'Renovación automática mediante la App Store. Administre la suscripción en Ajustes → Apple ID → Suscripciones.';

  @override
  String get modulesWebStoreNote =>
      'O suscríbase en eastmarkhk.com y actívela con el código recibido por correo electrónico.';

  @override
  String get modulesHaveEinvoicing => 'Ya tengo EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Probar 7 días';

  @override
  String get modulesSubscribe => 'Suscribirse';

  @override
  String get modulesRestore => 'Restaurar compras';

  @override
  String get modulesWebSubscription => 'Suscripción eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Activar un código web';

  @override
  String get modulesUseInCrm => 'Usar en el CRM';

  @override
  String get modulesDontUseInCrm => 'No usar en el CRM';

  @override
  String get modulesBuyOnAppStore => 'Comprar en el App Store';

  @override
  String get modulesStoreUnavailable =>
      'El App Store no está disponible en esta versión. Use una versión de App Store, o active una suscripción en eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Comprobando compras de App Store y eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Comprobando compras de App Store…';

  @override
  String get modulesPerMonth => '/ mes';

  @override
  String get modulesActivationSubtitleAppStore =>
      '¿Se suscribió en eastmarkhk.com? Pegue el código recibido por correo. En iPhone/iPad, la compra inicial se realiza mediante la App Store o el sitio antes de la activación.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Suscríbase en eastmarkhk.com y luego pegue el código de activación vinculado a este dispositivo.';

  @override
  String get modulesMachineId => 'ID de la máquina';

  @override
  String get modulesCopy => 'Copiar';

  @override
  String get modulesSubscriptionEmailLabel => 'Correo de la suscripción';

  @override
  String get modulesActivationCodeLabel => 'Código de activación';

  @override
  String get modulesActivationCodeHint =>
      'Pegue el código recibido después de la compra';

  @override
  String get modulesActivate => 'Activar';

  @override
  String get modulesBuyOnWebsite => 'Comprar en eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Solicitar un código por correo';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name activado mediante eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID de la máquina copiado';

  @override
  String get modulesEmailRequired => 'Introduzca su correo de suscripción';

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
  String get invPickClientTitle => 'Elegir un cliente';

  @override
  String get invPickClientSearch => 'Buscar por nombre, NIF, país…';

  @override
  String get invPickClientEmpty => 'Ningún cliente coincide.';

  @override
  String get invPickClientButton => 'Elegir cliente';

  @override
  String get invClientRequired => 'Elija un cliente antes de guardar.';

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
  String get invSaving => 'Guardando…';

  @override
  String invEditQuote(String number) {
    return 'Editar presupuesto $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Editar factura $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number guardado.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'No se pudo guardar: $error';
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
      'Presupuestos y facturas — datos de EastmarkHK e-Invoicing (recibos y recordatorios: app independiente)';

  @override
  String get invOpenStandalone => 'Abrir e-Invoicing';

  @override
  String get invLaunchStandalone => 'Iniciar e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Conexión remota';

  @override
  String invTabQuotes(int count) {
    return 'Presupuestos ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Facturas ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Sin presupuestos — cree uno desde una oportunidad ganada o el botón de arriba.';

  @override
  String get invEmptyInvoices => 'Sin facturas.';

  @override
  String get invEmptyCompanyDocs => 'Sin presupuestos ni facturas.';

  @override
  String get invQuotesSection => 'PRESUPUESTOS';

  @override
  String get invInvoicesSection => 'FACTURAS';

  @override
  String get invCompanyFooter =>
      'Los documentos son gestionados por EastmarkHK e-Invoicing — envío, PDF, recibos y recordatorios en la app independiente.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing está en modo remoto — conexión no configurada.';

  @override
  String get invConfigure => 'Configurar';

  @override
  String get invAppNotDetected =>
      'No se detectó la app e-Invoicing — instale/inicie EastmarkHK e-Invoicing para crear presupuestos y facturas desde esta ficha.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing está configurada para almacenamiento remoto. Introduzca aquí las mismas credenciales para conectar el CRM a la misma API — los mismos valores que en e-Invoicing → Ajustes → Almacenamiento remoto.';

  @override
  String get invLaunchOnceBody =>
      'Inicie EastmarkHK e-Invoicing una vez para inicializar la base de datos compartida y luego vuelva aquí.';

  @override
  String get invAcquireAppStoreBody =>
      'Este módulo usa EastmarkHK e-Invoicing. Descárguela y suscríbase desde el App Store, inícela una vez y vuelva aquí.';

  @override
  String get invAcquireWebBody =>
      'Este módulo usa EastmarkHK e-Invoicing. Descárguela y suscríbase en eastmarkhk.com, inícela una vez y vuelva aquí.';

  @override
  String get invConfigureRemote => 'Configurar conexión remota';

  @override
  String get invViewOnAppStore => 'Ver en el App Store';

  @override
  String get invViewOnWebsite => 'Ver en eastmarkhk.com';

  @override
  String get invRetry => 'Reintentar';

  @override
  String get invDocInvoice => 'Factura';

  @override
  String get invDocQuote => 'Presupuesto';

  @override
  String get invDocClient => 'Cliente';

  @override
  String get invDocStatus => 'Estado';

  @override
  String get invDocDate => 'Fecha';

  @override
  String get invOpenInStandalone => 'Abrir en e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'No se pudo abrir e-Invoicing — compruebe que está instalada.';

  @override
  String get invCreateInvoiceFromQuote => 'Crear factura';

  @override
  String get invCreatingInvoice => 'Creando factura…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Factura $number creada a partir del presupuesto.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Este presupuesto ya está facturado.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'No se pudo crear la factura: $error';
  }

  @override
  String get invLinkMenu => 'Vínculo con e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Cliente de e-Invoicing vinculado';

  @override
  String get invLinkStatusNone =>
      'No hay ningún vínculo con e-Invoicing guardado';

  @override
  String get invUnlinkCustomer => 'Desvincular cliente de e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => '¿Desvincular el cliente?';

  @override
  String get invUnlinkConfirmBody =>
      'El próximo presupuesto o factura le pedirá elegir o crear de nuevo el cliente en e-Invoicing.';

  @override
  String get invUnlinkDone => 'Vínculo con e-Invoicing eliminado.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing aún no figura en el App Store para esta versión. Use eastmarkhk.com o inicie una app ya instalada.';

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
    return 'Hoy · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return 'Mañana · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · en $days d';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return 'Hoy · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return 'Mañana · $date';
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
    return 'Más tarde · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return 'Más tarde · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip =>
      'Sincronización no activada — toque para configurar';

  @override
  String get bannerSyncInProgressTooltip => 'Sincronizando…';

  @override
  String get bannerSyncErrorTooltip => 'Error de sync — toque para reintentar';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return 'Última sync: $date';
  }

  @override
  String get bannerSyncIdleTooltip => 'Sincronizar';

  @override
  String get bannerCompanyPlaceholder => 'Su empresa';

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
      'Base de datos compartida: introduzca la contraseña de sincronización en Ajustes para reconectar este dispositivo.';

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
  String get activityTaskCreated => 'Tarea creada';

  @override
  String get dictationOfflineTip =>
      'Dictado sin conexión: a menudo captura el ruido (TV) en lugar de su voz. Active el «reconocimiento de voz en línea» en Configuración de Windows → Privacidad → Voz, reduzca el ruido y vuelva a intentarlo.';

  @override
  String get dictationLanguageFallbackTip =>
      'Esta variante de idioma no está instalada en Windows: se usa una variante cercana. Instale el paquete de voz en Configuración → Hora e idioma → Voz.';

  @override
  String get dictationStarting => 'Iniciando el dictado…';

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

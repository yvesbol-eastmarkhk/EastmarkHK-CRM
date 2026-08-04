// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Nome utente';

  @override
  String get commonDisplayNameLabel => 'Nome visualizzato';

  @override
  String get commonPasswordLabel => 'Password';

  @override
  String get commonConfirmPasswordLabel => 'Conferma password';

  @override
  String get commonPasswordMismatch => 'Le password non corrispondono';

  @override
  String get commonUsernameTaken => 'Questo nome utente è già in uso';

  @override
  String get commonChoosePassword => 'Scegli una password';

  @override
  String get commonRequiredFields => 'Nome e nome utente sono obbligatori';

  @override
  String get passwordFieldShow => 'Mostra';

  @override
  String get passwordFieldHide => 'Nascondi';

  @override
  String loginWelcomeBack(String name) {
    return 'Bentornato, $name';
  }

  @override
  String get loginTitle => 'Accesso';

  @override
  String get loginVerifying => 'Verifica in corso…';

  @override
  String get loginUnlockTouchId => 'Sblocca con Touch ID';

  @override
  String get loginOr => 'oppure';

  @override
  String get loginRequiredFields => 'Nome utente e password obbligatori';

  @override
  String get loginInvalidCredentials => 'Nome utente o password errati';

  @override
  String get loginSubmit => 'Accedi';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Benvenuto';

  @override
  String get bootstrapSubtitle =>
      'Crea l\'account amministratore per proteggere il tuo CRM.';

  @override
  String get bootstrapSubmit => 'Crea account amministratore';

  @override
  String get commonAdd => 'Aggiungi';

  @override
  String get commonCreate => 'Crea';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonNoName => '(senza nome)';

  @override
  String get commonNotesLabel => 'Note';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Telefono';

  @override
  String get commonFirstNameLabel => 'Nome';

  @override
  String get commonLastNameLabel => 'Cognome';

  @override
  String get commonCompanyNameLabel => 'Nome azienda';

  @override
  String messagingCannotOpen(String target) {
    return 'Impossibile aprire $target.';
  }

  @override
  String get messagingEmailAppLabel => 'l\'app email';

  @override
  String get messagingPhoneAppLabel => 'l\'app telefono';

  @override
  String messagingIncompleteId(String label) {
    return 'Identificativo incompleto per aprire $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Impossibile aprire $label: l\'app è installata?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat non espone un link pubblico a un contatto specifico — l\'app si apre, ma la conversazione va scelta manualmente.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk non espone un link pubblico a un contatto specifico — l\'app si apre, ma la conversazione va scelta manualmente.';

  @override
  String get messagingPhoneCallLabel => 'Chiamata telefonica';

  @override
  String get companyDeleteOpportunityConfirm => 'Eliminare questa opportunità?';

  @override
  String get companyDeleteContactConfirm => 'Eliminare questo contatto?';

  @override
  String get companyDeleteTaskConfirm => 'Eliminare questa attività?';

  @override
  String get companyDeleteConfirmTitle => 'Eliminare questo cliente?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — i suoi contatti, opportunità, attività e cronologia verranno eliminati con lui.';
  }

  @override
  String get companyNewNoteTitle => 'Nuova nota';

  @override
  String get companyNoteFieldLabel => 'Nota (o dettala)';

  @override
  String get companyTabOverview => 'Panoramica';

  @override
  String get companyTabActivity => 'Attività';

  @override
  String get companyTabTasks => 'Compiti';

  @override
  String get companyTabDeals => 'Opportunità';

  @override
  String get companyContactsTitle => 'Contatti';

  @override
  String get companyNoContacts => 'Nessun contatto';

  @override
  String get companyNoActivity => 'Nessuna attività — aggiungi una nota.';

  @override
  String get companyNoTasks => 'Nessun compito';

  @override
  String get companyNoDeals => 'Nessuna opportunità';

  @override
  String get companyNoteButtonLabel => 'Nota';

  @override
  String get companyNewClientTitle => 'Nuovo cliente';

  @override
  String get companyEditClientTitle => 'Modifica cliente';

  @override
  String get companyWebsiteLabel => 'Sito web';

  @override
  String get companyPeppolLabel => 'ID Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Tag (separati da virgole)';

  @override
  String get companyNewContactTitle => 'Nuovo contatto';

  @override
  String get companyEditContactTitle => 'Modifica contatto';

  @override
  String get companyAppLabel => 'App';

  @override
  String get companyIdentifierNumberLabel => 'Identificativo / numero';

  @override
  String get companyOpenTooltip => 'Apri';

  @override
  String get companyRemoveTooltip => 'Rimuovi';

  @override
  String get companyRoleFieldLabel => 'Ruolo (es. Acquirente)';

  @override
  String get companyMessagingTitle => 'Messaggistica';

  @override
  String get companyNoMessagingHint =>
      'Nessun canale di messaggistica aggiunto — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Nessuna informazione di contatto ancora inserita.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSubtitle => 'Configurazione una tantum dell\'app.';

  @override
  String get settingsLanguagesTitle => 'Lingue e valuta';

  @override
  String get settingsAppLanguageLabel => 'Lingua dell\'app';

  @override
  String get settingsDictationLanguageLabel => 'Lingua di dettatura';

  @override
  String get settingsCurrencyLabel => 'Valuta';

  @override
  String get settingsFormatsHint =>
      'Importi mostrati come 1.234,56 (punto = migliaia, virgola = decimali) e date come gg/mm/aaaa, indipendentemente dalla lingua dell\'interfaccia.';

  @override
  String get settingsCompanyTitle => 'Azienda';

  @override
  String get settingsCompanySubtitle =>
      'Identità dell\'azienda che utilizza questo CRM — riutilizzata in seguito nell\'intestazione (white-label) e nell\'intestazione dei documenti PDF.';

  @override
  String get settingsSyncTitle => 'Sincronizzazione';

  @override
  String get settingsSyncSubtitle =>
      'Per impostazione predefinita, tutti i dati restano in locale (SQLite) su questo dispositivo.';

  @override
  String get settingsSyncLocalTitle => 'Standalone (solo locale)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Nessun dato inviato fuori da questo dispositivo';

  @override
  String get settingsSyncRemoteTitle => 'Database condiviso (remoto)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Si sincronizza con un server PHP + SQLite (vedi server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Server';

  @override
  String get settingsAccountLabel => 'Account';

  @override
  String get settingsSyncPasswordHint =>
      'Memorizzato nel portachiavi sicuro del dispositivo — mai nel database.';

  @override
  String get settingsSyncNowButton => 'Sincronizza ora';

  @override
  String get settingsSyncPollHint =>
      'Recupero automatico ogni 25 s in background; invio immediato dopo ogni modifica (modalità remota attiva). Nessun recupero durante la digitazione.';

  @override
  String get settingsSyncMissingFields =>
      'Server, account e password richiesti';

  @override
  String get settingsModulesTitle => 'Moduli';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Scanner, Sync… — prova di 7 giorni o attivazione licenza.';

  @override
  String get settingsBrowseModules => 'Sfoglia i moduli';

  @override
  String get settingsImportExportTitle => 'Importa / esporta';

  @override
  String get settingsImportExportSubtitle =>
      'Clienti, contatti e opportunità in CSV; contatti da vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Personalizza le fasi e le loro etichette.';

  @override
  String get settingsConfigureStages => 'Configura le fasi';

  @override
  String get settingsBackupTitle => 'Backup locale';

  @override
  String get settingsBackupSubtitle =>
      'Esporta una copia del tuo database SQLite — utile prima di un aggiornamento o per l\'archiviazione.';

  @override
  String get settingsExportDbButton => 'Esporta database (.db)';

  @override
  String get settingsBackupShareText => 'Backup EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Esportazione non riuscita: $error';
  }

  @override
  String get settingsUsersTitle => 'Utenti';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Account, ruoli e password — amministratore e utente.';

  @override
  String get settingsUsersSubtitleLocked => 'Solo amministratori.';

  @override
  String get settingsManageUsersButton => 'Gestisci utenti';

  @override
  String get settingsUsersLockedHint =>
      'Accedi con un account amministratore per visualizzare o modificare utenti e password.';

  @override
  String get settingsSaveKeychainError =>
      'Impostazioni salvate, ma il portachiavi sicuro non è disponibile — la password di sincronizzazione non è stata salvata (riavvia l\'app dopo una ricompilazione completa).';

  @override
  String get settingsSaved => 'Impostazioni salvate';

  @override
  String get settingsLogoutConfirmTitle => 'Disconnettersi?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Dovrai inserire la password (o Touch ID) per tornare.';

  @override
  String get settingsLogoutButton => 'Disconnetti';

  @override
  String get settingsLogoTitle => 'Logo aziendale';

  @override
  String get settingsLogoSubtitle => 'Mostrato in alto nell\'app e nel banner.';

  @override
  String get settingsLogoEmpty =>
      'Nessun logo — aggiungi quello della tua azienda';

  @override
  String get settingsLogoChoose => 'Scegli un\'immagine';

  @override
  String get settingsLogoChange => 'Cambia logo';

  @override
  String get usersDeleteSelfError => 'Non puoi eliminare il tuo stesso account';

  @override
  String get usersDeleteConfirmTitle => 'Eliminare questo utente?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) perderà l\'accesso al CRM.';
  }

  @override
  String get usersTitle => 'Utenti';

  @override
  String get usersSubtitle => 'Account, ruoli e password.';

  @override
  String get usersAddButton => 'Utente';

  @override
  String get usersEmptyTitle => 'Nessun utente';

  @override
  String get usersEmptySubtitle =>
      'Crea il primo account — sarà amministratore.';

  @override
  String get usersEmptyAction => 'Nuovo utente';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (tu)';
  }

  @override
  String get usersNewTitle => 'Nuovo utente';

  @override
  String get usersEditTitle => 'Modifica utente';

  @override
  String get usersLoginIdLabel => 'ID di accesso';

  @override
  String get usersRoleLabel => 'Ruolo';

  @override
  String get usersNewPasswordLabel =>
      'Nuova password (lascia vuoto per non modificarla)';

  @override
  String get usersTouchIdTitle => 'Touch ID su questo dispositivo';

  @override
  String get usersTouchIdSubtitle =>
      'Sblocca senza reinserire la password, solo su questo dispositivo.';

  @override
  String get roleAdministrator => 'Amministratore';

  @override
  String get roleUser => 'Utente';

  @override
  String get dashboardTitleEmbedded => 'Dashboard';

  @override
  String get dashboardTitle => 'Oggi';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString azioni da gestire',
      one: '$countString azione da gestire',
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
      other: '+$countString altri — vedi tutto',
      one: '+$countString altro — vedi tutto',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Tutti i commerciali';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (io)';
  }

  @override
  String get dashboardEmptyTitle => 'Il tuo CRM è pronto';

  @override
  String get dashboardEmptySubtitle =>
      'Aggiungi il tuo primo cliente, importa un file CSV o esplora i prossimi moduli.';

  @override
  String get dashboardNothingScheduled =>
      'Niente in programma — i tuoi follow-up appariranno qui.';

  @override
  String get dashboardBucketOverdue => 'In ritardo';

  @override
  String get dashboardBucketToday => 'Oggi';

  @override
  String get dashboardBucketWeek => 'Questa settimana';

  @override
  String get dashboardBucketLater => 'Più tardi';

  @override
  String get dashboardContactedButton => 'Contattato';

  @override
  String get dashboardDoneButton => 'Fatto';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Top clienti (pipeline aperta)';

  @override
  String get dashboardPipelineByStage => 'Pipeline per fase';

  @override
  String get dashboardNoOpportunitiesYet => 'Ancora nessuna opportunità';

  @override
  String get dashboardWonLostByMonth => 'Vinto / Perso per mese';

  @override
  String get dashboardNoClosuresYet => 'Ancora nessuna chiusura registrata.';

  @override
  String get dashboardRecentActivity => 'Attività recente';

  @override
  String get dashboardNoActivityYet => 'Ancora nessuna attività.';

  @override
  String get metricClients => 'Clienti';

  @override
  String get metricOpportunities => 'Opportunità';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Previsione';

  @override
  String get metricTasks => 'Compiti';

  @override
  String get metricOverdue => 'In ritardo';

  @override
  String get productTagline => 'Risparmia tempo fin dal primo giorno.';

  @override
  String get placeholderDashboardHint =>
      'Panoramica: pipeline, follow-up e attività recente.';

  @override
  String get placeholderTodayTitle => 'La tua giornata';

  @override
  String get placeholderTodayHint =>
      'Scegli un follow-up a sinistra.\nIl cliente si apre qui — senza cambiare schermata.';

  @override
  String get placeholderClientsTitle => 'Scheda cliente';

  @override
  String get placeholderClientsHint =>
      'Seleziona un cliente dalla lista,\no creane uno con il pulsante +.';

  @override
  String get placeholderPipelineHint =>
      'Trascina una scheda tra le colonne.\nClicca per aprire la scheda cliente.';

  @override
  String get placeholderTasksHint =>
      'Seleziona un\'attività per vedere il cliente collegato.';

  @override
  String get modulesSubtitleAppStore =>
      'Abbonati tramite l\'App Store o attiva un abbonamento già acquistato su eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Prova gratuita, acquisto su eastmarkhk.com — lo stesso abbonamento dell\'app EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Attivo — App Store';

  @override
  String get modulesStatusActiveWeb => 'Attivo — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prova — $countString giorni rimasti',
      one: 'Prova — $countString giorno rimasto',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Attivo';

  @override
  String get modulesStatusAvailable => 'Disponibile';

  @override
  String get modulesBuyFailed =>
      'Impossibile avviare l\'acquisto. Riprova o ripristina i tuoi acquisti.';

  @override
  String get modulesRestoreDone => 'Ripristino completato.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name attivato dall\'app installata.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licenza non trovata automaticamente. Apri EastmarkHK e-Invoicing → Impostazioni, copia il tuo codice di attivazione e scegli «Attiva un codice web».';

  @override
  String get modulesRenewalNote =>
      'Rinnovo automatico tramite l\'App Store. Gestisci l\'abbonamento in Impostazioni → Apple ID → Abbonamenti.';

  @override
  String get modulesWebStoreNote =>
      'Oppure abbonati su eastmarkhk.com e attiva con il codice ricevuto via email.';

  @override
  String get modulesHaveEinvoicing => 'Ho già EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Prova 7 giorni';

  @override
  String get modulesSubscribe => 'Abbonati';

  @override
  String get modulesRestore => 'Ripristina acquisti';

  @override
  String get modulesWebSubscription => 'Abbonamento eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Attiva un codice web';

  @override
  String get modulesUseInCrm => 'Usa nel CRM';

  @override
  String get modulesDontUseInCrm => 'Non usare nel CRM';

  @override
  String get modulesBuyOnAppStore => 'Acquista sull\'App Store';

  @override
  String get modulesStoreUnavailable =>
      'L\'App Store non è disponibile in questa build. Usa una build dell\'App Store, oppure attiva un abbonamento eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Verifica degli acquisti App Store ed eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Verifica degli acquisti App Store…';

  @override
  String get modulesPerMonth => '/ mese';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Ti sei abbonato su eastmarkhk.com? Incolla il codice ricevuto via email. Su iPhone/iPad, l\'acquisto iniziale avviene tramite l\'App Store o il sito prima dell\'attivazione.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Abbonati su eastmarkhk.com, poi incolla il codice di attivazione collegato a questo dispositivo.';

  @override
  String get modulesMachineId => 'ID macchina';

  @override
  String get modulesCopy => 'Copia';

  @override
  String get modulesSubscriptionEmailLabel => 'Email abbonamento';

  @override
  String get modulesActivationCodeLabel => 'Codice di attivazione';

  @override
  String get modulesActivationCodeHint =>
      'Incolla il codice ricevuto dopo l\'acquisto';

  @override
  String get modulesActivate => 'Attiva';

  @override
  String get modulesBuyOnWebsite => 'Acquista su eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Richiedi un codice via email';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name attivato tramite eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID macchina copiato';

  @override
  String get modulesEmailRequired => 'Inserisci la tua email di abbonamento';

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
  String get invPickClientTitle => 'Scegli un cliente';

  @override
  String get invPickClientSearch => 'Cerca per nome, partita IVA, paese…';

  @override
  String get invPickClientEmpty => 'Nessun cliente corrispondente.';

  @override
  String get invPickClientButton => 'Scegli cliente';

  @override
  String get invClientRequired => 'Scegli un cliente prima di salvare.';

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
  String get invSave => 'Salva';

  @override
  String get invSaving => 'Salvataggio…';

  @override
  String invEditQuote(String number) {
    return 'Modifica preventivo $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Modifica fattura $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number salvato.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Salvataggio non riuscito: $error';
  }

  @override
  String get invEditDocument => 'Modifica';

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
      'Preventivi e fatture — dati EastmarkHK e-Invoicing (ricevute e promemoria: app standalone)';

  @override
  String get invOpenStandalone => 'Apri e-Invoicing';

  @override
  String get invLaunchStandalone => 'Avvia e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Connessione remota';

  @override
  String invTabQuotes(int count) {
    return 'Preventivi ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Fatture ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Nessun preventivo — creane uno da un\'opportunità vinta o dal pulsante qui sopra.';

  @override
  String get invEmptyInvoices => 'Nessuna fattura.';

  @override
  String get invEmptyCompanyDocs => 'Nessun preventivo o fattura.';

  @override
  String get invQuotesSection => 'PREVENTIVI';

  @override
  String get invInvoicesSection => 'FATTURE';

  @override
  String get invCompanyFooter =>
      'I documenti sono gestiti da EastmarkHK e-Invoicing — invio, PDF, ricevute e promemoria nell\'app standalone.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing è in modalità remota — connessione non configurata.';

  @override
  String get invConfigure => 'Configura';

  @override
  String get invAppNotDetected =>
      'App e-Invoicing non rilevata — installa/avvia EastmarkHK e-Invoicing per creare preventivi e fatture da questa scheda.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing è configurata per l\'archiviazione remota. Inserisci qui le stesse credenziali per collegare il CRM alla stessa API — stessi valori di e-Invoicing → Impostazioni → Archiviazione remota.';

  @override
  String get invLaunchOnceBody =>
      'Avvia EastmarkHK e-Invoicing una volta per inizializzare il database condiviso, poi torna qui.';

  @override
  String get invAcquireAppStoreBody =>
      'Questo modulo utilizza EastmarkHK e-Invoicing. Scaricala e abbonati dall\'App Store, avviala una volta, poi torna qui.';

  @override
  String get invAcquireWebBody =>
      'Questo modulo utilizza EastmarkHK e-Invoicing. Scaricala e abbonati su eastmarkhk.com, avviala una volta, poi torna qui.';

  @override
  String get invConfigureRemote => 'Configura connessione remota';

  @override
  String get invViewOnAppStore => 'Vedi sull\'App Store';

  @override
  String get invViewOnWebsite => 'Vedi su eastmarkhk.com';

  @override
  String get invRetry => 'Riprova';

  @override
  String get invDocInvoice => 'Fattura';

  @override
  String get invDocQuote => 'Preventivo';

  @override
  String get invDocClient => 'Cliente';

  @override
  String get invDocStatus => 'Stato';

  @override
  String get invDocDate => 'Data';

  @override
  String get invOpenInStandalone => 'Apri in e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Impossibile aprire e-Invoicing — verifica che sia installata.';

  @override
  String get invCreateInvoiceFromQuote => 'Crea fattura';

  @override
  String get invCreatingInvoice => 'Creazione fattura…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Fattura $number creata dal preventivo.';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'Questo preventivo è già stato fatturato.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Impossibile creare la fattura: $error';
  }

  @override
  String get invLinkMenu => 'Collegamento e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Cliente e-Invoicing collegato';

  @override
  String get invLinkStatusNone => 'Nessun collegamento e-Invoicing salvato';

  @override
  String get invUnlinkCustomer => 'Scollega cliente e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Scollegare il cliente?';

  @override
  String get invUnlinkConfirmBody =>
      'Il prossimo preventivo o fattura chiederà di nuovo di scegliere o creare il cliente in e-Invoicing.';

  @override
  String get invUnlinkDone => 'Collegamento e-Invoicing rimosso.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing non è ancora elencata sull\'App Store per questa build. Usa eastmarkhk.com oppure avvia un\'app già installata.';

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
      'Database condiviso: inserisci la password di sincronizzazione in Impostazioni per riconnettere questo dispositivo.';

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
  String get activityTaskCreated => 'Attività creata';

  @override
  String get dictationOfflineTip =>
      'Dettatura offline: spesso cattura il rumore (TV) invece della voce. Attiva il «riconoscimento vocale online» in Impostazioni Windows → Privacy → Voce, riduci il rumore e riprova.';

  @override
  String get dictationLanguageFallbackTip =>
      'Questa variante di lingua non è installata su Windows: viene usata una variante simile. Installa il pacchetto vocale in Impostazioni → Ora e lingua → Voce.';

  @override
  String get dictationStarting => 'Avvio della dettatura…';
}

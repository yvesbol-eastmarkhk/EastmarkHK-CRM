// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonSave => 'Lagre';

  @override
  String get commonDelete => 'Slett';

  @override
  String get commonEdit => 'Rediger';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Brukernavn';

  @override
  String get commonDisplayNameLabel => 'Visningsnavn';

  @override
  String get commonPasswordLabel => 'Passord';

  @override
  String get commonConfirmPasswordLabel => 'Bekreft passord';

  @override
  String get commonPasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get commonUsernameTaken => 'Dette brukernavnet er allerede tatt';

  @override
  String get commonChoosePassword => 'Velg et passord';

  @override
  String get commonRequiredFields => 'Navn og brukernavn er påkrevd';

  @override
  String get passwordFieldShow => 'Vis';

  @override
  String get passwordFieldHide => 'Skjul';

  @override
  String loginWelcomeBack(String name) {
    return 'Velkommen tilbake, $name';
  }

  @override
  String get loginTitle => 'Logg inn';

  @override
  String get loginVerifying => 'Bekrefter…';

  @override
  String get loginUnlockTouchId => 'Lås opp med Touch ID';

  @override
  String get loginOr => 'eller';

  @override
  String get loginRequiredFields => 'Brukernavn og passord er påkrevd';

  @override
  String get loginInvalidCredentials => 'Feil brukernavn eller passord';

  @override
  String get loginSubmit => 'Logg inn';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Velkommen';

  @override
  String get bootstrapSubtitle =>
      'Opprett administratorkontoen for å sikre CRM-et ditt.';

  @override
  String get bootstrapSubmit => 'Opprett administratorkonto';

  @override
  String get commonAdd => 'Legg til';

  @override
  String get commonCreate => 'Opprett';

  @override
  String get commonClose => 'Lukk';

  @override
  String get commonNoName => '(uten navn)';

  @override
  String get commonNotesLabel => 'Notater';

  @override
  String get commonEmailLabel => 'E-post';

  @override
  String get commonPhoneLabel => 'Telefon';

  @override
  String get commonFirstNameLabel => 'Fornavn';

  @override
  String get commonLastNameLabel => 'Etternavn';

  @override
  String get commonCompanyNameLabel => 'Firmanavn';

  @override
  String messagingCannotOpen(String target) {
    return 'Kan ikke åpne $target.';
  }

  @override
  String get messagingEmailAppLabel => 'e-postappen';

  @override
  String get messagingPhoneAppLabel => 'telefonappen';

  @override
  String messagingIncompleteId(String label) {
    return 'Ufullstendig identifikator for å åpne $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Kan ikke åpne $label — er appen installert?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat eksponerer ikke en offentlig lenke til en bestemt kontakt — appen åpnes, men samtalen må velges manuelt.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk eksponerer ikke en offentlig lenke til en bestemt kontakt — appen åpnes, men samtalen må velges manuelt.';

  @override
  String get messagingPhoneCallLabel => 'Telefonsamtale';

  @override
  String get companyDeleteOpportunityConfirm => 'Slette denne salgsmuligheten?';

  @override
  String get companyDeleteContactConfirm => 'Slette denne kontakten?';

  @override
  String get companyDeleteTaskConfirm => 'Slette denne oppgaven?';

  @override
  String get companyDeleteConfirmTitle => 'Slette denne kunden?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — kontakter, salgsmuligheter, oppgaver og historikk slettes sammen med den.';
  }

  @override
  String get companyNewNoteTitle => 'Nytt notat';

  @override
  String get companyNoteFieldLabel => 'Notat (eller diktér det)';

  @override
  String get companyTabOverview => 'Oversikt';

  @override
  String get companyTabActivity => 'Aktivitet';

  @override
  String get companyTabTasks => 'Oppgaver';

  @override
  String get companyTabDeals => 'Salgsmuligheter';

  @override
  String get companyContactsTitle => 'Kontakter';

  @override
  String get companyNoContacts => 'Ingen kontakter';

  @override
  String get companyNoActivity => 'Ingen aktivitet — legg til et notat.';

  @override
  String get companyNoTasks => 'Ingen oppgaver';

  @override
  String get companyNoDeals => 'Ingen salgsmuligheter';

  @override
  String get companyNoteButtonLabel => 'Notat';

  @override
  String get companyNewClientTitle => 'Ny kunde';

  @override
  String get companyEditClientTitle => 'Rediger kunde';

  @override
  String get companyWebsiteLabel => 'Nettsted';

  @override
  String get companyPeppolLabel => 'Peppol-ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Tagger (kommaseparert)';

  @override
  String get companyNewContactTitle => 'Ny kontakt';

  @override
  String get companyEditContactTitle => 'Rediger kontakt';

  @override
  String get companyAppLabel => 'App';

  @override
  String get companyIdentifierNumberLabel => 'Identifikator / nummer';

  @override
  String get companyOpenTooltip => 'Åpne';

  @override
  String get companyRemoveTooltip => 'Fjern';

  @override
  String get companyRoleFieldLabel => 'Rolle (f.eks. Innkjøper)';

  @override
  String get companyMessagingTitle => 'Meldinger';

  @override
  String get companyNoMessagingHint =>
      'Ingen meldingskanal lagt til — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Ingen kontaktinformasjon lagt til ennå.';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get settingsSubtitle => 'Engangskonfigurasjon av appen.';

  @override
  String get settingsLanguagesTitle => 'Språk og valuta';

  @override
  String get settingsAppLanguageLabel => 'Appspråk';

  @override
  String get settingsDictationLanguageLabel => 'Diktatspråk';

  @override
  String get settingsCurrencyLabel => 'Valuta';

  @override
  String get settingsFormatsHint =>
      'Beløp vises som 1 234,56 (mellomrom = tusener, komma = desimaler) og datoer som dd.mm.åååå, uansett grensesnittspråk.';

  @override
  String get settingsCompanyTitle => 'Firma';

  @override
  String get settingsCompanySubtitle =>
      'Identitet til firmaet som bruker dette CRM-et — brukes senere i toppteksten (white-label) og PDF-dokumenttopptekster.';

  @override
  String get settingsSyncTitle => 'Synkronisering';

  @override
  String get settingsSyncSubtitle =>
      'Som standard forblir alle data lokalt (SQLite) på denne enheten.';

  @override
  String get settingsSyncLocalTitle => 'Frittstående (kun lokalt)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Ingen data sendes utenfor denne enheten';

  @override
  String get settingsSyncRemoteTitle => 'Delt database (ekstern)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Synkroniserer med en PHP + SQLite-server (se server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Server';

  @override
  String get settingsAccountLabel => 'Konto';

  @override
  String get settingsSyncPasswordHint =>
      'Lagret i enhetens sikre nøkkelring — aldri i databasen.';

  @override
  String get settingsSyncNowButton => 'Synkroniser nå';

  @override
  String get settingsSyncPollHint =>
      'Automatisk henting hvert 25. sekund i bakgrunnen; umiddelbar sending etter hver endring (ekstern modus aktiv). Ingen henting under skriving.';

  @override
  String get settingsSyncMissingFields => 'Server, konto og passord kreves';

  @override
  String get settingsModulesTitle => 'Moduler';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-fakturering, Skanner, Synkronisering… — 7 dagers prøveperiode eller lisensaktivering.';

  @override
  String get settingsBrowseModules => 'Bla gjennom moduler';

  @override
  String get settingsImportExportTitle => 'Importer / eksporter';

  @override
  String get settingsImportExportSubtitle =>
      'Kunder, kontakter og salgsmuligheter som CSV; kontakter fra vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Tilpass trinnene og etikettene deres.';

  @override
  String get settingsConfigureStages => 'Konfigurer trinn';

  @override
  String get settingsBackupTitle => 'Lokal sikkerhetskopi';

  @override
  String get settingsBackupSubtitle =>
      'Eksporterer en kopi av SQLite-databasen din — nyttig før en oppdatering eller for arkivering.';

  @override
  String get settingsExportDbButton => 'Eksporter database (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM-sikkerhetskopi';

  @override
  String settingsExportError(String error) {
    return 'Eksport mislyktes: $error';
  }

  @override
  String get settingsUsersTitle => 'Brukere';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Kontoer, roller og passord — administrator og bruker.';

  @override
  String get settingsUsersSubtitleLocked => 'Kun for administratorer.';

  @override
  String get settingsManageUsersButton => 'Administrer brukere';

  @override
  String get settingsUsersLockedHint =>
      'Logg inn med en administratorkonto for å vise eller redigere brukere og passordene deres.';

  @override
  String get settingsSaveKeychainError =>
      'Innstillinger lagret, men den sikre nøkkelringen er utilgjengelig — synkroniseringspassordet kunne ikke lagres (start appen på nytt etter en fullstendig ombygging).';

  @override
  String get settingsSaved => 'Innstillinger lagret';

  @override
  String get settingsLogoutConfirmTitle => 'Logge ut?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Du må angi passordet (eller Touch ID) for å komme tilbake.';

  @override
  String get settingsLogoutButton => 'Logg ut';

  @override
  String get settingsLogoTitle => 'Firmalogo';

  @override
  String get settingsLogoSubtitle => 'Vises øverst i appen og i banneret.';

  @override
  String get settingsLogoEmpty => 'Ingen logo — legg til firmaets logo';

  @override
  String get settingsLogoChoose => 'Velg et bilde';

  @override
  String get settingsLogoChange => 'Endre logo';

  @override
  String get usersDeleteSelfError => 'Du kan ikke slette din egen konto';

  @override
  String get usersDeleteConfirmTitle => 'Slette denne brukeren?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) mister tilgangen til CRM-et.';
  }

  @override
  String get usersTitle => 'Brukere';

  @override
  String get usersSubtitle => 'Kontoer, roller og passord.';

  @override
  String get usersAddButton => 'Bruker';

  @override
  String get usersEmptyTitle => 'Ingen brukere';

  @override
  String get usersEmptySubtitle =>
      'Opprett den første kontoen — den blir administrator.';

  @override
  String get usersEmptyAction => 'Ny bruker';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (deg)';
  }

  @override
  String get usersNewTitle => 'Ny bruker';

  @override
  String get usersEditTitle => 'Rediger bruker';

  @override
  String get usersLoginIdLabel => 'Innloggings-ID';

  @override
  String get usersRoleLabel => 'Rolle';

  @override
  String get usersNewPasswordLabel =>
      'Nytt passord (la stå tomt for å ikke endre)';

  @override
  String get usersTouchIdTitle => 'Touch ID på denne enheten';

  @override
  String get usersTouchIdSubtitle =>
      'Lås opp uten å skrive inn passordet på nytt, kun på denne enheten.';

  @override
  String get roleAdministrator => 'Administrator';

  @override
  String get roleUser => 'Bruker';

  @override
  String get dashboardTitleEmbedded => 'Dashbord';

  @override
  String get dashboardTitle => 'I dag';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString handlinger å behandle',
      one: '$countString handling å behandle',
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
      other: '+$countString til — se alle',
      one: '+$countString til — se alle',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Alle selgere';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (meg)';
  }

  @override
  String get dashboardEmptyTitle => 'CRM-et ditt er klart';

  @override
  String get dashboardEmptySubtitle =>
      'Legg til din første kunde, importer en CSV-fil, eller utforsk kommende moduler.';

  @override
  String get dashboardNothingScheduled =>
      'Ingenting planlagt — oppfølgingene dine vises her.';

  @override
  String get dashboardBucketOverdue => 'Forsinket';

  @override
  String get dashboardBucketToday => 'I dag';

  @override
  String get dashboardBucketWeek => 'Denne uken';

  @override
  String get dashboardBucketLater => 'Senere';

  @override
  String get dashboardContactedButton => 'Kontaktet';

  @override
  String get dashboardDoneButton => 'Ferdig';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Toppkunder (åpen pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline etter trinn';

  @override
  String get dashboardNoOpportunitiesYet => 'Ingen salgsmuligheter ennå';

  @override
  String get dashboardWonLostByMonth => 'Vunnet / tapt per måned';

  @override
  String get dashboardNoClosuresYet => 'Ingen lukkinger registrert ennå.';

  @override
  String get dashboardRecentActivity => 'Nylig aktivitet';

  @override
  String get dashboardNoActivityYet => 'Ingen aktivitet ennå.';

  @override
  String get metricClients => 'Kunder';

  @override
  String get metricOpportunities => 'Salgsmuligheter';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Prognose';

  @override
  String get metricTasks => 'Oppgaver';

  @override
  String get metricOverdue => 'Forsinket';

  @override
  String get productTagline => 'Spar tid fra dag én.';

  @override
  String get placeholderDashboardHint =>
      'Oversikt: pipeline, oppfølginger og nylig aktivitet.';

  @override
  String get placeholderTodayTitle => 'Din dag';

  @override
  String get placeholderTodayHint =>
      'Velg en oppfølging til venstre.\nKunden åpnes her — uten å bytte skjerm.';

  @override
  String get placeholderClientsTitle => 'Kundekort';

  @override
  String get placeholderClientsHint =>
      'Velg en kunde fra listen,\neller opprett en med +-knappen.';

  @override
  String get placeholderPipelineHint =>
      'Dra et kort mellom kolonner.\nKlikk for å åpne kundekortet.';

  @override
  String get placeholderTasksHint =>
      'Velg en oppgave for å se tilhørende kunde.';

  @override
  String get modulesSubtitleAppStore =>
      'Abonner via App Store, eller aktiver et abonnement du allerede har kjøpt på eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Gratis prøveperiode, kjøp på eastmarkhk.com — samme abonnement som EastmarkHK e-Invoicing-appen.';

  @override
  String get modulesStatusActiveAppStore => 'Aktiv — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktiv — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prøveperiode — $countString dager igjen',
      one: 'Prøveperiode — $countString dag igjen',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktiv';

  @override
  String get modulesStatusAvailable => 'Tilgjengelig';

  @override
  String get modulesBuyFailed =>
      'Kunne ikke starte kjøpet. Prøv igjen, eller gjenopprett kjøpene dine.';

  @override
  String get modulesRestoreDone => 'Gjenoppretting fullført.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name aktivert fra den installerte appen.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Lisensen ble ikke funnet automatisk. Åpne EastmarkHK e-Invoicing → Innstillinger, kopier aktiveringskoden, og velg «Aktiver en webkode».';

  @override
  String get modulesRenewalNote =>
      'Automatisk fornyelse via App Store. Administrer abonnementet i Innstillinger → Apple ID → Abonnementer.';

  @override
  String get modulesWebStoreNote =>
      'Eller abonner på eastmarkhk.com og aktiver med koden du mottok på e-post.';

  @override
  String get modulesHaveEinvoicing => 'Jeg har allerede EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Prøv 7 dager';

  @override
  String get modulesSubscribe => 'Abonner';

  @override
  String get modulesRestore => 'Gjenopprett kjøp';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com-abonnement';

  @override
  String get modulesActivateWebCode => 'Aktiver en webkode';

  @override
  String get modulesUseInCrm => 'Bruk i CRM';

  @override
  String get modulesDontUseInCrm => 'Ikke bruk i CRM';

  @override
  String get modulesBuyOnAppStore => 'Kjøp på App Store';

  @override
  String get modulesStoreUnavailable =>
      'App Store er ikke tilgjengelig i denne bygningen. Bruk en App Store-bygning, eller aktiver et eastmarkhk.com-abonnement.';

  @override
  String get modulesCheckingPurchases =>
      'Sjekker kjøp fra App Store og eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Sjekker kjøp fra App Store…';

  @override
  String get modulesPerMonth => '/ måned';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Har du abonnert på eastmarkhk.com? Lim inn koden du mottok på e-post. På iPhone/iPad gjøres det første kjøpet via App Store eller nettstedet før aktivering.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Abonner på eastmarkhk.com, og lim deretter inn aktiveringskoden som er knyttet til denne enheten.';

  @override
  String get modulesMachineId => 'Maskin-ID';

  @override
  String get modulesCopy => 'Kopier';

  @override
  String get modulesSubscriptionEmailLabel => 'E-post for abonnement';

  @override
  String get modulesActivationCodeLabel => 'Aktiveringskode';

  @override
  String get modulesActivationCodeHint =>
      'Lim inn koden du mottok etter kjøpet';

  @override
  String get modulesActivate => 'Aktiver';

  @override
  String get modulesBuyOnWebsite => 'Kjøp på eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Be om kode på e-post';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name aktivert via eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'Maskin-ID kopiert';

  @override
  String get modulesEmailRequired => 'Skriv inn e-posten for abonnementet ditt';

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
  String get invPickClientTitle => 'Velg en klient';

  @override
  String get invPickClientSearch => 'Søk etter navn, org.nr., land…';

  @override
  String get invPickClientEmpty => 'Ingen samsvarende klient.';

  @override
  String get invPickClientButton => 'Velg klient';

  @override
  String get invClientRequired => 'Velg en klient før du lagrer.';

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
  String get invSave => 'Lagre';

  @override
  String get invSaving => 'Lagrer…';

  @override
  String invEditQuote(String number) {
    return 'Rediger tilbud $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Rediger faktura $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number lagret.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Kunne ikke lagre: $error';
  }

  @override
  String get invEditDocument => 'Rediger';

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
      'Tilbud og fakturaer — data fra EastmarkHK e-Invoicing (kvitteringer og påminnelser: frittstående app)';

  @override
  String get invOpenStandalone => 'Åpne e-Invoicing';

  @override
  String get invLaunchStandalone => 'Start e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Ekstern tilkobling';

  @override
  String invTabQuotes(int count) {
    return 'Tilbud ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Fakturaer ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Ingen tilbud — opprett ett fra en vunnet mulighet eller knappen ovenfor.';

  @override
  String get invEmptyInvoices => 'Ingen fakturaer.';

  @override
  String get invEmptyCompanyDocs => 'Ingen tilbud eller fakturaer.';

  @override
  String get invQuotesSection => 'TILBUD';

  @override
  String get invInvoicesSection => 'FAKTURAER';

  @override
  String get invCompanyFooter =>
      'Dokumenter administreres av EastmarkHK e-Invoicing — sending, PDF, kvitteringer og påminnelser i den frittstående appen.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing er i ekstern modus — tilkobling er ikke konfigurert.';

  @override
  String get invConfigure => 'Konfigurer';

  @override
  String get invAppNotDetected =>
      'e-Invoicing-appen ble ikke oppdaget — installer/start EastmarkHK e-Invoicing for å opprette tilbud og fakturaer fra denne posten.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing er konfigurert for ekstern lagring. Angi de samme påloggingsopplysningene her for å koble CRM til samme API — samme verdier som i e-Invoicing → Innstillinger → Ekstern lagring.';

  @override
  String get invLaunchOnceBody =>
      'Start EastmarkHK e-Invoicing én gang for å initialisere den delte databasen, og kom deretter tilbake hit.';

  @override
  String get invAcquireAppStoreBody =>
      'Denne modulen bruker EastmarkHK e-Invoicing. Last ned og abonner via App Store, start den én gang, og kom deretter tilbake hit.';

  @override
  String get invAcquireWebBody =>
      'Denne modulen bruker EastmarkHK e-Invoicing. Last ned og abonner på eastmarkhk.com, start den én gang, og kom deretter tilbake hit.';

  @override
  String get invConfigureRemote => 'Konfigurer ekstern tilkobling';

  @override
  String get invViewOnAppStore => 'Se på App Store';

  @override
  String get invViewOnWebsite => 'Se på eastmarkhk.com';

  @override
  String get invRetry => 'Prøv igjen';

  @override
  String get invDocInvoice => 'Faktura';

  @override
  String get invDocQuote => 'Tilbud';

  @override
  String get invDocClient => 'Klient';

  @override
  String get invDocStatus => 'Status';

  @override
  String get invDocDate => 'Dato';

  @override
  String get invOpenInStandalone => 'Åpne i e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Kunne ikke åpne e-Invoicing — sjekk at den er installert.';

  @override
  String get invCreateInvoiceFromQuote => 'Opprett faktura';

  @override
  String get invCreatingInvoice => 'Oppretter faktura…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Faktura $number opprettet fra tilbudet.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Dette tilbudet er allerede fakturert.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Kunne ikke opprette fakturaen: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing-kobling';

  @override
  String get invLinkStatusLinked => 'e-Invoicing-kunde koblet';

  @override
  String get invLinkStatusNone => 'Ingen lagret e-Invoicing-kobling';

  @override
  String get invUnlinkCustomer => 'Fjern kobling til e-Invoicing-kunde';

  @override
  String get invUnlinkConfirmTitle => 'Fjerne kobling til klient?';

  @override
  String get invUnlinkConfirmBody =>
      'Neste tilbud eller faktura vil be deg velge eller opprette klienten i e-Invoicing på nytt.';

  @override
  String get invUnlinkDone => 'e-Invoicing-kobling fjernet.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing er ennå ikke oppført i App Store for denne bygningen. Bruk eastmarkhk.com eller start en allerede installert app.';

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
    return 'Overdue · $days d · $date';
  }

  @override
  String dueLabelToday(String date) {
    return 'Today · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return 'Tomorrow · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · in $days d';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return 'Today · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return 'Tomorrow · $date';
  }

  @override
  String dueGroupWeekWithDate(String date) {
    return 'This week · $date';
  }

  @override
  String dueGroupWeekWithRange(String from, String to) {
    return 'This week · $from → $to';
  }

  @override
  String dueGroupLaterWithDate(String date) {
    return 'Later · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return 'Later · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip => 'Sync not enabled — tap to set up';

  @override
  String get bannerSyncInProgressTooltip => 'Syncing…';

  @override
  String get bannerSyncErrorTooltip => 'Sync error — tap to retry';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return 'Last sync: $date';
  }

  @override
  String get bannerSyncIdleTooltip => 'Sync';

  @override
  String get bannerCompanyPlaceholder => 'Your company';

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
      'Delt database: angi synkroniseringspassordet i Innstillinger for å koble denne enheten til på nytt.';

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
  String get activityTaskCreated => 'Oppgave opprettet';

  @override
  String get dictationOfflineTip =>
      'Frakoblet diktering plukker ofte opp støy (TV) i stedet for stemmen din. Slå på «Online talegjenkjenning» i Windows-innstillinger → Personvern → Tale, demp støyen og prøv igjen.';

  @override
  String get dictationLanguageFallbackTip =>
      'Denne språkvarianten er ikke installert i Windows — en nær match brukes. Installer ønsket talepakke i Innstillinger → Tid og språk → Tale.';

  @override
  String get dictationStarting => 'Starter diktering…';

  @override
  String get invChooseLinePhotoTitle => 'Choose photo for the PDF';

  @override
  String get invChooseNewPhoto => 'Choose another file…';

  @override
  String get invNoPhoto => 'No photo';
}

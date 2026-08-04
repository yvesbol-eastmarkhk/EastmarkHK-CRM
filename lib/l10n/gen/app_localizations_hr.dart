// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get commonCancel => 'Odustani';

  @override
  String get commonSave => 'Spremi';

  @override
  String get commonDelete => 'Izbriši';

  @override
  String get commonEdit => 'Uredi';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Korisničko ime';

  @override
  String get commonDisplayNameLabel => 'Prikazano ime';

  @override
  String get commonPasswordLabel => 'Lozinka';

  @override
  String get commonConfirmPasswordLabel => 'Potvrdite lozinku';

  @override
  String get commonPasswordMismatch => 'Lozinke se ne podudaraju';

  @override
  String get commonUsernameTaken => 'Ovo korisničko ime je već zauzeto';

  @override
  String get commonChoosePassword => 'Odaberite lozinku';

  @override
  String get commonRequiredFields => 'Ime i korisničko ime su obavezni';

  @override
  String get passwordFieldShow => 'Prikaži';

  @override
  String get passwordFieldHide => 'Sakrij';

  @override
  String loginWelcomeBack(String name) {
    return 'Dobrodošli natrag, $name';
  }

  @override
  String get loginTitle => 'Prijava';

  @override
  String get loginVerifying => 'Provjera…';

  @override
  String get loginUnlockTouchId => 'Otključaj pomoću Touch ID-a';

  @override
  String get loginOr => 'ili';

  @override
  String get loginRequiredFields => 'Potrebno je korisničko ime i lozinka';

  @override
  String get loginInvalidCredentials => 'Netočno korisničko ime ili lozinka';

  @override
  String get loginSubmit => 'Prijavi se';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Dobrodošli';

  @override
  String get bootstrapSubtitle =>
      'Izradite administratorski račun kako biste zaštitili svoj CRM.';

  @override
  String get bootstrapSubmit => 'Izradi administratorski račun';

  @override
  String get commonAdd => 'Dodaj';

  @override
  String get commonCreate => 'Kreiraj';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get commonNoName => '(bez imena)';

  @override
  String get commonNotesLabel => 'Bilješke';

  @override
  String get commonEmailLabel => 'E-pošta';

  @override
  String get commonPhoneLabel => 'Telefon';

  @override
  String get commonFirstNameLabel => 'Ime';

  @override
  String get commonLastNameLabel => 'Prezime';

  @override
  String get commonCompanyNameLabel => 'Naziv tvrtke';

  @override
  String messagingCannotOpen(String target) {
    return 'Nije moguće otvoriti $target.';
  }

  @override
  String get messagingEmailAppLabel => 'aplikaciju e-pošte';

  @override
  String get messagingPhoneAppLabel => 'telefonsku aplikaciju';

  @override
  String messagingIncompleteId(String label) {
    return 'Nepotpuni identifikator za otvaranje $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Nije moguće otvoriti $label — je li aplikacija instalirana?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat ne omogućuje javnu poveznicu na određeni kontakt — aplikacija će se otvoriti, ali razgovor treba odabrati ručno.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk ne omogućuje javnu poveznicu na određeni kontakt — aplikacija će se otvoriti, ali razgovor treba odabrati ručno.';

  @override
  String get messagingPhoneCallLabel => 'Telefonski poziv';

  @override
  String get companyDeleteOpportunityConfirm => 'Izbrisati ovu priliku?';

  @override
  String get companyDeleteContactConfirm => 'Izbrisati ovaj kontakt?';

  @override
  String get companyDeleteTaskConfirm => 'Izbrisati ovaj zadatak?';

  @override
  String get companyDeleteConfirmTitle => 'Izbrisati ovog klijenta?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — njegovi kontakti, prilike, zadaci i povijest bit će izbrisani zajedno s njim.';
  }

  @override
  String get companyNewNoteTitle => 'Nova bilješka';

  @override
  String get companyNoteFieldLabel => 'Bilješka (ili je izdiktirajte)';

  @override
  String get companyTabOverview => 'Pregled';

  @override
  String get companyTabActivity => 'Aktivnost';

  @override
  String get companyTabTasks => 'Zadaci';

  @override
  String get companyTabDeals => 'Prilike';

  @override
  String get companyContactsTitle => 'Kontakti';

  @override
  String get companyNoContacts => 'Nema kontakata';

  @override
  String get companyNoActivity => 'Nema aktivnosti — dodajte bilješku.';

  @override
  String get companyNoTasks => 'Nema zadataka';

  @override
  String get companyNoDeals => 'Nema prilika';

  @override
  String get companyNoteButtonLabel => 'Bilješka';

  @override
  String get companyNewClientTitle => 'Novi klijent';

  @override
  String get companyEditClientTitle => 'Uredi klijenta';

  @override
  String get companyWebsiteLabel => 'Web-stranica';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Oznake (odvojene zarezima)';

  @override
  String get companyNewContactTitle => 'Novi kontakt';

  @override
  String get companyEditContactTitle => 'Uredi kontakt';

  @override
  String get companyAppLabel => 'Aplikacija';

  @override
  String get companyIdentifierNumberLabel => 'Identifikator / broj';

  @override
  String get companyOpenTooltip => 'Otvori';

  @override
  String get companyRemoveTooltip => 'Ukloni';

  @override
  String get companyRoleFieldLabel => 'Uloga (npr. Kupac)';

  @override
  String get companyMessagingTitle => 'Poruke';

  @override
  String get companyNoMessagingHint =>
      'Nije dodan kanal za poruke — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Još nema dodanih podataka za kontakt.';

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get settingsSubtitle => 'Jednokratno postavljanje aplikacije.';

  @override
  String get settingsLanguagesTitle => 'Jezici i valuta';

  @override
  String get settingsAppLanguageLabel => 'Jezik aplikacije';

  @override
  String get settingsDictationLanguageLabel => 'Jezik diktiranja';

  @override
  String get settingsCurrencyLabel => 'Valuta';

  @override
  String get settingsFormatsHint =>
      'Iznosi se prikazuju kao 1.234,56 (točka = tisućice, zarez = decimale), a datumi kao dd.mm.gggg, bez obzira na jezik sučelja.';

  @override
  String get settingsCompanyTitle => 'Tvrtka';

  @override
  String get settingsCompanySubtitle =>
      'Identitet tvrtke koja koristi ovaj CRM — kasnije se koristi u zaglavlju (white-label) i zaglavljima PDF dokumenata.';

  @override
  String get settingsSyncTitle => 'Sinkronizacija';

  @override
  String get settingsSyncSubtitle =>
      'Prema zadanim postavkama svi podaci ostaju lokalno (SQLite) na ovom uređaju.';

  @override
  String get settingsSyncLocalTitle => 'Samostalno (samo lokalno)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Nikakvi podaci se ne šalju izvan ovog uređaja';

  @override
  String get settingsSyncRemoteTitle => 'Zajednička baza podataka (udaljena)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Sinkronizira se s PHP + SQLite poslužiteljem (vidi server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Poslužitelj';

  @override
  String get settingsAccountLabel => 'Račun';

  @override
  String get settingsSyncPasswordHint =>
      'Pohranjeno u sigurnom skupu ključeva uređaja — nikad u bazi podataka.';

  @override
  String get settingsSyncNowButton => 'Sinkroniziraj sada';

  @override
  String get settingsSyncPollHint =>
      'Automatsko preuzimanje svakih 25 s u pozadini; trenutno slanje nakon svake promjene (aktivan udaljeni način). Nema preuzimanja tijekom tipkanja.';

  @override
  String get settingsSyncMissingFields =>
      'Potrebni su poslužitelj, račun i lozinka';

  @override
  String get settingsModulesTitle => 'Moduli';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, skener, sinkronizacija… — 7-dnevno probno razdoblje ili aktivacija licence.';

  @override
  String get settingsBrowseModules => 'Pregledaj module';

  @override
  String get settingsImportExportTitle => 'Uvoz / izvoz';

  @override
  String get settingsImportExportSubtitle =>
      'Klijenti, kontakti i prilike kao CSV; kontakti iz vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle => 'Prilagodite faze i njihove oznake.';

  @override
  String get settingsConfigureStages => 'Konfiguriraj faze';

  @override
  String get settingsBackupTitle => 'Lokalna sigurnosna kopija';

  @override
  String get settingsBackupSubtitle =>
      'Izvozi kopiju vaše SQLite baze podataka — korisno prije ažuriranja ili za arhiviranje.';

  @override
  String get settingsExportDbButton => 'Izvezi bazu podataka (.db)';

  @override
  String get settingsBackupShareText => 'Sigurnosna kopija EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Izvoz nije uspio: $error';
  }

  @override
  String get settingsUsersTitle => 'Korisnici';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Računi, uloge i lozinke — administrator i korisnik.';

  @override
  String get settingsUsersSubtitleLocked => 'Samo za administratore.';

  @override
  String get settingsManageUsersButton => 'Upravljanje korisnicima';

  @override
  String get settingsUsersLockedHint =>
      'Prijavite se administratorskim računom za pregled ili uređivanje korisnika i njihovih lozinki.';

  @override
  String get settingsSaveKeychainError =>
      'Postavke spremljene, ali sigurni skup ključeva nije dostupan — lozinku za sinkronizaciju nije bilo moguće spremiti (ponovno pokrenite aplikaciju nakon potpune ponovne izgradnje).';

  @override
  String get settingsSaved => 'Postavke spremljene';

  @override
  String get settingsLogoutConfirmTitle => 'Odjaviti se?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Za povratak ćete morati unijeti lozinku (ili Touch ID).';

  @override
  String get settingsLogoutButton => 'Odjava';

  @override
  String get settingsLogoTitle => 'Logo tvrtke';

  @override
  String get settingsLogoSubtitle =>
      'Prikazuje se na vrhu aplikacije i u banneru.';

  @override
  String get settingsLogoEmpty =>
      'Nema logotipa — dodajte logotip svoje tvrtke';

  @override
  String get settingsLogoChoose => 'Odaberi sliku';

  @override
  String get settingsLogoChange => 'Promijeni logotip';

  @override
  String get usersDeleteSelfError => 'Ne možete izbrisati vlastiti račun';

  @override
  String get usersDeleteConfirmTitle => 'Izbrisati ovog korisnika?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) izgubit će pristup CRM-u.';
  }

  @override
  String get usersTitle => 'Korisnici';

  @override
  String get usersSubtitle => 'Računi, uloge i lozinke.';

  @override
  String get usersAddButton => 'Korisnik';

  @override
  String get usersEmptyTitle => 'Nema korisnika';

  @override
  String get usersEmptySubtitle =>
      'Kreirajte prvi račun — bit će administrator.';

  @override
  String get usersEmptyAction => 'Novi korisnik';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (vi)';
  }

  @override
  String get usersNewTitle => 'Novi korisnik';

  @override
  String get usersEditTitle => 'Uredi korisnika';

  @override
  String get usersLoginIdLabel => 'ID za prijavu';

  @override
  String get usersRoleLabel => 'Uloga';

  @override
  String get usersNewPasswordLabel =>
      'Nova lozinka (ostavite prazno da se ne mijenja)';

  @override
  String get usersTouchIdTitle => 'Touch ID na ovom uređaju';

  @override
  String get usersTouchIdSubtitle =>
      'Otključavanje bez ponovnog unosa lozinke, samo na ovom uređaju.';

  @override
  String get roleAdministrator => 'Administrator';

  @override
  String get roleUser => 'Korisnik';

  @override
  String get dashboardTitleEmbedded => 'Nadzorna ploča';

  @override
  String get dashboardTitle => 'Danas';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString radnji za obradu',
      few: '$countString radnje za obradu',
      one: '$countString radnja za obradu',
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
      other: '+$countString više — vidi sve',
      few: '+$countString više — vidi sve',
      one: '+$countString više — vidi sve',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Svi prodavači';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ja)';
  }

  @override
  String get dashboardEmptyTitle => 'Vaš CRM je spreman';

  @override
  String get dashboardEmptySubtitle =>
      'Dodajte prvog klijenta, uvezite CSV datoteku ili istražite nadolazeće module.';

  @override
  String get dashboardNothingScheduled =>
      'Ništa nije zakazano — vaše naknadne radnje pojavit će se ovdje.';

  @override
  String get dashboardBucketOverdue => 'Zakašnjelo';

  @override
  String get dashboardBucketToday => 'Danas';

  @override
  String get dashboardBucketWeek => 'Ovaj tjedan';

  @override
  String get dashboardBucketLater => 'Kasnije';

  @override
  String get dashboardContactedButton => 'Kontaktirano';

  @override
  String get dashboardDoneButton => 'Gotovo';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Najbolji klijenti (otvoreni pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline po fazi';

  @override
  String get dashboardNoOpportunitiesYet => 'Još nema prilika';

  @override
  String get dashboardWonLostByMonth => 'Dobiveno / izgubljeno po mjesecu';

  @override
  String get dashboardNoClosuresYet => 'Još nema zabilježenih zatvaranja.';

  @override
  String get dashboardRecentActivity => 'Nedavna aktivnost';

  @override
  String get dashboardNoActivityYet => 'Još nema aktivnosti.';

  @override
  String get metricClients => 'Klijenti';

  @override
  String get metricOpportunities => 'Prilike';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Prognoza';

  @override
  String get metricTasks => 'Zadaci';

  @override
  String get metricOverdue => 'Zakašnjelo';

  @override
  String get productTagline => 'Uštedite vrijeme od prvog dana.';

  @override
  String get placeholderDashboardHint =>
      'Pregled: pipeline, naknadne radnje i nedavna aktivnost.';

  @override
  String get placeholderTodayTitle => 'Vaš dan';

  @override
  String get placeholderTodayHint =>
      'Odaberite naknadnu radnju lijevo.\nKlijent se otvara ovdje — bez promjene zaslona.';

  @override
  String get placeholderClientsTitle => 'Kartica klijenta';

  @override
  String get placeholderClientsHint =>
      'Odaberite klijenta s popisa\nili kreirajte novog gumbom +.';

  @override
  String get placeholderPipelineHint =>
      'Povucite karticu između stupaca.\nKliknite za otvaranje kartice klijenta.';

  @override
  String get placeholderTasksHint =>
      'Odaberite zadatak za prikaz povezanog klijenta.';

  @override
  String get modulesSubtitleAppStore =>
      'Pretplatite se putem App Storea ili aktivirajte pretplatu već kupljenu na eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Besplatna proba, kupnja na eastmarkhk.com — ista pretplata kao u aplikaciji EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Aktivno — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktivno — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Proba — preostalo $countString dana',
      few: 'Proba — preostala $countString dana',
      one: 'Proba — preostao $countString dan',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktivno';

  @override
  String get modulesStatusAvailable => 'Dostupno';

  @override
  String get modulesBuyFailed =>
      'Kupnja se nije mogla pokrenuti. Pokušajte ponovno ili vratite svoje kupnje.';

  @override
  String get modulesRestoreDone => 'Vraćanje je dovršeno.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name je aktiviran iz instalirane aplikacije.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licenca nije automatski pronađena. Otvorite EastmarkHK e-Invoicing → Postavke, kopirajte aktivacijski kod i odaberite „Aktiviraj web kod“.';

  @override
  String get modulesRenewalNote =>
      'Automatsko obnavljanje putem App Storea. Upravljajte pretplatom u Postavkama → Apple ID → Pretplate.';

  @override
  String get modulesWebStoreNote =>
      'Ili se pretplatite na eastmarkhk.com i aktivirajte kodom primljenim e-poštom.';

  @override
  String get modulesHaveEinvoicing => 'Već imam EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Isprobajte 7 dana';

  @override
  String get modulesSubscribe => 'Pretplatite se';

  @override
  String get modulesRestore => 'Vrati kupnje';

  @override
  String get modulesWebSubscription => 'Pretplata eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Aktiviraj web kod';

  @override
  String get modulesUseInCrm => 'Koristi u CRM-u';

  @override
  String get modulesDontUseInCrm => 'Ne koristiti u CRM-u';

  @override
  String get modulesBuyOnAppStore => 'Kupi na App Storeu';

  @override
  String get modulesStoreUnavailable =>
      'App Store nije dostupan u ovoj verziji. Koristite verziju za App Store ili aktivirajte pretplatu na eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Provjera kupnji na App Storeu i eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Provjera kupnji na App Storeu…';

  @override
  String get modulesPerMonth => '/ mjesec';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Jeste li se pretplatili na eastmarkhk.com? Zalijepite kod primljen e-poštom. Na iPhone/iPadu početna se kupnja obavlja putem App Storea ili web-mjesta prije aktivacije.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Pretplatite se na eastmarkhk.com, zatim zalijepite aktivacijski kod povezan s ovim uređajem.';

  @override
  String get modulesMachineId => 'ID uređaja';

  @override
  String get modulesCopy => 'Kopiraj';

  @override
  String get modulesSubscriptionEmailLabel => 'E-pošta pretplate';

  @override
  String get modulesActivationCodeLabel => 'Aktivacijski kod';

  @override
  String get modulesActivationCodeHint =>
      'Zalijepite kod primljen nakon kupnje';

  @override
  String get modulesActivate => 'Aktiviraj';

  @override
  String get modulesBuyOnWebsite => 'Kupi na eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Zatraži kod e-poštom';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name je aktiviran putem eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID uređaja kopiran';

  @override
  String get modulesEmailRequired => 'Unesite svoju e-poštu pretplate';

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
  String get invPickClientTitle => 'Odaberi klijenta';

  @override
  String get invPickClientSearch => 'Pretraži po imenu, OIB-u, državi…';

  @override
  String get invPickClientEmpty => 'Nema odgovarajućeg klijenta.';

  @override
  String get invPickClientButton => 'Odaberi klijenta';

  @override
  String get invClientRequired => 'Odaberite klijenta prije spremanja.';

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
  String get invSave => 'Spremi';

  @override
  String get invSaving => 'Spremanje…';

  @override
  String invEditQuote(String number) {
    return 'Uredi ponudu $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Uredi račun $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number spremljen.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Spremanje nije uspjelo: $error';
  }

  @override
  String get invEditDocument => 'Uredi';

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
      'Ponude i računi — podaci iz EastmarkHK e-Invoicing (primici i podsjetnici: samostalna aplikacija)';

  @override
  String get invOpenStandalone => 'Otvori e-Invoicing';

  @override
  String get invLaunchStandalone => 'Pokreni e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Udaljena veza';

  @override
  String invTabQuotes(int count) {
    return 'Ponude ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Računi ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Nema ponuda — izradite jednu iz dobivene prilike ili gumbom iznad.';

  @override
  String get invEmptyInvoices => 'Nema računa.';

  @override
  String get invEmptyCompanyDocs => 'Nema ponuda ni računa.';

  @override
  String get invQuotesSection => 'PONUDE';

  @override
  String get invInvoicesSection => 'RAČUNI';

  @override
  String get invCompanyFooter =>
      'Dokumentima upravlja EastmarkHK e-Invoicing — slanje, PDF, primici i podsjetnici u samostalnoj aplikaciji.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing je u udaljenom načinu rada — veza nije konfigurirana.';

  @override
  String get invConfigure => 'Konfiguriraj';

  @override
  String get invAppNotDetected =>
      'Aplikacija e-Invoicing nije pronađena — instalirajte/pokrenite EastmarkHK e-Invoicing za izradu ponuda i računa iz ovog zapisa.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing konfigurirana je za udaljenu pohranu. Unesite ovdje iste podatke za povezivanje CRM-a s istim API-jem — iste vrijednosti kao u e-Invoicing → Postavke → Udaljena pohrana.';

  @override
  String get invLaunchOnceBody =>
      'Pokrenite EastmarkHK e-Invoicing jednom kako biste inicijalizirali zajedničku bazu podataka, a zatim se vratite ovamo.';

  @override
  String get invAcquireAppStoreBody =>
      'Ovaj modul koristi EastmarkHK e-Invoicing. Preuzmite i pretplatite se putem App Storea, pokrenite je jednom, a zatim se vratite ovamo.';

  @override
  String get invAcquireWebBody =>
      'Ovaj modul koristi EastmarkHK e-Invoicing. Preuzmite i pretplatite se na eastmarkhk.com, pokrenite je jednom, a zatim se vratite ovamo.';

  @override
  String get invConfigureRemote => 'Konfiguriraj udaljenu vezu';

  @override
  String get invViewOnAppStore => 'Pogledaj na App Storeu';

  @override
  String get invViewOnWebsite => 'Pogledaj na eastmarkhk.com';

  @override
  String get invRetry => 'Pokušaj ponovno';

  @override
  String get invDocInvoice => 'Račun';

  @override
  String get invDocQuote => 'Ponuda';

  @override
  String get invDocClient => 'Klijent';

  @override
  String get invDocStatus => 'Status';

  @override
  String get invDocDate => 'Datum';

  @override
  String get invOpenInStandalone => 'Otvori u e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing se nije mogao otvoriti — provjerite je li instaliran.';

  @override
  String get invCreateInvoiceFromQuote => 'Izradi račun';

  @override
  String get invCreatingInvoice => 'Izrada računa…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Račun $number izrađen iz ponude.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Ova ponuda već je fakturirana.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Račun nije moguće izraditi: $error';
  }

  @override
  String get invLinkMenu => 'Veza s e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Klijent e-Invoicing povezan';

  @override
  String get invLinkStatusNone => 'Nema spremljene veze s e-Invoicing';

  @override
  String get invUnlinkCustomer => 'Prekini vezu s klijentom e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Prekinuti vezu s klijentom?';

  @override
  String get invUnlinkConfirmBody =>
      'Sljedeća ponuda ili račun ponovno će tražiti odabir ili izradu klijenta u e-Invoicing.';

  @override
  String get invUnlinkDone => 'Veza s e-Invoicing uklonjena.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing još nije naveden na App Storeu za ovu verziju. Koristite eastmarkhk.com ili pokrenite već instaliranu aplikaciju.';

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
      'Zajednička baza podataka: unesite lozinku za sinkronizaciju u Postavkama za ponovno povezivanje ovog uređaja.';

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
  String get activityTaskCreated => 'Task created';

  @override
  String get dictationOfflineTip =>
      'Offline dictation — it often picks up noise (TV) instead of your voice. Turn ON “Online speech recognition” in Windows Settings → Privacy → Speech, reduce background noise, then try again.';

  @override
  String get dictationLanguageFallbackTip =>
      'This language variant is not installed on Windows — a close match is used. Install the desired speech pack in Settings → Time & language → Speech.';

  @override
  String get dictationStarting => 'Starting dictation…';
}

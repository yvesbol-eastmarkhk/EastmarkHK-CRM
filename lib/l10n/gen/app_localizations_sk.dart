// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonSave => 'Uložiť';

  @override
  String get commonDelete => 'Odstrániť';

  @override
  String get commonEdit => 'Upraviť';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Používateľské meno';

  @override
  String get commonDisplayNameLabel => 'Zobrazované meno';

  @override
  String get commonPasswordLabel => 'Heslo';

  @override
  String get commonConfirmPasswordLabel => 'Potvrďte heslo';

  @override
  String get commonPasswordMismatch => 'Heslá sa nezhodujú';

  @override
  String get commonUsernameTaken => 'Toto používateľské meno je už obsadené';

  @override
  String get commonChoosePassword => 'Zvoľte heslo';

  @override
  String get commonRequiredFields => 'Meno a používateľské meno sú povinné';

  @override
  String get passwordFieldShow => 'Zobraziť';

  @override
  String get passwordFieldHide => 'Skryť';

  @override
  String loginWelcomeBack(String name) {
    return 'Vitajte späť, $name';
  }

  @override
  String get loginTitle => 'Prihlásenie';

  @override
  String get loginVerifying => 'Overuje sa…';

  @override
  String get loginUnlockTouchId => 'Odomknúť pomocou Touch ID';

  @override
  String get loginOr => 'alebo';

  @override
  String get loginRequiredFields => 'Vyžaduje sa používateľské meno a heslo';

  @override
  String get loginInvalidCredentials =>
      'Nesprávne používateľské meno alebo heslo';

  @override
  String get loginSubmit => 'Prihlásiť sa';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Vitajte';

  @override
  String get bootstrapSubtitle =>
      'Vytvorte účet administrátora na zabezpečenie vášho CRM.';

  @override
  String get bootstrapSubmit => 'Vytvoriť účet administrátora';

  @override
  String get commonAdd => 'Pridať';

  @override
  String get commonCreate => 'Vytvoriť';

  @override
  String get commonClose => 'Zavrieť';

  @override
  String get commonNoName => '(bez mena)';

  @override
  String get commonNotesLabel => 'Poznámky';

  @override
  String get commonEmailLabel => 'E-mail';

  @override
  String get commonPhoneLabel => 'Telefón';

  @override
  String get commonFirstNameLabel => 'Krstné meno';

  @override
  String get commonLastNameLabel => 'Priezvisko';

  @override
  String get commonCompanyNameLabel => 'Názov spoločnosti';

  @override
  String messagingCannotOpen(String target) {
    return 'Nie je možné otvoriť $target.';
  }

  @override
  String get messagingEmailAppLabel => 'e-mailovú aplikáciu';

  @override
  String get messagingPhoneAppLabel => 'telefónnu aplikáciu';

  @override
  String messagingIncompleteId(String label) {
    return 'Neúplný identifikátor na otvorenie $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Nie je možné otvoriť $label — je aplikácia nainštalovaná?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat neposkytuje verejný odkaz na konkrétny kontakt — aplikácia sa otvorí, ale konverzáciu treba vybrať ručne.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk neposkytuje verejný odkaz na konkrétny kontakt — aplikácia sa otvorí, ale konverzáciu treba vybrať ručne.';

  @override
  String get messagingPhoneCallLabel => 'Telefonický hovor';

  @override
  String get companyDeleteOpportunityConfirm =>
      'Odstrániť túto obchodnú príležitosť?';

  @override
  String get companyDeleteContactConfirm => 'Odstrániť tento kontakt?';

  @override
  String get companyDeleteTaskConfirm => 'Odstrániť túto úlohu?';

  @override
  String get companyDeleteConfirmTitle => 'Odstrániť tohto klienta?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — jeho kontakty, obchodné príležitosti, úlohy a história budú odstránené spolu s ním.';
  }

  @override
  String get companyNewNoteTitle => 'Nová poznámka';

  @override
  String get companyNoteFieldLabel => 'Poznámka (alebo ju nadiktujte)';

  @override
  String get companyTabOverview => 'Prehľad';

  @override
  String get companyTabActivity => 'Aktivita';

  @override
  String get companyTabTasks => 'Úlohy';

  @override
  String get companyTabDeals => 'Obchodné príležitosti';

  @override
  String get companyContactsTitle => 'Kontakty';

  @override
  String get companyNoContacts => 'Žiadne kontakty';

  @override
  String get companyNoActivity => 'Žiadna aktivita — pridajte poznámku.';

  @override
  String get companyNoTasks => 'Žiadne úlohy';

  @override
  String get companyNoDeals => 'Žiadne obchodné príležitosti';

  @override
  String get companyNoteButtonLabel => 'Poznámka';

  @override
  String get companyNewClientTitle => 'Nový klient';

  @override
  String get companyEditClientTitle => 'Upraviť klienta';

  @override
  String get companyWebsiteLabel => 'Webová stránka';

  @override
  String get companyPeppolLabel => 'ID Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Štítky (oddelené čiarkami)';

  @override
  String get companyNewContactTitle => 'Nový kontakt';

  @override
  String get companyEditContactTitle => 'Upraviť kontakt';

  @override
  String get companyAppLabel => 'Aplikácia';

  @override
  String get companyIdentifierNumberLabel => 'Identifikátor / číslo';

  @override
  String get companyOpenTooltip => 'Otvoriť';

  @override
  String get companyRemoveTooltip => 'Odstrániť';

  @override
  String get companyRoleFieldLabel => 'Rola (napr. Nákupca)';

  @override
  String get companyMessagingTitle => 'Správy';

  @override
  String get companyNoMessagingHint =>
      'Nebol pridaný žiadny komunikačný kanál — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Zatiaľ neboli pridané žiadne kontaktné údaje.';

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get settingsSubtitle => 'Jednorazová konfigurácia aplikácie.';

  @override
  String get settingsLanguagesTitle => 'Jazyky a mena';

  @override
  String get settingsAppLanguageLabel => 'Jazyk aplikácie';

  @override
  String get settingsDictationLanguageLabel => 'Jazyk diktovania';

  @override
  String get settingsCurrencyLabel => 'Mena';

  @override
  String get settingsFormatsHint =>
      'Sumy sa zobrazujú ako 1 234,56 (medzera = tisíce, čiarka = desatinné miesta) a dátumy ako dd.mm.rrrr, bez ohľadu na jazyk rozhrania.';

  @override
  String get settingsCompanyTitle => 'Spoločnosť';

  @override
  String get settingsCompanySubtitle =>
      'Identita spoločnosti používajúcej tento CRM — ďalej použité v záhlaví (white-label) a záhlaviach PDF dokumentov.';

  @override
  String get settingsSyncTitle => 'Synchronizácia';

  @override
  String get settingsSyncSubtitle =>
      'V predvolenom nastavení zostávajú všetky dáta lokálne (SQLite) na tomto zariadení.';

  @override
  String get settingsSyncLocalTitle => 'Samostatné (iba lokálne)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Žiadne dáta sa neodosielajú mimo tohto zariadenia';

  @override
  String get settingsSyncRemoteTitle => 'Zdieľaná databáza (vzdialená)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Synchronizuje sa so serverom PHP + SQLite (pozri server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Server';

  @override
  String get settingsAccountLabel => 'Účet';

  @override
  String get settingsSyncPasswordHint =>
      'Uložené v zabezpečenej kľúčenke zariadenia — nikdy v databáze.';

  @override
  String get settingsSyncNowButton => 'Synchronizovať teraz';

  @override
  String get settingsSyncPollHint =>
      'Automatické sťahovanie každých 25 s na pozadí; okamžité odoslanie po každej zmene (vzdialený režim aktívny). Žiadne sťahovanie počas písania.';

  @override
  String get settingsSyncMissingFields => 'Vyžaduje sa server, účet a heslo';

  @override
  String get settingsModulesTitle => 'Moduly';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, skener, synchronizácia… — 7-dňová skúšobná verzia alebo aktivácia licencie.';

  @override
  String get settingsBrowseModules => 'Prehliadať moduly';

  @override
  String get settingsImportExportTitle => 'Import / export';

  @override
  String get settingsImportExportSubtitle =>
      'Klienti, kontakty a obchodné príležitosti ako CSV; kontakty z vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle => 'Prispôsobte fázy a ich popisky.';

  @override
  String get settingsConfigureStages => 'Konfigurovať fázy';

  @override
  String get settingsBackupTitle => 'Lokálna záloha';

  @override
  String get settingsBackupSubtitle =>
      'Exportuje kópiu vašej databázy SQLite — užitočné pred aktualizáciou alebo na archiváciu.';

  @override
  String get settingsExportDbButton => 'Exportovať databázu (.db)';

  @override
  String get settingsBackupShareText => 'Záloha EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Export zlyhal: $error';
  }

  @override
  String get settingsUsersTitle => 'Používatelia';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Účty, role a heslá — administrátor a používateľ.';

  @override
  String get settingsUsersSubtitleLocked => 'Iba pre administrátorov.';

  @override
  String get settingsManageUsersButton => 'Spravovať používateľov';

  @override
  String get settingsUsersLockedHint =>
      'Prihláste sa pomocou administrátorského účtu na zobrazenie alebo úpravu používateľov a ich hesiel.';

  @override
  String get settingsSaveKeychainError =>
      'Nastavenia uložené, ale zabezpečená kľúčenka nie je k dispozícii — synchronizačné heslo sa nepodarilo uložiť (reštartujte aplikáciu po úplnom prebudovaní).';

  @override
  String get settingsSaved => 'Nastavenia uložené';

  @override
  String get settingsLogoutConfirmTitle => 'Odhlásiť sa?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Na návrat budete musieť zadať heslo (alebo Touch ID).';

  @override
  String get settingsLogoutButton => 'Odhlásiť sa';

  @override
  String get settingsLogoTitle => 'Logo spoločnosti';

  @override
  String get settingsLogoSubtitle =>
      'Zobrazuje sa v hornej časti aplikácie a na banneri.';

  @override
  String get settingsLogoEmpty =>
      'Žiadne logo — pridajte logo svojej spoločnosti';

  @override
  String get settingsLogoChoose => 'Vybrať obrázok';

  @override
  String get settingsLogoChange => 'Zmeniť logo';

  @override
  String get usersDeleteSelfError => 'Nemôžete odstrániť svoj vlastný účet';

  @override
  String get usersDeleteConfirmTitle => 'Odstrániť tohto používateľa?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) stratí prístup do CRM.';
  }

  @override
  String get usersTitle => 'Používatelia';

  @override
  String get usersSubtitle => 'Účty, role a heslá.';

  @override
  String get usersAddButton => 'Používateľ';

  @override
  String get usersEmptyTitle => 'Žiadni používatelia';

  @override
  String get usersEmptySubtitle => 'Vytvorte prvý účet — bude administrátorom.';

  @override
  String get usersEmptyAction => 'Nový používateľ';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (vy)';
  }

  @override
  String get usersNewTitle => 'Nový používateľ';

  @override
  String get usersEditTitle => 'Upraviť používateľa';

  @override
  String get usersLoginIdLabel => 'Prihlasovacie ID';

  @override
  String get usersRoleLabel => 'Rola';

  @override
  String get usersNewPasswordLabel =>
      'Nové heslo (ponechajte prázdne, ak ho nechcete zmeniť)';

  @override
  String get usersTouchIdTitle => 'Touch ID na tomto zariadení';

  @override
  String get usersTouchIdSubtitle =>
      'Odomknutie bez opätovného zadávania hesla, iba na tomto zariadení.';

  @override
  String get roleAdministrator => 'Administrátor';

  @override
  String get roleUser => 'Používateľ';

  @override
  String get dashboardTitleEmbedded => 'Prehľad';

  @override
  String get dashboardTitle => 'Dnes';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString akcií na spracovanie',
      many: '$countString akcie na spracovanie',
      few: '$countString akcie na spracovanie',
      one: '$countString akcia na spracovanie',
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
      other: '+$countString ďalších — zobraziť všetko',
      many: '+$countString ďalšie — zobraziť všetko',
      few: '+$countString ďalšie — zobraziť všetko',
      one: '+$countString ďalšia — zobraziť všetko',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Všetci obchodní zástupcovia';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ja)';
  }

  @override
  String get dashboardEmptyTitle => 'Váš CRM je pripravený';

  @override
  String get dashboardEmptySubtitle =>
      'Pridajte svojho prvého klienta, importujte súbor CSV alebo preskúmajte nadchádzajúce moduly.';

  @override
  String get dashboardNothingScheduled =>
      'Nič naplánované — vaše následné kroky sa zobrazia tu.';

  @override
  String get dashboardBucketOverdue => 'Po termíne';

  @override
  String get dashboardBucketToday => 'Dnes';

  @override
  String get dashboardBucketWeek => 'Tento týždeň';

  @override
  String get dashboardBucketLater => 'Neskôr';

  @override
  String get dashboardContactedButton => 'Kontaktovaný';

  @override
  String get dashboardDoneButton => 'Hotovo';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Najlepší klienti (otvorený pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline podľa fázy';

  @override
  String get dashboardNoOpportunitiesYet =>
      'Zatiaľ žiadne obchodné príležitosti';

  @override
  String get dashboardWonLostByMonth => 'Vyhraté / prehraté podľa mesiaca';

  @override
  String get dashboardNoClosuresYet => 'Zatiaľ žiadne zaznamenané uzávierky.';

  @override
  String get dashboardRecentActivity => 'Nedávna aktivita';

  @override
  String get dashboardNoActivityYet => 'Zatiaľ žiadna aktivita.';

  @override
  String get metricClients => 'Klienti';

  @override
  String get metricOpportunities => 'Obchodné príležitosti';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Prognóza';

  @override
  String get metricTasks => 'Úlohy';

  @override
  String get metricOverdue => 'Po termíne';

  @override
  String get productTagline => 'Šetrite čas od prvého dňa.';

  @override
  String get placeholderDashboardHint =>
      'Prehľad: pipeline, následné kroky a nedávna aktivita.';

  @override
  String get placeholderTodayTitle => 'Váš deň';

  @override
  String get placeholderTodayHint =>
      'Vyberte následný krok vľavo.\nKlient sa otvorí tu — bez prepínania obrazoviek.';

  @override
  String get placeholderClientsTitle => 'Karta klienta';

  @override
  String get placeholderClientsHint =>
      'Vyberte klienta zo zoznamu\nalebo vytvorte nového tlačidlom +.';

  @override
  String get placeholderPipelineHint =>
      'Presuňte kartu medzi stĺpcami.\nKliknutím otvorte kartu klienta.';

  @override
  String get placeholderTasksHint =>
      'Vyberte úlohu na zobrazenie súvisiaceho klienta.';

  @override
  String get modulesSubtitleAppStore =>
      'Prihláste sa na odber cez App Store alebo aktivujte predplatné už zakúpené na eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Bezplatná skúšobná verzia, nákup na eastmarkhk.com — rovnaké predplatné ako aplikácia EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Aktívne — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktívne — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skúška — zostáva $countString dní',
      many: 'Skúška — zostáva $countString dní',
      few: 'Skúška — zostávajú $countString dni',
      one: 'Skúška — zostáva $countString deň',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktívne';

  @override
  String get modulesStatusAvailable => 'Dostupné';

  @override
  String get modulesBuyFailed =>
      'Nákup sa nepodarilo spustiť. Skúste to znova alebo obnovte svoje nákupy.';

  @override
  String get modulesRestoreDone => 'Obnovenie dokončené.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name aktivované z nainštalovanej aplikácie.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licencia sa nenašla automaticky. Otvorte EastmarkHK e-Invoicing → Nastavenia, skopírujte aktivačný kód a vyberte „Aktivovať webový kód“.';

  @override
  String get modulesRenewalNote =>
      'Automatické obnovenie cez App Store. Spravujte predplatné v Nastaveniach → Apple ID → Predplatné.';

  @override
  String get modulesWebStoreNote =>
      'Alebo sa prihláste na odber na eastmarkhk.com a aktivujte kódom zaslaným e-mailom.';

  @override
  String get modulesHaveEinvoicing => 'Už mám EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Vyskúšať 7 dní';

  @override
  String get modulesSubscribe => 'Prihlásiť sa na odber';

  @override
  String get modulesRestore => 'Obnoviť nákupy';

  @override
  String get modulesWebSubscription => 'Predplatné eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Aktivovať webový kód';

  @override
  String get modulesUseInCrm => 'Použiť v CRM';

  @override
  String get modulesDontUseInCrm => 'Nepoužívať v CRM';

  @override
  String get modulesBuyOnAppStore => 'Kúpiť v App Store';

  @override
  String get modulesStoreUnavailable =>
      'App Store nie je v tejto verzii k dispozícii. Použite verziu z App Store, alebo aktivujte predplatné eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Kontrola nákupov App Store a eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Kontrola nákupov App Store…';

  @override
  String get modulesPerMonth => '/ mesiac';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Prihlásili ste sa na odber na eastmarkhk.com? Vložte kód zaslaný e-mailom. Na iPhone/iPad sa počiatočný nákup uskutoční cez App Store alebo web pred aktiváciou.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Prihláste sa na odber na eastmarkhk.com a potom vložte aktivačný kód pripojený k tomuto zariadeniu.';

  @override
  String get modulesMachineId => 'ID zariadenia';

  @override
  String get modulesCopy => 'Kopírovať';

  @override
  String get modulesSubscriptionEmailLabel => 'E-mail predplatného';

  @override
  String get modulesActivationCodeLabel => 'Aktivačný kód';

  @override
  String get modulesActivationCodeHint => 'Vložte kód obdržaný po nákupe';

  @override
  String get modulesActivate => 'Aktivovať';

  @override
  String get modulesBuyOnWebsite => 'Kúpiť na eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Vyžiadať kód e-mailom';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name aktivované cez eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID zariadenia skopírované';

  @override
  String get modulesEmailRequired => 'Zadajte svoj e-mail predplatného';

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
  String get invPickClientTitle => 'Vybrať klienta';

  @override
  String get invPickClientSearch => 'Hľadať podľa mena, IČ DPH, krajiny…';

  @override
  String get invPickClientEmpty => 'Žiadny zodpovedajúci klient.';

  @override
  String get invPickClientButton => 'Vybrať klienta';

  @override
  String get invClientRequired => 'Pred uložením vyberte klienta.';

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
  String get invSave => 'Uložiť';

  @override
  String get invSaving => 'Ukladá sa…';

  @override
  String invEditQuote(String number) {
    return 'Upraviť ponuku $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Upraviť faktúru $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number uložené.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Uloženie zlyhalo: $error';
  }

  @override
  String get invEditDocument => 'Upraviť';

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
      'Ponuky a faktúry — údaje z EastmarkHK e-Invoicing (potvrdenia a upomienky: samostatná aplikácia)';

  @override
  String get invOpenStandalone => 'Otvoriť e-Invoicing';

  @override
  String get invLaunchStandalone => 'Spustiť e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Vzdialené pripojenie';

  @override
  String invTabQuotes(int count) {
    return 'Ponuky ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Faktúry ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Žiadne ponuky — vytvorte jednu z vyhratej príležitosti alebo tlačidlom vyššie.';

  @override
  String get invEmptyInvoices => 'Žiadne faktúry.';

  @override
  String get invEmptyCompanyDocs => 'Žiadne ponuky ani faktúry.';

  @override
  String get invQuotesSection => 'PONUKY';

  @override
  String get invInvoicesSection => 'FAKTÚRY';

  @override
  String get invCompanyFooter =>
      'Dokumenty spravuje EastmarkHK e-Invoicing — odosielanie, PDF, potvrdenia a upomienky v samostatnej aplikácii.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing je v vzdialenom režime — pripojenie nie je nakonfigurované.';

  @override
  String get invConfigure => 'Nastaviť';

  @override
  String get invAppNotDetected =>
      'Aplikácia e-Invoicing nebola nájdená — nainštalujte/spustite EastmarkHK e-Invoicing na vytváranie ponúk a faktúr z tohto záznamu.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing je nastavená na vzdialené úložisko. Zadajte tu rovnaké prihlasovacie údaje na pripojenie CRM k rovnakému API — rovnaké hodnoty ako v e-Invoicing → Nastavenia → Vzdialené úložisko.';

  @override
  String get invLaunchOnceBody =>
      'Spustite EastmarkHK e-Invoicing raz, aby sa inicializovala zdieľaná databáza, potom sa sem vráťte.';

  @override
  String get invAcquireAppStoreBody =>
      'Tento modul používa EastmarkHK e-Invoicing. Stiahnite si ju a predplaťte cez App Store, raz ju spustite a vráťte sa sem.';

  @override
  String get invAcquireWebBody =>
      'Tento modul používa EastmarkHK e-Invoicing. Stiahnite si ju a predplaťte na eastmarkhk.com, raz ju spustite a vráťte sa sem.';

  @override
  String get invConfigureRemote => 'Nastaviť vzdialené pripojenie';

  @override
  String get invViewOnAppStore => 'Zobraziť v App Store';

  @override
  String get invViewOnWebsite => 'Zobraziť na eastmarkhk.com';

  @override
  String get invRetry => 'Skúsiť znova';

  @override
  String get invDocInvoice => 'Faktúra';

  @override
  String get invDocQuote => 'Ponuka';

  @override
  String get invDocClient => 'Klient';

  @override
  String get invDocStatus => 'Stav';

  @override
  String get invDocDate => 'Dátum';

  @override
  String get invOpenInStandalone => 'Otvoriť v e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing sa nepodarilo otvoriť — skontrolujte, či je nainštalovaná.';

  @override
  String get invCreateInvoiceFromQuote => 'Vytvoriť faktúru';

  @override
  String get invCreatingInvoice => 'Vytváranie faktúry…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Faktúra $number vytvorená z ponuky.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Táto ponuka už bola vyfakturovaná.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Faktúru sa nepodarilo vytvoriť: $error';
  }

  @override
  String get invLinkMenu => 'Prepojenie s e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Klient e-Invoicing prepojený';

  @override
  String get invLinkStatusNone => 'Žiadne uložené prepojenie s e-Invoicing';

  @override
  String get invUnlinkCustomer => 'Zrušiť prepojenie klienta e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Zrušiť prepojenie klienta?';

  @override
  String get invUnlinkConfirmBody =>
      'Ďalšia ponuka alebo faktúra si znova vyžiada výber alebo vytvorenie klienta v e-Invoicing.';

  @override
  String get invUnlinkDone => 'Prepojenie s e-Invoicing zrušené.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing zatiaľ nie je pre túto verziu uvedená v App Store. Použite eastmarkhk.com alebo spustite už nainštalovanú aplikáciu.';

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
      'Zdieľaná databáza: zadajte synchronizačné heslo v Nastaveniach na opätovné pripojenie tohto zariadenia.';

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
}

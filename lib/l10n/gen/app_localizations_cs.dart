// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonSave => 'Uložit';

  @override
  String get commonDelete => 'Smazat';

  @override
  String get commonEdit => 'Upravit';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Uživatelské jméno';

  @override
  String get commonDisplayNameLabel => 'Zobrazované jméno';

  @override
  String get commonPasswordLabel => 'Heslo';

  @override
  String get commonConfirmPasswordLabel => 'Potvrďte heslo';

  @override
  String get commonPasswordMismatch => 'Hesla se neshodují';

  @override
  String get commonUsernameTaken => 'Toto uživatelské jméno je již obsazeno';

  @override
  String get commonChoosePassword => 'Zvolte heslo';

  @override
  String get commonRequiredFields => 'Jméno a uživatelské jméno jsou povinné';

  @override
  String get passwordFieldShow => 'Zobrazit';

  @override
  String get passwordFieldHide => 'Skrýt';

  @override
  String loginWelcomeBack(String name) {
    return 'Vítejte zpět, $name';
  }

  @override
  String get loginTitle => 'Přihlášení';

  @override
  String get loginVerifying => 'Ověřování…';

  @override
  String get loginUnlockTouchId => 'Odemknout pomocí Touch ID';

  @override
  String get loginOr => 'nebo';

  @override
  String get loginRequiredFields => 'Je vyžadováno uživatelské jméno a heslo';

  @override
  String get loginInvalidCredentials =>
      'Nesprávné uživatelské jméno nebo heslo';

  @override
  String get loginSubmit => 'Přihlásit se';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Vítejte';

  @override
  String get bootstrapSubtitle =>
      'Vytvořte účet administrátora a zabezpečte svůj CRM.';

  @override
  String get bootstrapSubmit => 'Vytvořit účet administrátora';

  @override
  String get commonAdd => 'Přidat';

  @override
  String get commonCreate => 'Vytvořit';

  @override
  String get commonClose => 'Zavřít';

  @override
  String get commonNoName => '(bez jména)';

  @override
  String get commonNotesLabel => 'Poznámky';

  @override
  String get commonEmailLabel => 'E-mail';

  @override
  String get commonPhoneLabel => 'Telefon';

  @override
  String get commonFirstNameLabel => 'Křestní jméno';

  @override
  String get commonLastNameLabel => 'Příjmení';

  @override
  String get commonCompanyNameLabel => 'Název společnosti';

  @override
  String messagingCannotOpen(String target) {
    return 'Nelze otevřít $target.';
  }

  @override
  String get messagingEmailAppLabel => 'e-mailovou aplikaci';

  @override
  String get messagingPhoneAppLabel => 'telefonní aplikaci';

  @override
  String messagingIncompleteId(String label) {
    return 'Neúplný identifikátor pro otevření $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Nelze otevřít $label — je aplikace nainstalována?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat neposkytuje veřejný odkaz na konkrétní kontakt — aplikace se otevře, ale konverzaci je nutné vybrat ručně.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk neposkytuje veřejný odkaz na konkrétní kontakt — aplikace se otevře, ale konverzaci je nutné vybrat ručně.';

  @override
  String get messagingPhoneCallLabel => 'Telefonní hovor';

  @override
  String get companyDeleteOpportunityConfirm =>
      'Smazat tuto obchodní příležitost?';

  @override
  String get companyDeleteContactConfirm => 'Smazat tento kontakt?';

  @override
  String get companyDeleteTaskConfirm => 'Smazat tento úkol?';

  @override
  String get companyDeleteConfirmTitle => 'Smazat tohoto klienta?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — jeho kontakty, obchodní příležitosti, úkoly a historie budou smazány spolu s ním.';
  }

  @override
  String get companyNewNoteTitle => 'Nová poznámka';

  @override
  String get companyNoteFieldLabel => 'Poznámka (nebo ji nadiktujte)';

  @override
  String get companyTabOverview => 'Přehled';

  @override
  String get companyTabActivity => 'Aktivita';

  @override
  String get companyTabTasks => 'Úkoly';

  @override
  String get companyTabDeals => 'Obchodní příležitosti';

  @override
  String get companyContactsTitle => 'Kontakty';

  @override
  String get companyNoContacts => 'Žádné kontakty';

  @override
  String get companyNoActivity => 'Žádná aktivita — přidejte poznámku.';

  @override
  String get companyNoTasks => 'Žádné úkoly';

  @override
  String get companyNoDeals => 'Žádné obchodní příležitosti';

  @override
  String get companyNoteButtonLabel => 'Poznámka';

  @override
  String get companyNewClientTitle => 'Nový klient';

  @override
  String get companyEditClientTitle => 'Upravit klienta';

  @override
  String get companyWebsiteLabel => 'Webové stránky';

  @override
  String get companyPeppolLabel => 'ID Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Štítky (oddělené čárkami)';

  @override
  String get companyNewContactTitle => 'Nový kontakt';

  @override
  String get companyEditContactTitle => 'Upravit kontakt';

  @override
  String get companyAppLabel => 'Aplikace';

  @override
  String get companyIdentifierNumberLabel => 'Identifikátor / číslo';

  @override
  String get companyOpenTooltip => 'Otevřít';

  @override
  String get companyRemoveTooltip => 'Odebrat';

  @override
  String get companyRoleFieldLabel => 'Role (např. Nákupčí)';

  @override
  String get companyMessagingTitle => 'Zprávy';

  @override
  String get companyNoMessagingHint =>
      'Nebyl přidán žádný komunikační kanál — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Zatím nebyly přidány žádné kontaktní údaje.';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get settingsSubtitle => 'Jednorázová konfigurace aplikace.';

  @override
  String get settingsLanguagesTitle => 'Jazyky a měna';

  @override
  String get settingsAppLanguageLabel => 'Jazyk aplikace';

  @override
  String get settingsDictationLanguageLabel => 'Jazyk diktování';

  @override
  String get settingsCurrencyLabel => 'Měna';

  @override
  String get settingsFormatsHint =>
      'Částky se zobrazují jako 1 234,56 (mezera = tisíce, čárka = desetinná místa) a data jako dd.mm.rrrr, bez ohledu na jazyk rozhraní.';

  @override
  String get settingsCompanyTitle => 'Společnost';

  @override
  String get settingsCompanySubtitle =>
      'Identita společnosti používající tento CRM — dále použito v záhlaví (white-label) a záhlaví PDF dokumentů.';

  @override
  String get settingsSyncTitle => 'Synchronizace';

  @override
  String get settingsSyncSubtitle =>
      'Ve výchozím nastavení zůstávají všechna data lokálně (SQLite) na tomto zařízení.';

  @override
  String get settingsSyncLocalTitle => 'Samostatné (pouze lokální)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Žádná data nejsou odesílána mimo toto zařízení';

  @override
  String get settingsSyncRemoteTitle => 'Sdílená databáze (vzdálená)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Synchronizuje se se serverem PHP + SQLite (viz server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Server';

  @override
  String get settingsAccountLabel => 'Účet';

  @override
  String get settingsSyncPasswordHint =>
      'Uloženo v zabezpečené klíčence zařízení — nikdy v databázi.';

  @override
  String get settingsSyncNowButton => 'Synchronizovat nyní';

  @override
  String get settingsSyncPollHint =>
      'Automatické stahování každých 25 s na pozadí; okamžité odeslání po každé změně (vzdálený režim aktivní). Žádné stahování během psaní.';

  @override
  String get settingsSyncMissingFields => 'Vyžadován server, účet a heslo';

  @override
  String get settingsModulesTitle => 'Moduly';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, skener, synchronizace… — 7denní zkušební verze nebo aktivace licence.';

  @override
  String get settingsBrowseModules => 'Procházet moduly';

  @override
  String get settingsImportExportTitle => 'Import / export';

  @override
  String get settingsImportExportSubtitle =>
      'Klienti, kontakty a obchodní příležitosti jako CSV; kontakty z vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle => 'Přizpůsobte fáze a jejich popisky.';

  @override
  String get settingsConfigureStages => 'Konfigurovat fáze';

  @override
  String get settingsBackupTitle => 'Místní záloha';

  @override
  String get settingsBackupSubtitle =>
      'Exportuje kopii vaší databáze SQLite — užitečné před aktualizací nebo pro archivaci.';

  @override
  String get settingsExportDbButton => 'Exportovat databázi (.db)';

  @override
  String get settingsBackupShareText => 'Záloha EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Export se nezdařil: $error';
  }

  @override
  String get settingsUsersTitle => 'Uživatelé';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Účty, role a hesla — administrátor a uživatel.';

  @override
  String get settingsUsersSubtitleLocked => 'Pouze pro administrátory.';

  @override
  String get settingsManageUsersButton => 'Spravovat uživatele';

  @override
  String get settingsUsersLockedHint =>
      'Přihlaste se pomocí administrátorského účtu, chcete-li zobrazit nebo upravit uživatele a jejich hesla.';

  @override
  String get settingsSaveKeychainError =>
      'Nastavení uloženo, ale zabezpečená klíčenka není k dispozici — synchronizační heslo se nepodařilo uložit (restartujte aplikaci po úplném znovusestavení).';

  @override
  String get settingsSaved => 'Nastavení uloženo';

  @override
  String get settingsLogoutConfirmTitle => 'Odhlásit se?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Pro návrat budete muset zadat heslo (nebo Touch ID).';

  @override
  String get settingsLogoutButton => 'Odhlásit se';

  @override
  String get settingsLogoTitle => 'Logo společnosti';

  @override
  String get settingsLogoSubtitle =>
      'Zobrazuje se v horní části aplikace a na banneru.';

  @override
  String get settingsLogoEmpty => 'Žádné logo — přidejte logo své společnosti';

  @override
  String get settingsLogoChoose => 'Vybrat obrázek';

  @override
  String get settingsLogoChange => 'Změnit logo';

  @override
  String get usersDeleteSelfError => 'Nelze smazat váš vlastní účet';

  @override
  String get usersDeleteConfirmTitle => 'Smazat tohoto uživatele?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) ztratí přístup do CRM.';
  }

  @override
  String get usersTitle => 'Uživatelé';

  @override
  String get usersSubtitle => 'Účty, role a hesla.';

  @override
  String get usersAddButton => 'Uživatel';

  @override
  String get usersEmptyTitle => 'Žádní uživatelé';

  @override
  String get usersEmptySubtitle =>
      'Vytvořte první účet — bude administrátorem.';

  @override
  String get usersEmptyAction => 'Nový uživatel';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (vy)';
  }

  @override
  String get usersNewTitle => 'Nový uživatel';

  @override
  String get usersEditTitle => 'Upravit uživatele';

  @override
  String get usersLoginIdLabel => 'Přihlašovací ID';

  @override
  String get usersRoleLabel => 'Role';

  @override
  String get usersNewPasswordLabel =>
      'Nové heslo (ponechte prázdné, pokud nechcete měnit)';

  @override
  String get usersTouchIdTitle => 'Touch ID na tomto zařízení';

  @override
  String get usersTouchIdSubtitle =>
      'Odemknutí bez opětovného zadávání hesla, pouze na tomto zařízení.';

  @override
  String get roleAdministrator => 'Administrátor';

  @override
  String get roleUser => 'Uživatel';

  @override
  String get dashboardTitleEmbedded => 'Přehled';

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
      other: '$countString akcí ke zpracování',
      many: '$countString akce ke zpracování',
      few: '$countString akce ke zpracování',
      one: '$countString akce ke zpracování',
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
      other: '+$countString dalších — zobrazit vše',
      many: '+$countString další — zobrazit vše',
      few: '+$countString další — zobrazit vše',
      one: '+$countString další — zobrazit vše',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Všichni obchodní zástupci';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (já)';
  }

  @override
  String get dashboardEmptyTitle => 'Váš CRM je připraven';

  @override
  String get dashboardEmptySubtitle =>
      'Přidejte svého prvního klienta, importujte soubor CSV nebo prozkoumejte nadcházející moduly.';

  @override
  String get dashboardNothingScheduled =>
      'Nic naplánováno — vaše následné kroky se zobrazí zde.';

  @override
  String get dashboardBucketOverdue => 'Po termínu';

  @override
  String get dashboardBucketToday => 'Dnes';

  @override
  String get dashboardBucketWeek => 'Tento týden';

  @override
  String get dashboardBucketLater => 'Později';

  @override
  String get dashboardContactedButton => 'Kontaktováno';

  @override
  String get dashboardDoneButton => 'Hotovo';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Nejlepší klienti (otevřený pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline podle fáze';

  @override
  String get dashboardNoOpportunitiesYet => 'Zatím žádné obchodní příležitosti';

  @override
  String get dashboardWonLostByMonth => 'Vyhráno / prohráno podle měsíce';

  @override
  String get dashboardNoClosuresYet => 'Zatím žádné zaznamenané uzávěrky.';

  @override
  String get dashboardRecentActivity => 'Nedávná aktivita';

  @override
  String get dashboardNoActivityYet => 'Zatím žádná aktivita.';

  @override
  String get metricClients => 'Klienti';

  @override
  String get metricOpportunities => 'Obchodní příležitosti';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Prognóza';

  @override
  String get metricTasks => 'Úkoly';

  @override
  String get metricOverdue => 'Po termínu';

  @override
  String get productTagline => 'Šetřete čas od prvního dne.';

  @override
  String get placeholderDashboardHint =>
      'Přehled: pipeline, následné kroky a nedávná aktivita.';

  @override
  String get placeholderTodayTitle => 'Váš den';

  @override
  String get placeholderTodayHint =>
      'Vyberte následný krok vlevo.\nKlient se otevře zde — bez přepínání obrazovek.';

  @override
  String get placeholderClientsTitle => 'Karta klienta';

  @override
  String get placeholderClientsHint =>
      'Vyberte klienta ze seznamu\nnebo vytvořte nového tlačítkem +.';

  @override
  String get placeholderPipelineHint =>
      'Přetáhněte kartu mezi sloupci.\nKliknutím otevřete kartu klienta.';

  @override
  String get placeholderTasksHint =>
      'Vyberte úkol pro zobrazení souvisejícího klienta.';

  @override
  String get modulesSubtitleAppStore =>
      'Přihlaste se k odběru přes App Store nebo aktivujte předplatné již zakoupené na eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Bezplatná zkušební verze, nákup na eastmarkhk.com — stejné předplatné jako aplikace EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Aktivní — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktivní — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zkušební — zbývá $countString dní',
      many: 'Zkušební — zbývá $countString dnů',
      few: 'Zkušební — zbývají $countString dny',
      one: 'Zkušební — zbývá $countString den',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktivní';

  @override
  String get modulesStatusAvailable => 'Dostupné';

  @override
  String get modulesBuyFailed =>
      'Nákup se nepodařilo spustit. Zkuste to znovu nebo obnovte své nákupy.';

  @override
  String get modulesRestoreDone => 'Obnovení dokončeno.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name aktivováno z nainstalované aplikace.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licence nebyla automaticky nalezena. Otevřete EastmarkHK e-Invoicing → Nastavení, zkopírujte aktivační kód a zvolte „Aktivovat webový kód“.';

  @override
  String get modulesRenewalNote =>
      'Automatické obnovení přes App Store. Spravujte předplatné v Nastavení → Apple ID → Předplatná.';

  @override
  String get modulesWebStoreNote =>
      'Nebo se přihlaste k odběru na eastmarkhk.com a aktivujte kódem zaslaným e-mailem.';

  @override
  String get modulesHaveEinvoicing => 'Už mám EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Vyzkoušet 7 dní';

  @override
  String get modulesSubscribe => 'Přihlásit k odběru';

  @override
  String get modulesRestore => 'Obnovit nákupy';

  @override
  String get modulesWebSubscription => 'Předplatné eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Aktivovat webový kód';

  @override
  String get modulesUseInCrm => 'Použít v CRM';

  @override
  String get modulesDontUseInCrm => 'Ne pas utiliser dans le CRM';

  @override
  String get modulesBuyOnAppStore => 'Acheter sur l\'App Store';

  @override
  String get modulesStoreUnavailable =>
      'L\'App Store n\'est pas disponible sur cette installation. Utilisez une build App Store, ou activez un abonnement eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Vérification des achats App Store et eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Vérification des achats App Store…';

  @override
  String get modulesPerMonth => '/ měsíc';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Přihlásili jste se k odběru na eastmarkhk.com? Vložte kód zaslaný e-mailem. Na iPhone/iPad se počáteční nákup provádí přes App Store nebo web před aktivací.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Přihlaste se k odběru na eastmarkhk.com a poté vložte aktivační kód propojený s tímto zařízením.';

  @override
  String get modulesMachineId => 'ID zařízení';

  @override
  String get modulesCopy => 'Kopírovat';

  @override
  String get modulesSubscriptionEmailLabel => 'E-mail k předplatnému';

  @override
  String get modulesActivationCodeLabel => 'Aktivační kód';

  @override
  String get modulesActivationCodeHint => 'Vložte kód obdržený po nákupu';

  @override
  String get modulesActivate => 'Aktivovat';

  @override
  String get modulesBuyOnWebsite => 'Koupit na eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Vyžádat kód e-mailem';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name aktivováno přes eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'ID zařízení zkopírováno';

  @override
  String get modulesEmailRequired => 'Zadejte svůj e-mail k předplatnému';

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
  String get invPickClientTitle => 'Choisir un client';

  @override
  String get invPickClientSearch => 'Rechercher par nom, n° fiscal, pays…';

  @override
  String get invPickClientEmpty => 'Aucun client correspondant.';

  @override
  String get invPickClientButton => 'Choisir le client';

  @override
  String get invClientRequired => 'Choisissez un client avant d’enregistrer.';

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
  String get invSave => 'Enregistrer';

  @override
  String get invSaving => 'Enregistrement…';

  @override
  String invEditQuote(String number) {
    return 'Modifier le devis $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Modifier la facture $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number enregistré.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Enregistrement impossible : $error';
  }

  @override
  String get invEditDocument => 'Modifier';

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
      'Devis et factures — données EastmarkHK e-Invoicing (reçues et relances : app standalone)';

  @override
  String get invOpenStandalone => 'Ouvrir e-Invoicing';

  @override
  String get invLaunchStandalone => 'Lancer e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Connexion distante';

  @override
  String invTabQuotes(int count) {
    return 'Devis ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Factures ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Aucun devis — créez-en un depuis une opportunité gagnée ou le bouton ci-dessus.';

  @override
  String get invEmptyInvoices => 'Aucune facture.';

  @override
  String get invEmptyCompanyDocs => 'Aucun devis ni facture.';

  @override
  String get invQuotesSection => 'DEVIS';

  @override
  String get invInvoicesSection => 'FACTURES';

  @override
  String get invCompanyFooter =>
      'Documents gérés par EastmarkHK e-Invoicing — envoi, PDF, reçues et relances dans l\'app standalone.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing est en mode distant — connexion non configurée.';

  @override
  String get invConfigure => 'Configurer';

  @override
  String get invAppNotDetected =>
      'App e-Invoicing non détectée — installez/lancez EastmarkHK e-Invoicing pour créer des devis et factures depuis cette fiche.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing est configurée en mode « stockage distant ». Renseigne les mêmes identifiants ici pour connecter le CRM à la même API — mêmes valeurs que dans e-Invoicing → Réglages → Stockage distant.';

  @override
  String get invLaunchOnceBody =>
      'Lancez l\'app EastmarkHK e-Invoicing une première fois pour initialiser la base partagée, puis revenez ici.';

  @override
  String get invAcquireAppStoreBody =>
      'Le module utilise l\'app EastmarkHK e-Invoicing. Téléchargez-la et abonnez-vous depuis l\'App Store, lancez-la une fois, puis revenez ici.';

  @override
  String get invAcquireWebBody =>
      'Le module utilise l\'app EastmarkHK e-Invoicing. Téléchargez-la et souscrivez sur eastmarkhk.com, lancez-la une fois, puis revenez ici.';

  @override
  String get invConfigureRemote => 'Configurer la connexion distante';

  @override
  String get invViewOnAppStore => 'Voir sur l\'App Store';

  @override
  String get invViewOnWebsite => 'Voir sur eastmarkhk.com';

  @override
  String get invRetry => 'Réessayer';

  @override
  String get invDocInvoice => 'Facture';

  @override
  String get invDocQuote => 'Devis';

  @override
  String get invDocClient => 'Client';

  @override
  String get invDocStatus => 'Statut';

  @override
  String get invDocDate => 'Date';

  @override
  String get invOpenInStandalone => 'Ouvrir dans e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Impossible d\'ouvrir e-Invoicing — vérifie qu\'elle est bien installée.';

  @override
  String get invCreateInvoiceFromQuote => 'Créer la facture';

  @override
  String get invCreatingInvoice => 'Création de la facture…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Facture $number créée à partir du devis.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Ce devis est déjà facturé.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Impossible de créer la facture : $error';
  }

  @override
  String get invLinkMenu => 'Lien e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Client e-Invoicing lié';

  @override
  String get invLinkStatusNone => 'Aucun lien e-Invoicing mémorisé';

  @override
  String get invUnlinkCustomer => 'Dissocier le client e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Dissocier le client ?';

  @override
  String get invUnlinkConfirmBody =>
      'Le prochain devis ou facture redemandera de choisir ou créer le client dans e-Invoicing.';

  @override
  String get invUnlinkDone => 'Lien e-Invoicing dissocié.';

  @override
  String get invAppStoreUrlMissing =>
      'L\'app e-Invoicing n\'est pas encore listée sur l\'App Store pour ce build. Utilisez eastmarkhk.com ou lancez l\'app déjà installée.';

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
      'Base partagée : saisissez le mot de passe sync dans Réglages pour reconnecter cet appareil.';

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

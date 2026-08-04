// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonSave => 'Mentés';

  @override
  String get commonDelete => 'Törlés';

  @override
  String get commonEdit => 'Szerkesztés';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Felhasználónév';

  @override
  String get commonDisplayNameLabel => 'Megjelenített név';

  @override
  String get commonPasswordLabel => 'Jelszó';

  @override
  String get commonConfirmPasswordLabel => 'Jelszó megerősítése';

  @override
  String get commonPasswordMismatch => 'A jelszavak nem egyeznek';

  @override
  String get commonUsernameTaken => 'Ez a felhasználónév már foglalt';

  @override
  String get commonChoosePassword => 'Válasszon jelszót';

  @override
  String get commonRequiredFields => 'A név és a felhasználónév kötelező';

  @override
  String get passwordFieldShow => 'Megjelenítés';

  @override
  String get passwordFieldHide => 'Elrejtés';

  @override
  String loginWelcomeBack(String name) {
    return 'Üdvözöljük ismét, $name';
  }

  @override
  String get loginTitle => 'Bejelentkezés';

  @override
  String get loginVerifying => 'Ellenőrzés…';

  @override
  String get loginUnlockTouchId => 'Feloldás Touch ID-vel';

  @override
  String get loginOr => 'vagy';

  @override
  String get loginRequiredFields => 'Felhasználónév és jelszó szükséges';

  @override
  String get loginInvalidCredentials => 'Helytelen felhasználónév vagy jelszó';

  @override
  String get loginSubmit => 'Bejelentkezés';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Üdvözöljük';

  @override
  String get bootstrapSubtitle =>
      'Hozza létre az adminisztrátori fiókot a CRM védelméhez.';

  @override
  String get bootstrapSubmit => 'Adminisztrátori fiók létrehozása';

  @override
  String get commonAdd => 'Hozzáadás';

  @override
  String get commonCreate => 'Létrehozás';

  @override
  String get commonClose => 'Bezárás';

  @override
  String get commonNoName => '(nincs név)';

  @override
  String get commonNotesLabel => 'Jegyzetek';

  @override
  String get commonEmailLabel => 'E-mail';

  @override
  String get commonPhoneLabel => 'Telefon';

  @override
  String get commonFirstNameLabel => 'Keresztnév';

  @override
  String get commonLastNameLabel => 'Vezetéknév';

  @override
  String get commonCompanyNameLabel => 'Cégnév';

  @override
  String messagingCannotOpen(String target) {
    return 'Nem sikerült megnyitni: $target.';
  }

  @override
  String get messagingEmailAppLabel => 'az e-mail alkalmazást';

  @override
  String get messagingPhoneAppLabel => 'a telefon alkalmazást';

  @override
  String messagingIncompleteId(String label) {
    return 'Hiányos azonosító a(z) $label megnyitásához.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Nem sikerült megnyitni: $label — telepítve van az alkalmazás?';
  }

  @override
  String get messagingWechatNote =>
      'A WeChat nem biztosít nyilvános linket egy adott partnerhez — az alkalmazás megnyílik, de a beszélgetést manuálisan kell kiválasztani.';

  @override
  String get messagingKakaotalkNote =>
      'A KakaoTalk nem biztosít nyilvános linket egy adott partnerhez — az alkalmazás megnyílik, de a beszélgetést manuálisan kell kiválasztani.';

  @override
  String get messagingPhoneCallLabel => 'Telefonhívás';

  @override
  String get companyDeleteOpportunityConfirm => 'Törli ezt a lehetőséget?';

  @override
  String get companyDeleteContactConfirm => 'Törli ezt a kapcsolatot?';

  @override
  String get companyDeleteTaskConfirm => 'Törli ezt a feladatot?';

  @override
  String get companyDeleteConfirmTitle => 'Törli ezt az ügyfelet?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — a kapcsolatai, lehetőségei, feladatai és előzményei is törlődnek vele együtt.';
  }

  @override
  String get companyNewNoteTitle => 'Új jegyzet';

  @override
  String get companyNoteFieldLabel => 'Jegyzet (vagy diktálja be)';

  @override
  String get companyTabOverview => 'Áttekintés';

  @override
  String get companyTabActivity => 'Tevékenység';

  @override
  String get companyTabTasks => 'Feladatok';

  @override
  String get companyTabDeals => 'Lehetőségek';

  @override
  String get companyContactsTitle => 'Kapcsolatok';

  @override
  String get companyNoContacts => 'Nincsenek kapcsolatok';

  @override
  String get companyNoActivity =>
      'Nincs tevékenység — adjon hozzá egy jegyzetet.';

  @override
  String get companyNoTasks => 'Nincsenek feladatok';

  @override
  String get companyNoDeals => 'Nincsenek lehetőségek';

  @override
  String get companyNoteButtonLabel => 'Jegyzet';

  @override
  String get companyNewClientTitle => 'Új ügyfél';

  @override
  String get companyEditClientTitle => 'Ügyfél szerkesztése';

  @override
  String get companyWebsiteLabel => 'Weboldal';

  @override
  String get companyPeppolLabel => 'Peppol-azonosító';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Címkék (vesszővel elválasztva)';

  @override
  String get companyNewContactTitle => 'Új kapcsolat';

  @override
  String get companyEditContactTitle => 'Kapcsolat szerkesztése';

  @override
  String get companyAppLabel => 'Alkalmazás';

  @override
  String get companyIdentifierNumberLabel => 'Azonosító / szám';

  @override
  String get companyOpenTooltip => 'Megnyitás';

  @override
  String get companyRemoveTooltip => 'Eltávolítás';

  @override
  String get companyRoleFieldLabel => 'Szerepkör (pl. Beszerző)';

  @override
  String get companyMessagingTitle => 'Üzenetküldés';

  @override
  String get companyNoMessagingHint =>
      'Nincs hozzáadva üzenetküldő csatorna — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Még nincs hozzáadva elérhetőség.';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get settingsSubtitle => 'Az alkalmazás egyszeri beállítása.';

  @override
  String get settingsLanguagesTitle => 'Nyelvek és pénznem';

  @override
  String get settingsAppLanguageLabel => 'Alkalmazás nyelve';

  @override
  String get settingsDictationLanguageLabel => 'Diktálás nyelve';

  @override
  String get settingsCurrencyLabel => 'Pénznem';

  @override
  String get settingsFormatsHint =>
      'Az összegek 1 234,56 formátumban (szóköz = ezres, vessző = tizedes), a dátumok éééé.hh.nn formátumban jelennek meg, a felület nyelvétől függetlenül.';

  @override
  String get settingsCompanyTitle => 'Cég';

  @override
  String get settingsCompanySubtitle =>
      'A CRM-et használó cég adatai — később a fejlécben (white-label) és a PDF dokumentumok fejlécében kerül felhasználásra.';

  @override
  String get settingsSyncTitle => 'Szinkronizálás';

  @override
  String get settingsSyncSubtitle =>
      'Alapértelmezés szerint minden adat helyben (SQLite) marad ezen az eszközön.';

  @override
  String get settingsSyncLocalTitle => 'Önálló (csak helyi)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Semmilyen adat nem kerül elküldésre ezen az eszközön kívülre';

  @override
  String get settingsSyncRemoteTitle => 'Megosztott adatbázis (távoli)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Szinkronizál egy PHP + SQLite szerverrel (lásd server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Szerver';

  @override
  String get settingsAccountLabel => 'Fiók';

  @override
  String get settingsSyncPasswordHint =>
      'Az eszköz biztonságos kulcstartójában tárolva — soha az adatbázisban.';

  @override
  String get settingsSyncNowButton => 'Szinkronizálás most';

  @override
  String get settingsSyncPollHint =>
      'Automatikus lekérés 25 másodpercenként a háttérben; azonnali küldés minden módosítás után (távoli mód aktív). Gépelés közben nincs lekérés.';

  @override
  String get settingsSyncMissingFields => 'Szerver, fiók és jelszó szükséges';

  @override
  String get settingsModulesTitle => 'Modulok';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-számlázás, szkenner, szinkronizálás… — 7 napos próbaidőszak vagy licencaktiválás.';

  @override
  String get settingsBrowseModules => 'Modulok böngészése';

  @override
  String get settingsImportExportTitle => 'Importálás / exportálás';

  @override
  String get settingsImportExportSubtitle =>
      'Ügyfelek, kapcsolatok és lehetőségek CSV formátumban; kapcsolatok vCard-ból.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Testreszabhatja a szakaszokat és címkéiket.';

  @override
  String get settingsConfigureStages => 'Szakaszok beállítása';

  @override
  String get settingsBackupTitle => 'Helyi biztonsági mentés';

  @override
  String get settingsBackupSubtitle =>
      'Exportálja az SQLite adatbázis másolatát — hasznos frissítés előtt vagy archiváláshoz.';

  @override
  String get settingsExportDbButton => 'Adatbázis exportálása (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM biztonsági mentés';

  @override
  String settingsExportError(String error) {
    return 'Az exportálás sikertelen: $error';
  }

  @override
  String get settingsUsersTitle => 'Felhasználók';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Fiókok, szerepkörök és jelszavak — rendszergazda és felhasználó.';

  @override
  String get settingsUsersSubtitleLocked => 'Csak rendszergazdáknak.';

  @override
  String get settingsManageUsersButton => 'Felhasználók kezelése';

  @override
  String get settingsUsersLockedHint =>
      'Jelentkezzen be rendszergazdai fiókkal a felhasználók és jelszavaik megtekintéséhez vagy szerkesztéséhez.';

  @override
  String get settingsSaveKeychainError =>
      'A beállítások mentve, de a biztonságos kulcstartó nem érhető el — a szinkronizálási jelszót nem sikerült elmenteni (indítsa újra az alkalmazást egy teljes újraépítés után).';

  @override
  String get settingsSaved => 'Beállítások mentve';

  @override
  String get settingsLogoutConfirmTitle => 'Kijelentkezik?';

  @override
  String get settingsLogoutConfirmDetail =>
      'A visszatéréshez meg kell adnia a jelszavát (vagy Touch ID-t).';

  @override
  String get settingsLogoutButton => 'Kijelentkezés';

  @override
  String get settingsLogoTitle => 'Cégembléma';

  @override
  String get settingsLogoSubtitle =>
      'Az alkalmazás tetején és a bannerben jelenik meg.';

  @override
  String get settingsLogoEmpty => 'Nincs embléma — adja hozzá cége emblémáját';

  @override
  String get settingsLogoChoose => 'Kép kiválasztása';

  @override
  String get settingsLogoChange => 'Embléma módosítása';

  @override
  String get usersDeleteSelfError => 'Nem törölheti saját fiókját';

  @override
  String get usersDeleteConfirmTitle => 'Törli ezt a felhasználót?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) elveszíti a hozzáférést a CRM-hez.';
  }

  @override
  String get usersTitle => 'Felhasználók';

  @override
  String get usersSubtitle => 'Fiókok, szerepkörök és jelszavak.';

  @override
  String get usersAddButton => 'Felhasználó';

  @override
  String get usersEmptyTitle => 'Nincsenek felhasználók';

  @override
  String get usersEmptySubtitle =>
      'Hozza létre az első fiókot — rendszergazda lesz.';

  @override
  String get usersEmptyAction => 'Új felhasználó';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (ön)';
  }

  @override
  String get usersNewTitle => 'Új felhasználó';

  @override
  String get usersEditTitle => 'Felhasználó szerkesztése';

  @override
  String get usersLoginIdLabel => 'Bejelentkezési azonosító';

  @override
  String get usersRoleLabel => 'Szerepkör';

  @override
  String get usersNewPasswordLabel =>
      'Új jelszó (hagyja üresen, ha nem szeretné módosítani)';

  @override
  String get usersTouchIdTitle => 'Touch ID ezen az eszközön';

  @override
  String get usersTouchIdSubtitle =>
      'Feloldás jelszó újbóli begépelése nélkül, csak ezen az eszközön.';

  @override
  String get roleAdministrator => 'Rendszergazda';

  @override
  String get roleUser => 'Felhasználó';

  @override
  String get dashboardTitleEmbedded => 'Irányítópult';

  @override
  String get dashboardTitle => 'Ma';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString intézendő teendő',
      one: '$countString intézendő teendő',
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
      other: '+$countString további — összes megtekintése',
      one: '+$countString további — összes megtekintése',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Minden értékesítő';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (én)';
  }

  @override
  String get dashboardEmptyTitle => 'A CRM készen áll';

  @override
  String get dashboardEmptySubtitle =>
      'Adja hozzá első ügyfelét, importáljon egy CSV-fájlt, vagy fedezze fel a következő modulokat.';

  @override
  String get dashboardNothingScheduled =>
      'Nincs ütemezve — a nyomon követések itt jelennek meg.';

  @override
  String get dashboardBucketOverdue => 'Késésben';

  @override
  String get dashboardBucketToday => 'Ma';

  @override
  String get dashboardBucketWeek => 'Ezen a héten';

  @override
  String get dashboardBucketLater => 'Később';

  @override
  String get dashboardContactedButton => 'Kapcsolatba lépve';

  @override
  String get dashboardDoneButton => 'Kész';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Legjobb ügyfelek (nyitott pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline szakaszonként';

  @override
  String get dashboardNoOpportunitiesYet => 'Még nincsenek lehetőségek';

  @override
  String get dashboardWonLostByMonth => 'Nyert / vesztett havi bontásban';

  @override
  String get dashboardNoClosuresYet => 'Még nincs rögzített lezárás.';

  @override
  String get dashboardRecentActivity => 'Legutóbbi tevékenység';

  @override
  String get dashboardNoActivityYet => 'Még nincs tevékenység.';

  @override
  String get metricClients => 'Ügyfelek';

  @override
  String get metricOpportunities => 'Lehetőségek';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Előrejelzés';

  @override
  String get metricTasks => 'Feladatok';

  @override
  String get metricOverdue => 'Késésben';

  @override
  String get productTagline => 'Takarítson meg időt az első naptól kezdve.';

  @override
  String get placeholderDashboardHint =>
      'Áttekintés: pipeline, nyomon követések és legutóbbi tevékenység.';

  @override
  String get placeholderTodayTitle => 'A napja';

  @override
  String get placeholderTodayHint =>
      'Válasszon egy nyomon követést balra.\nAz ügyfél itt nyílik meg — képernyőváltás nélkül.';

  @override
  String get placeholderClientsTitle => 'Ügyfélkártya';

  @override
  String get placeholderClientsHint =>
      'Válasszon egy ügyfelet a listából,\nvagy hozzon létre egyet a + gombbal.';

  @override
  String get placeholderPipelineHint =>
      'Húzzon egy kártyát az oszlopok között.\nKattintson az ügyfélkártya megnyitásához.';

  @override
  String get placeholderTasksHint =>
      'Válasszon egy feladatot a kapcsolódó ügyfél megtekintéséhez.';

  @override
  String get modulesSubtitleAppStore =>
      'Fizessen elő az App Store-on keresztül, vagy aktiváljon egy már megvásárolt előfizetést az eastmarkhk.com oldalon.';

  @override
  String get modulesSubtitleWebStore =>
      'Ingyenes próba, vásárlás az eastmarkhk.com oldalon — ugyanaz az előfizetés, mint az EastmarkHK e-Invoicing alkalmazásban.';

  @override
  String get modulesStatusActiveAppStore => 'Aktív — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktív — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Próba — $countString nap van hátra',
      one: 'Próba — $countString nap van hátra',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktív';

  @override
  String get modulesStatusAvailable => 'Elérhető';

  @override
  String get modulesBuyFailed =>
      'A vásárlás nem indítható el. Próbálja újra, vagy állítsa vissza vásárlásait.';

  @override
  String get modulesRestoreDone => 'Visszaállítás kész.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name aktiválva a telepített alkalmazásból.';
  }

  @override
  String get modulesLicenseNotFound =>
      'A licenc nem található automatikusan. Nyissa meg az EastmarkHK e-Invoicing → Beállítások elemet, másolja ki aktiválási kódját, majd válassza a „Webkód aktiválása” lehetőséget.';

  @override
  String get modulesRenewalNote =>
      'Automatikus megújítás az App Store-on keresztül. Kezelje az előfizetést a Beállítások → Apple ID → Előfizetések menüben.';

  @override
  String get modulesWebStoreNote =>
      'Vagy fizessen elő az eastmarkhk.com oldalon, és aktiváljon az e-mailben kapott kóddal.';

  @override
  String get modulesHaveEinvoicing =>
      'Már van EastmarkHK e-Invoicing előfizetésem';

  @override
  String get modulesTry7Days => '7 napos próba';

  @override
  String get modulesSubscribe => 'Feliratkozás';

  @override
  String get modulesRestore => 'Vásárlások visszaállítása';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com előfizetés';

  @override
  String get modulesActivateWebCode => 'Webkód aktiválása';

  @override
  String get modulesUseInCrm => 'Használat a CRM-ben';

  @override
  String get modulesDontUseInCrm => 'Ne használja a CRM-ben';

  @override
  String get modulesBuyOnAppStore => 'Vásárlás az App Store-ban';

  @override
  String get modulesStoreUnavailable =>
      'Az App Store nem elérhető ebben a buildben. Használjon App Store buildet, vagy aktiváljon eastmarkhk.com előfizetést.';

  @override
  String get modulesCheckingPurchases =>
      'App Store és eastmarkhk.com vásárlások ellenőrzése…';

  @override
  String get modulesCheckingAppStore => 'App Store vásárlások ellenőrzése…';

  @override
  String get modulesPerMonth => '/ hónap';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Feliratkozott az eastmarkhk.com oldalon? Illessze be az e-mailben kapott kódot. iPhone/iPad készüléken a kezdeti vásárlás az App Store-on vagy a webhelyen történik az aktiválás előtt.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Fizessen elő az eastmarkhk.com oldalon, majd illessze be az eszközhöz kapcsolódó aktiválási kódot.';

  @override
  String get modulesMachineId => 'Gépazonosító';

  @override
  String get modulesCopy => 'Másolás';

  @override
  String get modulesSubscriptionEmailLabel => 'Előfizetés e-mail';

  @override
  String get modulesActivationCodeLabel => 'Aktiválási kód';

  @override
  String get modulesActivationCodeHint =>
      'Illessze be a vásárlás után kapott kódot';

  @override
  String get modulesActivate => 'Aktiválás';

  @override
  String get modulesBuyOnWebsite => 'Vásárlás az eastmarkhk.com oldalon';

  @override
  String get modulesRequestCodeByEmail => 'Kód kérése e-mailben';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name aktiválva az eastmarkhk.com oldalon keresztül';
  }

  @override
  String get modulesMachineIdCopied => 'Gépazonosító kimásolva';

  @override
  String get modulesEmailRequired => 'Adja meg előfizetési e-mail címét';

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
  String get invPickClientTitle => 'Ügyfél kiválasztása';

  @override
  String get invPickClientSearch => 'Keresés név, adószám, ország alapján…';

  @override
  String get invPickClientEmpty => 'Nincs megfelelő ügyfél.';

  @override
  String get invPickClientButton => 'Ügyfél kiválasztása';

  @override
  String get invClientRequired => 'Mentés előtt válasszon ügyfelet.';

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
  String get invSave => 'Mentés';

  @override
  String get invSaving => 'Mentés…';

  @override
  String invEditQuote(String number) {
    return '$number árajánlat szerkesztése';
  }

  @override
  String invEditInvoice(String number) {
    return '$number számla szerkesztése';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number mentve.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'A mentés nem sikerült: $error';
  }

  @override
  String get invEditDocument => 'Szerkesztés';

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
      'Árajánlatok és számlák — EastmarkHK e-Invoicing adatok (nyugták és emlékeztetők: önálló alkalmazás)';

  @override
  String get invOpenStandalone => 'e-Invoicing megnyitása';

  @override
  String get invLaunchStandalone => 'e-Invoicing indítása';

  @override
  String get invRemoteConnectionTooltip => 'Távoli kapcsolat';

  @override
  String invTabQuotes(int count) {
    return 'Árajánlatok ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Számlák ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Nincs árajánlat — hozzon létre egyet egy megnyert lehetőségből vagy a fenti gombbal.';

  @override
  String get invEmptyInvoices => 'Nincs számla.';

  @override
  String get invEmptyCompanyDocs => 'Nincs árajánlat vagy számla.';

  @override
  String get invQuotesSection => 'ÁRAJÁNLATOK';

  @override
  String get invInvoicesSection => 'SZÁMLÁK';

  @override
  String get invCompanyFooter =>
      'A dokumentumokat az EastmarkHK e-Invoicing kezeli — küldés, PDF, nyugták és emlékeztetők az önálló alkalmazásban.';

  @override
  String get invRemoteNotConfigured =>
      'Az e-Invoicing távoli módban van — a kapcsolat nincs beállítva.';

  @override
  String get invConfigure => 'Beállítás';

  @override
  String get invAppNotDetected =>
      'Az e-Invoicing alkalmazás nem található — telepítse/indítsa el az EastmarkHK e-Invoicing alkalmazást, hogy árajánlatokat és számlákat hozhasson létre ebből a rekordból.';

  @override
  String get invRemoteSetupBody =>
      'Az EastmarkHK e-Invoicing távoli tárolásra van beállítva. Adja meg itt ugyanazokat a hitelesítő adatokat, hogy a CRM-et ugyanahhoz az API-hoz kapcsolja — ugyanazok az értékek, mint az e-Invoicing → Beállítások → Távoli tárolás menüben.';

  @override
  String get invLaunchOnceBody =>
      'Indítsa el egyszer az EastmarkHK e-Invoicing alkalmazást a megosztott adatbázis inicializálásához, majd térjen vissza ide.';

  @override
  String get invAcquireAppStoreBody =>
      'Ez a modul az EastmarkHK e-Invoicing alkalmazást használja. Töltse le és fizessen elő rá az App Store-ban, indítsa el egyszer, majd térjen vissza ide.';

  @override
  String get invAcquireWebBody =>
      'Ez a modul az EastmarkHK e-Invoicing alkalmazást használja. Töltse le és fizessen elő rá az eastmarkhk.com oldalon, indítsa el egyszer, majd térjen vissza ide.';

  @override
  String get invConfigureRemote => 'Távoli kapcsolat beállítása';

  @override
  String get invViewOnAppStore => 'Megtekintés az App Store-ban';

  @override
  String get invViewOnWebsite => 'Megtekintés az eastmarkhk.com oldalon';

  @override
  String get invRetry => 'Újrapróbálkozás';

  @override
  String get invDocInvoice => 'Számla';

  @override
  String get invDocQuote => 'Árajánlat';

  @override
  String get invDocClient => 'Ügyfél';

  @override
  String get invDocStatus => 'Állapot';

  @override
  String get invDocDate => 'Dátum';

  @override
  String get invOpenInStandalone => 'Megnyitás az e-Invoicingban';

  @override
  String get invOpenStandaloneFailed =>
      'Az e-Invoicing nem nyitható meg — ellenőrizze, hogy telepítve van-e.';

  @override
  String get invCreateInvoiceFromQuote => 'Számla létrehozása';

  @override
  String get invCreatingInvoice => 'Számla létrehozása…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return '$number számla létrehozva az árajánlatból.';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'Ehhez az árajánlathoz már készült számla.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'A számla nem hozható létre: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing kapcsolat';

  @override
  String get invLinkStatusLinked => 'e-Invoicing ügyfél összekapcsolva';

  @override
  String get invLinkStatusNone => 'Nincs mentett e-Invoicing kapcsolat';

  @override
  String get invUnlinkCustomer => 'e-Invoicing ügyfél leválasztása';

  @override
  String get invUnlinkConfirmTitle => 'Leválasztja az ügyfelet?';

  @override
  String get invUnlinkConfirmBody =>
      'A következő árajánlat vagy számla ismét kérni fogja az ügyfél kiválasztását vagy létrehozását az e-Invoicingban.';

  @override
  String get invUnlinkDone => 'Az e-Invoicing kapcsolat eltávolítva.';

  @override
  String get invAppStoreUrlMissing =>
      'Az e-Invoicing még nincs feltüntetve az App Store-ban ehhez a buildhez. Használja az eastmarkhk.com oldalt, vagy indítson egy már telepített alkalmazást.';

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
      'Megosztott adatbázis: adja meg a szinkronizálási jelszót a Beállításokban az eszköz újracsatlakoztatásához.';

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
  String get activityTaskCreated => 'Feladat létrehozva';

  @override
  String get dictationOfflineTip =>
      'Offline diktálás — gyakran a zajt (TV) ismeri fel a hangja helyett. Kapcsolja be az „Online beszédfelismerést” a Windows Beállítások → Adatvédelem → Beszéd menüpontban, csökkentse a zajt, majd próbálja újra.';

  @override
  String get dictationLanguageFallbackTip =>
      'Ez a nyelvi változat nincs telepítve a Windowsban — közeli változatot használunk. Telepítse a kívánt beszédcsomagot: Beállítások → Idő és nyelv → Beszéd.';

  @override
  String get dictationStarting => 'Diktálás indítása…';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get commonCancel => 'Kanselahin';

  @override
  String get commonSave => 'I-save';

  @override
  String get commonDelete => 'Tanggalin';

  @override
  String get commonEdit => 'I-edit';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Username';

  @override
  String get commonDisplayNameLabel => 'Ipinapakitang pangalan';

  @override
  String get commonPasswordLabel => 'Password';

  @override
  String get commonConfirmPasswordLabel => 'Kumpirmahin ang password';

  @override
  String get commonPasswordMismatch => 'Hindi magkatugma ang mga password';

  @override
  String get commonUsernameTaken => 'Ginagamit na ang username na ito';

  @override
  String get commonChoosePassword => 'Pumili ng password';

  @override
  String get commonRequiredFields => 'Kailangan ang pangalan at username';

  @override
  String get passwordFieldShow => 'Ipakita';

  @override
  String get passwordFieldHide => 'Itago';

  @override
  String loginWelcomeBack(String name) {
    return 'Maligayang pagbabalik, $name';
  }

  @override
  String get loginTitle => 'Mag-log in';

  @override
  String get loginVerifying => 'Vinerify…';

  @override
  String get loginUnlockTouchId => 'I-unlock gamit ang Touch ID';

  @override
  String get loginOr => 'o';

  @override
  String get loginRequiredFields => 'Kailangan ang username at password';

  @override
  String get loginInvalidCredentials => 'Maling username o password';

  @override
  String get loginSubmit => 'Mag-log in';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Maligayang pagdating';

  @override
  String get bootstrapSubtitle =>
      'Gumawa ng administrator account para protektahan ang iyong CRM.';

  @override
  String get bootstrapSubmit => 'Gumawa ng administrator account';

  @override
  String get commonAdd => 'Idagdag';

  @override
  String get commonCreate => 'Gumawa';

  @override
  String get commonClose => 'Isara';

  @override
  String get commonNoName => '(walang pangalan)';

  @override
  String get commonNotesLabel => 'Mga Tala';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Telepono';

  @override
  String get commonFirstNameLabel => 'Unang pangalan';

  @override
  String get commonLastNameLabel => 'Apelyido';

  @override
  String get commonCompanyNameLabel => 'Pangalan ng kumpanya';

  @override
  String messagingCannotOpen(String target) {
    return 'Hindi mabuksan ang $target.';
  }

  @override
  String get messagingEmailAppLabel => 'ang email app';

  @override
  String get messagingPhoneAppLabel => 'ang telepono app';

  @override
  String messagingIncompleteId(String label) {
    return 'Hindi kumpletong identifier para buksan ang $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Hindi mabuksan ang $label — naka-install ba ang app?';
  }

  @override
  String get messagingWechatNote =>
      'Hindi nagbibigay ang WeChat ng pampublikong link sa isang partikular na contact — magbubukas ang app, pero kailangang piliin nang manu-mano ang usapan.';

  @override
  String get messagingKakaotalkNote =>
      'Hindi nagbibigay ang KakaoTalk ng pampublikong link sa isang partikular na contact — magbubukas ang app, pero kailangang piliin nang manu-mano ang usapan.';

  @override
  String get messagingPhoneCallLabel => 'Tawag sa telepono';

  @override
  String get companyDeleteOpportunityConfirm => 'Burahin ang pagkakataong ito?';

  @override
  String get companyDeleteContactConfirm => 'Burahin ang contact na ito?';

  @override
  String get companyDeleteTaskConfirm => 'Burahin ang gawaing ito?';

  @override
  String get companyDeleteConfirmTitle => 'Burahin ang kliyenteng ito?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — ang mga contact, pagkakataon, gawain, at kasaysayan nito ay mabubura kasama nito.';
  }

  @override
  String get companyNewNoteTitle => 'Bagong tala';

  @override
  String get companyNoteFieldLabel => 'Tala (o idikta ito)';

  @override
  String get companyTabOverview => 'Buod';

  @override
  String get companyTabActivity => 'Aktibidad';

  @override
  String get companyTabTasks => 'Mga Gawain';

  @override
  String get companyTabDeals => 'Mga Pagkakataon';

  @override
  String get companyContactsTitle => 'Mga Contact';

  @override
  String get companyNoContacts => 'Walang contact';

  @override
  String get companyNoActivity => 'Walang aktibidad — magdagdag ng tala.';

  @override
  String get companyNoTasks => 'Walang gawain';

  @override
  String get companyNoDeals => 'Walang pagkakataon';

  @override
  String get companyNoteButtonLabel => 'Tala';

  @override
  String get companyNewClientTitle => 'Bagong kliyente';

  @override
  String get companyEditClientTitle => 'I-edit ang kliyente';

  @override
  String get companyWebsiteLabel => 'Website';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Mga tag (pinaghihiwalay ng kuwit)';

  @override
  String get companyNewContactTitle => 'Bagong contact';

  @override
  String get companyEditContactTitle => 'I-edit ang contact';

  @override
  String get companyAppLabel => 'App';

  @override
  String get companyIdentifierNumberLabel => 'Identifier / numero';

  @override
  String get companyOpenTooltip => 'Buksan';

  @override
  String get companyRemoveTooltip => 'Alisin';

  @override
  String get companyRoleFieldLabel => 'Tungkulin (hal. Mamimili)';

  @override
  String get companyMessagingTitle => 'Pagmemensahe';

  @override
  String get companyNoMessagingHint =>
      'Walang naidagdag na channel ng pagmemensahe — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Wala pang naidagdag na impormasyon ng contact.';

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get settingsSubtitle => 'Isang beses na pag-configure ng app.';

  @override
  String get settingsLanguagesTitle => 'Mga wika at pera';

  @override
  String get settingsAppLanguageLabel => 'Wika ng app';

  @override
  String get settingsDictationLanguageLabel => 'Wika ng pagdikta';

  @override
  String get settingsCurrencyLabel => 'Pera';

  @override
  String get settingsFormatsHint =>
      'Ang mga halaga ay ipinapakita bilang 1,234.56 (kuwit = libo, tuldok = decimal) at petsa bilang dd/mm/yyyy, anuman ang wika ng interface.';

  @override
  String get settingsCompanyTitle => 'Kumpanya';

  @override
  String get settingsCompanySubtitle =>
      'Pagkakakilanlan ng kumpanyang gumagamit ng CRM na ito — gagamitin muli sa header (white-label) at mga header ng dokumentong PDF.';

  @override
  String get settingsSyncTitle => 'Pag-sync';

  @override
  String get settingsSyncSubtitle =>
      'Bilang default, ang lahat ng data ay nananatiling lokal (SQLite) sa device na ito.';

  @override
  String get settingsSyncLocalTitle => 'Standalone (lokal lang)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Walang datos na ipinapadala sa labas ng device na ito';

  @override
  String get settingsSyncRemoteTitle => 'Shared database (remote)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Nagsi-sync sa isang PHP + SQLite server (tingnan ang server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Server';

  @override
  String get settingsAccountLabel => 'Account';

  @override
  String get settingsSyncPasswordHint =>
      'Nakaimbak sa secure na keychain ng device — hindi kailanman sa database.';

  @override
  String get settingsSyncNowButton => 'I-sync ngayon';

  @override
  String get settingsSyncPollHint =>
      'Awtomatikong pag-pull tuwing 25 segundo sa background; agarang push pagkatapos ng bawat pagbabago (aktibo ang remote mode). Walang pag-pull habang nagta-type.';

  @override
  String get settingsSyncMissingFields =>
      'Kailangan ang server, account, at password';

  @override
  String get settingsModulesTitle => 'Mga Module';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Scanner, Sync… — 7-araw na trial o pag-activate ng lisensya.';

  @override
  String get settingsBrowseModules => 'Tingnan ang mga module';

  @override
  String get settingsImportExportTitle => 'Import / export';

  @override
  String get settingsImportExportSubtitle =>
      'Mga kliyente, contact, at pagkakataon bilang CSV; mga contact mula sa vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'I-customize ang mga yugto at ang kanilang mga label.';

  @override
  String get settingsConfigureStages => 'I-configure ang mga yugto';

  @override
  String get settingsBackupTitle => 'Lokal na backup';

  @override
  String get settingsBackupSubtitle =>
      'Nag-export ng kopya ng iyong SQLite database — kapaki-pakinabang bago mag-update o para sa pag-archive.';

  @override
  String get settingsExportDbButton => 'I-export ang database (.db)';

  @override
  String get settingsBackupShareText => 'Backup ng EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Nabigo ang pag-export: $error';
  }

  @override
  String get settingsUsersTitle => 'Mga User';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Mga account, tungkulin, at password — administrator at user.';

  @override
  String get settingsUsersSubtitleLocked => 'Para sa mga administrator lang.';

  @override
  String get settingsManageUsersButton => 'Pamahalaan ang mga user';

  @override
  String get settingsUsersLockedHint =>
      'Mag-sign in gamit ang administrator account para makita o ma-edit ang mga user at ang kanilang mga password.';

  @override
  String get settingsSaveKeychainError =>
      'Na-save ang mga setting, pero hindi available ang secure na keychain — hindi na-save ang password sa pag-sync (i-restart ang app pagkatapos ng buong rebuild).';

  @override
  String get settingsSaved => 'Na-save ang mga setting';

  @override
  String get settingsLogoutConfirmTitle => 'Mag-sign out?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Kakailanganin mong ilagay ang iyong password (o Touch ID) para bumalik.';

  @override
  String get settingsLogoutButton => 'Mag-sign out';

  @override
  String get settingsLogoTitle => 'Logo ng kumpanya';

  @override
  String get settingsLogoSubtitle =>
      'Ipinapakita sa itaas ng app at sa banner.';

  @override
  String get settingsLogoEmpty =>
      'Walang logo — idagdag ang logo ng iyong kumpanya';

  @override
  String get settingsLogoChoose => 'Pumili ng larawan';

  @override
  String get settingsLogoChange => 'Palitan ang logo';

  @override
  String get usersDeleteSelfError =>
      'Hindi mo mabubura ang sarili mong account';

  @override
  String get usersDeleteConfirmTitle => 'Burahin ang user na ito?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return 'Mawawalan ng access sa CRM si $displayName ($username).';
  }

  @override
  String get usersTitle => 'Mga User';

  @override
  String get usersSubtitle => 'Mga account, tungkulin, at password.';

  @override
  String get usersAddButton => 'User';

  @override
  String get usersEmptyTitle => 'Walang user';

  @override
  String get usersEmptySubtitle =>
      'Gumawa ng unang account — magiging administrator ito.';

  @override
  String get usersEmptyAction => 'Bagong user';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (ikaw)';
  }

  @override
  String get usersNewTitle => 'Bagong user';

  @override
  String get usersEditTitle => 'I-edit ang user';

  @override
  String get usersLoginIdLabel => 'Login ID';

  @override
  String get usersRoleLabel => 'Tungkulin';

  @override
  String get usersNewPasswordLabel =>
      'Bagong password (iwanang blangko para hindi baguhin)';

  @override
  String get usersTouchIdTitle => 'Touch ID sa device na ito';

  @override
  String get usersTouchIdSubtitle =>
      'Mag-unlock nang hindi na kailangang i-type muli ang password, dito lang sa device na ito.';

  @override
  String get roleAdministrator => 'Administrator';

  @override
  String get roleUser => 'User';

  @override
  String get dashboardTitleEmbedded => 'Dashboard';

  @override
  String get dashboardTitle => 'Ngayon';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString aksyon na kailangang asikasuhin',
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
      other: '+$countString pa — tingnan lahat',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Lahat ng sales rep';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ako)';
  }

  @override
  String get dashboardEmptyTitle => 'Handa na ang iyong CRM';

  @override
  String get dashboardEmptySubtitle =>
      'Idagdag ang iyong unang kliyente, mag-import ng CSV file, o tuklasin ang mga darating na module.';

  @override
  String get dashboardNothingScheduled =>
      'Walang naka-iskedyul — lalabas dito ang mga follow-up mo.';

  @override
  String get dashboardBucketOverdue => 'Overdue';

  @override
  String get dashboardBucketToday => 'Ngayon';

  @override
  String get dashboardBucketWeek => 'Ngayong linggo';

  @override
  String get dashboardBucketLater => 'Mamaya';

  @override
  String get dashboardContactedButton => 'Nakontak';

  @override
  String get dashboardDoneButton => 'Tapos na';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Nangungunang kliyente (bukas na pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline ayon sa yugto';

  @override
  String get dashboardNoOpportunitiesYet => 'Wala pang pagkakataon';

  @override
  String get dashboardWonLostByMonth => 'Nanalo / Natalo bawat buwan';

  @override
  String get dashboardNoClosuresYet => 'Wala pang naitalang pagsasara.';

  @override
  String get dashboardRecentActivity => 'Kamakailang aktibidad';

  @override
  String get dashboardNoActivityYet => 'Wala pang aktibidad.';

  @override
  String get metricClients => 'Mga kliyente';

  @override
  String get metricOpportunities => 'Mga pagkakataon';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Forecast';

  @override
  String get metricTasks => 'Mga gawain';

  @override
  String get metricOverdue => 'Overdue';

  @override
  String get productTagline => 'Makatipid ng oras mula unang araw.';

  @override
  String get placeholderDashboardHint =>
      'Buod: pipeline, follow-up, at kamakailang aktibidad.';

  @override
  String get placeholderTodayTitle => 'Ang iyong araw';

  @override
  String get placeholderTodayHint =>
      'Pumili ng follow-up sa kaliwa.\nBubukas dito ang kliyente — nang hindi lumilipat ng screen.';

  @override
  String get placeholderClientsTitle => 'Kliyente file';

  @override
  String get placeholderClientsHint =>
      'Pumili ng kliyente mula sa listahan,\no gumawa ng bago gamit ang + button.';

  @override
  String get placeholderPipelineHint =>
      'I-drag ang isang card sa pagitan ng mga column.\nMag-click para buksan ang kliyente file.';

  @override
  String get placeholderTasksHint =>
      'Pumili ng gawain para makita ang kaugnay na kliyente.';

  @override
  String get modulesSubtitleAppStore =>
      'Mag-subscribe sa pamamagitan ng App Store, o i-activate ang isang subscription na nabili na sa eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Libreng pagsubok, bumili sa eastmarkhk.com — parehong subscription sa EastmarkHK e-Invoicing app.';

  @override
  String get modulesStatusActiveAppStore => 'Aktibo — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktibo — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pagsubok — $countString araw na natitira',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktibo';

  @override
  String get modulesStatusAvailable => 'Available';

  @override
  String get modulesBuyFailed =>
      'Hindi ma-start ang pagbili. Subukan muli o i-restore ang iyong mga binili.';

  @override
  String get modulesRestoreDone => 'Kumpleto ang pag-restore.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return 'Na-activate ang $name mula sa naka-install na app.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Hindi awtomatikong natagpuan ang lisensya. Buksan ang EastmarkHK e-Invoicing → Mga Setting, kopyahin ang iyong activation code, pagkatapos ay piliin ang \'I-activate ang web code\'.';

  @override
  String get modulesRenewalNote =>
      'Awtomatikong pag-renew sa pamamagitan ng App Store. Pamahalaan ang subscription sa Mga Setting → Apple ID → Mga Subscription.';

  @override
  String get modulesWebStoreNote =>
      'O mag-subscribe sa eastmarkhk.com at i-activate gamit ang code na natanggap sa email.';

  @override
  String get modulesHaveEinvoicing => 'Mayroon na akong EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Subukan ang 7 araw';

  @override
  String get modulesSubscribe => 'Mag-subscribe';

  @override
  String get modulesRestore => 'I-restore ang mga binili';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com subscription';

  @override
  String get modulesActivateWebCode => 'I-activate ang web code';

  @override
  String get modulesUseInCrm => 'Gamitin sa CRM';

  @override
  String get modulesDontUseInCrm => 'Huwag gamitin sa CRM';

  @override
  String get modulesBuyOnAppStore => 'Bilhin sa App Store';

  @override
  String get modulesStoreUnavailable =>
      'Hindi available ang App Store sa build na ito. Gumamit ng App Store build, o i-activate ang subscription sa eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Sinusuri ang mga binili sa App Store at eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Sinusuri ang mga binili sa App Store…';

  @override
  String get modulesPerMonth => '/ buwan';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Nag-subscribe ka ba sa eastmarkhk.com? I-paste ang code na natanggap sa email. Sa iPhone/iPad, ang paunang pagbili ay ginagawa sa pamamagitan ng App Store o site bago ang pag-activate.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Mag-subscribe sa eastmarkhk.com, pagkatapos ay i-paste ang activation code na naka-link sa device na ito.';

  @override
  String get modulesMachineId => 'Machine ID';

  @override
  String get modulesCopy => 'Kopyahin';

  @override
  String get modulesSubscriptionEmailLabel => 'Email ng subscription';

  @override
  String get modulesActivationCodeLabel => 'Activation code';

  @override
  String get modulesActivationCodeHint =>
      'I-paste ang code na natanggap pagkatapos bumili';

  @override
  String get modulesActivate => 'I-activate';

  @override
  String get modulesBuyOnWebsite => 'Bumili sa eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail =>
      'Humiling ng code sa pamamagitan ng email';

  @override
  String modulesActivatedViaWebsite(String name) {
    return 'Na-activate ang $name sa pamamagitan ng eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'Na-kopya ang Machine ID';

  @override
  String get modulesEmailRequired => 'Ilagay ang iyong subscription email';

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
  String get invPickClientTitle => 'Pumili ng kliyente';

  @override
  String get invPickClientSearch => 'Maghanap ayon sa pangalan, tax ID, bansa…';

  @override
  String get invPickClientEmpty => 'Walang tugmang kliyente.';

  @override
  String get invPickClientButton => 'Piliin ang kliyente';

  @override
  String get invClientRequired => 'Pumili ng kliyente bago mag-save.';

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
  String get invSave => 'I-save';

  @override
  String get invSaving => 'Sine-save…';

  @override
  String invEditQuote(String number) {
    return 'I-edit ang quote $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'I-edit ang invoice $number';
  }

  @override
  String invDocumentSaved(String number) {
    return 'Na-save ang $number.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Hindi na-save: $error';
  }

  @override
  String get invEditDocument => 'I-edit';

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
      'Mga quote at invoice — datos mula sa EastmarkHK e-Invoicing (mga resibo at paalala: standalone app)';

  @override
  String get invOpenStandalone => 'Buksan ang e-Invoicing';

  @override
  String get invLaunchStandalone => 'Ilunsad ang e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Malayuang koneksyon';

  @override
  String invTabQuotes(int count) {
    return 'Mga Quote ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Mga Invoice ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Walang quote — gumawa ng isa mula sa napanalunang oportunidad o sa button sa itaas.';

  @override
  String get invEmptyInvoices => 'Walang invoice.';

  @override
  String get invEmptyCompanyDocs => 'Walang quote o invoice.';

  @override
  String get invQuotesSection => 'MGA QUOTE';

  @override
  String get invInvoicesSection => 'MGA INVOICE';

  @override
  String get invCompanyFooter =>
      'Ang mga dokumento ay pinamamahalaan ng EastmarkHK e-Invoicing — pagpapadala, PDF, resibo at paalala sa standalone app.';

  @override
  String get invRemoteNotConfigured =>
      'Nasa remote mode ang e-Invoicing — hindi pa naka-configure ang koneksyon.';

  @override
  String get invConfigure => 'I-configure';

  @override
  String get invAppNotDetected =>
      'Hindi na-detect ang e-Invoicing app — i-install/ilunsad ang EastmarkHK e-Invoicing para gumawa ng quote at invoice mula sa record na ito.';

  @override
  String get invRemoteSetupBody =>
      'Naka-configure ang EastmarkHK e-Invoicing para sa remote storage. Ilagay dito ang parehong kredensyal para ikonekta ang CRM sa parehong API — kaparehong halaga tulad sa e-Invoicing → Settings → Remote storage.';

  @override
  String get invLaunchOnceBody =>
      'Ilunsad ang EastmarkHK e-Invoicing nang isang beses para i-initialize ang shared database, pagkatapos ay bumalik dito.';

  @override
  String get invAcquireAppStoreBody =>
      'Ginagamit ng module na ito ang EastmarkHK e-Invoicing. I-download at mag-subscribe mula sa App Store, ilunsad ito nang isang beses, pagkatapos ay bumalik dito.';

  @override
  String get invAcquireWebBody =>
      'Ginagamit ng module na ito ang EastmarkHK e-Invoicing. I-download at mag-subscribe sa eastmarkhk.com, ilunsad ito nang isang beses, pagkatapos ay bumalik dito.';

  @override
  String get invConfigureRemote => 'I-configure ang malayuang koneksyon';

  @override
  String get invViewOnAppStore => 'Tingnan sa App Store';

  @override
  String get invViewOnWebsite => 'Tingnan sa eastmarkhk.com';

  @override
  String get invRetry => 'Subukan muli';

  @override
  String get invDocInvoice => 'Invoice';

  @override
  String get invDocQuote => 'Quote';

  @override
  String get invDocClient => 'Kliyente';

  @override
  String get invDocStatus => 'Katayuan';

  @override
  String get invDocDate => 'Petsa';

  @override
  String get invOpenInStandalone => 'Buksan sa e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Hindi mabuksan ang e-Invoicing — tiyakin na naka-install ito.';

  @override
  String get invCreateInvoiceFromQuote => 'Gumawa ng invoice';

  @override
  String get invCreatingInvoice => 'Gumagawa ng invoice…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Nagawa ang invoice $number mula sa quote.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Na-invoice na ang quote na ito.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Hindi magawa ang invoice: $error';
  }

  @override
  String get invLinkMenu => 'Link sa e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Naka-link ang kliyente sa e-Invoicing';

  @override
  String get invLinkStatusNone => 'Walang naka-save na link sa e-Invoicing';

  @override
  String get invUnlinkCustomer => 'Alisin ang link ng kliyente sa e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Alisin ang link ng kliyente?';

  @override
  String get invUnlinkConfirmBody =>
      'Sa susunod na quote o invoice, hihilingin muli na piliin o gawin ang kliyente sa e-Invoicing.';

  @override
  String get invUnlinkDone => 'Naalis ang link sa e-Invoicing.';

  @override
  String get invAppStoreUrlMissing =>
      'Hindi pa nakalista ang e-Invoicing sa App Store para sa build na ito. Gamitin ang eastmarkhk.com o ilunsad ang naka-install na app.';

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
      'Shared database: ilagay ang sync password sa Settings para ikonekta muli ang device na ito.';

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

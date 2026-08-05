// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get commonCancel => 'ரத்து செய்';

  @override
  String get commonSave => 'சேமி';

  @override
  String get commonDelete => 'அழி';

  @override
  String get commonEdit => 'திருத்து';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'பயனர்பெயர்';

  @override
  String get commonDisplayNameLabel => 'காட்சிப்பெயர்';

  @override
  String get commonPasswordLabel => 'கடவுச்சொல்';

  @override
  String get commonConfirmPasswordLabel => 'கடவுச்சொல்லை உறுதிப்படுத்தவும்';

  @override
  String get commonPasswordMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get commonUsernameTaken =>
      'இந்த பயனர்பெயர் ஏற்கனவே பயன்பாட்டில் உள்ளது';

  @override
  String get commonChoosePassword => 'ஒரு கடவுச்சொல்லைத் தேர்ந்தெடுக்கவும்';

  @override
  String get commonRequiredFields => 'பெயர் மற்றும் பயனர்பெயர் அவசியம்';

  @override
  String get passwordFieldShow => 'காட்டு';

  @override
  String get passwordFieldHide => 'மறை';

  @override
  String loginWelcomeBack(String name) {
    return 'மீண்டும் வரவேற்கிறோம், $name';
  }

  @override
  String get loginTitle => 'உள்நுழைவு';

  @override
  String get loginVerifying => 'சரிபார்க்கிறது…';

  @override
  String get loginUnlockTouchId => 'Touch ID மூலம் திறக்கவும்';

  @override
  String get loginOr => 'அல்லது';

  @override
  String get loginRequiredFields => 'பயனர்பெயர் மற்றும் கடவுச்சொல் தேவை';

  @override
  String get loginInvalidCredentials => 'தவறான பயனர்பெயர் அல்லது கடவுச்சொல்';

  @override
  String get loginSubmit => 'உள்நுழைக';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'வரவேற்கிறோம்';

  @override
  String get bootstrapSubtitle =>
      'உங்கள் CRM-ஐ பாதுகாக்க நிர்வாகி கணக்கை உருவாக்கவும்.';

  @override
  String get bootstrapSubmit => 'நிர்வாகி கணக்கை உருவாக்கு';

  @override
  String get commonAdd => 'சேர்க்கவும்';

  @override
  String get commonCreate => 'உருவாக்கவும்';

  @override
  String get commonClose => 'மூடு';

  @override
  String get commonNoName => '(பெயர் இல்லை)';

  @override
  String get commonNotesLabel => 'குறிப்புகள்';

  @override
  String get commonEmailLabel => 'மின்னஞ்சல்';

  @override
  String get commonPhoneLabel => 'தொலைபேசி';

  @override
  String get commonFirstNameLabel => 'முதல் பெயர்';

  @override
  String get commonLastNameLabel => 'கடைசி பெயர்';

  @override
  String get commonCompanyNameLabel => 'நிறுவனத்தின் பெயர்';

  @override
  String messagingCannotOpen(String target) {
    return '$target திறக்க முடியவில்லை.';
  }

  @override
  String get messagingEmailAppLabel => 'மின்னஞ்சல் ஆப்';

  @override
  String get messagingPhoneAppLabel => 'தொலைபேசி ஆப்';

  @override
  String messagingIncompleteId(String label) {
    return '$label திறக்க அடையாளங்காட்டி முழுமையடையவில்லை.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label திறக்க முடியவில்லை — ஆப் நிறுவப்பட்டுள்ளதா?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat ஒரு குறிப்பிட்ட தொடர்புக்கு பொது இணைப்பை வழங்காது — ஆப் திறக்கும், ஆனால் உரையாடலை கைமுறையாக தேர்ந்தெடுக்க வேண்டும்.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk ஒரு குறிப்பிட்ட தொடர்புக்கு பொது இணைப்பை வழங்காது — ஆப் திறக்கும், ஆனால் உரையாடலை கைமுறையாக தேர்ந்தெடுக்க வேண்டும்.';

  @override
  String get messagingPhoneCallLabel => 'தொலைபேசி அழைப்பு';

  @override
  String get companyDeleteOpportunityConfirm => 'இந்த வாய்ப்பை நீக்கவா?';

  @override
  String get companyDeleteContactConfirm => 'இந்த தொடர்பை நீக்கவா?';

  @override
  String get companyDeleteTaskConfirm => 'இந்த பணியை நீக்கவா?';

  @override
  String get companyDeleteConfirmTitle => 'இந்த வாடிக்கையாளரை நீக்கவா?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — இதன் தொடர்புகள், வாய்ப்புகள், பணிகள் மற்றும் வரலாறும் இதனுடன் நீக்கப்படும்.';
  }

  @override
  String get companyNewNoteTitle => 'புதிய குறிப்பு';

  @override
  String get companyNoteFieldLabel => 'குறிப்பு (அல்லது சொல்லி எழுதவும்)';

  @override
  String get companyTabOverview => 'மேலோட்டப் பார்வை';

  @override
  String get companyTabActivity => 'செயல்பாடு';

  @override
  String get companyTabTasks => 'பணிகள்';

  @override
  String get companyTabDeals => 'வாய்ப்புகள்';

  @override
  String get companyContactsTitle => 'தொடர்புகள்';

  @override
  String get companyNoContacts => 'தொடர்புகள் இல்லை';

  @override
  String get companyNoActivity =>
      'செயல்பாடு இல்லை — ஒரு குறிப்பைச் சேர்க்கவும்.';

  @override
  String get companyNoTasks => 'பணிகள் இல்லை';

  @override
  String get companyNoDeals => 'வாய்ப்புகள் இல்லை';

  @override
  String get companyNoteButtonLabel => 'குறிப்பு';

  @override
  String get companyNewClientTitle => 'புதிய வாடிக்கையாளர்';

  @override
  String get companyEditClientTitle => 'வாடிக்கையாளரைத் திருத்து';

  @override
  String get companyWebsiteLabel => 'இணையதளம்';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'குறிச்சொற்கள் (கமாவால் பிரிக்கப்பட்டவை)';

  @override
  String get companyNewContactTitle => 'புதிய தொடர்பு';

  @override
  String get companyEditContactTitle => 'தொடர்பைத் திருத்து';

  @override
  String get companyAppLabel => 'ஆப்';

  @override
  String get companyIdentifierNumberLabel => 'அடையாளங்காட்டி / எண்';

  @override
  String get companyOpenTooltip => 'திற';

  @override
  String get companyRemoveTooltip => 'அகற்று';

  @override
  String get companyRoleFieldLabel => 'பங்கு (எ.கா. வாங்குபவர்)';

  @override
  String get companyMessagingTitle => 'செய்தி அனுப்புதல்';

  @override
  String get companyNoMessagingHint =>
      'எந்த செய்தி அனுப்பும் சேனலும் சேர்க்கப்படவில்லை — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'இதுவரை தொடர்புத் தகவல் எதுவும் சேர்க்கப்படவில்லை.';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsSubtitle => 'ஆப்பின் ஒருமுறை உள்ளமைவு.';

  @override
  String get settingsLanguagesTitle => 'மொழிகள் & நாணயம்';

  @override
  String get settingsAppLanguageLabel => 'ஆப் மொழி';

  @override
  String get settingsDictationLanguageLabel => 'வாய்மொழி மொழி';

  @override
  String get settingsCurrencyLabel => 'நாணயம்';

  @override
  String get settingsFormatsHint =>
      'தொகைகள் 1,234.56 ஆக (கமா = ஆயிரம், புள்ளி = தசம) மற்றும் தேதிகள் dd/mm/yyyy ஆக காட்டப்படும், இடைமுக மொழியைப் பொருட்படுத்தாமல்.';

  @override
  String get settingsCompanyTitle => 'நிறுவனம்';

  @override
  String get settingsCompanySubtitle =>
      'இந்த CRM-ஐப் பயன்படுத்தும் நிறுவனத்தின் அடையாளம் — பின்னர் தலைப்பில் (வெள்ளை-லேபிள்) மற்றும் PDF ஆவண தலைப்புகளில் மீண்டும் பயன்படுத்தப்படும்.';

  @override
  String get settingsSyncTitle => 'ஒத்திசைவு';

  @override
  String get settingsSyncSubtitle =>
      'இயல்பாக, அனைத்து தரவும் இந்த சாதனத்தில் உள்ளூர் (SQLite) ஆக இருக்கும்.';

  @override
  String get settingsSyncLocalTitle => 'தனித்தியங்கி (உள்ளூர் மட்டும்)';

  @override
  String get settingsSyncLocalSubtitle =>
      'இந்த சாதனத்திற்கு வெளியே எந்த தரவும் அனுப்பப்படாது';

  @override
  String get settingsSyncRemoteTitle => 'பகிரப்பட்ட தரவுத்தளம் (தொலைநிலை)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite சேவையகத்துடன் ஒத்திசைக்கிறது (server/crm-sync/ ஐப் பார்க்கவும்)';

  @override
  String get settingsServerLabel => 'சேவையகம்';

  @override
  String get settingsAccountLabel => 'கணக்கு';

  @override
  String get settingsSyncPasswordHint =>
      'சாதனத்தின் பாதுகாப்பான கீசெயினில் சேமிக்கப்படுகிறது — தரவுத்தளத்தில் ஒருபோதும் இல்லை.';

  @override
  String get settingsSyncNowButton => 'இப்போது ஒத்திசை';

  @override
  String get settingsSyncPollHint =>
      'பின்னணியில் ஒவ்வொரு 25 வினாடிக்கும் தானியங்கு இழுத்தல்; ஒவ்வொரு மாற்றத்திற்குப் பிறகும் உடனடி தள்ளுதல் (தொலைநிலை பயன்முறை செயலில்). தட்டச்சு செய்யும்போது இழுத்தல் இல்லை.';

  @override
  String get settingsSyncMissingFields =>
      'சேவையகம், கணக்கு மற்றும் கடவுச்சொல் தேவை';

  @override
  String get settingsModulesTitle => 'தொகுதிகள்';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK மின்-விலைப்பட்டியல், ஸ்கேனர், ஒத்திசைவு… — 7-நாள் சோதனை அல்லது உரிம செயல்படுத்தல்.';

  @override
  String get settingsBrowseModules => 'தொகுதிகளை உலாவவும்';

  @override
  String get settingsImportExportTitle => 'இறக்குமதி / ஏற்றுமதி';

  @override
  String get settingsImportExportSubtitle =>
      'வாடிக்கையாளர்கள், தொடர்புகள் மற்றும் வாய்ப்புகள் CSV ஆக; vCard இலிருந்து தொடர்புகள்.';

  @override
  String get settingsPipelineTitle => 'பைப்லைன்';

  @override
  String get settingsPipelineSubtitle =>
      'நிலைகள் மற்றும் அவற்றின் லேபிள்களை தனிப்பயனாக்கவும்.';

  @override
  String get settingsConfigureStages => 'நிலைகளை உள்ளமைக்கவும்';

  @override
  String get settingsBackupTitle => 'உள்ளூர் காப்புப்பிரதி';

  @override
  String get settingsBackupSubtitle =>
      'உங்கள் SQLite தரவுத்தளத்தின் நகலை ஏற்றுமதி செய்கிறது — புதுப்பிப்புக்கு முன் அல்லது காப்பகப்படுத்த பயனுள்ளது.';

  @override
  String get settingsExportDbButton => 'தரவுத்தளத்தை ஏற்றுமதி செய் (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM காப்புப்பிரதி';

  @override
  String settingsExportError(String error) {
    return 'ஏற்றுமதி தோல்வியடைந்தது: $error';
  }

  @override
  String get settingsUsersTitle => 'பயனர்கள்';

  @override
  String get settingsUsersSubtitleAdmin =>
      'கணக்குகள், பங்குகள் மற்றும் கடவுச்சொற்கள் — நிர்வாகி மற்றும் பயனர்.';

  @override
  String get settingsUsersSubtitleLocked => 'நிர்வாகிகளுக்கு மட்டும்.';

  @override
  String get settingsManageUsersButton => 'பயனர்களை நிர்வகிக்கவும்';

  @override
  String get settingsUsersLockedHint =>
      'பயனர்களையும் அவர்களின் கடவுச்சொற்களையும் பார்க்க அல்லது திருத்த நிர்வாகி கணக்குடன் உள்நுழையவும்.';

  @override
  String get settingsSaveKeychainError =>
      'அமைப்புகள் சேமிக்கப்பட்டன, ஆனால் பாதுகாப்பான கீசெயின் கிடைக்கவில்லை — ஒத்திசைவு கடவுச்சொல்லை சேமிக்க முடியவில்லை (முழு மறுகட்டமைப்புக்குப் பிறகு ஆப்பை மறுதொடக்கம் செய்யவும்).';

  @override
  String get settingsSaved => 'அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get settingsLogoutConfirmTitle => 'வெளியேற வேண்டுமா?';

  @override
  String get settingsLogoutConfirmDetail =>
      'திரும்ப வர உங்கள் கடவுச்சொல்லை (அல்லது Touch ID) உள்ளிட வேண்டும்.';

  @override
  String get settingsLogoutButton => 'வெளியேறு';

  @override
  String get settingsLogoTitle => 'நிறுவன லோகோ';

  @override
  String get settingsLogoSubtitle =>
      'ஆப்பின் மேலே மற்றும் பேனரில் காட்டப்படும்.';

  @override
  String get settingsLogoEmpty =>
      'லோகோ இல்லை — உங்கள் நிறுவனத்தின் லோகோவைச் சேர்க்கவும்';

  @override
  String get settingsLogoChoose => 'ஒரு படத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get settingsLogoChange => 'லோகோவை மாற்று';

  @override
  String get usersDeleteSelfError => 'உங்கள் சொந்த கணக்கை நீக்க முடியாது';

  @override
  String get usersDeleteConfirmTitle => 'இந்த பயனரை நீக்கவா?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM க்கான அணுகலை இழப்பார்.';
  }

  @override
  String get usersTitle => 'பயனர்கள்';

  @override
  String get usersSubtitle => 'கணக்குகள், பங்குகள் மற்றும் கடவுச்சொற்கள்.';

  @override
  String get usersAddButton => 'பயனர்';

  @override
  String get usersEmptyTitle => 'பயனர்கள் இல்லை';

  @override
  String get usersEmptySubtitle =>
      'முதல் கணக்கை உருவாக்கவும் — அது நிர்வாகியாக இருக்கும்.';

  @override
  String get usersEmptyAction => 'புதிய பயனர்';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (நீங்கள்)';
  }

  @override
  String get usersNewTitle => 'புதிய பயனர்';

  @override
  String get usersEditTitle => 'பயனரைத் திருத்து';

  @override
  String get usersLoginIdLabel => 'உள்நுழைவு ID';

  @override
  String get usersRoleLabel => 'பங்கு';

  @override
  String get usersNewPasswordLabel =>
      'புதிய கடவுச்சொல் (மாற்ற வேண்டாம் என்றால் காலியாக விடவும்)';

  @override
  String get usersTouchIdTitle => 'இந்த சாதனத்தில் Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'கடவுச்சொல்லை மீண்டும் தட்டச்சு செய்யாமல் திறக்கவும், இந்த சாதனத்தில் மட்டும்.';

  @override
  String get roleAdministrator => 'நிர்வாகி';

  @override
  String get roleUser => 'பயனர்';

  @override
  String get dashboardTitleEmbedded => 'டாஷ்போர்டு';

  @override
  String get dashboardTitle => 'இன்று';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'கையாள $countString செயல்கள்',
      one: 'கையாள $countString செயல்',
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
      other: '+$countString மேலும் — அனைத்தையும் காண்க',
      one: '+$countString மேலும் — அனைத்தையும் காண்க',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'அனைத்து விற்பனை பிரதிநிதிகள்';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (நான்)';
  }

  @override
  String get dashboardEmptyTitle => 'உங்கள் CRM தயார்';

  @override
  String get dashboardEmptySubtitle =>
      'உங்கள் முதல் வாடிக்கையாளரைச் சேர்க்கவும், CSV கோப்பை இறக்குமதி செய்யவும், அல்லது வரவிருக்கும் தொகுதிகளை ஆராயவும்.';

  @override
  String get dashboardNothingScheduled =>
      'எதுவும் திட்டமிடப்படவில்லை — உங்கள் பின்தொடர்தல்கள் இங்கே தோன்றும்.';

  @override
  String get dashboardBucketOverdue => 'காலாவதியானது';

  @override
  String get dashboardBucketToday => 'இன்று';

  @override
  String get dashboardBucketWeek => 'இந்த வாரம்';

  @override
  String get dashboardBucketLater => 'பின்னர்';

  @override
  String get dashboardContactedButton => 'தொடர்பு கொள்ளப்பட்டது';

  @override
  String get dashboardDoneButton => 'முடிந்தது';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'சிறந்த வாடிக்கையாளர்கள் (திறந்த பைப்லைன்)';

  @override
  String get dashboardPipelineByStage => 'நிலை வாரியாக பைப்லைன்';

  @override
  String get dashboardNoOpportunitiesYet => 'இதுவரை வாய்ப்புகள் இல்லை';

  @override
  String get dashboardWonLostByMonth => 'மாதம் வாரியாக வெற்றி / தோல்வி';

  @override
  String get dashboardNoClosuresYet =>
      'இதுவரை பதிவு செய்யப்பட்ட முடிவுகள் இல்லை.';

  @override
  String get dashboardRecentActivity => 'சமீபத்திய செயல்பாடு';

  @override
  String get dashboardNoActivityYet => 'இதுவரை செயல்பாடு இல்லை.';

  @override
  String get metricClients => 'வாடிக்கையாளர்கள்';

  @override
  String get metricOpportunities => 'வாய்ப்புகள்';

  @override
  String get metricPipeline => 'பைப்லைன்';

  @override
  String get metricForecast => 'முன்னறிவிப்பு';

  @override
  String get metricTasks => 'பணிகள்';

  @override
  String get metricOverdue => 'காலாவதியானது';

  @override
  String get productTagline =>
      'முதல் நாளிலிருந்தே நேரத்தை மிச்சப்படுத்துங்கள்.';

  @override
  String get placeholderDashboardHint =>
      'மேலோட்டப் பார்வை: பைப்லைன், பின்தொடர்தல்கள் மற்றும் சமீபத்திய செயல்பாடு.';

  @override
  String get placeholderTodayTitle => 'உங்கள் நாள்';

  @override
  String get placeholderTodayHint =>
      'இடதுபுறத்தில் ஒரு பின்தொடர்தலைத் தேர்ந்தெடுக்கவும்.\nவாடிக்கையாளர் இங்கே திறக்கும் — திரையை மாற்றாமல்.';

  @override
  String get placeholderClientsTitle => 'வாடிக்கையாளர் அட்டை';

  @override
  String get placeholderClientsHint =>
      'பட்டியலிலிருந்து ஒரு வாடிக்கையாளரைத் தேர்ந்தெடுக்கவும்,\nஅல்லது + பொத்தானுடன் ஒன்றை உருவாக்கவும்.';

  @override
  String get placeholderPipelineHint =>
      'நெடுவரிசைகளுக்கு இடையே ஒரு அட்டையை இழுக்கவும்.\nவாடிக்கையாளர் அட்டையைத் திறக்க கிளிக் செய்யவும்.';

  @override
  String get placeholderTasksHint =>
      'தொடர்புடைய வாடிக்கையாளரைக் காண ஒரு பணியைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store மூலம் சந்தா செலுத்தவும், அல்லது eastmarkhk.com-இல் ஏற்கனவே வாங்கிய சந்தாவைச் செயல்படுத்தவும்.';

  @override
  String get modulesSubtitleWebStore =>
      'இலவச சோதனை, eastmarkhk.com-இல் வாங்குதல் — EastmarkHK e-Invoicing ஆப்பைப் போன்ற அதே சந்தா.';

  @override
  String get modulesStatusActiveAppStore => 'செயலில் — App Store';

  @override
  String get modulesStatusActiveWeb => 'செயலில் — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'சோதனை — $countString நாட்கள் மீதம்',
      one: 'சோதனை — $countString நாள் மீதம்',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'செயலில்';

  @override
  String get modulesStatusAvailable => 'கிடைக்கிறது';

  @override
  String get modulesBuyFailed =>
      'வாங்குதலைத் தொடங்க முடியவில்லை. மீண்டும் முயற்சிக்கவும் அல்லது உங்கள் வாங்குதல்களை மீட்டெடுக்கவும்.';

  @override
  String get modulesRestoreDone => 'மீட்டெடுப்பு நிறைவடைந்தது.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name நிறுவப்பட்ட ஆப்பிலிருந்து செயல்படுத்தப்பட்டது.';
  }

  @override
  String get modulesLicenseNotFound =>
      'உரிமம் தானாகக் கண்டறியப்படவில்லை. EastmarkHK e-Invoicing → அமைப்புகளைத் திறந்து, உங்கள் செயல்படுத்தல் குறியீட்டை நகலெடுத்து, பிறகு «வலைக் குறியீட்டைச் செயல்படுத்து» என்பதைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get modulesRenewalNote =>
      'App Store மூலம் தானியங்கி புதுப்பித்தல். அமைப்புகள் → Apple ID → சந்தாக்களில் சந்தாவை நிர்வகிக்கவும்.';

  @override
  String get modulesWebStoreNote =>
      'அல்லது eastmarkhk.com-இல் சந்தா செலுத்தி, மின்னஞ்சலில் பெற்ற குறியீட்டுடன் செயல்படுத்தவும்.';

  @override
  String get modulesHaveEinvoicing =>
      'என்னிடம் ஏற்கனவே EastmarkHK e-Invoicing உள்ளது';

  @override
  String get modulesTry7Days => '7 நாட்கள் முயற்சிக்கவும்';

  @override
  String get modulesSubscribe => 'சந்தா செலுத்து';

  @override
  String get modulesRestore => 'வாங்குதல்களை மீட்டெடு';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com சந்தா';

  @override
  String get modulesActivateWebCode => 'வலைக் குறியீட்டைச் செயல்படுத்து';

  @override
  String get modulesUseInCrm => 'CRM-இல் பயன்படுத்து';

  @override
  String get modulesDontUseInCrm => 'CRM இல் பயன்படுத்த வேண்டாம்';

  @override
  String get modulesBuyOnAppStore => 'App Store இல் வாங்கவும்';

  @override
  String get modulesStoreUnavailable =>
      'இந்த பதிப்பில் App Store கிடைக்கவில்லை. App Store பதிப்பைப் பயன்படுத்தவும், அல்லது eastmarkhk.com சந்தாவை செயல்படுத்தவும்.';

  @override
  String get modulesCheckingPurchases =>
      'App Store மற்றும் eastmarkhk.com வாங்குதல்கள் சரிபார்க்கப்படுகின்றன…';

  @override
  String get modulesCheckingAppStore =>
      'App Store வாங்குதல்கள் சரிபார்க்கப்படுகின்றன…';

  @override
  String get modulesPerMonth => '/ மாதம்';

  @override
  String get modulesActivationSubtitleAppStore =>
      'eastmarkhk.com-இல் சந்தா செலுத்தினீர்களா? மின்னஞ்சலில் பெற்ற குறியீட்டை ஒட்டவும். iPhone/iPad-இல், ஆரம்ப வாங்குதல் செயல்படுத்துவதற்கு முன் App Store அல்லது தளம் மூலம் செய்யப்படுகிறது.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com-இல் சந்தா செலுத்தி, பிறகு இந்தச் சாதனத்துடன் இணைக்கப்பட்ட செயல்படுத்தல் குறியீட்டை ஒட்டவும்.';

  @override
  String get modulesMachineId => 'இயந்திர அடையாள எண்';

  @override
  String get modulesCopy => 'நகலெடு';

  @override
  String get modulesSubscriptionEmailLabel => 'சந்தா மின்னஞ்சல்';

  @override
  String get modulesActivationCodeLabel => 'செயல்படுத்தல் குறியீடு';

  @override
  String get modulesActivationCodeHint =>
      'வாங்கிய பிறகு பெற்ற குறியீட்டை ஒட்டவும்';

  @override
  String get modulesActivate => 'செயல்படுத்து';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com-இல் வாங்கவும்';

  @override
  String get modulesRequestCodeByEmail =>
      'மின்னஞ்சல் மூலம் குறியீட்டைக் கோரவும்';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com மூலம் செயல்படுத்தப்பட்டது';
  }

  @override
  String get modulesMachineIdCopied => 'இயந்திர அடையாள எண் நகலெடுக்கப்பட்டது';

  @override
  String get modulesEmailRequired => 'உங்கள் சந்தா மின்னஞ்சலை உள்ளிடவும்';

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
  String get invPickClientTitle => 'வாடிக்கையாளரைத் தேர்ந்தெடுக்கவும்';

  @override
  String get invPickClientSearch => 'பெயர், வரி எண், நாடு மூலம் தேடவும்…';

  @override
  String get invPickClientEmpty => 'பொருந்தும் வாடிக்கையாளர் இல்லை.';

  @override
  String get invPickClientButton => 'வாடிக்கையாளரைத் தேர்ந்தெடு';

  @override
  String get invClientRequired =>
      'சேமிப்பதற்கு முன் ஒரு வாடிக்கையாளரைத் தேர்ந்தெடுக்கவும்.';

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
  String get invSave => 'சேமி';

  @override
  String get invSaving => 'சேமிக்கிறது…';

  @override
  String invEditQuote(String number) {
    return 'மேற்கோள் $number ஐத் திருத்து';
  }

  @override
  String invEditInvoice(String number) {
    return 'விலைப்பட்டியல் $number ஐத் திருத்து';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number சேமிக்கப்பட்டது.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get invEditDocument => 'திருத்து';

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
      'மேற்கோள்கள் மற்றும் விலைப்பட்டியல்கள் — EastmarkHK e-Invoicing தரவு (ரசீதுகள் மற்றும் நினைவூட்டல்கள்: தனி பயன்பாடு)';

  @override
  String get invOpenStandalone => 'e-Invoicing ஐத் திற';

  @override
  String get invLaunchStandalone => 'e-Invoicing ஐத் தொடங்கு';

  @override
  String get invRemoteConnectionTooltip => 'தொலைநிலை இணைப்பு';

  @override
  String invTabQuotes(int count) {
    return 'மேற்கோள்கள் ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'விலைப்பட்டியல்கள் ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'மேற்கோள்கள் இல்லை — வெற்றி பெற்ற வாய்ப்பிலிருந்து அல்லது மேலே உள்ள பொத்தானிலிருந்து ஒன்றை உருவாக்கவும்.';

  @override
  String get invEmptyInvoices => 'விலைப்பட்டியல்கள் இல்லை.';

  @override
  String get invEmptyCompanyDocs => 'மேற்கோள்களோ விலைப்பட்டியல்களோ இல்லை.';

  @override
  String get invQuotesSection => 'மேற்கோள்கள்';

  @override
  String get invInvoicesSection => 'விலைப்பட்டியல்கள்';

  @override
  String get invCompanyFooter =>
      'ஆவணங்கள் EastmarkHK e-Invoicing ஆல் நிர்வகிக்கப்படுகின்றன — அனுப்புதல், PDF, ரசீதுகள் மற்றும் நினைவூட்டல்கள் தனி பயன்பாட்டில்.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing தொலைநிலை பயன்முறையில் உள்ளது — இணைப்பு கட்டமைக்கப்படவில்லை.';

  @override
  String get invConfigure => 'கட்டமை';

  @override
  String get invAppNotDetected =>
      'e-Invoicing பயன்பாடு கண்டறியப்படவில்லை — இந்த பதிவிலிருந்து மேற்கோள்கள் மற்றும் விலைப்பட்டியல்களை உருவாக்க EastmarkHK e-Invoicing ஐ நிறுவவும்/தொடங்கவும்.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing தொலைநிலை சேமிப்பிற்காக கட்டமைக்கப்பட்டுள்ளது. CRM ஐ அதே API உடன் இணைக்க இங்கே அதே நற்சான்றிதழ்களை உள்ளிடவும் — e-Invoicing → அமைப்புகள் → தொலைநிலை சேமிப்பில் உள்ளது போன்ற அதே மதிப்புகள்.';

  @override
  String get invLaunchOnceBody =>
      'பகிரப்பட்ட தரவுத்தளத்தை துவக்க EastmarkHK e-Invoicing ஐ ஒருமுறை தொடங்கவும், பின்னர் இங்கு திரும்பவும்.';

  @override
  String get invAcquireAppStoreBody =>
      'இந்த தொகுதி EastmarkHK e-Invoicing ஐப் பயன்படுத்துகிறது. App Store இலிருந்து பதிவிறக்கம் செய்து குழுசேரவும், ஒருமுறை தொடங்கவும், பின்னர் இங்கு திரும்பவும்.';

  @override
  String get invAcquireWebBody =>
      'இந்த தொகுதி EastmarkHK e-Invoicing ஐப் பயன்படுத்துகிறது. eastmarkhk.com இல் பதிவிறக்கம் செய்து குழுசேரவும், ஒருமுறை தொடங்கவும், பின்னர் இங்கு திரும்பவும்.';

  @override
  String get invConfigureRemote => 'தொலைநிலை இணைப்பைக் கட்டமை';

  @override
  String get invViewOnAppStore => 'App Store இல் காண்க';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com இல் காண்க';

  @override
  String get invRetry => 'மீண்டும் முயற்சி';

  @override
  String get invDocInvoice => 'விலைப்பட்டியல்';

  @override
  String get invDocQuote => 'மேற்கோள்';

  @override
  String get invDocClient => 'வாடிக்கையாளர்';

  @override
  String get invDocStatus => 'நிலை';

  @override
  String get invDocDate => 'தேதி';

  @override
  String get invOpenInStandalone => 'e-Invoicing இல் திற';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing ஐத் திறக்க முடியவில்லை — அது நிறுவப்பட்டுள்ளதா எனச் சரிபார்க்கவும்.';

  @override
  String get invCreateInvoiceFromQuote => 'விலைப்பட்டியலை உருவாக்கு';

  @override
  String get invCreatingInvoice => 'விலைப்பட்டியல் உருவாக்கப்படுகிறது…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'மேற்கோளிலிருந்து விலைப்பட்டியல் $number உருவாக்கப்பட்டது.';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'இந்த மேற்கோளுக்கு ஏற்கனவே விலைப்பட்டியல் தயாரிக்கப்பட்டது.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'விலைப்பட்டியலை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing இணைப்பு';

  @override
  String get invLinkStatusLinked =>
      'e-Invoicing வாடிக்கையாளர் இணைக்கப்பட்டுள்ளார்';

  @override
  String get invLinkStatusNone =>
      'e-Invoicing இணைப்பு எதுவும் சேமிக்கப்படவில்லை';

  @override
  String get invUnlinkCustomer => 'e-Invoicing வாடிக்கையாளர் இணைப்பை நீக்கு';

  @override
  String get invUnlinkConfirmTitle => 'வாடிக்கையாளர் இணைப்பை நீக்கவா?';

  @override
  String get invUnlinkConfirmBody =>
      'அடுத்த மேற்கோள் அல்லது விலைப்பட்டியல் மீண்டும் e-Invoicing இல் வாடிக்கையாளரைத் தேர்ந்தெடுக்கவோ உருவாக்கவோ கேட்கும்.';

  @override
  String get invUnlinkDone => 'e-Invoicing இணைப்பு அகற்றப்பட்டது.';

  @override
  String get invAppStoreUrlMissing =>
      'இந்த பதிப்பிற்கு e-Invoicing இன்னும் App Store இல் பட்டியலிடப்படவில்லை. eastmarkhk.com ஐப் பயன்படுத்தவும் அல்லது ஏற்கனவே நிறுவப்பட்ட பயன்பாட்டைத் தொடங்கவும்.';

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
      'பகிரப்பட்ட தரவுத்தளம்: இந்த சாதனத்தை மீண்டும் இணைக்க அமைப்புகளில் ஒத்திசைவு கடவுச்சொல்லை உள்ளிடவும்.';

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

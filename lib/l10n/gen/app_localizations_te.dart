// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get commonCancel => 'రద్దు చేయి';

  @override
  String get commonSave => 'సేవ్ చేయి';

  @override
  String get commonDelete => 'తొలగించు';

  @override
  String get commonEdit => 'సవరించు';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'వినియోగదారు పేరు';

  @override
  String get commonDisplayNameLabel => 'ప్రదర్శన పేరు';

  @override
  String get commonPasswordLabel => 'పాస్‌వర్డ్';

  @override
  String get commonConfirmPasswordLabel => 'పాస్‌వర్డ్‌ను నిర్ధారించండి';

  @override
  String get commonPasswordMismatch => 'పాస్‌వర్డ్‌లు సరిపోలడం లేదు';

  @override
  String get commonUsernameTaken => 'ఈ వినియోగదారు పేరు ఇప్పటికే వాడుకలో ఉంది';

  @override
  String get commonChoosePassword => 'పాస్‌వర్డ్ ఎంచుకోండి';

  @override
  String get commonRequiredFields => 'పేరు మరియు వినియోగదారు పేరు అవసరం';

  @override
  String get passwordFieldShow => 'చూపించు';

  @override
  String get passwordFieldHide => 'దాచు';

  @override
  String loginWelcomeBack(String name) {
    return 'తిరిగి స్వాగతం, $name';
  }

  @override
  String get loginTitle => 'లాగిన్';

  @override
  String get loginVerifying => 'ధృవీకరిస్తోంది…';

  @override
  String get loginUnlockTouchId => 'Touch ID తో అన్‌లాక్ చేయండి';

  @override
  String get loginUnlockWindowsHello => 'Déverrouiller avec Windows Hello';

  @override
  String get loginOr => 'లేదా';

  @override
  String get loginRequiredFields => 'వినియోగదారు పేరు మరియు పాస్‌వర్డ్ అవసరం';

  @override
  String get loginInvalidCredentials =>
      'తప్పు వినియోగదారు పేరు లేదా పాస్‌వర్డ్';

  @override
  String get loginSubmit => 'లాగిన్ చేయండి';

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
  String get bootstrapWelcome => 'స్వాగతం';

  @override
  String get bootstrapSubtitle =>
      'మీ CRMని భద్రపరచడానికి నిర్వాహక ఖాతాను సృష్టించండి.';

  @override
  String get bootstrapSubmit => 'నిర్వాహక ఖాతాను సృష్టించు';

  @override
  String get commonAdd => 'జోడించు';

  @override
  String get commonCreate => 'సృష్టించు';

  @override
  String get commonClose => 'మూసివేయి';

  @override
  String get commonNoName => '(పేరు లేదు)';

  @override
  String get commonNotesLabel => 'గమనికలు';

  @override
  String get commonEmailLabel => 'ఇమెయిల్';

  @override
  String get commonPhoneLabel => 'ఫోన్';

  @override
  String get commonFirstNameLabel => 'మొదటి పేరు';

  @override
  String get commonLastNameLabel => 'చివరి పేరు';

  @override
  String get commonCompanyNameLabel => 'కంపెనీ పేరు';

  @override
  String messagingCannotOpen(String target) {
    return '$target తెరవడం సాధ్యం కాలేదు.';
  }

  @override
  String get messagingEmailAppLabel => 'ఇమెయిల్ యాప్';

  @override
  String get messagingPhoneAppLabel => 'ఫోన్ యాప్';

  @override
  String messagingIncompleteId(String label) {
    return '$label తెరవడానికి గుర్తింపు అసంపూర్ణంగా ఉంది.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label తెరవడం సాధ్యం కాలేదు — యాప్ ఇన్‌స్టాల్ చేయబడిందా?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat నిర్దిష్ట పరిచయానికి పబ్లిక్ లింక్‌ను అందించదు — యాప్ తెరుచుకుంటుంది, కానీ సంభాషణను మాన్యువల్‌గా ఎంచుకోవాలి.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk నిర్దిష్ట పరిచయానికి పబ్లిక్ లింక్‌ను అందించదు — యాప్ తెరుచుకుంటుంది, కానీ సంభాషణను మాన్యువల్‌గా ఎంచుకోవాలి.';

  @override
  String get messagingPhoneCallLabel => 'ఫోన్ కాల్';

  @override
  String get companyDeleteOpportunityConfirm => 'ఈ అవకాశాన్ని తొలగించాలా?';

  @override
  String get companyDeleteContactConfirm => 'ఈ పరిచయాన్ని తొలగించాలా?';

  @override
  String get companyDeleteTaskConfirm => 'ఈ పనిని తొలగించాలా?';

  @override
  String get companyDeleteConfirmTitle => 'ఈ క్లయింట్‌ను తొలగించాలా?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — దీని పరిచయాలు, అవకాశాలు, పనులు మరియు చరిత్ర కూడా దీనితో పాటు తొలగించబడతాయి.';
  }

  @override
  String get companyNewNoteTitle => 'కొత్త గమనిక';

  @override
  String get companyNoteFieldLabel => 'గమనిక (లేదా చెప్పి రాయండి)';

  @override
  String get companyTabOverview => 'అవలోకనం';

  @override
  String get companyTabActivity => 'కార్యాచరణ';

  @override
  String get companyTabTasks => 'పనులు';

  @override
  String get companyTabDeals => 'అవకాశాలు';

  @override
  String get companyContactsTitle => 'పరిచయాలు';

  @override
  String get companyNoContacts => 'పరిచయాలు లేవు';

  @override
  String get companyNoActivity => 'కార్యాచరణ లేదు — ఒక గమనికను జోడించండి.';

  @override
  String get companyNoTasks => 'పనులు లేవు';

  @override
  String get companyNoDeals => 'అవకాశాలు లేవు';

  @override
  String get companyNoteButtonLabel => 'గమనిక';

  @override
  String get companyNewClientTitle => 'కొత్త క్లయింట్';

  @override
  String get companyEditClientTitle => 'క్లయింట్‌ను సవరించండి';

  @override
  String get companyWebsiteLabel => 'వెబ్‌సైట్';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ట్యాగ్‌లు (కామాలతో వేరు చేయబడినవి)';

  @override
  String get companyNewContactTitle => 'కొత్త పరిచయం';

  @override
  String get companyEditContactTitle => 'పరిచయాన్ని సవరించండి';

  @override
  String get companyAppLabel => 'యాప్';

  @override
  String get companyIdentifierNumberLabel => 'గుర్తింపు / సంఖ్య';

  @override
  String get companyOpenTooltip => 'తెరవండి';

  @override
  String get companyRemoveTooltip => 'తీసివేయండి';

  @override
  String get companyRoleFieldLabel => 'పాత్ర (ఉదా. కొనుగోలుదారు)';

  @override
  String get companyMessagingTitle => 'సందేశం పంపడం';

  @override
  String get companyNoMessagingHint =>
      'ఏ మెసేజింగ్ ఛానెల్ జోడించబడలేదు — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'ఇంకా ఏ సంప్రదింపు సమాచారం జోడించబడలేదు.';

  @override
  String get settingsTitle => 'సెట్టింగ్‌లు';

  @override
  String get settingsSubtitle => 'యాప్ యొక్క ఒకసారి కాన్ఫిగరేషన్.';

  @override
  String get settingsLanguagesTitle => 'భాషలు & కరెన్సీ';

  @override
  String get settingsAppLanguageLabel => 'యాప్ భాష';

  @override
  String get settingsDictationLanguageLabel => 'డిక్టేషన్ భాష';

  @override
  String get settingsCurrencyLabel => 'కరెన్సీ';

  @override
  String get settingsFormatsHint =>
      'మొత్తాలు 1,234.56గా (కామా = వేలు, చుక్క = దశాంశం) మరియు తేదీలు dd/mm/yyyyగా చూపబడతాయి, ఇంటర్‌ఫేస్ భాషతో సంబంధం లేకుండా.';

  @override
  String get settingsCompanyTitle => 'కంపెనీ';

  @override
  String get settingsCompanySubtitle =>
      'ఈ CRMని ఉపయోగించే కంపెనీ గుర్తింపు — తర్వాత హెడర్‌లో (వైట్-లేబుల్) మరియు PDF డాక్యుమెంట్ హెడర్‌లలో మళ్లీ ఉపయోగించబడుతుంది.';

  @override
  String get settingsSyncTitle => 'సమకాలీకరణ';

  @override
  String get settingsSyncSubtitle =>
      'డిఫాల్ట్‌గా, మొత్తం డేటా ఈ పరికరంలో స్థానికంగా (SQLite) ఉంటుంది.';

  @override
  String get settingsSyncLocalTitle => 'స్టాండ్‌అలోన్ (స్థానికం మాత్రమే)';

  @override
  String get settingsSyncLocalSubtitle => 'ఈ పరికరం వెలుపల ఏ డేటా పంపబడదు';

  @override
  String get settingsSyncRemoteTitle => 'భాగస్వామ్య డేటాబేస్ (రిమోట్)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite సర్వర్‌తో సమకాలీకరిస్తుంది (server/crm-sync/ చూడండి)';

  @override
  String get settingsServerLabel => 'సర్వర్';

  @override
  String get settingsAccountLabel => 'ఖాతా';

  @override
  String get settingsSyncPasswordHint =>
      'పరికరం యొక్క సురక్షిత కీచైన్‌లో నిల్వ చేయబడింది — డేటాబేస్‌లో ఎప్పుడూ కాదు.';

  @override
  String get settingsSyncNowButton => 'ఇప్పుడు సమకాలీకరించండి';

  @override
  String get settingsSyncPollHint =>
      'బ్యాక్‌గ్రౌండ్‌లో ప్రతి 25 సెకన్లకు ఆటోమేటిక్ పుల్; ప్రతి మార్పు తర్వాత తక్షణ పుష్ (రిమోట్ మోడ్ యాక్టివ్). టైప్ చేస్తున్నప్పుడు పుల్ లేదు.';

  @override
  String get settingsSyncMissingFields => 'సర్వర్, ఖాతా మరియు పాస్‌వర్డ్ అవసరం';

  @override
  String get settingsModulesTitle => 'మాడ్యూల్స్';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK ఇ-ఇన్వాయిసింగ్, స్కానర్, సమకాలీకరణ… — 7-రోజుల ట్రయల్ లేదా లైసెన్స్ యాక్టివేషన్.';

  @override
  String get settingsBrowseModules => 'మాడ్యూల్స్‌ను బ్రౌజ్ చేయండి';

  @override
  String get settingsImportExportTitle => 'దిగుమతి / ఎగుమతి';

  @override
  String get settingsImportExportSubtitle =>
      'క్లయింట్లు, పరిచయాలు మరియు అవకాశాలు CSVగా; vCard నుండి పరిచయాలు.';

  @override
  String get settingsPipelineTitle => 'పైప్‌లైన్';

  @override
  String get settingsPipelineSubtitle =>
      'దశలను మరియు వాటి లేబుల్‌లను అనుకూలీకరించండి.';

  @override
  String get settingsConfigureStages => 'దశలను కాన్ఫిగర్ చేయండి';

  @override
  String get settingsBackupTitle => 'స్థానిక బ్యాకప్';

  @override
  String get settingsBackupSubtitle =>
      'మీ SQLite డేటాబేస్ కాపీని ఎగుమతి చేస్తుంది — అప్‌డేట్‌కు ముందు లేదా ఆర్కైవింగ్ కోసం ఉపయోగకరం.';

  @override
  String get settingsExportDbButton => 'డేటాబేస్‌ను ఎగుమతి చేయండి (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM బ్యాకప్';

  @override
  String settingsExportError(String error) {
    return 'ఎగుమతి విఫలమైంది: $error';
  }

  @override
  String get settingsUsersTitle => 'వినియోగదారులు';

  @override
  String get settingsUsersSubtitleAdmin =>
      'ఖాతాలు, పాత్రలు మరియు పాస్‌వర్డ్‌లు — నిర్వాహకుడు మరియు వినియోగదారు.';

  @override
  String get settingsUsersSubtitleLocked => 'నిర్వాహకుల కోసం మాత్రమే.';

  @override
  String get settingsManageUsersButton => 'వినియోగదారులను నిర్వహించండి';

  @override
  String get settingsUsersLockedHint =>
      'వినియోగదారులను మరియు వారి పాస్‌వర్డ్‌లను చూడటానికి లేదా సవరించడానికి నిర్వాహక ఖాతాతో సైన్ ఇన్ చేయండి.';

  @override
  String get settingsSaveKeychainError =>
      'సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి, కానీ సురక్షిత కీచైన్ అందుబాటులో లేదు — సమకాలీకరణ పాస్‌వర్డ్‌ను సేవ్ చేయలేకపోయాము (పూర్తి రీబిల్డ్ తర్వాత యాప్‌ను పునఃప్రారంభించండి).';

  @override
  String get settingsSaved => 'సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get settingsLogoutConfirmTitle => 'సైన్ అవుట్ చేయాలా?';

  @override
  String get settingsLogoutConfirmDetail =>
      'తిరిగి రావడానికి మీరు మీ పాస్‌వర్డ్ (లేదా Touch ID) నమోదు చేయాలి.';

  @override
  String get settingsLogoutButton => 'సైన్ అవుట్';

  @override
  String get settingsLogoTitle => 'కంపెనీ లోగో';

  @override
  String get settingsLogoSubtitle =>
      'యాప్ పైభాగంలో మరియు బ్యానర్‌లో చూపబడుతుంది.';

  @override
  String get settingsLogoEmpty => 'లోగో లేదు — మీ కంపెనీ లోగోను జోడించండి';

  @override
  String get settingsLogoChoose => 'ఒక చిత్రాన్ని ఎంచుకోండి';

  @override
  String get settingsLogoChange => 'లోగోను మార్చండి';

  @override
  String get usersDeleteSelfError => 'మీ స్వంత ఖాతాను తొలగించలేరు';

  @override
  String get usersDeleteConfirmTitle => 'ఈ వినియోగదారుని తొలగించాలా?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRMకి యాక్సెస్‌ను కోల్పోతారు.';
  }

  @override
  String get usersTitle => 'వినియోగదారులు';

  @override
  String get usersSubtitle => 'ఖాతాలు, పాత్రలు మరియు పాస్‌వర్డ్‌లు.';

  @override
  String get usersAddButton => 'వినియోగదారు';

  @override
  String get usersEmptyTitle => 'వినియోగదారులు లేరు';

  @override
  String get usersEmptySubtitle =>
      'మొదటి ఖాతాను సృష్టించండి — ఇది నిర్వాహకుడిగా ఉంటుంది.';

  @override
  String get usersEmptyAction => 'కొత్త వినియోగదారు';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (మీరు)';
  }

  @override
  String get usersNewTitle => 'కొత్త వినియోగదారు';

  @override
  String get usersEditTitle => 'వినియోగదారుని సవరించండి';

  @override
  String get usersLoginIdLabel => 'లాగిన్ ID';

  @override
  String get usersRoleLabel => 'పాత్ర';

  @override
  String get usersNewPasswordLabel =>
      'కొత్త పాస్‌వర్డ్ (మార్చకూడదనుకుంటే ఖాళీగా ఉంచండి)';

  @override
  String get usersTouchIdTitle => 'ఈ పరికరంలో Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'పాస్‌వర్డ్‌ను మళ్లీ టైప్ చేయకుండా అన్‌లాక్ చేయండి, ఈ పరికరంలో మాత్రమే.';

  @override
  String get roleAdministrator => 'నిర్వాహకుడు';

  @override
  String get roleUser => 'వినియోగదారు';

  @override
  String get dashboardTitleEmbedded => 'డాష్‌బోర్డ్';

  @override
  String get dashboardTitle => 'ఈరోజు';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'నిర్వహించాల్సిన $countString చర్యలు',
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
      other: '+$countString మరిన్ని — అన్నీ చూడండి',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'అందరు సేల్స్ ప్రతినిధులు';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (నేను)';
  }

  @override
  String get dashboardEmptyTitle => 'మీ CRM సిద్ధంగా ఉంది';

  @override
  String get dashboardEmptySubtitle =>
      'మీ మొదటి క్లయింట్‌ను జోడించండి, CSV ఫైల్‌ను దిగుమతి చేయండి, లేదా రాబోయే మాడ్యూల్స్‌ను అన్వేషించండి.';

  @override
  String get dashboardNothingScheduled =>
      'ఏమీ షెడ్యూల్ చేయబడలేదు — మీ ఫాలో-అప్‌లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get dashboardBucketOverdue => 'గడువు ముగిసింది';

  @override
  String get dashboardBucketToday => 'ఈరోజు';

  @override
  String get dashboardBucketWeek => 'ఈ వారం';

  @override
  String get dashboardBucketLater => 'తర్వాత';

  @override
  String get dashboardContactedButton => 'సంప్రదించారు';

  @override
  String get dashboardDoneButton => 'పూర్తయింది';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'అగ్రశ్రేణి క్లయింట్లు (తెరిచిన పైప్‌లైన్)';

  @override
  String get dashboardPipelineByStage => 'దశ వారీగా పైప్‌లైన్';

  @override
  String get dashboardNoOpportunitiesYet => 'ఇంకా అవకాశాలు లేవు';

  @override
  String get dashboardWonLostByMonth => 'నెల వారీగా గెలుపు / ఓటమి';

  @override
  String get dashboardNoClosuresYet => 'ఇంకా క్లోజర్‌లు నమోదు చేయబడలేదు.';

  @override
  String get dashboardRecentActivity => 'ఇటీవలి కార్యాచరణ';

  @override
  String get dashboardNoActivityYet => 'ఇంకా కార్యాచరణ లేదు.';

  @override
  String get metricClients => 'క్లయింట్లు';

  @override
  String get metricOpportunities => 'అవకాశాలు';

  @override
  String get metricPipeline => 'పైప్‌లైన్';

  @override
  String get metricForecast => 'అంచనా';

  @override
  String get metricTasks => 'పనులు';

  @override
  String get metricOverdue => 'గడువు ముగిసింది';

  @override
  String get productTagline => 'మొదటి రోజు నుండి సమయాన్ని ఆదా చేయండి.';

  @override
  String get placeholderDashboardHint =>
      'అవలోకనం: పైప్‌లైన్, ఫాలో-అప్‌లు మరియు ఇటీవలి కార్యాచరణ.';

  @override
  String get placeholderTodayTitle => 'మీ రోజు';

  @override
  String get placeholderTodayHint =>
      'ఎడమవైపు ఒక ఫాలో-అప్‌ను ఎంచుకోండి.\nక్లయింట్ ఇక్కడ తెరుచుకుంటుంది — స్క్రీన్‌ను మార్చకుండా.';

  @override
  String get placeholderClientsTitle => 'క్లయింట్ కార్డ్';

  @override
  String get placeholderClientsHint =>
      'జాబితా నుండి ఒక క్లయింట్‌ను ఎంచుకోండి,\nలేదా + బటన్‌తో కొత్తదాన్ని సృష్టించండి.';

  @override
  String get placeholderPipelineHint =>
      'నిలువు వరుసల మధ్య ఒక కార్డ్‌ను లాగండి.\nక్లయింట్ కార్డ్‌ను తెరవడానికి క్లిక్ చేయండి.';

  @override
  String get placeholderTasksHint =>
      'సంబంధిత క్లయింట్‌ను చూడటానికి ఒక పనిని ఎంచుకోండి.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store ద్వారా సబ్స్క్రైబ్ చేయండి, లేదా eastmarkhk.comలో ఇప్పటికే కొనుగోలు చేసిన సబ్స్క్రిప్షన్‌ను సక్రియం చేయండి.';

  @override
  String get modulesSubtitleWebStore =>
      'ఉచిత ట్రయల్, eastmarkhk.comలో కొనుగోలు — EastmarkHK e-Invoicing యాప్‌లాగే అదే సబ్స్క్రిప్షన్.';

  @override
  String get modulesStatusActiveAppStore => 'యాక్టివ్ — App Store';

  @override
  String get modulesStatusActiveWeb => 'యాక్టివ్ — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ట్రయల్ — $countString రోజులు మిగిలి ఉన్నాయి',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'యాక్టివ్';

  @override
  String get modulesStatusAvailable => 'అందుబాటులో ఉంది';

  @override
  String get modulesBuyFailed =>
      'కొనుగోలును ప్రారంభించలేకపోయాము. మళ్లీ ప్రయత్నించండి లేదా మీ కొనుగోళ్లను పునరుద్ధరించండి.';

  @override
  String get modulesRestoreDone => 'పునరుద్ధరణ పూర్తయింది.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name ఇన్‌స్టాల్ చేసిన యాప్ నుండి సక్రియం చేయబడింది.';
  }

  @override
  String get modulesLicenseNotFound =>
      'లైసెన్స్ స్వయంచాలకంగా కనుగొనబడలేదు. EastmarkHK e-Invoicing → సెట్టింగ్‌లను తెరిచి, మీ యాక్టివేషన్ కోడ్‌ను కాపీ చేసి, ఆపై «వెబ్ కోడ్ సక్రియం చేయి» ఎంచుకోండి.';

  @override
  String get modulesRenewalNote =>
      'App Store ద్వారా స్వయంచాలక పునరుద్ధరణ. సెట్టింగ్‌లు → Apple ID → సబ్స్క్రిప్షన్‌లలో సబ్స్క్రిప్షన్‌ను నిర్వహించండి.';

  @override
  String get modulesWebStoreNote =>
      'లేదా eastmarkhk.comలో సబ్స్క్రైబ్ చేసి, ఇమెయిల్ ద్వారా అందుకున్న కోడ్‌తో సక్రియం చేయండి.';

  @override
  String get modulesHaveEinvoicing =>
      'నా దగ్గర ఇప్పటికే EastmarkHK e-Invoicing ఉంది';

  @override
  String get modulesTry7Days => '7 రోజులు ప్రయత్నించండి';

  @override
  String get modulesSubscribe => 'సబ్స్క్రైబ్ చేయి';

  @override
  String get modulesRestore => 'కొనుగోళ్లను పునరుద్ధరించండి';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com సబ్స్క్రిప్షన్';

  @override
  String get modulesActivateWebCode => 'వెబ్ కోడ్ సక్రియం చేయి';

  @override
  String get modulesUseInCrm => 'CRMలో ఉపయోగించండి';

  @override
  String get modulesDontUseInCrm => 'CRMలో ఉపయోగించవద్దు';

  @override
  String get modulesBuyOnAppStore => 'App Storeలో కొనండి';

  @override
  String get modulesStoreUnavailable =>
      'ఈ బిల్డ్‌లో App Store అందుబాటులో లేదు. App Store బిల్డ్‌ను ఉపయోగించండి, లేదా eastmarkhk.com సభ్యత్వాన్ని సక్రియం చేయండి.';

  @override
  String get modulesCheckingPurchases =>
      'App Store మరియు eastmarkhk.com కొనుగోళ్లు తనిఖీ చేయబడుతున్నాయి…';

  @override
  String get modulesCheckingAppStore =>
      'App Store కొనుగోళ్లు తనిఖీ చేయబడుతున్నాయి…';

  @override
  String get modulesPerMonth => '/ నెల';

  @override
  String get modulesActivationSubtitleAppStore =>
      'మీరు eastmarkhk.comలో సబ్స్క్రైబ్ చేశారా? ఇమెయిల్ ద్వారా అందుకున్న కోడ్‌ను అతికించండి. iPhone/iPadలో, ప్రారంభ కొనుగోలు యాక్టివేషన్‌కు ముందు App Store లేదా సైట్ ద్వారా చేయబడుతుంది.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.comలో సబ్స్క్రైబ్ చేసి, ఆపై ఈ పరికరానికి లింక్ చేయబడిన యాక్టివేషన్ కోడ్‌ను అతికించండి.';

  @override
  String get modulesMachineId => 'మెషిన్ ID';

  @override
  String get modulesCopy => 'కాపీ చేయి';

  @override
  String get modulesSubscriptionEmailLabel => 'సబ్స్క్రిప్షన్ ఇమెయిల్';

  @override
  String get modulesActivationCodeLabel => 'యాక్టివేషన్ కోడ్';

  @override
  String get modulesActivationCodeHint =>
      'కొనుగోలు తర్వాత అందుకున్న కోడ్‌ను అతికించండి';

  @override
  String get modulesActivate => 'సక్రియం చేయి';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.comలో కొనుగోలు చేయండి';

  @override
  String get modulesRequestCodeByEmail => 'ఇమెయిల్ ద్వారా కోడ్ అభ్యర్థించండి';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com ద్వారా సక్రియం చేయబడింది';
  }

  @override
  String get modulesMachineIdCopied => 'మెషిన్ ID కాపీ చేయబడింది';

  @override
  String get modulesEmailRequired => 'మీ సబ్స్క్రిప్షన్ ఇమెయిల్ నమోదు చేయండి';

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
  String get invPickClientTitle => 'క్లయింట్‌ను ఎంచుకోండి';

  @override
  String get invPickClientSearch => 'పేరు, పన్ను ID, దేశం ద్వారా శోధించండి…';

  @override
  String get invPickClientEmpty => 'సరిపోలే క్లయింట్ లేదు.';

  @override
  String get invPickClientButton => 'క్లయింట్‌ను ఎంచుకోండి';

  @override
  String get invClientRequired => 'సేవ్ చేయడానికి ముందు క్లయింట్‌ను ఎంచుకోండి.';

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
  String get invSave => 'సేవ్ చేయండి';

  @override
  String get invSaving => 'సేవ్ చేస్తోంది…';

  @override
  String invEditQuote(String number) {
    return 'కోటేషన్ $number సవరించండి';
  }

  @override
  String invEditInvoice(String number) {
    return 'ఇన్‌వాయిస్ $number సవరించండి';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number సేవ్ చేయబడింది.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'సేవ్ చేయడం సాధ్యం కాలేదు: $error';
  }

  @override
  String get invEditDocument => 'సవరించండి';

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
      'కోటేషన్‌లు మరియు ఇన్‌వాయిస్‌లు — EastmarkHK e-Invoicing డేటా (రసీదులు మరియు రిమైండర్‌లు: స్వతంత్ర యాప్)';

  @override
  String get invOpenStandalone => 'e-Invoicing తెరవండి';

  @override
  String get invLaunchStandalone => 'e-Invoicing ప్రారంభించండి';

  @override
  String get invRemoteConnectionTooltip => 'రిమోట్ కనెక్షన్';

  @override
  String invTabQuotes(int count) {
    return 'కోటేషన్‌లు ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'ఇన్‌వాయిస్‌లు ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'కోటేషన్‌లు లేవు — గెలిచిన అవకాశం నుండి లేదా పైన ఉన్న బటన్ నుండి ఒకటి సృష్టించండి.';

  @override
  String get invEmptyInvoices => 'ఇన్‌వాయిస్‌లు లేవు.';

  @override
  String get invEmptyCompanyDocs => 'కోటేషన్‌లు లేదా ఇన్‌వాయిస్‌లు లేవు.';

  @override
  String get invQuotesSection => 'కోటేషన్‌లు';

  @override
  String get invInvoicesSection => 'ఇన్‌వాయిస్‌లు';

  @override
  String get invCompanyFooter =>
      'పత్రాలు EastmarkHK e-Invoicing ద్వారా నిర్వహించబడతాయి — పంపడం, PDF, రసీదులు మరియు రిమైండర్‌లు స్వతంత్ర యాప్‌లో.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing రిమోట్ మోడ్‌లో ఉంది — కనెక్షన్ కాన్ఫిగర్ చేయబడలేదు.';

  @override
  String get invConfigure => 'కాన్ఫిగర్ చేయండి';

  @override
  String get invAppNotDetected =>
      'e-Invoicing యాప్ కనుగొనబడలేదు — ఈ రికార్డు నుండి కోటేషన్‌లు మరియు ఇన్‌వాయిస్‌లను సృష్టించడానికి EastmarkHK e-Invoicingను ఇన్‌స్టాల్/ప్రారంభించండి.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing రిమోట్ నిల్వ కోసం కాన్ఫిగర్ చేయబడింది. CRMను అదే APIకి కనెక్ట్ చేయడానికి ఇక్కడ అదే ఆధారాలను నమోదు చేయండి — e-Invoicing → సెట్టింగ్‌లు → రిమోట్ నిల్వ వలె అదే విలువలు.';

  @override
  String get invLaunchOnceBody =>
      'భాగస్వామ్య డేటాబేస్‌ను ప్రారంభించడానికి ఒకసారి EastmarkHK e-Invoicingను ప్రారంభించండి, ఆపై ఇక్కడకు తిరిగి రండి.';

  @override
  String get invAcquireAppStoreBody =>
      'ఈ మాడ్యూల్ EastmarkHK e-Invoicingను ఉపయోగిస్తుంది. App Store నుండి డౌన్‌లోడ్ చేసి సభ్యత్వం పొందండి, ఒకసారి ప్రారంభించండి, ఆపై ఇక్కడకు తిరిగి రండి.';

  @override
  String get invAcquireWebBody =>
      'ఈ మాడ్యూల్ EastmarkHK e-Invoicingను ఉపయోగిస్తుంది. eastmarkhk.comలో డౌన్‌లోడ్ చేసి సభ్యత్వం పొందండి, ఒకసారి ప్రారంభించండి, ఆపై ఇక్కడకు తిరిగి రండి.';

  @override
  String get invConfigureRemote => 'రిమోట్ కనెక్షన్‌ను కాన్ఫిగర్ చేయండి';

  @override
  String get invViewOnAppStore => 'App Storeలో చూడండి';

  @override
  String get invViewOnWebsite => 'eastmarkhk.comలో చూడండి';

  @override
  String get invRetry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get invDocInvoice => 'ఇన్‌వాయిస్';

  @override
  String get invDocQuote => 'కోటేషన్';

  @override
  String get invDocClient => 'క్లయింట్';

  @override
  String get invDocStatus => 'స్థితి';

  @override
  String get invDocDate => 'తేదీ';

  @override
  String get invOpenInStandalone => 'e-Invoicingలో తెరవండి';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicingను తెరవడం సాధ్యం కాలేదు — అది ఇన్‌స్టాల్ చేయబడిందో లేదో తనిఖీ చేయండి.';

  @override
  String get invCreateInvoiceFromQuote => 'ఇన్‌వాయిస్‌ను సృష్టించండి';

  @override
  String get invCreatingInvoice => 'ఇన్‌వాయిస్ సృష్టించబడుతోంది…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'కోటేషన్ నుండి ఇన్‌వాయిస్ $number సృష్టించబడింది.';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'ఈ కోటేషన్‌కు ఇప్పటికే ఇన్‌వాయిస్ చేయబడింది.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'ఇన్‌వాయిస్‌ను సృష్టించడం సాధ్యం కాలేదు: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing లింక్';

  @override
  String get invLinkStatusLinked => 'e-Invoicing క్లయింట్ లింక్ చేయబడింది';

  @override
  String get invLinkStatusNone => 'సేవ్ చేయబడిన e-Invoicing లింక్ లేదు';

  @override
  String get invUnlinkCustomer => 'e-Invoicing క్లయింట్‌ను అన్‌లింక్ చేయండి';

  @override
  String get invUnlinkConfirmTitle => 'క్లయింట్‌ను అన్‌లింక్ చేయాలా?';

  @override
  String get invUnlinkConfirmBody =>
      'తదుపరి కోటేషన్ లేదా ఇన్‌వాయిస్ మళ్లీ e-Invoicingలో క్లయింట్‌ను ఎంచుకోవడానికి లేదా సృష్టించడానికి అడుగుతుంది.';

  @override
  String get invUnlinkDone => 'e-Invoicing లింక్ తీసివేయబడింది.';

  @override
  String get invAppStoreUrlMissing =>
      'ఈ బిల్డ్ కోసం e-Invoicing ఇంకా App Storeలో జాబితా చేయబడలేదు. eastmarkhk.comను ఉపయోగించండి లేదా ఇప్పటికే ఇన్‌స్టాల్ చేసిన యాప్‌ను ప్రారంభించండి.';

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
      'భాగస్వామ్య డేటాబేస్: ఈ పరికరాన్ని మళ్లీ కనెక్ట్ చేయడానికి సెట్టింగ్‌లలో సింక్ పాస్‌వర్డ్‌ను నమోదు చేయండి.';

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

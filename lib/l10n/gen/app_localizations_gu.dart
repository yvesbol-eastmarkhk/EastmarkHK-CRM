// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get commonCancel => 'રદ કરો';

  @override
  String get commonSave => 'સાચવો';

  @override
  String get commonDelete => 'કાઢી નાખો';

  @override
  String get commonEdit => 'સંપાદિત કરો';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'વપરાશકર્તાનામ';

  @override
  String get commonDisplayNameLabel => 'પ્રદર્શન નામ';

  @override
  String get commonPasswordLabel => 'પાસવર્ડ';

  @override
  String get commonConfirmPasswordLabel => 'પાસવર્ડની પુષ્ટિ કરો';

  @override
  String get commonPasswordMismatch => 'પાસવર્ડ મેળ ખાતા નથી';

  @override
  String get commonUsernameTaken => 'આ વપરાશકર્તાનામ પહેલેથી વપરાયેલું છે';

  @override
  String get commonChoosePassword => 'પાસવર્ડ પસંદ કરો';

  @override
  String get commonRequiredFields => 'નામ અને વપરાશકર્તાનામ જરૂરી છે';

  @override
  String get passwordFieldShow => 'બતાવો';

  @override
  String get passwordFieldHide => 'છુપાવો';

  @override
  String loginWelcomeBack(String name) {
    return 'પાછા આવવા બદલ સ્વાગત છે, $name';
  }

  @override
  String get loginTitle => 'લૉગિન';

  @override
  String get loginVerifying => 'ચકાસી રહ્યાં છીએ…';

  @override
  String get loginUnlockTouchId => 'Touch ID વડે અનલૉક કરો';

  @override
  String get loginOr => 'અથવા';

  @override
  String get loginRequiredFields => 'વપરાશકર્તાનામ અને પાસવર્ડ જરૂરી છે';

  @override
  String get loginInvalidCredentials => 'ખોટું વપરાશકર્તાનામ અથવા પાસવર્ડ';

  @override
  String get loginSubmit => 'લૉગિન કરો';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'સ્વાગત છે';

  @override
  String get bootstrapSubtitle =>
      'તમારા CRM ને સુરક્ષિત કરવા માટે સંચાલક ખાતું બનાવો.';

  @override
  String get bootstrapSubmit => 'સંચાલક ખાતું બનાવો';

  @override
  String get commonAdd => 'ઉમેરો';

  @override
  String get commonCreate => 'બનાવો';

  @override
  String get commonClose => 'બંધ કરો';

  @override
  String get commonNoName => '(નામ નથી)';

  @override
  String get commonNotesLabel => 'નોંધો';

  @override
  String get commonEmailLabel => 'ઇમેઇલ';

  @override
  String get commonPhoneLabel => 'ફોન';

  @override
  String get commonFirstNameLabel => 'પ્રથમ નામ';

  @override
  String get commonLastNameLabel => 'અટક';

  @override
  String get commonCompanyNameLabel => 'કંપનીનું નામ';

  @override
  String messagingCannotOpen(String target) {
    return '$target ખોલી શકાયું નથી.';
  }

  @override
  String get messagingEmailAppLabel => 'ઇમેઇલ એપ';

  @override
  String get messagingPhoneAppLabel => 'ફોન એપ';

  @override
  String messagingIncompleteId(String label) {
    return '$label ખોલવા માટે ઓળખકર્તા અધૂરો છે.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label ખોલી શકાયું નથી — શું એપ ઇન્સ્ટોલ કરેલી છે?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat કોઈ ચોક્કસ સંપર્ક માટે જાહેર લિંક પ્રદાન કરતું નથી — એપ ખુલશે, પરંતુ વાતચીત જાતે પસંદ કરવી પડશે.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk કોઈ ચોક્કસ સંપર્ક માટે જાહેર લિંક પ્રદાન કરતું નથી — એપ ખુલશે, પરંતુ વાતચીત જાતે પસંદ કરવી પડશે.';

  @override
  String get messagingPhoneCallLabel => 'ફોન કૉલ';

  @override
  String get companyDeleteOpportunityConfirm => 'આ તક કાઢી નાખવી છે?';

  @override
  String get companyDeleteContactConfirm => 'આ સંપર્ક કાઢી નાખવો છે?';

  @override
  String get companyDeleteTaskConfirm => 'આ કાર્ય કાઢી નાખવું છે?';

  @override
  String get companyDeleteConfirmTitle => 'આ ગ્રાહક કાઢી નાખવો છે?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — તેના સંપર્કો, તકો, કાર્યો અને ઇતિહાસ પણ તેની સાથે કાઢી નાખવામાં આવશે.';
  }

  @override
  String get companyNewNoteTitle => 'નવી નોંધ';

  @override
  String get companyNoteFieldLabel => 'નોંધ (અથવા બોલીને લખો)';

  @override
  String get companyTabOverview => 'વિહંગાવલોકન';

  @override
  String get companyTabActivity => 'પ્રવૃત્તિ';

  @override
  String get companyTabTasks => 'કાર્યો';

  @override
  String get companyTabDeals => 'તકો';

  @override
  String get companyContactsTitle => 'સંપર્કો';

  @override
  String get companyNoContacts => 'કોઈ સંપર્ક નથી';

  @override
  String get companyNoActivity => 'કોઈ પ્રવૃત્તિ નથી — એક નોંધ ઉમેરો.';

  @override
  String get companyNoTasks => 'કોઈ કાર્ય નથી';

  @override
  String get companyNoDeals => 'કોઈ તક નથી';

  @override
  String get companyNoteButtonLabel => 'નોંધ';

  @override
  String get companyNewClientTitle => 'નવો ગ્રાહક';

  @override
  String get companyEditClientTitle => 'ગ્રાહક સંપાદિત કરો';

  @override
  String get companyWebsiteLabel => 'વેબસાઇટ';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ટૅગ્સ (અલ્પવિરામથી અલગ કરેલા)';

  @override
  String get companyNewContactTitle => 'નવો સંપર્ક';

  @override
  String get companyEditContactTitle => 'સંપર્ક સંપાદિત કરો';

  @override
  String get companyAppLabel => 'એપ';

  @override
  String get companyIdentifierNumberLabel => 'ઓળખકર્તા / નંબર';

  @override
  String get companyOpenTooltip => 'ખોલો';

  @override
  String get companyRemoveTooltip => 'દૂર કરો';

  @override
  String get companyRoleFieldLabel => 'ભૂમિકા (દા.ત. ખરીદનાર)';

  @override
  String get companyMessagingTitle => 'મેસેજિંગ';

  @override
  String get companyNoMessagingHint =>
      'કોઈ મેસેજિંગ ચેનલ ઉમેરેલી નથી — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'હજુ સુધી કોઈ સંપર્ક માહિતી ઉમેરેલી નથી.';

  @override
  String get settingsTitle => 'સેટિંગ્સ';

  @override
  String get settingsSubtitle => 'એપનું એક વખતનું રૂપરેખાંકન.';

  @override
  String get settingsLanguagesTitle => 'ભાષાઓ અને ચલણ';

  @override
  String get settingsAppLanguageLabel => 'એપ ભાષા';

  @override
  String get settingsDictationLanguageLabel => 'ડિક્ટેશન ભાષા';

  @override
  String get settingsCurrencyLabel => 'ચલણ';

  @override
  String get settingsFormatsHint =>
      'રકમ 1,234.56 તરીકે (અલ્પવિરામ = હજાર, બિંદુ = દશાંશ) અને તારીખો dd/mm/yyyy તરીકે દર્શાવવામાં આવે છે, ઈન્ટરફેસ ભાષાને ધ્યાનમાં લીધા વિના.';

  @override
  String get settingsCompanyTitle => 'કંપની';

  @override
  String get settingsCompanySubtitle =>
      'આ CRM નો ઉપયોગ કરતી કંપનીની ઓળખ — પછીથી હેડર (વ્હાઇટ-લેબલ) અને PDF દસ્તાવેજ હેડરમાં ફરીથી ઉપયોગમાં લેવાશે.';

  @override
  String get settingsSyncTitle => 'સિંક્રનાઇઝેશન';

  @override
  String get settingsSyncSubtitle =>
      'ડિફોલ્ટ રૂપે, બધો ડેટા આ ડિવાઇસ પર સ્થાનિક (SQLite) રહે છે.';

  @override
  String get settingsSyncLocalTitle => 'સ્ટેન્ડઅલોન (ફક્ત સ્થાનિક)';

  @override
  String get settingsSyncLocalSubtitle =>
      'આ ડિવાઇસની બહાર કોઈ ડેટા મોકલવામાં આવતો નથી';

  @override
  String get settingsSyncRemoteTitle => 'શેર કરેલ ડેટાબેઝ (રિમોટ)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite સર્વર સાથે સિંક કરે છે (server/crm-sync/ જુઓ)';

  @override
  String get settingsServerLabel => 'સર્વર';

  @override
  String get settingsAccountLabel => 'ખાતું';

  @override
  String get settingsSyncPasswordHint =>
      'ડિવાઇસની સુરક્ષિત કીચેઇનમાં સંગ્રહિત — ડેટાબેઝમાં ક્યારેય નહીં.';

  @override
  String get settingsSyncNowButton => 'હમણાં સિંક કરો';

  @override
  String get settingsSyncPollHint =>
      'બેકગ્રાઉન્ડમાં દર 25 સેકંડે સ્વચાલિત પુલ; દરેક ફેરફાર પછી તરત જ પુશ (રિમોટ મોડ સક્રિય). ટાઇપ કરતી વખતે કોઈ પુલ નહીં.';

  @override
  String get settingsSyncMissingFields => 'સર્વર, ખાતું અને પાસવર્ડ જરૂરી છે';

  @override
  String get settingsModulesTitle => 'મોડ્યુલો';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, સ્કેનર, સિંક… — 7-દિવસની ટ્રાયલ અથવા લાઇસન્સ સક્રિયકરણ.';

  @override
  String get settingsBrowseModules => 'મોડ્યુલો બ્રાઉઝ કરો';

  @override
  String get settingsImportExportTitle => 'આયાત / નિકાસ';

  @override
  String get settingsImportExportSubtitle =>
      'ગ્રાહકો, સંપર્કો અને તકો CSV તરીકે; vCard માંથી સંપર્કો.';

  @override
  String get settingsPipelineTitle => 'પાઇપલાઇન';

  @override
  String get settingsPipelineSubtitle =>
      'તબક્કાઓ અને તેમના લેબલોને કસ્ટમાઇઝ કરો.';

  @override
  String get settingsConfigureStages => 'તબક્કાઓ ગોઠવો';

  @override
  String get settingsBackupTitle => 'સ્થાનિક બેકઅપ';

  @override
  String get settingsBackupSubtitle =>
      'તમારા SQLite ડેટાબેઝની એક નકલ નિકાસ કરે છે — અપડેટ પહેલા અથવા આર્કાઇવિંગ માટે ઉપયોગી.';

  @override
  String get settingsExportDbButton => 'ડેટાબેઝ નિકાસ કરો (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM બેકઅપ';

  @override
  String settingsExportError(String error) {
    return 'નિકાસ નિષ્ફળ: $error';
  }

  @override
  String get settingsUsersTitle => 'વપરાશકર્તાઓ';

  @override
  String get settingsUsersSubtitleAdmin =>
      'ખાતાઓ, ભૂમિકાઓ અને પાસવર્ડ્સ — સંચાલક અને વપરાશકર્તા.';

  @override
  String get settingsUsersSubtitleLocked => 'ફક્ત સંચાલકો માટે.';

  @override
  String get settingsManageUsersButton => 'વપરાશકર્તાઓનું સંચાલન કરો';

  @override
  String get settingsUsersLockedHint =>
      'વપરાશકર્તાઓ અને તેમના પાસવર્ડ્સ જોવા અથવા સંપાદિત કરવા માટે સંચાલક ખાતાથી સાઇન ઇન કરો.';

  @override
  String get settingsSaveKeychainError =>
      'સેટિંગ્સ સાચવવામાં આવી, પરંતુ સુરક્ષિત કીચેઇન ઉપલબ્ધ નથી — સિંક પાસવર્ડ સાચવી શકાયો નથી (સંપૂર્ણ રીબિલ્ડ પછી એપ ફરીથી શરૂ કરો).';

  @override
  String get settingsSaved => 'સેટિંગ્સ સાચવવામાં આવી';

  @override
  String get settingsLogoutConfirmTitle => 'સાઇન આઉટ કરવું છે?';

  @override
  String get settingsLogoutConfirmDetail =>
      'પાછા આવવા માટે તમારે તમારો પાસવર્ડ (અથવા Touch ID) દાખલ કરવો પડશે.';

  @override
  String get settingsLogoutButton => 'સાઇન આઉટ કરો';

  @override
  String get settingsLogoTitle => 'કંપની લોગો';

  @override
  String get settingsLogoSubtitle =>
      'એપની ટોચે અને બેનરમાં દર્શાવવામાં આવે છે.';

  @override
  String get settingsLogoEmpty => 'કોઈ લોગો નથી — તમારી કંપનીનો લોગો ઉમેરો';

  @override
  String get settingsLogoChoose => 'એક છબી પસંદ કરો';

  @override
  String get settingsLogoChange => 'લોગો બદલો';

  @override
  String get usersDeleteSelfError => 'તમે તમારું પોતાનું ખાતું કાઢી શકતા નથી';

  @override
  String get usersDeleteConfirmTitle => 'આ વપરાશકર્તાને કાઢી નાખવો છે?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM ની ઍક્સેસ ગુમાવશે.';
  }

  @override
  String get usersTitle => 'વપરાશકર્તાઓ';

  @override
  String get usersSubtitle => 'ખાતાઓ, ભૂમિકાઓ અને પાસવર્ડ્સ.';

  @override
  String get usersAddButton => 'વપરાશકર્તા';

  @override
  String get usersEmptyTitle => 'કોઈ વપરાશકર્તા નથી';

  @override
  String get usersEmptySubtitle => 'પ્રથમ ખાતું બનાવો — તે સંચાલક હશે.';

  @override
  String get usersEmptyAction => 'નવો વપરાશકર્તા';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (તમે)';
  }

  @override
  String get usersNewTitle => 'નવો વપરાશકર્તા';

  @override
  String get usersEditTitle => 'વપરાશકર્તા સંપાદિત કરો';

  @override
  String get usersLoginIdLabel => 'લોગિન ID';

  @override
  String get usersRoleLabel => 'ભૂમિકા';

  @override
  String get usersNewPasswordLabel => 'નવો પાસવર્ડ (બદલવો ન હોય તો ખાલી રાખો)';

  @override
  String get usersTouchIdTitle => 'આ ડિવાઇસ પર Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'પાસવર્ડ ફરીથી ટાઇપ કર્યા વિના અનલોક કરો, ફક્ત આ ડિવાઇસ પર.';

  @override
  String get roleAdministrator => 'સંચાલક';

  @override
  String get roleUser => 'વપરાશકર્તા';

  @override
  String get dashboardTitleEmbedded => 'ડેશબોર્ડ';

  @override
  String get dashboardTitle => 'આજે';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ક્રિયાઓ પ્રક્રિયા કરવાની',
      one: '$countString ક્રિયા પ્રક્રિયા કરવાની',
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
      other: '+$countString વધુ — બધું જુઓ',
      one: '+$countString વધુ — બધું જુઓ',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'બધા સેલ્સ પ્રતિનિધિઓ';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (હું)';
  }

  @override
  String get dashboardEmptyTitle => 'તમારું CRM તૈયાર છે';

  @override
  String get dashboardEmptySubtitle =>
      'તમારો પ્રથમ ગ્રાહક ઉમેરો, CSV ફાઇલ આયાત કરો, અથવા આગામી મોડ્યુલો શોધો.';

  @override
  String get dashboardNothingScheduled =>
      'કંઈ સુનિશ્ચિત નથી — તમારા ફોલો-અપ્સ અહીં દેખાશે.';

  @override
  String get dashboardBucketOverdue => 'મુદત વીતી ગઈ';

  @override
  String get dashboardBucketToday => 'આજે';

  @override
  String get dashboardBucketWeek => 'આ અઠવાડિયે';

  @override
  String get dashboardBucketLater => 'પછીથી';

  @override
  String get dashboardContactedButton => 'સંપર્ક કરાયો';

  @override
  String get dashboardDoneButton => 'પૂર્ણ';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'ટોચના ગ્રાહકો (ખુલ્લી પાઇપલાઇન)';

  @override
  String get dashboardPipelineByStage => 'તબક્કા પ્રમાણે પાઇપલાઇન';

  @override
  String get dashboardNoOpportunitiesYet => 'હજુ સુધી કોઈ તક નથી';

  @override
  String get dashboardWonLostByMonth => 'મહિના પ્રમાણે જીત / હાર';

  @override
  String get dashboardNoClosuresYet => 'હજુ સુધી કોઈ ક્લોઝર નોંધાયેલ નથી.';

  @override
  String get dashboardRecentActivity => 'તાજેતરની પ્રવૃત્તિ';

  @override
  String get dashboardNoActivityYet => 'હજુ સુધી કોઈ પ્રવૃત્તિ નથી.';

  @override
  String get metricClients => 'ગ્રાહકો';

  @override
  String get metricOpportunities => 'તકો';

  @override
  String get metricPipeline => 'પાઇપલાઇન';

  @override
  String get metricForecast => 'આગાહી';

  @override
  String get metricTasks => 'કાર્યો';

  @override
  String get metricOverdue => 'મુદત વીતી ગઈ';

  @override
  String get productTagline => 'પ્રથમ દિવસથી સમય બચાવો.';

  @override
  String get placeholderDashboardHint =>
      'વિહંગાવલોકન: પાઇપલાઇન, ફોલો-અપ્સ અને તાજેતરની પ્રવૃત્તિ.';

  @override
  String get placeholderTodayTitle => 'તમારો દિવસ';

  @override
  String get placeholderTodayHint =>
      'ડાબી બાજુ એક ફોલો-અપ પસંદ કરો.\nગ્રાહક અહીં ખુલશે — સ્ક્રીન બદલ્યા વિના.';

  @override
  String get placeholderClientsTitle => 'ગ્રાહક કાર્ડ';

  @override
  String get placeholderClientsHint =>
      'યાદીમાંથી ગ્રાહક પસંદ કરો,\nઅથવા + બટનથી નવો બનાવો.';

  @override
  String get placeholderPipelineHint =>
      'કૉલમ વચ્ચે કાર્ડ ખેંચો.\nગ્રાહક કાર્ડ ખોલવા ક્લિક કરો.';

  @override
  String get placeholderTasksHint =>
      'સંબંધિત ગ્રાહક જોવા માટે એક કાર્ય પસંદ કરો.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store દ્વારા સબ્સ્ક્રાઇબ કરો, અથવા eastmarkhk.com પર પહેલેથી ખરીદેલ સબ્સ્ક્રિપ્શન સક્રિય કરો.';

  @override
  String get modulesSubtitleWebStore =>
      'મફત અજમાયશ, eastmarkhk.com પર ખરીદી — EastmarkHK e-Invoicing એપ જેવું જ સબ્સ્ક્રિપ્શન.';

  @override
  String get modulesStatusActiveAppStore => 'સક્રિય — App Store';

  @override
  String get modulesStatusActiveWeb => 'સક્રિય — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'અજમાયશ — $countString દિવસો બાકી',
      one: 'અજમાયશ — $countString દિવસ બાકી',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'સક્રિય';

  @override
  String get modulesStatusAvailable => 'ઉપલબ્ધ';

  @override
  String get modulesBuyFailed =>
      'ખરીદી શરૂ કરી શકાઈ નહીં. ફરી પ્રયાસ કરો અથવા તમારી ખરીદીઓ પુનઃસ્થાપિત કરો.';

  @override
  String get modulesRestoreDone => 'પુનઃસ્થાપના પૂર્ણ.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name ઇન્સ્ટોલ કરેલી એપમાંથી સક્રિય થયું.';
  }

  @override
  String get modulesLicenseNotFound =>
      'લાઇસેંસ આપમેળે મળ્યું નથી. EastmarkHK e-Invoicing → સેટિંગ્સ ખોલો, તમારો સક્રિયકરણ કોડ કૉપિ કરો, પછી «વેબ કોડ સક્રિય કરો» પસંદ કરો.';

  @override
  String get modulesRenewalNote =>
      'App Store દ્વારા આપમેળે નવીકરણ. સબ્સ્ક્રિપ્શન સેટિંગ્સ → Apple ID → સબ્સ્ક્રિપ્શન્સમાં મેનેજ કરો.';

  @override
  String get modulesWebStoreNote =>
      'અથવા eastmarkhk.com પર સબ્સ્ક્રાઇબ કરો અને ઇમેઇલ દ્વારા મળેલા કોડથી સક્રિય કરો.';

  @override
  String get modulesHaveEinvoicing =>
      'મારી પાસે પહેલેથી EastmarkHK e-Invoicing છે';

  @override
  String get modulesTry7Days => '7 દિવસ અજમાવો';

  @override
  String get modulesSubscribe => 'સબ્સ્ક્રાઇબ કરો';

  @override
  String get modulesRestore => 'ખરીદીઓ પુનઃસ્થાપિત કરો';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com સબ્સ્ક્રિપ્શન';

  @override
  String get modulesActivateWebCode => 'વેબ કોડ સક્રિય કરો';

  @override
  String get modulesUseInCrm => 'CRMમાં ઉપયોગ કરો';

  @override
  String get modulesDontUseInCrm => 'CRMમાં ઉપયોગ ન કરો';

  @override
  String get modulesBuyOnAppStore => 'App Store પરથી ખરીદો';

  @override
  String get modulesStoreUnavailable =>
      'આ બિલ્ડમાં App Store ઉપલબ્ધ નથી. App Store બિલ્ડનો ઉપયોગ કરો, અથવા eastmarkhk.com સબ્સ્ક્રિપ્શન સક્રિય કરો.';

  @override
  String get modulesCheckingPurchases =>
      'App Store અને eastmarkhk.com ખરીદીઓ ચકાસાઈ રહી છે…';

  @override
  String get modulesCheckingAppStore => 'App Store ખરીદીઓ ચકાસાઈ રહી છે…';

  @override
  String get modulesPerMonth => '/ મહિનો';

  @override
  String get modulesActivationSubtitleAppStore =>
      'શું તમે eastmarkhk.com પર સબ્સ્ક્રાઇબ કર્યું છે? ઇમેઇલ દ્વારા મળેલો કોડ પેસ્ટ કરો. iPhone/iPad પર, પ્રારંભિક ખરીદી સક્રિયકરણ પહેલાં App Store અથવા સાઇટ દ્વારા થાય છે.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com પર સબ્સ્ક્રાઇબ કરો, પછી આ ઉપકરણ સાથે સંકળાયેલ સક્રિયકરણ કોડ પેસ્ટ કરો.';

  @override
  String get modulesMachineId => 'મશીન ID';

  @override
  String get modulesCopy => 'કૉપિ';

  @override
  String get modulesSubscriptionEmailLabel => 'સબ્સ્ક્રિપ્શન ઇમેઇલ';

  @override
  String get modulesActivationCodeLabel => 'સક્રિયકરણ કોડ';

  @override
  String get modulesActivationCodeHint => 'ખરીદી પછી મળેલો કોડ પેસ્ટ કરો';

  @override
  String get modulesActivate => 'સક્રિય કરો';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com પર ખરીદો';

  @override
  String get modulesRequestCodeByEmail => 'ઇમેઇલ દ્વારા કોડ માંગો';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com દ્વારા સક્રિય થયું';
  }

  @override
  String get modulesMachineIdCopied => 'મશીન ID કૉપિ થયું';

  @override
  String get modulesEmailRequired => 'તમારો સબ્સ્ક્રિપ્શન ઇમેઇલ દાખલ કરો';

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
  String get invPickClientTitle => 'ક્લાયન્ટ પસંદ કરો';

  @override
  String get invPickClientSearch => 'નામ, ટેક્સ ID, દેશ દ્વારા શોધો…';

  @override
  String get invPickClientEmpty => 'કોઈ મેળ ખાતો ક્લાયન્ટ નથી.';

  @override
  String get invPickClientButton => 'ક્લાયન્ટ પસંદ કરો';

  @override
  String get invClientRequired => 'સાચવતા પહેલાં ક્લાયન્ટ પસંદ કરો.';

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
  String get invSave => 'સાચવો';

  @override
  String get invSaving => 'સાચવી રહ્યાં છીએ…';

  @override
  String invEditQuote(String number) {
    return 'ક્વોટ $number સંપાદિત કરો';
  }

  @override
  String invEditInvoice(String number) {
    return 'ઇન્વોઇસ $number સંપાદિત કરો';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number સાચવ્યું.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'સાચવી શકાયું નથી: $error';
  }

  @override
  String get invEditDocument => 'સંપાદિત કરો';

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
      'ક્વોટ અને ઇન્વોઇસ — EastmarkHK e-Invoicing ડેટા (રસીદ અને રિમાઇન્ડર: સ્વતંત્ર એપ)';

  @override
  String get invOpenStandalone => 'e-Invoicing ખોલો';

  @override
  String get invLaunchStandalone => 'e-Invoicing શરૂ કરો';

  @override
  String get invRemoteConnectionTooltip => 'રિમોટ કનેક્શન';

  @override
  String invTabQuotes(int count) {
    return 'ક્વોટ ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'ઇન્વોઇસ ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'કોઈ ક્વોટ નથી — જીતેલી તક અથવા ઉપરના બટનમાંથી એક બનાવો.';

  @override
  String get invEmptyInvoices => 'કોઈ ઇન્વોઇસ નથી.';

  @override
  String get invEmptyCompanyDocs => 'કોઈ ક્વોટ કે ઇન્વોઇસ નથી.';

  @override
  String get invQuotesSection => 'ક્વોટ';

  @override
  String get invInvoicesSection => 'ઇન્વોઇસ';

  @override
  String get invCompanyFooter =>
      'દસ્તાવેજો EastmarkHK e-Invoicing દ્વારા સંચાલિત — મોકલવું, PDF, રસીદ અને રિમાઇન્ડર સ્વતંત્ર એપમાં.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing રિમોટ મોડમાં છે — કનેક્શન ગોઠવેલું નથી.';

  @override
  String get invConfigure => 'ગોઠવો';

  @override
  String get invAppNotDetected =>
      'e-Invoicing એપ મળી નથી — આ રેકોર્ડમાંથી ક્વોટ અને ઇન્વોઇસ બનાવવા EastmarkHK e-Invoicing ઇન્સ્ટોલ/શરૂ કરો.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing રિમોટ સ્ટોરેજ માટે ગોઠવેલું છે. CRMને એ જ API સાથે જોડવા અહીં એ જ ઓળખપત્રો દાખલ કરો — e-Invoicing → સેટિંગ્સ → રિમોટ સ્ટોરેજ જેવા જ મૂલ્યો.';

  @override
  String get invLaunchOnceBody =>
      'શેર કરેલ ડેટાબેઝ શરૂ કરવા EastmarkHK e-Invoicing એકવાર શરૂ કરો, પછી અહીં પાછા આવો.';

  @override
  String get invAcquireAppStoreBody =>
      'આ મોડ્યુલ EastmarkHK e-Invoicingનો ઉપયોગ કરે છે. App Store પરથી ડાઉનલોડ કરી સબ્સ્ક્રાઇબ કરો, એકવાર શરૂ કરો, પછી અહીં પાછા આવો.';

  @override
  String get invAcquireWebBody =>
      'આ મોડ્યુલ EastmarkHK e-Invoicingનો ઉપયોગ કરે છે. eastmarkhk.com પર ડાઉનલોડ કરી સબ્સ્ક્રાઇબ કરો, એકવાર શરૂ કરો, પછી અહીં પાછા આવો.';

  @override
  String get invConfigureRemote => 'રિમોટ કનેક્શન ગોઠવો';

  @override
  String get invViewOnAppStore => 'App Store પર જુઓ';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com પર જુઓ';

  @override
  String get invRetry => 'ફરી પ્રયાસ કરો';

  @override
  String get invDocInvoice => 'ઇન્વોઇસ';

  @override
  String get invDocQuote => 'ક્વોટ';

  @override
  String get invDocClient => 'ક્લાયન્ટ';

  @override
  String get invDocStatus => 'સ્થિતિ';

  @override
  String get invDocDate => 'તારીખ';

  @override
  String get invOpenInStandalone => 'e-Invoicingમાં ખોલો';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing ખોલી શકાયું નથી — તે ઇન્સ્ટોલ છે કે નહીં ચકાસો.';

  @override
  String get invCreateInvoiceFromQuote => 'ઇન્વોઇસ બનાવો';

  @override
  String get invCreatingInvoice => 'ઇન્વોઇસ બનાવી રહ્યાં છીએ…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'ક્વોટમાંથી ઇન્વોઇસ $number બનાવ્યું.';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'આ ક્વોટનું ઇન્વોઇસ પહેલેથી બની ગયું છે.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'ઇન્વોઇસ બનાવી શકાયું નથી: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing લિંક';

  @override
  String get invLinkStatusLinked => 'e-Invoicing ક્લાયન્ટ લિંક થયેલ';

  @override
  String get invLinkStatusNone => 'કોઈ e-Invoicing લિંક સાચવેલ નથી';

  @override
  String get invUnlinkCustomer => 'e-Invoicing ક્લાયન્ટ અનલિંક કરો';

  @override
  String get invUnlinkConfirmTitle => 'ક્લાયન્ટ અનલિંક કરવો છે?';

  @override
  String get invUnlinkConfirmBody =>
      'આગલું ક્વોટ કે ઇન્વોઇસ ફરીથી e-Invoicingમાં ક્લાયન્ટ પસંદ કરવા કે બનાવવા કહેશે.';

  @override
  String get invUnlinkDone => 'e-Invoicing લિંક દૂર કરી.';

  @override
  String get invAppStoreUrlMissing =>
      'આ બિલ્ડ માટે e-Invoicing હજી App Store પર સૂચિબદ્ધ નથી. eastmarkhk.com નો ઉપયોગ કરો અથવા પહેલેથી ઇન્સ્ટોલ કરેલી એપ શરૂ કરો.';

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
      'શેર કરેલ ડેટાબેઝ: આ ડિવાઇસને ફરીથી કનેક્ટ કરવા સેટિંગ્સમાં સિંક પાસવર્ડ દાખલ કરો.';

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
}

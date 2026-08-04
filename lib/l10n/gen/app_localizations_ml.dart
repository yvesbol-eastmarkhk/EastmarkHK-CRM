// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get commonCancel => 'റദ്ദാക്കുക';

  @override
  String get commonSave => 'സംരക്ഷിക്കുക';

  @override
  String get commonDelete => 'ഇല്ലാതാക്കുക';

  @override
  String get commonEdit => 'തിരുത്തുക';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'ഉപയോക്തൃനാമം';

  @override
  String get commonDisplayNameLabel => 'പ്രദർശന നാമം';

  @override
  String get commonPasswordLabel => 'പാസ്‌വേഡ്';

  @override
  String get commonConfirmPasswordLabel => 'പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get commonPasswordMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get commonUsernameTaken => 'ഈ ഉപയോക്തൃനാമം ഇതിനകം ഉപയോഗത്തിലാണ്';

  @override
  String get commonChoosePassword => 'ഒരു പാസ്‌വേഡ് തിരഞ്ഞെടുക്കുക';

  @override
  String get commonRequiredFields => 'പേരും ഉപയോക്തൃനാമവും ആവശ്യമാണ്';

  @override
  String get passwordFieldShow => 'കാണിക്കുക';

  @override
  String get passwordFieldHide => 'മറയ്ക്കുക';

  @override
  String loginWelcomeBack(String name) {
    return 'തിരികെ സ്വാഗതം, $name';
  }

  @override
  String get loginTitle => 'ലോഗിൻ';

  @override
  String get loginVerifying => 'പരിശോധിക്കുന്നു…';

  @override
  String get loginUnlockTouchId => 'Touch ID ഉപയോഗിച്ച് അൺലോക്ക് ചെയ്യുക';

  @override
  String get loginOr => 'അല്ലെങ്കിൽ';

  @override
  String get loginRequiredFields => 'ഉപയോക്തൃനാമവും പാസ്‌വേഡും ആവശ്യമാണ്';

  @override
  String get loginInvalidCredentials =>
      'തെറ്റായ ഉപയോക്തൃനാമം അല്ലെങ്കിൽ പാസ്‌വേഡ്';

  @override
  String get loginSubmit => 'ലോഗിൻ ചെയ്യുക';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'സ്വാഗതം';

  @override
  String get bootstrapSubtitle =>
      'നിങ്ങളുടെ CRM സുരക്ഷിതമാക്കാൻ അഡ്മിനിസ്ട്രേറ്റർ അക്കൗണ്ട് സൃഷ്ടിക്കുക.';

  @override
  String get bootstrapSubmit => 'അഡ്മിനിസ്ട്രേറ്റർ അക്കൗണ്ട് സൃഷ്ടിക്കുക';

  @override
  String get commonAdd => 'ചേർക്കുക';

  @override
  String get commonCreate => 'സൃഷ്ടിക്കുക';

  @override
  String get commonClose => 'അടയ്ക്കുക';

  @override
  String get commonNoName => '(പേരില്ല)';

  @override
  String get commonNotesLabel => 'കുറിപ്പുകൾ';

  @override
  String get commonEmailLabel => 'ഇമെയിൽ';

  @override
  String get commonPhoneLabel => 'ഫോൺ';

  @override
  String get commonFirstNameLabel => 'ആദ്യ നാമം';

  @override
  String get commonLastNameLabel => 'അവസാന നാമം';

  @override
  String get commonCompanyNameLabel => 'കമ്പനിയുടെ പേര്';

  @override
  String messagingCannotOpen(String target) {
    return '$target തുറക്കാൻ കഴിഞ്ഞില്ല.';
  }

  @override
  String get messagingEmailAppLabel => 'ഇമെയിൽ ആപ്പ്';

  @override
  String get messagingPhoneAppLabel => 'ഫോൺ ആപ്പ്';

  @override
  String messagingIncompleteId(String label) {
    return '$label തുറക്കാൻ തിരിച്ചറിയൽ അപൂർണ്ണമാണ്.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label തുറക്കാൻ കഴിഞ്ഞില്ല — ആപ്പ് ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ടോ?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat ഒരു നിർദ്ദിഷ്ട കോൺടാക്റ്റിലേക്ക് പൊതു ലിങ്ക് നൽകുന്നില്ല — ആപ്പ് തുറക്കും, പക്ഷേ സംഭാഷണം സ്വമേധയാ തിരഞ്ഞെടുക്കണം.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk ഒരു നിർദ്ദിഷ്ട കോൺടാക്റ്റിലേക്ക് പൊതു ലിങ്ക് നൽകുന്നില്ല — ആപ്പ് തുറക്കും, പക്ഷേ സംഭാഷണം സ്വമേധയാ തിരഞ്ഞെടുക്കണം.';

  @override
  String get messagingPhoneCallLabel => 'ഫോൺ കോൾ';

  @override
  String get companyDeleteOpportunityConfirm => 'ഈ അവസരം ഇല്ലാതാക്കണോ?';

  @override
  String get companyDeleteContactConfirm => 'ഈ കോൺടാക്റ്റ് ഇല്ലാതാക്കണോ?';

  @override
  String get companyDeleteTaskConfirm => 'ഈ ടാസ്ക് ഇല്ലാതാക്കണോ?';

  @override
  String get companyDeleteConfirmTitle => 'ഈ ക്ലയന്റിനെ ഇല്ലാതാക്കണോ?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — ഇതിന്റെ കോൺടാക്റ്റുകൾ, അവസരങ്ങൾ, ടാസ്കുകൾ, ചരിത്രം എന്നിവയും ഇതിനൊപ്പം ഇല്ലാതാക്കും.';
  }

  @override
  String get companyNewNoteTitle => 'പുതിയ കുറിപ്പ്';

  @override
  String get companyNoteFieldLabel => 'കുറിപ്പ് (അല്ലെങ്കിൽ പറഞ്ഞ് എഴുതുക)';

  @override
  String get companyTabOverview => 'അവലോകനം';

  @override
  String get companyTabActivity => 'പ്രവർത്തനം';

  @override
  String get companyTabTasks => 'ടാസ്കുകൾ';

  @override
  String get companyTabDeals => 'അവസരങ്ങൾ';

  @override
  String get companyContactsTitle => 'കോൺടാക്റ്റുകൾ';

  @override
  String get companyNoContacts => 'കോൺടാക്റ്റുകൾ ഇല്ല';

  @override
  String get companyNoActivity => 'പ്രവർത്തനമില്ല — ഒരു കുറിപ്പ് ചേർക്കുക.';

  @override
  String get companyNoTasks => 'ടാസ്കുകൾ ഇല്ല';

  @override
  String get companyNoDeals => 'അവസരങ്ങൾ ഇല്ല';

  @override
  String get companyNoteButtonLabel => 'കുറിപ്പ്';

  @override
  String get companyNewClientTitle => 'പുതിയ ക്ലയന്റ്';

  @override
  String get companyEditClientTitle => 'ക്ലയന്റിനെ എഡിറ്റ് ചെയ്യുക';

  @override
  String get companyWebsiteLabel => 'വെബ്സൈറ്റ്';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ടാഗുകൾ (കോമയാൽ വേർതിരിച്ചത്)';

  @override
  String get companyNewContactTitle => 'പുതിയ കോൺടാക്റ്റ്';

  @override
  String get companyEditContactTitle => 'കോൺടാക്റ്റ് എഡിറ്റ് ചെയ്യുക';

  @override
  String get companyAppLabel => 'ആപ്പ്';

  @override
  String get companyIdentifierNumberLabel => 'തിരിച്ചറിയൽ / നമ്പർ';

  @override
  String get companyOpenTooltip => 'തുറക്കുക';

  @override
  String get companyRemoveTooltip => 'നീക്കം ചെയ്യുക';

  @override
  String get companyRoleFieldLabel => 'റോൾ (ഉദാ. വാങ്ങുന്നയാൾ)';

  @override
  String get companyMessagingTitle => 'മെസേജിംഗ്';

  @override
  String get companyNoMessagingHint =>
      'മെസേജിംഗ് ചാനൽ ചേർത്തിട്ടില്ല — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'ഇതുവരെ കോൺടാക്റ്റ് വിവരങ്ങളൊന്നും ചേർത്തിട്ടില്ല.';

  @override
  String get settingsTitle => 'ക്രമീകരണങ്ങൾ';

  @override
  String get settingsSubtitle => 'ആപ്പിന്റെ ഒറ്റത്തവണ കോൺഫിഗറേഷൻ.';

  @override
  String get settingsLanguagesTitle => 'ഭാഷകളും കറൻസിയും';

  @override
  String get settingsAppLanguageLabel => 'ആപ്പ് ഭാഷ';

  @override
  String get settingsDictationLanguageLabel => 'ഡിക്റ്റേഷൻ ഭാഷ';

  @override
  String get settingsCurrencyLabel => 'കറൻസി';

  @override
  String get settingsFormatsHint =>
      'തുകകൾ 1,234.56 ആയി (കോമ = ആയിരം, പോയിന്റ് = ദശാംശം) തീയതികൾ dd/mm/yyyy ആയി കാണിക്കുന്നു, ഇന്റർഫേസ് ഭാഷ പരിഗണിക്കാതെ.';

  @override
  String get settingsCompanyTitle => 'കമ്പനി';

  @override
  String get settingsCompanySubtitle =>
      'ഈ CRM ഉപയോഗിക്കുന്ന കമ്പനിയുടെ വിവരങ്ങൾ — ഹെഡറിലും (വൈറ്റ്-ലേബൽ) PDF ഡോക്യുമെന്റ് ഹെഡറുകളിലും പിന്നീട് വീണ്ടും ഉപയോഗിക്കും.';

  @override
  String get settingsSyncTitle => 'സമന്വയം';

  @override
  String get settingsSyncSubtitle =>
      'ഡിഫോൾട്ടായി, എല്ലാ ഡാറ്റയും ഈ ഉപകരണത്തിൽ പ്രാദേശികമായി (SQLite) നിലനിൽക്കുന്നു.';

  @override
  String get settingsSyncLocalTitle => 'സ്റ്റാൻഡ്എലോൺ (പ്രാദേശികം മാത്രം)';

  @override
  String get settingsSyncLocalSubtitle =>
      'ഈ ഉപകരണത്തിന് പുറത്തേക്ക് ഡാറ്റയൊന്നും അയക്കുന്നില്ല';

  @override
  String get settingsSyncRemoteTitle => 'പങ്കിട്ട ഡാറ്റാബേസ് (റിമോട്ട്)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite സെർവറുമായി സമന്വയിപ്പിക്കുന്നു (server/crm-sync/ കാണുക)';

  @override
  String get settingsServerLabel => 'സെർവർ';

  @override
  String get settingsAccountLabel => 'അക്കൗണ്ട്';

  @override
  String get settingsSyncPasswordHint =>
      'ഉപകരണത്തിന്റെ സുരക്ഷിത കീചെയിനിൽ സൂക്ഷിച്ചിരിക്കുന്നു — ഡാറ്റാബേസിൽ ഒരിക്കലും ഇല്ല.';

  @override
  String get settingsSyncNowButton => 'ഇപ്പോൾ സമന്വയിപ്പിക്കുക';

  @override
  String get settingsSyncPollHint =>
      'പശ്ചാത്തലത്തിൽ ഓരോ 25 സെക്കൻഡിലും സ്വയമേവ പുൾ; ഓരോ മാറ്റത്തിനും ശേഷം ഉടനടി പുഷ് (റിമോട്ട് മോഡ് സജീവം). ടൈപ്പ് ചെയ്യുമ്പോൾ പുൾ ഇല്ല.';

  @override
  String get settingsSyncMissingFields =>
      'സെർവർ, അക്കൗണ്ട്, പാസ്‌വേഡ് ആവശ്യമാണ്';

  @override
  String get settingsModulesTitle => 'മൊഡ്യൂളുകൾ';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, സ്കാനർ, സമന്വയം… — 7 ദിവസത്തെ ട്രയൽ അല്ലെങ്കിൽ ലൈസൻസ് ആക്റ്റിവേഷൻ.';

  @override
  String get settingsBrowseModules => 'മൊഡ്യൂളുകൾ ബ്രൗസ് ചെയ്യുക';

  @override
  String get settingsImportExportTitle => 'ഇറക്കുമതി / കയറ്റുമതി';

  @override
  String get settingsImportExportSubtitle =>
      'ക്ലയന്റുകൾ, കോൺടാക്റ്റുകൾ, അവസരങ്ങൾ CSV ആയി; vCard-ൽ നിന്ന് കോൺടാക്റ്റുകൾ.';

  @override
  String get settingsPipelineTitle => 'പൈപ്പ്ലൈൻ';

  @override
  String get settingsPipelineSubtitle =>
      'ഘട്ടങ്ങളും അവയുടെ ലേബലുകളും ഇഷ്ടാനുസൃതമാക്കുക.';

  @override
  String get settingsConfigureStages => 'ഘട്ടങ്ങൾ കോൺഫിഗർ ചെയ്യുക';

  @override
  String get settingsBackupTitle => 'പ്രാദേശിക ബാക്കപ്പ്';

  @override
  String get settingsBackupSubtitle =>
      'നിങ്ങളുടെ SQLite ഡാറ്റാബേസിന്റെ ഒരു പകർപ്പ് കയറ്റുമതി ചെയ്യുന്നു — അപ്‌ഡേറ്റിന് മുമ്പോ ആർക്കൈവിംഗിനോ ഉപയോഗപ്രദമാണ്.';

  @override
  String get settingsExportDbButton => 'ഡാറ്റാബേസ് കയറ്റുമതി ചെയ്യുക (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM ബാക്കപ്പ്';

  @override
  String settingsExportError(String error) {
    return 'കയറ്റുമതി പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get settingsUsersTitle => 'ഉപയോക്താക്കൾ';

  @override
  String get settingsUsersSubtitleAdmin =>
      'അക്കൗണ്ടുകൾ, റോളുകൾ, പാസ്‌വേഡുകൾ — അഡ്മിനും ഉപയോക്താവും.';

  @override
  String get settingsUsersSubtitleLocked => 'അഡ്മിനുകൾക്ക് മാത്രം.';

  @override
  String get settingsManageUsersButton => 'ഉപയോക്താക്കളെ നിയന്ത്രിക്കുക';

  @override
  String get settingsUsersLockedHint =>
      'ഉപയോക്താക്കളെയും അവരുടെ പാസ്‌വേഡുകളെയും കാണാനോ എഡിറ്റ് ചെയ്യാനോ അഡ്മിൻ അക്കൗണ്ട് ഉപയോഗിച്ച് സൈൻ ഇൻ ചെയ്യുക.';

  @override
  String get settingsSaveKeychainError =>
      'ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു, പക്ഷേ സുരക്ഷിത കീചെയിൻ ലഭ്യമല്ല — സമന്വയ പാസ്‌വേഡ് സംരക്ഷിക്കാൻ കഴിഞ്ഞില്ല (പൂർണ്ണ പുനർനിർമ്മാണത്തിന് ശേഷം ആപ്പ് പുനരാരംഭിക്കുക).';

  @override
  String get settingsSaved => 'ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get settingsLogoutConfirmTitle => 'സൈൻ ഔട്ട് ചെയ്യണോ?';

  @override
  String get settingsLogoutConfirmDetail =>
      'തിരികെ വരാൻ നിങ്ങളുടെ പാസ്‌വേഡ് (അല്ലെങ്കിൽ Touch ID) നൽകേണ്ടിവരും.';

  @override
  String get settingsLogoutButton => 'സൈൻ ഔട്ട്';

  @override
  String get settingsLogoTitle => 'കമ്പനി ലോഗോ';

  @override
  String get settingsLogoSubtitle =>
      'ആപ്പിന്റെ മുകളിലും ബാനറിലും കാണിക്കുന്നു.';

  @override
  String get settingsLogoEmpty =>
      'ലോഗോയില്ല — നിങ്ങളുടെ കമ്പനിയുടെ ലോഗോ ചേർക്കുക';

  @override
  String get settingsLogoChoose => 'ഒരു ചിത്രം തിരഞ്ഞെടുക്കുക';

  @override
  String get settingsLogoChange => 'ലോഗോ മാറ്റുക';

  @override
  String get usersDeleteSelfError =>
      'നിങ്ങളുടെ സ്വന്തം അക്കൗണ്ട് ഇല്ലാതാക്കാൻ കഴിയില്ല';

  @override
  String get usersDeleteConfirmTitle => 'ഈ ഉപയോക്താവിനെ ഇല്ലാതാക്കണോ?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM-ലേക്കുള്ള ആക്സസ് നഷ്ടപ്പെടും.';
  }

  @override
  String get usersTitle => 'ഉപയോക്താക്കൾ';

  @override
  String get usersSubtitle => 'അക്കൗണ്ടുകൾ, റോളുകൾ, പാസ്‌വേഡുകൾ.';

  @override
  String get usersAddButton => 'ഉപയോക്താവ്';

  @override
  String get usersEmptyTitle => 'ഉപയോക്താക്കൾ ഇല്ല';

  @override
  String get usersEmptySubtitle =>
      'ആദ്യ അക്കൗണ്ട് സൃഷ്ടിക്കുക — ഇത് അഡ്മിൻ ആയിരിക്കും.';

  @override
  String get usersEmptyAction => 'പുതിയ ഉപയോക്താവ്';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (നിങ്ങൾ)';
  }

  @override
  String get usersNewTitle => 'പുതിയ ഉപയോക്താവ്';

  @override
  String get usersEditTitle => 'ഉപയോക്താവിനെ എഡിറ്റ് ചെയ്യുക';

  @override
  String get usersLoginIdLabel => 'ലോഗിൻ ID';

  @override
  String get usersRoleLabel => 'റോൾ';

  @override
  String get usersNewPasswordLabel =>
      'പുതിയ പാസ്‌വേഡ് (മാറ്റേണ്ടെങ്കിൽ ശൂന്യമായി വിടുക)';

  @override
  String get usersTouchIdTitle => 'ഈ ഉപകരണത്തിൽ Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'പാസ്‌വേഡ് വീണ്ടും ടൈപ്പ് ചെയ്യാതെ അൺലോക്ക് ചെയ്യുക, ഈ ഉപകരണത്തിൽ മാത്രം.';

  @override
  String get roleAdministrator => 'അഡ്മിൻ';

  @override
  String get roleUser => 'ഉപയോക്താവ്';

  @override
  String get dashboardTitleEmbedded => 'ഡാഷ്ബോർഡ്';

  @override
  String get dashboardTitle => 'ഇന്ന്';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString നടപടികൾ ചെയ്യേണ്ടതുണ്ട്',
      one: '$countString നടപടി ചെയ്യേണ്ടതുണ്ട്',
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
      other: '+$countString കൂടുതൽ — എല്ലാം കാണുക',
      one: '+$countString കൂടുതൽ — എല്ലാം കാണുക',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'എല്ലാ സെയിൽസ് പ്രതിനിധികളും';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ഞാൻ)';
  }

  @override
  String get dashboardEmptyTitle => 'നിങ്ങളുടെ CRM തയ്യാറാണ്';

  @override
  String get dashboardEmptySubtitle =>
      'നിങ്ങളുടെ ആദ്യ ക്ലയന്റിനെ ചേർക്കുക, ഒരു CSV ഫയൽ ഇറക്കുമതി ചെയ്യുക, അല്ലെങ്കിൽ വരാനിരിക്കുന്ന മൊഡ്യൂളുകൾ പര്യവേക്ഷണം ചെയ്യുക.';

  @override
  String get dashboardNothingScheduled =>
      'ഒന്നും ഷെഡ്യൂൾ ചെയ്തിട്ടില്ല — നിങ്ങളുടെ ഫോളോ-അപ്പുകൾ ഇവിടെ ദൃശ്യമാകും.';

  @override
  String get dashboardBucketOverdue => 'കാലാവധി കഴിഞ്ഞു';

  @override
  String get dashboardBucketToday => 'ഇന്ന്';

  @override
  String get dashboardBucketWeek => 'ഈ ആഴ്ച';

  @override
  String get dashboardBucketLater => 'പിന്നീട്';

  @override
  String get dashboardContactedButton => 'ബന്ധപ്പെട്ടു';

  @override
  String get dashboardDoneButton => 'പൂർത്തിയായി';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'മികച്ച ക്ലയന്റുകൾ (തുറന്ന പൈപ്പ്ലൈൻ)';

  @override
  String get dashboardPipelineByStage => 'ഘട്ടം അനുസരിച്ച് പൈപ്പ്ലൈൻ';

  @override
  String get dashboardNoOpportunitiesYet => 'ഇതുവരെ അവസരങ്ങളൊന്നുമില്ല';

  @override
  String get dashboardWonLostByMonth => 'മാസം അനുസരിച്ച് വിജയം / പരാജയം';

  @override
  String get dashboardNoClosuresYet =>
      'ഇതുവരെ ക്ലോഷറുകളൊന്നും രേഖപ്പെടുത്തിയിട്ടില്ല.';

  @override
  String get dashboardRecentActivity => 'സമീപകാല പ്രവർത്തനം';

  @override
  String get dashboardNoActivityYet => 'ഇതുവരെ പ്രവർത്തനമൊന്നുമില്ല.';

  @override
  String get metricClients => 'ക്ലയന്റുകൾ';

  @override
  String get metricOpportunities => 'അവസരങ്ങൾ';

  @override
  String get metricPipeline => 'പൈപ്പ്ലൈൻ';

  @override
  String get metricForecast => 'പ്രവചനം';

  @override
  String get metricTasks => 'ടാസ്കുകൾ';

  @override
  String get metricOverdue => 'കാലാവധി കഴിഞ്ഞു';

  @override
  String get productTagline => 'ആദ്യ ദിവസം മുതൽ സമയം ലാഭിക്കുക.';

  @override
  String get placeholderDashboardHint =>
      'അവലോകനം: പൈപ്പ്ലൈൻ, ഫോളോ-അപ്പുകൾ, സമീപകാല പ്രവർത്തനം.';

  @override
  String get placeholderTodayTitle => 'നിങ്ങളുടെ ദിവസം';

  @override
  String get placeholderTodayHint =>
      'ഇടതുവശത്ത് ഒരു ഫോളോ-അപ്പ് തിരഞ്ഞെടുക്കുക.\nക്ലയന്റ് ഇവിടെ തുറക്കും — സ്ക്രീൻ മാറ്റാതെ.';

  @override
  String get placeholderClientsTitle => 'ക്ലയന്റ് കാർഡ്';

  @override
  String get placeholderClientsHint =>
      'ലിസ്റ്റിൽ നിന്ന് ഒരു ക്ലയന്റിനെ തിരഞ്ഞെടുക്കുക,\nഅല്ലെങ്കിൽ + ബട്ടൺ ഉപയോഗിച്ച് ഒന്ന് സൃഷ്ടിക്കുക.';

  @override
  String get placeholderPipelineHint =>
      'കോളങ്ങൾക്കിടയിൽ ഒരു കാർഡ് വലിച്ചിടുക.\nക്ലയന്റ് കാർഡ് തുറക്കാൻ ക്ലിക്ക് ചെയ്യുക.';

  @override
  String get placeholderTasksHint =>
      'ബന്ധപ്പെട്ട ക്ലയന്റിനെ കാണാൻ ഒരു ടാസ്ക് തിരഞ്ഞെടുക്കുക.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store വഴി സബ്സ്ക്രൈബ് ചെയ്യുക, അല്ലെങ്കിൽ eastmarkhk.com-ൽ ഇതിനകം വാങ്ങിയ സബ്സ്ക്രിപ്ഷൻ സജീവമാക്കുക.';

  @override
  String get modulesSubtitleWebStore =>
      'സൗജന്യ ട്രയൽ, eastmarkhk.com-ൽ വാങ്ങൽ — EastmarkHK e-Invoicing ആപ്പിന് തുല്യമായ സബ്സ്ക്രിപ്ഷൻ.';

  @override
  String get modulesStatusActiveAppStore => 'സജീവം — App Store';

  @override
  String get modulesStatusActiveWeb => 'സജീവം — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ട്രയൽ — $countString ദിവസങ്ങൾ അവശേഷിക്കുന്നു',
      one: 'ട്രയൽ — $countString ദിവസം അവശേഷിക്കുന്നു',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'സജീവം';

  @override
  String get modulesStatusAvailable => 'ലഭ്യമാണ്';

  @override
  String get modulesBuyFailed =>
      'വാങ്ങൽ ആരംഭിക്കാൻ കഴിഞ്ഞില്ല. വീണ്ടും ശ്രമിക്കുക അല്ലെങ്കിൽ നിങ്ങളുടെ വാങ്ങലുകൾ പുനഃസ്ഥാപിക്കുക.';

  @override
  String get modulesRestoreDone => 'പുനഃസ്ഥാപനം പൂർത്തിയായി.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return 'ഇൻസ്റ്റാൾ ചെയ്ത ആപ്പിൽ നിന്ന് $name സജീവമാക്കി.';
  }

  @override
  String get modulesLicenseNotFound =>
      'ലൈസൻസ് സ്വയമേവ കണ്ടെത്തിയില്ല. EastmarkHK e-Invoicing → ക്രമീകരണങ്ങൾ തുറക്കുക, നിങ്ങളുടെ ആക്ടിവേഷൻ കോഡ് പകർത്തുക, തുടർന്ന് «വെബ് കോഡ് സജീവമാക്കുക» തിരഞ്ഞെടുക്കുക.';

  @override
  String get modulesRenewalNote =>
      'App Store വഴി സ്വയമേവ പുതുക്കൽ. ക്രമീകരണങ്ങൾ → Apple ID → സബ്സ്ക്രിപ്ഷനുകളിൽ സബ്സ്ക്രിപ്ഷൻ നിയന്ത്രിക്കുക.';

  @override
  String get modulesWebStoreNote =>
      'അല്ലെങ്കിൽ eastmarkhk.com-ൽ സബ്സ്ക്രൈബ് ചെയ്ത് ഇമെയിൽ വഴി ലഭിച്ച കോഡ് ഉപയോഗിച്ച് സജീവമാക്കുക.';

  @override
  String get modulesHaveEinvoicing =>
      'എനിക്ക് ഇതിനകം EastmarkHK e-Invoicing ഉണ്ട്';

  @override
  String get modulesTry7Days => '7 ദിവസം പരീക്ഷിക്കുക';

  @override
  String get modulesSubscribe => 'സബ്സ്ക്രൈബ് ചെയ്യുക';

  @override
  String get modulesRestore => 'വാങ്ങലുകൾ പുനഃസ്ഥാപിക്കുക';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com സബ്സ്ക്രിപ്ഷൻ';

  @override
  String get modulesActivateWebCode => 'വെബ് കോഡ് സജീവമാക്കുക';

  @override
  String get modulesUseInCrm => 'CRM-ൽ ഉപയോഗിക്കുക';

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
  String get modulesPerMonth => '/ മാസം';

  @override
  String get modulesActivationSubtitleAppStore =>
      'eastmarkhk.com-ൽ സബ്സ്ക്രൈബ് ചെയ്തിട്ടുണ്ടോ? ഇമെയിൽ വഴി ലഭിച്ച കോഡ് ഒട്ടിക്കുക. iPhone/iPad-ൽ, പ്രാരംഭ വാങ്ങൽ സജീവമാക്കുന്നതിന് മുമ്പ് App Store അല്ലെങ്കിൽ സൈറ്റ് വഴിയാണ് നടക്കുന്നത്.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com-ൽ സബ്സ്ക്രൈബ് ചെയ്യുക, തുടർന്ന് ഈ ഉപകരണവുമായി ബന്ധിപ്പിച്ച ആക്ടിവേഷൻ കോഡ് ഒട്ടിക്കുക.';

  @override
  String get modulesMachineId => 'മെഷീൻ ഐഡി';

  @override
  String get modulesCopy => 'പകർത്തുക';

  @override
  String get modulesSubscriptionEmailLabel => 'സബ്സ്ക്രിപ്ഷൻ ഇമെയിൽ';

  @override
  String get modulesActivationCodeLabel => 'ആക്ടിവേഷൻ കോഡ്';

  @override
  String get modulesActivationCodeHint =>
      'വാങ്ങലിന് ശേഷം ലഭിച്ച കോഡ് ഒട്ടിക്കുക';

  @override
  String get modulesActivate => 'സജീവമാക്കുക';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com-ൽ വാങ്ങുക';

  @override
  String get modulesRequestCodeByEmail => 'ഇമെയിൽ വഴി കോഡ് അഭ്യർത്ഥിക്കുക';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com വഴി സജീവമാക്കി';
  }

  @override
  String get modulesMachineIdCopied => 'മെഷീൻ ഐഡി പകർത്തി';

  @override
  String get modulesEmailRequired => 'നിങ്ങളുടെ സബ്സ്ക്രിപ്ഷൻ ഇമെയിൽ നൽകുക';

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

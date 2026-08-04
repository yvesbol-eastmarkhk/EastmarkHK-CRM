// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get commonCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get commonSave => 'ਸੰਭਾਲੋ';

  @override
  String get commonDelete => 'ਮਿਟਾਓ';

  @override
  String get commonEdit => 'ਸੋਧੋ';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'ਵਰਤੋਂਕਾਰ ਨਾਮ';

  @override
  String get commonDisplayNameLabel => 'ਦਿਖਾਈ ਦੇਣ ਵਾਲਾ ਨਾਮ';

  @override
  String get commonPasswordLabel => 'ਪਾਸਵਰਡ';

  @override
  String get commonConfirmPasswordLabel => 'ਪਾਸਵਰਡ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get commonPasswordMismatch => 'ਪਾਸਵਰਡ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get commonUsernameTaken =>
      'ਇਹ ਵਰਤੋਂਕਾਰ ਨਾਮ ਪਹਿਲਾਂ ਹੀ ਵਰਤਿਆ ਜਾ ਚੁੱਕਾ ਹੈ';

  @override
  String get commonChoosePassword => 'ਇੱਕ ਪਾਸਵਰਡ ਚੁਣੋ';

  @override
  String get commonRequiredFields => 'ਨਾਮ ਅਤੇ ਵਰਤੋਂਕਾਰ ਨਾਮ ਜ਼ਰੂਰੀ ਹਨ';

  @override
  String get passwordFieldShow => 'ਵਿਖਾਓ';

  @override
  String get passwordFieldHide => 'ਲੁਕਾਓ';

  @override
  String loginWelcomeBack(String name) {
    return 'ਵਾਪਸ ਆਉਣ ਤੇ ਜੀ ਆਇਆਂ ਨੂੰ, $name';
  }

  @override
  String get loginTitle => 'ਲੌਗਇਨ';

  @override
  String get loginVerifying => 'ਤਸਦੀਕ ਹੋ ਰਹੀ ਹੈ…';

  @override
  String get loginUnlockTouchId => 'Touch ID ਨਾਲ ਅਨਲੌਕ ਕਰੋ';

  @override
  String get loginOr => 'ਜਾਂ';

  @override
  String get loginRequiredFields => 'ਵਰਤੋਂਕਾਰ ਨਾਮ ਅਤੇ ਪਾਸਵਰਡ ਜ਼ਰੂਰੀ ਹਨ';

  @override
  String get loginInvalidCredentials => 'ਗਲਤ ਵਰਤੋਂਕਾਰ ਨਾਮ ਜਾਂ ਪਾਸਵਰਡ';

  @override
  String get loginSubmit => 'ਲੌਗਇਨ ਕਰੋ';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'ਜੀ ਆਇਆਂ ਨੂੰ';

  @override
  String get bootstrapSubtitle =>
      'ਆਪਣੇ CRM ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਪ੍ਰਬੰਧਕ ਖਾਤਾ ਬਣਾਓ।';

  @override
  String get bootstrapSubmit => 'ਪ੍ਰਬੰਧਕ ਖਾਤਾ ਬਣਾਓ';

  @override
  String get commonAdd => 'ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get commonCreate => 'ਬਣਾਓ';

  @override
  String get commonClose => 'ਬੰਦ ਕਰੋ';

  @override
  String get commonNoName => '(ਕੋਈ ਨਾਮ ਨਹੀਂ)';

  @override
  String get commonNotesLabel => 'ਨੋਟਸ';

  @override
  String get commonEmailLabel => 'ਈਮੇਲ';

  @override
  String get commonPhoneLabel => 'ਫ਼ੋਨ';

  @override
  String get commonFirstNameLabel => 'ਪਹਿਲਾ ਨਾਮ';

  @override
  String get commonLastNameLabel => 'ਆਖਰੀ ਨਾਮ';

  @override
  String get commonCompanyNameLabel => 'ਕੰਪਨੀ ਦਾ ਨਾਮ';

  @override
  String messagingCannotOpen(String target) {
    return '$target ਨੂੰ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ।';
  }

  @override
  String get messagingEmailAppLabel => 'ਈਮੇਲ ਐਪ';

  @override
  String get messagingPhoneAppLabel => 'ਫ਼ੋਨ ਐਪ';

  @override
  String messagingIncompleteId(String label) {
    return '$label ਖੋਲ੍ਹਣ ਲਈ ਅਧੂਰਾ ਪਛਾਣਕਰਤਾ।';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label ਨੂੰ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ — ਕੀ ਐਪ ਇੰਸਟਾਲ ਹੈ?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat ਕਿਸੇ ਖਾਸ ਸੰਪਰਕ ਲਈ ਜਨਤਕ ਲਿੰਕ ਪ੍ਰਦਾਨ ਨਹੀਂ ਕਰਦਾ — ਐਪ ਖੁੱਲ੍ਹੇਗੀ, ਪਰ ਗੱਲਬਾਤ ਹੱਥੀਂ ਚੁਣਨੀ ਪਵੇਗੀ।';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk ਕਿਸੇ ਖਾਸ ਸੰਪਰਕ ਲਈ ਜਨਤਕ ਲਿੰਕ ਪ੍ਰਦਾਨ ਨਹੀਂ ਕਰਦਾ — ਐਪ ਖੁੱਲ੍ਹੇਗੀ, ਪਰ ਗੱਲਬਾਤ ਹੱਥੀਂ ਚੁਣਨੀ ਪਵੇਗੀ।';

  @override
  String get messagingPhoneCallLabel => 'ਫ਼ੋਨ ਕਾਲ';

  @override
  String get companyDeleteOpportunityConfirm => 'ਕੀ ਇਹ ਮੌਕਾ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get companyDeleteContactConfirm => 'ਕੀ ਇਹ ਸੰਪਰਕ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get companyDeleteTaskConfirm => 'ਕੀ ਇਹ ਕੰਮ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get companyDeleteConfirmTitle => 'ਕੀ ਇਹ ਗਾਹਕ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — ਇਸਦੇ ਸੰਪਰਕ, ਮੌਕੇ, ਕੰਮ ਅਤੇ ਇਤਿਹਾਸ ਵੀ ਇਸ ਦੇ ਨਾਲ ਮਿਟਾ ਦਿੱਤੇ ਜਾਣਗੇ।';
  }

  @override
  String get companyNewNoteTitle => 'ਨਵਾਂ ਨੋਟ';

  @override
  String get companyNoteFieldLabel => 'ਨੋਟ (ਜਾਂ ਬੋਲ ਕੇ ਲਿਖੋ)';

  @override
  String get companyTabOverview => 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get companyTabActivity => 'ਸਰਗਰਮੀ';

  @override
  String get companyTabTasks => 'ਕੰਮ';

  @override
  String get companyTabDeals => 'ਮੌਕੇ';

  @override
  String get companyContactsTitle => 'ਸੰਪਰਕ';

  @override
  String get companyNoContacts => 'ਕੋਈ ਸੰਪਰਕ ਨਹੀਂ';

  @override
  String get companyNoActivity => 'ਕੋਈ ਸਰਗਰਮੀ ਨਹੀਂ — ਇੱਕ ਨੋਟ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get companyNoTasks => 'ਕੋਈ ਕੰਮ ਨਹੀਂ';

  @override
  String get companyNoDeals => 'ਕੋਈ ਮੌਕਾ ਨਹੀਂ';

  @override
  String get companyNoteButtonLabel => 'ਨੋਟ';

  @override
  String get companyNewClientTitle => 'ਨਵਾਂ ਗਾਹਕ';

  @override
  String get companyEditClientTitle => 'ਗਾਹਕ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get companyWebsiteLabel => 'ਵੈੱਬਸਾਈਟ';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ਟੈਗ (ਕਾਮਿਆਂ ਨਾਲ ਵੱਖ ਕੀਤੇ)';

  @override
  String get companyNewContactTitle => 'ਨਵਾਂ ਸੰਪਰਕ';

  @override
  String get companyEditContactTitle => 'ਸੰਪਰਕ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get companyAppLabel => 'ਐਪ';

  @override
  String get companyIdentifierNumberLabel => 'ਪਛਾਣਕਰਤਾ / ਨੰਬਰ';

  @override
  String get companyOpenTooltip => 'ਖੋਲ੍ਹੋ';

  @override
  String get companyRemoveTooltip => 'ਹਟਾਓ';

  @override
  String get companyRoleFieldLabel => 'ਭੂਮਿਕਾ (ਜਿਵੇਂ, ਖਰੀਦਦਾਰ)';

  @override
  String get companyMessagingTitle => 'ਮੈਸੇਜਿੰਗ';

  @override
  String get companyNoMessagingHint =>
      'ਕੋਈ ਮੈਸੇਜਿੰਗ ਚੈਨਲ ਸ਼ਾਮਲ ਨਹੀਂ ਕੀਤਾ ਗਿਆ — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'ਹਾਲੇ ਤੱਕ ਕੋਈ ਸੰਪਰਕ ਜਾਣਕਾਰੀ ਸ਼ਾਮਲ ਨਹੀਂ ਕੀਤੀ ਗਈ।';

  @override
  String get settingsTitle => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get settingsSubtitle => 'ਐਪ ਦੀ ਇੱਕ ਵਾਰੀ ਸੰਰਚਨਾ।';

  @override
  String get settingsLanguagesTitle => 'ਭਾਸ਼ਾਵਾਂ ਅਤੇ ਮੁਦਰਾ';

  @override
  String get settingsAppLanguageLabel => 'ਐਪ ਦੀ ਭਾਸ਼ਾ';

  @override
  String get settingsDictationLanguageLabel => 'ਡਿਕਟੇਸ਼ਨ ਭਾਸ਼ਾ';

  @override
  String get settingsCurrencyLabel => 'ਮੁਦਰਾ';

  @override
  String get settingsFormatsHint =>
      'ਰਕਮਾਂ 1,234.56 ਵਜੋਂ (ਕਾਮਾ = ਹਜ਼ਾਰ, ਬਿੰਦੂ = ਦਸ਼ਮਲਵ) ਅਤੇ ਤਾਰੀਖਾਂ dd/mm/yyyy ਵਜੋਂ ਦਿਖਾਈਆਂ ਜਾਂਦੀਆਂ ਹਨ, ਇੰਟਰਫੇਸ ਭਾਸ਼ਾ ਦੀ ਪਰਵਾਹ ਕੀਤੇ ਬਿਨਾਂ।';

  @override
  String get settingsCompanyTitle => 'ਕੰਪਨੀ';

  @override
  String get settingsCompanySubtitle =>
      'ਇਸ CRM ਦੀ ਵਰਤੋਂ ਕਰਨ ਵਾਲੀ ਕੰਪਨੀ ਦੀ ਪਛਾਣ — ਬਾਅਦ ਵਿੱਚ ਹੈਡਰ (ਵ੍ਹਾਈਟ-ਲੇਬਲ) ਅਤੇ PDF ਦਸਤਾਵੇਜ਼ ਹੈਡਰਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਵਰਤੀ ਜਾਵੇਗੀ।';

  @override
  String get settingsSyncTitle => 'ਸਿੰਕ੍ਰੋਨਾਈਜ਼ੇਸ਼ਨ';

  @override
  String get settingsSyncSubtitle =>
      'ਮੂਲ ਰੂਪ ਵਿੱਚ, ਸਾਰਾ ਡਾਟਾ ਇਸ ਡਿਵਾਈਸ ਉੱਤੇ ਸਥਾਨਕ (SQLite) ਰਹਿੰਦਾ ਹੈ।';

  @override
  String get settingsSyncLocalTitle => 'ਸਟੈਂਡਅਲੋਨ (ਸਿਰਫ਼ ਸਥਾਨਕ)';

  @override
  String get settingsSyncLocalSubtitle =>
      'ਇਸ ਡਿਵਾਈਸ ਤੋਂ ਬਾਹਰ ਕੋਈ ਡਾਟਾ ਨਹੀਂ ਭੇਜਿਆ ਜਾਂਦਾ';

  @override
  String get settingsSyncRemoteTitle => 'ਸਾਂਝਾ ਡਾਟਾਬੇਸ (ਰਿਮੋਟ)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite ਸਰਵਰ ਨਾਲ ਸਿੰਕ ਕਰਦਾ ਹੈ (server/crm-sync/ ਦੇਖੋ)';

  @override
  String get settingsServerLabel => 'ਸਰਵਰ';

  @override
  String get settingsAccountLabel => 'ਖਾਤਾ';

  @override
  String get settingsSyncPasswordHint =>
      'ਡਿਵਾਈਸ ਦੀ ਸੁਰੱਖਿਅਤ ਕੀਚੇਨ ਵਿੱਚ ਸੰਭਾਲਿਆ ਗਿਆ — ਡਾਟਾਬੇਸ ਵਿੱਚ ਕਦੇ ਨਹੀਂ।';

  @override
  String get settingsSyncNowButton => 'ਹੁਣੇ ਸਿੰਕ ਕਰੋ';

  @override
  String get settingsSyncPollHint =>
      'ਬੈਕਗ੍ਰਾਊਂਡ ਵਿੱਚ ਹਰ 25 ਸਕਿੰਟਾਂ ਵਿੱਚ ਆਟੋਮੈਟਿਕ ਪੁੱਲ; ਹਰ ਬਦਲਾਅ ਤੋਂ ਬਾਅਦ ਤੁਰੰਤ ਪੁਸ਼ (ਰਿਮੋਟ ਮੋਡ ਸਰਗਰਮ)। ਟਾਈਪ ਕਰਦੇ ਸਮੇਂ ਕੋਈ ਪੁੱਲ ਨਹੀਂ।';

  @override
  String get settingsSyncMissingFields => 'ਸਰਵਰ, ਖਾਤਾ ਅਤੇ ਪਾਸਵਰਡ ਲੋੜੀਂਦੇ ਹਨ';

  @override
  String get settingsModulesTitle => 'ਮੋਡਿਊਲ';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK ਈ-ਇਨਵੌਇਸਿੰਗ, ਸਕੈਨਰ, ਸਿੰਕ… — 7-ਦਿਨਾਂ ਦਾ ਟ੍ਰਾਇਲ ਜਾਂ ਲਾਇਸੈਂਸ ਸਰਗਰਮੀ।';

  @override
  String get settingsBrowseModules => 'ਮੋਡਿਊਲ ਬ੍ਰਾਊਜ਼ ਕਰੋ';

  @override
  String get settingsImportExportTitle => 'ਆਯਾਤ / ਨਿਰਯਾਤ';

  @override
  String get settingsImportExportSubtitle =>
      'ਗਾਹਕ, ਸੰਪਰਕ ਅਤੇ ਮੌਕੇ CSV ਵਜੋਂ; vCard ਤੋਂ ਸੰਪਰਕ।';

  @override
  String get settingsPipelineTitle => 'ਪਾਈਪਲਾਈਨ';

  @override
  String get settingsPipelineSubtitle =>
      'ਪੜਾਵਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਲੇਬਲਾਂ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ।';

  @override
  String get settingsConfigureStages => 'ਪੜਾਅ ਸੰਰਚਿਤ ਕਰੋ';

  @override
  String get settingsBackupTitle => 'ਸਥਾਨਕ ਬੈਕਅੱਪ';

  @override
  String get settingsBackupSubtitle =>
      'ਤੁਹਾਡੇ SQLite ਡਾਟਾਬੇਸ ਦੀ ਇੱਕ ਕਾਪੀ ਨਿਰਯਾਤ ਕਰਦਾ ਹੈ — ਅੱਪਡੇਟ ਤੋਂ ਪਹਿਲਾਂ ਜਾਂ ਆਰਕਾਈਵਿੰਗ ਲਈ ਲਾਭਦਾਇਕ।';

  @override
  String get settingsExportDbButton => 'ਡਾਟਾਬੇਸ ਨਿਰਯਾਤ ਕਰੋ (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM ਬੈਕਅੱਪ';

  @override
  String settingsExportError(String error) {
    return 'ਨਿਰਯਾਤ ਅਸਫਲ: $error';
  }

  @override
  String get settingsUsersTitle => 'ਵਰਤੋਂਕਾਰ';

  @override
  String get settingsUsersSubtitleAdmin =>
      'ਖਾਤੇ, ਭੂਮਿਕਾਵਾਂ ਅਤੇ ਪਾਸਵਰਡ — ਪ੍ਰਸ਼ਾਸਕ ਅਤੇ ਵਰਤੋਂਕਾਰ।';

  @override
  String get settingsUsersSubtitleLocked => 'ਸਿਰਫ਼ ਪ੍ਰਸ਼ਾਸਕਾਂ ਲਈ।';

  @override
  String get settingsManageUsersButton => 'ਵਰਤੋਂਕਾਰਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ';

  @override
  String get settingsUsersLockedHint =>
      'ਵਰਤੋਂਕਾਰਾਂ ਅਤੇ ਉਹਨਾਂ ਦੇ ਪਾਸਵਰਡ ਵੇਖਣ ਜਾਂ ਸੰਪਾਦਿਤ ਕਰਨ ਲਈ ਪ੍ਰਸ਼ਾਸਕ ਖਾਤੇ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰੋ।';

  @override
  String get settingsSaveKeychainError =>
      'ਸੈਟਿੰਗਾਂ ਸੰਭਾਲੀਆਂ ਗਈਆਂ, ਪਰ ਸੁਰੱਖਿਅਤ ਕੀਚੇਨ ਉਪਲਬਧ ਨਹੀਂ ਹੈ — ਸਿੰਕ ਪਾਸਵਰਡ ਸੰਭਾਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ (ਪੂਰੀ ਰੀਬਿਲਡ ਤੋਂ ਬਾਅਦ ਐਪ ਮੁੜ ਚਾਲੂ ਕਰੋ)।';

  @override
  String get settingsSaved => 'ਸੈਟਿੰਗਾਂ ਸੰਭਾਲੀਆਂ ਗਈਆਂ';

  @override
  String get settingsLogoutConfirmTitle => 'ਸਾਈਨ ਆਊਟ ਕਰਨਾ ਹੈ?';

  @override
  String get settingsLogoutConfirmDetail =>
      'ਵਾਪਸ ਆਉਣ ਲਈ ਤੁਹਾਨੂੰ ਆਪਣਾ ਪਾਸਵਰਡ (ਜਾਂ Touch ID) ਦਰਜ ਕਰਨਾ ਪਵੇਗਾ।';

  @override
  String get settingsLogoutButton => 'ਸਾਈਨ ਆਊਟ';

  @override
  String get settingsLogoTitle => 'ਕੰਪਨੀ ਲੋਗੋ';

  @override
  String get settingsLogoSubtitle =>
      'ਐਪ ਦੇ ਸਿਖਰ ਅਤੇ ਬੈਨਰ ਵਿੱਚ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ।';

  @override
  String get settingsLogoEmpty =>
      'ਕੋਈ ਲੋਗੋ ਨਹੀਂ — ਆਪਣੀ ਕੰਪਨੀ ਦਾ ਲੋਗੋ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get settingsLogoChoose => 'ਇੱਕ ਤਸਵੀਰ ਚੁਣੋ';

  @override
  String get settingsLogoChange => 'ਲੋਗੋ ਬਦਲੋ';

  @override
  String get usersDeleteSelfError => 'ਤੁਸੀਂ ਆਪਣਾ ਖੁਦ ਦਾ ਖਾਤਾ ਨਹੀਂ ਮਿਟਾ ਸਕਦੇ';

  @override
  String get usersDeleteConfirmTitle => 'ਕੀ ਇਹ ਵਰਤੋਂਕਾਰ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM ਤੱਕ ਪਹੁੰਚ ਗੁਆ ਦੇਣਗੇ।';
  }

  @override
  String get usersTitle => 'ਵਰਤੋਂਕਾਰ';

  @override
  String get usersSubtitle => 'ਖਾਤੇ, ਭੂਮਿਕਾਵਾਂ ਅਤੇ ਪਾਸਵਰਡ।';

  @override
  String get usersAddButton => 'ਵਰਤੋਂਕਾਰ';

  @override
  String get usersEmptyTitle => 'ਕੋਈ ਵਰਤੋਂਕਾਰ ਨਹੀਂ';

  @override
  String get usersEmptySubtitle => 'ਪਹਿਲਾ ਖਾਤਾ ਬਣਾਓ — ਇਹ ਪ੍ਰਸ਼ਾਸਕ ਹੋਵੇਗਾ।';

  @override
  String get usersEmptyAction => 'ਨਵਾਂ ਵਰਤੋਂਕਾਰ';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (ਤੁਸੀਂ)';
  }

  @override
  String get usersNewTitle => 'ਨਵਾਂ ਵਰਤੋਂਕਾਰ';

  @override
  String get usersEditTitle => 'ਵਰਤੋਂਕਾਰ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get usersLoginIdLabel => 'ਲੌਗਇਨ ID';

  @override
  String get usersRoleLabel => 'ਭੂਮਿਕਾ';

  @override
  String get usersNewPasswordLabel => 'ਨਵਾਂ ਪਾਸਵਰਡ (ਨਾ ਬਦਲਣ ਲਈ ਖਾਲੀ ਛੱਡੋ)';

  @override
  String get usersTouchIdTitle => 'ਇਸ ਡਿਵਾਈਸ ਉੱਤੇ Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'ਪਾਸਵਰਡ ਦੁਬਾਰਾ ਟਾਈਪ ਕੀਤੇ ਬਿਨਾਂ ਅਨਲੌਕ ਕਰੋ, ਸਿਰਫ਼ ਇਸ ਡਿਵਾਈਸ ਉੱਤੇ।';

  @override
  String get roleAdministrator => 'ਪ੍ਰਸ਼ਾਸਕ';

  @override
  String get roleUser => 'ਵਰਤੋਂਕਾਰ';

  @override
  String get dashboardTitleEmbedded => 'ਡੈਸ਼ਬੋਰਡ';

  @override
  String get dashboardTitle => 'ਅੱਜ';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ਕਾਰਵਾਈਆਂ ਨਿਪਟਾਉਣੀਆਂ ਹਨ',
      one: '$countString ਕਾਰਵਾਈ ਨਿਪਟਾਉਣੀ ਹੈ',
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
      other: '+$countString ਹੋਰ — ਸਭ ਵੇਖੋ',
      one: '+$countString ਹੋਰ — ਸਭ ਵੇਖੋ',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'ਸਾਰੇ ਸੇਲਜ਼ ਪ੍ਰਤੀਨਿਧੀ';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ਮੈਂ)';
  }

  @override
  String get dashboardEmptyTitle => 'ਤੁਹਾਡਾ CRM ਤਿਆਰ ਹੈ';

  @override
  String get dashboardEmptySubtitle =>
      'ਆਪਣਾ ਪਹਿਲਾ ਗਾਹਕ ਸ਼ਾਮਲ ਕਰੋ, ਇੱਕ CSV ਫਾਈਲ ਆਯਾਤ ਕਰੋ, ਜਾਂ ਆਉਣ ਵਾਲੇ ਮੋਡਿਊਲ ਖੋਜੋ।';

  @override
  String get dashboardNothingScheduled =>
      'ਕੁਝ ਵੀ ਤਹਿ ਨਹੀਂ — ਤੁਹਾਡੇ ਫਾਲੋ-ਅੱਪ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ।';

  @override
  String get dashboardBucketOverdue => 'ਸਮਾਂ ਸੀਮਾ ਲੰਘ ਗਈ';

  @override
  String get dashboardBucketToday => 'ਅੱਜ';

  @override
  String get dashboardBucketWeek => 'ਇਸ ਹਫ਼ਤੇ';

  @override
  String get dashboardBucketLater => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get dashboardContactedButton => 'ਸੰਪਰਕ ਕੀਤਾ ਗਿਆ';

  @override
  String get dashboardDoneButton => 'ਪੂਰਾ';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'ਚੋਟੀ ਦੇ ਗਾਹਕ (ਖੁੱਲ੍ਹੀ ਪਾਈਪਲਾਈਨ)';

  @override
  String get dashboardPipelineByStage => 'ਪੜਾਅ ਅਨੁਸਾਰ ਪਾਈਪਲਾਈਨ';

  @override
  String get dashboardNoOpportunitiesYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਮੌਕਾ ਨਹੀਂ';

  @override
  String get dashboardWonLostByMonth => 'ਮਹੀਨੇ ਅਨੁਸਾਰ ਜਿੱਤ / ਹਾਰ';

  @override
  String get dashboardNoClosuresYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਕਲੋਜ਼ਰ ਦਰਜ ਨਹੀਂ ਕੀਤਾ ਗਿਆ।';

  @override
  String get dashboardRecentActivity => 'ਹਾਲੀਆ ਸਰਗਰਮੀ';

  @override
  String get dashboardNoActivityYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਸਰਗਰਮੀ ਨਹੀਂ।';

  @override
  String get metricClients => 'ਗਾਹਕ';

  @override
  String get metricOpportunities => 'ਮੌਕੇ';

  @override
  String get metricPipeline => 'ਪਾਈਪਲਾਈਨ';

  @override
  String get metricForecast => 'ਪੂਰਵ ਅਨੁਮਾਨ';

  @override
  String get metricTasks => 'ਕੰਮ';

  @override
  String get metricOverdue => 'ਸਮਾਂ ਸੀਮਾ ਲੰਘ ਗਈ';

  @override
  String get productTagline => 'ਪਹਿਲੇ ਦਿਨ ਤੋਂ ਸਮਾਂ ਬਚਾਓ।';

  @override
  String get placeholderDashboardHint =>
      'ਸੰਖੇਪ ਜਾਣਕਾਰੀ: ਪਾਈਪਲਾਈਨ, ਫਾਲੋ-ਅੱਪ ਅਤੇ ਹਾਲੀਆ ਸਰਗਰਮੀ।';

  @override
  String get placeholderTodayTitle => 'ਤੁਹਾਡਾ ਦਿਨ';

  @override
  String get placeholderTodayHint =>
      'ਖੱਬੇ ਪਾਸੇ ਇੱਕ ਫਾਲੋ-ਅੱਪ ਚੁਣੋ।\nਗਾਹਕ ਇੱਥੇ ਖੁੱਲ੍ਹੇਗਾ — ਸਕ੍ਰੀਨ ਬਦਲੇ ਬਿਨਾਂ।';

  @override
  String get placeholderClientsTitle => 'ਗਾਹਕ ਕਾਰਡ';

  @override
  String get placeholderClientsHint =>
      'ਸੂਚੀ ਵਿੱਚੋਂ ਇੱਕ ਗਾਹਕ ਚੁਣੋ,\nਜਾਂ + ਬਟਨ ਨਾਲ ਇੱਕ ਨਵਾਂ ਬਣਾਓ।';

  @override
  String get placeholderPipelineHint =>
      'ਕਾਲਮਾਂ ਵਿਚਕਾਰ ਇੱਕ ਕਾਰਡ ਖਿੱਚੋ।\nਗਾਹਕ ਕਾਰਡ ਖੋਲ੍ਹਣ ਲਈ ਕਲਿੱਕ ਕਰੋ।';

  @override
  String get placeholderTasksHint => 'ਸੰਬੰਧਿਤ ਗਾਹਕ ਵੇਖਣ ਲਈ ਇੱਕ ਕੰਮ ਚੁਣੋ।';

  @override
  String get modulesSubtitleAppStore =>
      'App Store ਰਾਹੀਂ ਗਾਹਕ ਬਣੋ, ਜਾਂ eastmarkhk.com \'ਤੇ ਪਹਿਲਾਂ ਹੀ ਖਰੀਦੀ ਗਈ ਗਾਹਕੀ ਨੂੰ ਸਰਗਰਮ ਕਰੋ।';

  @override
  String get modulesSubtitleWebStore =>
      'ਮੁਫ਼ਤ ਅਜ਼ਮਾਇਸ਼, eastmarkhk.com \'ਤੇ ਖਰੀਦ — EastmarkHK e-Invoicing ਐਪ ਵਾਂਗ ਹੀ ਗਾਹਕੀ।';

  @override
  String get modulesStatusActiveAppStore => 'ਸਰਗਰਮ — App Store';

  @override
  String get modulesStatusActiveWeb => 'ਸਰਗਰਮ — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ਅਜ਼ਮਾਇਸ਼ — $countString ਦਿਨ ਬਾਕੀ',
      one: 'ਅਜ਼ਮਾਇਸ਼ — $countString ਦਿਨ ਬਾਕੀ',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'ਸਰਗਰਮ';

  @override
  String get modulesStatusAvailable => 'ਉਪਲਬਧ';

  @override
  String get modulesBuyFailed =>
      'ਖਰੀਦ ਸ਼ੁਰੂ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ ਜਾਂ ਆਪਣੀਆਂ ਖਰੀਦਾਂ ਮੁੜ ਬਹਾਲ ਕਰੋ।';

  @override
  String get modulesRestoreDone => 'ਮੁੜ ਬਹਾਲੀ ਪੂਰੀ ਹੋਈ।';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name ਇੰਸਟਾਲ ਕੀਤੀ ਐਪ ਤੋਂ ਸਰਗਰਮ ਕੀਤਾ ਗਿਆ।';
  }

  @override
  String get modulesLicenseNotFound =>
      'ਲਾਇਸੈਂਸ ਆਪਣੇ ਆਪ ਨਹੀਂ ਮਿਲਿਆ। EastmarkHK e-Invoicing → ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ, ਆਪਣਾ ਸਰਗਰਮੀ ਕੋਡ ਕਾਪੀ ਕਰੋ, ਫਿਰ «ਵੈੱਬ ਕੋਡ ਸਰਗਰਮ ਕਰੋ» ਚੁਣੋ।';

  @override
  String get modulesRenewalNote =>
      'App Store ਰਾਹੀਂ ਆਪਣੇ ਆਪ ਨਵੀਨੀਕਰਨ। ਸੈਟਿੰਗਾਂ → Apple ID → ਗਾਹਕੀਆਂ ਵਿੱਚ ਗਾਹਕੀ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ।';

  @override
  String get modulesWebStoreNote =>
      'ਜਾਂ eastmarkhk.com \'ਤੇ ਗਾਹਕ ਬਣੋ ਅਤੇ ਈਮੇਲ ਰਾਹੀਂ ਪ੍ਰਾਪਤ ਕੋਡ ਨਾਲ ਸਰਗਰਮ ਕਰੋ।';

  @override
  String get modulesHaveEinvoicing =>
      'ਮੇਰੇ ਕੋਲ ਪਹਿਲਾਂ ਹੀ EastmarkHK e-Invoicing ਹੈ';

  @override
  String get modulesTry7Days => '7 ਦਿਨ ਅਜ਼ਮਾਓ';

  @override
  String get modulesSubscribe => 'ਗਾਹਕ ਬਣੋ';

  @override
  String get modulesRestore => 'ਖਰੀਦਾਂ ਮੁੜ ਬਹਾਲ ਕਰੋ';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com ਗਾਹਕੀ';

  @override
  String get modulesActivateWebCode => 'ਵੈੱਬ ਕੋਡ ਸਰਗਰਮ ਕਰੋ';

  @override
  String get modulesUseInCrm => 'CRM ਵਿੱਚ ਵਰਤੋਂ';

  @override
  String get modulesDontUseInCrm => 'CRM ਵਿੱਚ ਵਰਤੋਂ ਨਾ ਕਰੋ';

  @override
  String get modulesBuyOnAppStore => 'App Store ਤੋਂ ਖਰੀਦੋ';

  @override
  String get modulesStoreUnavailable =>
      'ਇਸ ਬਿਲਡ ਵਿੱਚ App Store ਉਪਲਬਧ ਨਹੀਂ ਹੈ। App Store ਬਿਲਡ ਵਰਤੋ, ਜਾਂ eastmarkhk.com ਗਾਹਕੀ ਸਰਗਰਮ ਕਰੋ।';

  @override
  String get modulesCheckingPurchases =>
      'App Store ਅਤੇ eastmarkhk.com ਖਰੀਦਾਂ ਦੀ ਜਾਂਚ ਹੋ ਰਹੀ ਹੈ…';

  @override
  String get modulesCheckingAppStore => 'App Store ਖਰੀਦਾਂ ਦੀ ਜਾਂਚ ਹੋ ਰਹੀ ਹੈ…';

  @override
  String get modulesPerMonth => '/ ਮਹੀਨਾ';

  @override
  String get modulesActivationSubtitleAppStore =>
      'ਕੀ ਤੁਸੀਂ eastmarkhk.com \'ਤੇ ਗਾਹਕ ਬਣੇ ਹੋ? ਈਮੇਲ ਰਾਹੀਂ ਪ੍ਰਾਪਤ ਕੋਡ ਪੇਸਟ ਕਰੋ। iPhone/iPad \'ਤੇ, ਸ਼ੁਰੂਆਤੀ ਖਰੀਦ ਸਰਗਰਮ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ App Store ਜਾਂ ਸਾਈਟ ਰਾਹੀਂ ਕੀਤੀ ਜਾਂਦੀ ਹੈ।';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com \'ਤੇ ਗਾਹਕ ਬਣੋ, ਫਿਰ ਇਸ ਡਿਵਾਈਸ ਨਾਲ ਜੁੜਿਆ ਸਰਗਰਮੀ ਕੋਡ ਪੇਸਟ ਕਰੋ।';

  @override
  String get modulesMachineId => 'ਮਸ਼ੀਨ ਆਈਡੀ';

  @override
  String get modulesCopy => 'ਕਾਪੀ ਕਰੋ';

  @override
  String get modulesSubscriptionEmailLabel => 'ਗਾਹਕੀ ਈਮੇਲ';

  @override
  String get modulesActivationCodeLabel => 'ਸਰਗਰਮੀ ਕੋਡ';

  @override
  String get modulesActivationCodeHint => 'ਖਰੀਦ ਤੋਂ ਬਾਅਦ ਪ੍ਰਾਪਤ ਕੋਡ ਪੇਸਟ ਕਰੋ';

  @override
  String get modulesActivate => 'ਸਰਗਰਮ ਕਰੋ';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com \'ਤੇ ਖਰੀਦੋ';

  @override
  String get modulesRequestCodeByEmail => 'ਈਮੇਲ ਰਾਹੀਂ ਕੋਡ ਦੀ ਬੇਨਤੀ ਕਰੋ';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com ਰਾਹੀਂ ਸਰਗਰਮ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String get modulesMachineIdCopied => 'ਮਸ਼ੀਨ ਆਈਡੀ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get modulesEmailRequired => 'ਆਪਣੀ ਗਾਹਕੀ ਈਮੇਲ ਦਰਜ ਕਰੋ';

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
  String get invPickClientTitle => 'ਕਲਾਇੰਟ ਚੁਣੋ';

  @override
  String get invPickClientSearch => 'ਨਾਮ, ਟੈਕਸ ID, ਦੇਸ਼ ਦੁਆਰਾ ਖੋਜੋ…';

  @override
  String get invPickClientEmpty => 'ਕੋਈ ਮੇਲ ਖਾਂਦਾ ਕਲਾਇੰਟ ਨਹੀਂ।';

  @override
  String get invPickClientButton => 'ਕਲਾਇੰਟ ਚੁਣੋ';

  @override
  String get invClientRequired => 'ਸੰਭਾਲਣ ਤੋਂ ਪਹਿਲਾਂ ਇੱਕ ਕਲਾਇੰਟ ਚੁਣੋ।';

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
  String get invSave => 'ਸੰਭਾਲੋ';

  @override
  String get invSaving => 'ਸੰਭਾਲਿਆ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String invEditQuote(String number) {
    return 'ਕੋਟੇਸ਼ਨ $number ਸੰਪਾਦਿਤ ਕਰੋ';
  }

  @override
  String invEditInvoice(String number) {
    return 'ਇਨਵੌਇਸ $number ਸੰਪਾਦਿਤ ਕਰੋ';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number ਸੰਭਾਲਿਆ ਗਿਆ।';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'ਸੰਭਾਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get invEditDocument => 'ਸੰਪਾਦਿਤ ਕਰੋ';

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
      'ਕੋਟੇਸ਼ਨ ਅਤੇ ਇਨਵੌਇਸ — EastmarkHK e-Invoicing ਡਾਟਾ (ਰਸੀਦਾਂ ਅਤੇ ਰੀਮਾਈਂਡਰ: ਸਟੈਂਡਅਲੋਨ ਐਪ)';

  @override
  String get invOpenStandalone => 'e-Invoicing ਖੋਲ੍ਹੋ';

  @override
  String get invLaunchStandalone => 'e-Invoicing ਲਾਂਚ ਕਰੋ';

  @override
  String get invRemoteConnectionTooltip => 'ਰਿਮੋਟ ਕਨੈਕਸ਼ਨ';

  @override
  String invTabQuotes(int count) {
    return 'ਕੋਟੇਸ਼ਨ ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'ਇਨਵੌਇਸ ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'ਕੋਈ ਕੋਟੇਸ਼ਨ ਨਹੀਂ — ਜਿੱਤੇ ਮੌਕੇ ਜਾਂ ਉੱਪਰ ਦਿੱਤੇ ਬਟਨ ਤੋਂ ਇੱਕ ਬਣਾਓ।';

  @override
  String get invEmptyInvoices => 'ਕੋਈ ਇਨਵੌਇਸ ਨਹੀਂ।';

  @override
  String get invEmptyCompanyDocs => 'ਕੋਈ ਕੋਟੇਸ਼ਨ ਜਾਂ ਇਨਵੌਇਸ ਨਹੀਂ।';

  @override
  String get invQuotesSection => 'ਕੋਟੇਸ਼ਨ';

  @override
  String get invInvoicesSection => 'ਇਨਵੌਇਸ';

  @override
  String get invCompanyFooter =>
      'ਦਸਤਾਵੇਜ਼ EastmarkHK e-Invoicing ਦੁਆਰਾ ਪ੍ਰਬੰਧਿਤ — ਭੇਜਣਾ, PDF, ਰਸੀਦਾਂ ਅਤੇ ਰੀਮਾਈਂਡਰ ਸਟੈਂਡਅਲੋਨ ਐਪ ਵਿੱਚ।';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing ਰਿਮੋਟ ਮੋਡ ਵਿੱਚ ਹੈ — ਕਨੈਕਸ਼ਨ ਕੌਂਫਿਗਰ ਨਹੀਂ ਹੈ।';

  @override
  String get invConfigure => 'ਕੌਂਫਿਗਰ ਕਰੋ';

  @override
  String get invAppNotDetected =>
      'e-Invoicing ਐਪ ਨਹੀਂ ਮਿਲੀ — ਇਸ ਰਿਕਾਰਡ ਤੋਂ ਕੋਟੇਸ਼ਨ ਅਤੇ ਇਨਵੌਇਸ ਬਣਾਉਣ ਲਈ EastmarkHK e-Invoicing ਸਥਾਪਿਤ/ਲਾਂਚ ਕਰੋ।';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing ਰਿਮੋਟ ਸਟੋਰੇਜ ਲਈ ਕੌਂਫਿਗਰ ਹੈ। CRM ਨੂੰ ਉਸੇ API ਨਾਲ ਜੋੜਨ ਲਈ ਇੱਥੇ ਉਹੀ ਪ੍ਰਮਾਣ ਪੱਤਰ ਦਰਜ ਕਰੋ — e-Invoicing → ਸੈਟਿੰਗਾਂ → ਰਿਮੋਟ ਸਟੋਰੇਜ ਵਾਂਗ ਹੀ ਮੁੱਲ।';

  @override
  String get invLaunchOnceBody =>
      'ਸਾਂਝੇ ਡੇਟਾਬੇਸ ਨੂੰ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਇੱਕ ਵਾਰ EastmarkHK e-Invoicing ਲਾਂਚ ਕਰੋ, ਫਿਰ ਇੱਥੇ ਵਾਪਸ ਆਓ।';

  @override
  String get invAcquireAppStoreBody =>
      'ਇਹ ਮੋਡਿਊਲ EastmarkHK e-Invoicing ਵਰਤਦਾ ਹੈ। App Store ਤੋਂ ਡਾਊਨਲੋਡ ਕਰੋ ਅਤੇ ਗਾਹਕੀ ਲਓ, ਇੱਕ ਵਾਰ ਲਾਂਚ ਕਰੋ, ਫਿਰ ਇੱਥੇ ਵਾਪਸ ਆਓ।';

  @override
  String get invAcquireWebBody =>
      'ਇਹ ਮੋਡਿਊਲ EastmarkHK e-Invoicing ਵਰਤਦਾ ਹੈ। eastmarkhk.com \'ਤੇ ਡਾਊਨਲੋਡ ਕਰੋ ਅਤੇ ਗਾਹਕੀ ਲਓ, ਇੱਕ ਵਾਰ ਲਾਂਚ ਕਰੋ, ਫਿਰ ਇੱਥੇ ਵਾਪਸ ਆਓ।';

  @override
  String get invConfigureRemote => 'ਰਿਮੋਟ ਕਨੈਕਸ਼ਨ ਕੌਂਫਿਗਰ ਕਰੋ';

  @override
  String get invViewOnAppStore => 'App Store \'ਤੇ ਵੇਖੋ';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com \'ਤੇ ਵੇਖੋ';

  @override
  String get invRetry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get invDocInvoice => 'ਇਨਵੌਇਸ';

  @override
  String get invDocQuote => 'ਕੋਟੇਸ਼ਨ';

  @override
  String get invDocClient => 'ਕਲਾਇੰਟ';

  @override
  String get invDocStatus => 'ਸਥਿਤੀ';

  @override
  String get invDocDate => 'ਮਿਤੀ';

  @override
  String get invOpenInStandalone => 'e-Invoicing ਵਿੱਚ ਖੋਲ੍ਹੋ';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ — ਜਾਂਚੋ ਕਿ ਇਹ ਸਥਾਪਿਤ ਹੈ।';

  @override
  String get invCreateInvoiceFromQuote => 'ਇਨਵੌਇਸ ਬਣਾਓ';

  @override
  String get invCreatingInvoice => 'ਇਨਵੌਇਸ ਬਣਾਇਆ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'ਕੋਟੇਸ਼ਨ ਤੋਂ ਇਨਵੌਇਸ $number ਬਣਾਇਆ ਗਿਆ।';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'ਇਸ ਕੋਟੇਸ਼ਨ ਦਾ ਪਹਿਲਾਂ ਹੀ ਇਨਵੌਇਸ ਬਣ ਚੁੱਕਿਆ ਹੈ।';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'ਇਨਵੌਇਸ ਨਹੀਂ ਬਣਾਇਆ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing ਲਿੰਕ';

  @override
  String get invLinkStatusLinked => 'e-Invoicing ਕਲਾਇੰਟ ਲਿੰਕ ਹੈ';

  @override
  String get invLinkStatusNone => 'ਕੋਈ ਸੰਭਾਲਿਆ e-Invoicing ਲਿੰਕ ਨਹੀਂ';

  @override
  String get invUnlinkCustomer => 'e-Invoicing ਕਲਾਇੰਟ ਅਨਲਿੰਕ ਕਰੋ';

  @override
  String get invUnlinkConfirmTitle => 'ਕਲਾਇੰਟ ਅਨਲਿੰਕ ਕਰਨਾ ਹੈ?';

  @override
  String get invUnlinkConfirmBody =>
      'ਅਗਲਾ ਕੋਟੇਸ਼ਨ ਜਾਂ ਇਨਵੌਇਸ e-Invoicing ਵਿੱਚ ਕਲਾਇੰਟ ਨੂੰ ਦੁਬਾਰਾ ਚੁਣਨ ਜਾਂ ਬਣਾਉਣ ਲਈ ਕਹੇਗਾ।';

  @override
  String get invUnlinkDone => 'e-Invoicing ਲਿੰਕ ਹਟਾ ਦਿੱਤਾ ਗਿਆ।';

  @override
  String get invAppStoreUrlMissing =>
      'ਇਸ ਬਿਲਡ ਲਈ e-Invoicing ਅਜੇ App Store \'ਤੇ ਸੂਚੀਬੱਧ ਨਹੀਂ ਹੈ। eastmarkhk.com ਵਰਤੋ ਜਾਂ ਪਹਿਲਾਂ ਤੋਂ ਸਥਾਪਿਤ ਐਪ ਲਾਂਚ ਕਰੋ।';

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
      'ਸਾਂਝਾ ਡੇਟਾਬੇਸ: ਇਸ ਡਿਵਾਈਸ ਨੂੰ ਦੁਬਾਰਾ ਜੋੜਨ ਲਈ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਿੰਕ ਪਾਸਵਰਡ ਦਰਜ ਕਰੋ।';

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

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonSave => 'সংরক্ষণ করুন';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonEdit => 'সম্পাদনা করুন';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'ব্যবহারকারীর নাম';

  @override
  String get commonDisplayNameLabel => 'প্রদর্শনের নাম';

  @override
  String get commonPasswordLabel => 'পাসওয়ার্ড';

  @override
  String get commonConfirmPasswordLabel => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get commonPasswordMismatch => 'পাসওয়ার্ড মিলছে না';

  @override
  String get commonUsernameTaken =>
      'এই ব্যবহারকারীর নামটি ইতিমধ্যে ব্যবহৃত হয়েছে';

  @override
  String get commonChoosePassword => 'একটি পাসওয়ার্ড নির্বাচন করুন';

  @override
  String get commonRequiredFields => 'নাম এবং ব্যবহারকারীর নাম আবশ্যক';

  @override
  String get passwordFieldShow => 'দেখান';

  @override
  String get passwordFieldHide => 'লুকান';

  @override
  String loginWelcomeBack(String name) {
    return 'ফিরে আসায় স্বাগতম, $name';
  }

  @override
  String get loginTitle => 'লগইন';

  @override
  String get loginVerifying => 'যাচাই করা হচ্ছে…';

  @override
  String get loginUnlockTouchId => 'Touch ID দিয়ে আনলক করুন';

  @override
  String get loginOr => 'অথবা';

  @override
  String get loginRequiredFields => 'ব্যবহারকারীর নাম এবং পাসওয়ার্ড আবশ্যক';

  @override
  String get loginInvalidCredentials => 'ভুল ব্যবহারকারীর নাম বা পাসওয়ার্ড';

  @override
  String get loginSubmit => 'লগইন করুন';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'স্বাগতম';

  @override
  String get bootstrapSubtitle =>
      'আপনার CRM সুরক্ষিত করতে প্রশাসক অ্যাকাউন্ট তৈরি করুন।';

  @override
  String get bootstrapSubmit => 'প্রশাসক অ্যাকাউন্ট তৈরি করুন';

  @override
  String get commonAdd => 'যোগ করুন';

  @override
  String get commonCreate => 'তৈরি করুন';

  @override
  String get commonClose => 'বন্ধ করুন';

  @override
  String get commonNoName => '(নাম নেই)';

  @override
  String get commonNotesLabel => 'নোট';

  @override
  String get commonEmailLabel => 'ইমেল';

  @override
  String get commonPhoneLabel => 'ফোন';

  @override
  String get commonFirstNameLabel => 'প্রথম নাম';

  @override
  String get commonLastNameLabel => 'পদবি';

  @override
  String get commonCompanyNameLabel => 'কোম্পানির নাম';

  @override
  String messagingCannotOpen(String target) {
    return '$target খোলা যায়নি।';
  }

  @override
  String get messagingEmailAppLabel => 'ইমেল অ্যাপ';

  @override
  String get messagingPhoneAppLabel => 'ফোন অ্যাপ';

  @override
  String messagingIncompleteId(String label) {
    return '$label খুলতে অসম্পূর্ণ শনাক্তকারী।';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label খোলা যায়নি — অ্যাপটি কি ইনস্টল করা আছে?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat একটি নির্দিষ্ট পরিচিতির জন্য পাবলিক লিঙ্ক প্রদান করে না — অ্যাপটি খুলবে, তবে কথোপকথনটি ম্যানুয়ালি নির্বাচন করতে হবে।';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk একটি নির্দিষ্ট পরিচিতির জন্য পাবলিক লিঙ্ক প্রদান করে না — অ্যাপটি খুলবে, তবে কথোপকথনটি ম্যানুয়ালি নির্বাচন করতে হবে।';

  @override
  String get messagingPhoneCallLabel => 'ফোন কল';

  @override
  String get companyDeleteOpportunityConfirm => 'এই সুযোগটি মুছবেন?';

  @override
  String get companyDeleteContactConfirm => 'এই পরিচিতিটি মুছবেন?';

  @override
  String get companyDeleteTaskConfirm => 'এই কাজটি মুছবেন?';

  @override
  String get companyDeleteConfirmTitle => 'এই ক্লায়েন্টটি মুছবেন?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — এর পরিচিতি, সুযোগ, কাজ এবং ইতিহাসও এর সাথে মুছে যাবে।';
  }

  @override
  String get companyNewNoteTitle => 'নতুন নোট';

  @override
  String get companyNoteFieldLabel => 'নোট (অথবা বলে লিখুন)';

  @override
  String get companyTabOverview => 'সংক্ষিপ্ত বিবরণ';

  @override
  String get companyTabActivity => 'কার্যকলাপ';

  @override
  String get companyTabTasks => 'কাজ';

  @override
  String get companyTabDeals => 'সুযোগ';

  @override
  String get companyContactsTitle => 'পরিচিতি';

  @override
  String get companyNoContacts => 'কোনো পরিচিতি নেই';

  @override
  String get companyNoActivity => 'কোনো কার্যকলাপ নেই — একটি নোট যোগ করুন।';

  @override
  String get companyNoTasks => 'কোনো কাজ নেই';

  @override
  String get companyNoDeals => 'কোনো সুযোগ নেই';

  @override
  String get companyNoteButtonLabel => 'নোট';

  @override
  String get companyNewClientTitle => 'নতুন ক্লায়েন্ট';

  @override
  String get companyEditClientTitle => 'ক্লায়েন্ট সম্পাদনা করুন';

  @override
  String get companyWebsiteLabel => 'ওয়েবসাইট';

  @override
  String get companyPeppolLabel => 'Peppol আইডি';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ট্যাগ (কমা দ্বারা পৃথক)';

  @override
  String get companyNewContactTitle => 'নতুন পরিচিতি';

  @override
  String get companyEditContactTitle => 'পরিচিতি সম্পাদনা করুন';

  @override
  String get companyAppLabel => 'অ্যাপ';

  @override
  String get companyIdentifierNumberLabel => 'শনাক্তকারী / নম্বর';

  @override
  String get companyOpenTooltip => 'খুলুন';

  @override
  String get companyRemoveTooltip => 'সরান';

  @override
  String get companyRoleFieldLabel => 'ভূমিকা (যেমন, ক্রেতা)';

  @override
  String get companyMessagingTitle => 'মেসেজিং';

  @override
  String get companyNoMessagingHint =>
      'কোনো মেসেজিং চ্যানেল যোগ করা হয়নি — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'এখনও কোনো যোগাযোগের তথ্য যোগ করা হয়নি।';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsSubtitle => 'অ্যাপের একবারের কনফিগারেশন।';

  @override
  String get settingsLanguagesTitle => 'ভাষা এবং মুদ্রা';

  @override
  String get settingsAppLanguageLabel => 'অ্যাপের ভাষা';

  @override
  String get settingsDictationLanguageLabel => 'ডিকটেশন ভাষা';

  @override
  String get settingsCurrencyLabel => 'মুদ্রা';

  @override
  String get settingsFormatsHint =>
      'পরিমাণ 1,234.56 হিসেবে (কমা = হাজার, বিন্দু = দশমিক) এবং তারিখ dd/mm/yyyy হিসেবে দেখানো হয়, ইন্টারফেস ভাষা নির্বিশেষে।';

  @override
  String get settingsCompanyTitle => 'কোম্পানি';

  @override
  String get settingsCompanySubtitle =>
      'এই CRM ব্যবহারকারী কোম্পানির পরিচয় — পরে হেডারে (হোয়াইট-লেবেল) এবং PDF ডকুমেন্ট হেডারে পুনরায় ব্যবহৃত হবে।';

  @override
  String get settingsSyncTitle => 'সিঙ্ক্রোনাইজেশন';

  @override
  String get settingsSyncSubtitle =>
      'ডিফল্টরূপে, সমস্ত ডেটা এই ডিভাইসে স্থানীয়ভাবে (SQLite) থাকে।';

  @override
  String get settingsSyncLocalTitle => 'স্ট্যান্ডঅ্যালোন (শুধুমাত্র স্থানীয়)';

  @override
  String get settingsSyncLocalSubtitle =>
      'এই ডিভাইসের বাইরে কোনো ডেটা পাঠানো হয় না';

  @override
  String get settingsSyncRemoteTitle => 'শেয়ার্ড ডেটাবেস (রিমোট)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite সার্ভারের সাথে সিঙ্ক করে (দেখুন server/crm-sync/)';

  @override
  String get settingsServerLabel => 'সার্ভার';

  @override
  String get settingsAccountLabel => 'অ্যাকাউন্ট';

  @override
  String get settingsSyncPasswordHint =>
      'ডিভাইসের নিরাপদ কীচেইনে সংরক্ষিত — কখনো ডেটাবেসে নয়।';

  @override
  String get settingsSyncNowButton => 'এখনই সিঙ্ক করুন';

  @override
  String get settingsSyncPollHint =>
      'ব্যাকগ্রাউন্ডে প্রতি 25 সেকেন্ডে স্বয়ংক্রিয় পুল; প্রতিটি পরিবর্তনের পরে তাৎক্ষণিক পুশ (রিমোট মোড সক্রিয়)। টাইপ করার সময় কোনো পুল নেই।';

  @override
  String get settingsSyncMissingFields =>
      'সার্ভার, অ্যাকাউন্ট এবং পাসওয়ার্ড প্রয়োজন';

  @override
  String get settingsModulesTitle => 'মডিউল';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK ই-ইনভয়েসিং, স্ক্যানার, সিঙ্ক… — ৭ দিনের ট্রায়াল অথবা লাইসেন্স সক্রিয়করণ।';

  @override
  String get settingsBrowseModules => 'মডিউল ব্রাউজ করুন';

  @override
  String get settingsImportExportTitle => 'আমদানি / রপ্তানি';

  @override
  String get settingsImportExportSubtitle =>
      'ক্লায়েন্ট, পরিচিতি এবং সুযোগ CSV হিসেবে; vCard থেকে পরিচিতি।';

  @override
  String get settingsPipelineTitle => 'পাইপলাইন';

  @override
  String get settingsPipelineSubtitle => 'ধাপ এবং তাদের লেবেল কাস্টমাইজ করুন।';

  @override
  String get settingsConfigureStages => 'ধাপ কনফিগার করুন';

  @override
  String get settingsBackupTitle => 'স্থানীয় ব্যাকআপ';

  @override
  String get settingsBackupSubtitle =>
      'আপনার SQLite ডেটাবেসের একটি কপি রপ্তানি করে — আপডেটের আগে বা আর্কাইভিংয়ের জন্য কার্যকর।';

  @override
  String get settingsExportDbButton => 'ডেটাবেস রপ্তানি করুন (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM ব্যাকআপ';

  @override
  String settingsExportError(String error) {
    return 'রপ্তানি ব্যর্থ হয়েছে: $error';
  }

  @override
  String get settingsUsersTitle => 'ব্যবহারকারী';

  @override
  String get settingsUsersSubtitleAdmin =>
      'অ্যাকাউন্ট, ভূমিকা এবং পাসওয়ার্ড — প্রশাসক এবং ব্যবহারকারী।';

  @override
  String get settingsUsersSubtitleLocked => 'শুধুমাত্র প্রশাসকদের জন্য।';

  @override
  String get settingsManageUsersButton => 'ব্যবহারকারী পরিচালনা করুন';

  @override
  String get settingsUsersLockedHint =>
      'ব্যবহারকারী এবং তাদের পাসওয়ার্ড দেখতে বা সম্পাদনা করতে প্রশাসক অ্যাকাউন্ট দিয়ে সাইন ইন করুন।';

  @override
  String get settingsSaveKeychainError =>
      'সেটিংস সংরক্ষিত হয়েছে, তবে নিরাপদ কীচেইন উপলব্ধ নেই — সিঙ্ক পাসওয়ার্ড সংরক্ষণ করা যায়নি (সম্পূর্ণ রিবিল্ডের পরে অ্যাপ পুনরায় চালু করুন)।';

  @override
  String get settingsSaved => 'সেটিংস সংরক্ষিত হয়েছে';

  @override
  String get settingsLogoutConfirmTitle => 'সাইন আউট করবেন?';

  @override
  String get settingsLogoutConfirmDetail =>
      'ফিরে আসতে আপনাকে আপনার পাসওয়ার্ড (বা Touch ID) লিখতে হবে।';

  @override
  String get settingsLogoutButton => 'সাইন আউট';

  @override
  String get settingsLogoTitle => 'কোম্পানির লোগো';

  @override
  String get settingsLogoSubtitle =>
      'অ্যাপের শীর্ষে এবং ব্যানারে প্রদর্শিত হয়।';

  @override
  String get settingsLogoEmpty =>
      'কোনো লোগো নেই — আপনার কোম্পানির লোগো যোগ করুন';

  @override
  String get settingsLogoChoose => 'একটি ছবি নির্বাচন করুন';

  @override
  String get settingsLogoChange => 'লোগো পরিবর্তন করুন';

  @override
  String get usersDeleteSelfError =>
      'আপনি আপনার নিজের অ্যাকাউন্ট মুছতে পারবেন না';

  @override
  String get usersDeleteConfirmTitle => 'এই ব্যবহারকারীকে মুছবেন?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM অ্যাক্সেস হারাবেন।';
  }

  @override
  String get usersTitle => 'ব্যবহারকারী';

  @override
  String get usersSubtitle => 'অ্যাকাউন্ট, ভূমিকা এবং পাসওয়ার্ড।';

  @override
  String get usersAddButton => 'ব্যবহারকারী';

  @override
  String get usersEmptyTitle => 'কোনো ব্যবহারকারী নেই';

  @override
  String get usersEmptySubtitle =>
      'প্রথম অ্যাকাউন্ট তৈরি করুন — এটি প্রশাসক হবে।';

  @override
  String get usersEmptyAction => 'নতুন ব্যবহারকারী';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (আপনি)';
  }

  @override
  String get usersNewTitle => 'নতুন ব্যবহারকারী';

  @override
  String get usersEditTitle => 'ব্যবহারকারী সম্পাদনা করুন';

  @override
  String get usersLoginIdLabel => 'লগইন আইডি';

  @override
  String get usersRoleLabel => 'ভূমিকা';

  @override
  String get usersNewPasswordLabel =>
      'নতুন পাসওয়ার্ড (পরিবর্তন না করতে খালি রাখুন)';

  @override
  String get usersTouchIdTitle => 'এই ডিভাইসে Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'পাসওয়ার্ড পুনরায় টাইপ না করে আনলক করুন, শুধুমাত্র এই ডিভাইসে।';

  @override
  String get roleAdministrator => 'প্রশাসক';

  @override
  String get roleUser => 'ব্যবহারকারী';

  @override
  String get dashboardTitleEmbedded => 'ড্যাশবোর্ড';

  @override
  String get dashboardTitle => 'আজ';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringটি কর্ম প্রক্রিয়াকরণের জন্য',
      one: '$countStringটি কর্ম প্রক্রিয়াকরণের জন্য',
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
      other: '+$countStringটি আরও — সব দেখুন',
      one: '+$countStringটি আরও — সব দেখুন',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'সমস্ত সেলস প্রতিনিধি';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (আমি)';
  }

  @override
  String get dashboardEmptyTitle => 'আপনার CRM প্রস্তুত';

  @override
  String get dashboardEmptySubtitle =>
      'আপনার প্রথম ক্লায়েন্ট যোগ করুন, একটি CSV ফাইল আমদানি করুন, অথবা আসন্ন মডিউলগুলি অন্বেষণ করুন।';

  @override
  String get dashboardNothingScheduled =>
      'কিছু নির্ধারিত নেই — আপনার ফলো-আপগুলি এখানে প্রদর্শিত হবে।';

  @override
  String get dashboardBucketOverdue => 'মেয়াদোত্তীর্ণ';

  @override
  String get dashboardBucketToday => 'আজ';

  @override
  String get dashboardBucketWeek => 'এই সপ্তাহ';

  @override
  String get dashboardBucketLater => 'পরে';

  @override
  String get dashboardContactedButton => 'যোগাযোগ করা হয়েছে';

  @override
  String get dashboardDoneButton => 'সম্পন্ন';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'শীর্ষ ক্লায়েন্ট (খোলা পাইপলাইন)';

  @override
  String get dashboardPipelineByStage => 'ধাপ অনুযায়ী পাইপলাইন';

  @override
  String get dashboardNoOpportunitiesYet => 'এখনও কোনো সুযোগ নেই';

  @override
  String get dashboardWonLostByMonth => 'মাস অনুযায়ী জয়/পরাজয়';

  @override
  String get dashboardNoClosuresYet => 'এখনও কোনো ক্লোজার রেকর্ড করা হয়নি।';

  @override
  String get dashboardRecentActivity => 'সাম্প্রতিক কার্যকলাপ';

  @override
  String get dashboardNoActivityYet => 'এখনও কোনো কার্যকলাপ নেই।';

  @override
  String get metricClients => 'ক্লায়েন্ট';

  @override
  String get metricOpportunities => 'সুযোগ';

  @override
  String get metricPipeline => 'পাইপলাইন';

  @override
  String get metricForecast => 'পূর্বাভাস';

  @override
  String get metricTasks => 'কাজ';

  @override
  String get metricOverdue => 'মেয়াদোত্তীর্ণ';

  @override
  String get productTagline => 'প্রথম দিন থেকেই সময় বাঁচান।';

  @override
  String get placeholderDashboardHint =>
      'সংক্ষিপ্ত বিবরণ: পাইপলাইন, ফলো-আপ এবং সাম্প্রতিক কার্যকলাপ।';

  @override
  String get placeholderTodayTitle => 'আপনার দিন';

  @override
  String get placeholderTodayHint =>
      'বাম দিকে একটি ফলো-আপ নির্বাচন করুন।\nক্লায়েন্ট এখানে খুলবে — স্ক্রিন পরিবর্তন না করে।';

  @override
  String get placeholderClientsTitle => 'ক্লায়েন্ট কার্ড';

  @override
  String get placeholderClientsHint =>
      'তালিকা থেকে একটি ক্লায়েন্ট নির্বাচন করুন,\nঅথবা + বোতাম দিয়ে একটি তৈরি করুন।';

  @override
  String get placeholderPipelineHint =>
      'কলামের মধ্যে একটি কার্ড টেনে আনুন।\nক্লায়েন্ট কার্ড খুলতে ক্লিক করুন।';

  @override
  String get placeholderTasksHint =>
      'সম্পর্কিত ক্লায়েন্ট দেখতে একটি কাজ নির্বাচন করুন।';

  @override
  String get modulesSubtitleAppStore =>
      'App Store-এর মাধ্যমে সাবস্ক্রাইব করুন, অথবা eastmarkhk.com-এ ইতিমধ্যে কেনা সাবস্ক্রিপশন সক্রিয় করুন।';

  @override
  String get modulesSubtitleWebStore =>
      'বিনামূল্যে ট্রায়াল, eastmarkhk.com-এ কেনাকাটা — EastmarkHK e-Invoicing অ্যাপের মতোই সাবস্ক্রিপশন।';

  @override
  String get modulesStatusActiveAppStore => 'সক্রিয় — App Store';

  @override
  String get modulesStatusActiveWeb => 'সক্রিয় — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ট্রায়াল — $countString দিন বাকি',
      one: 'ট্রায়াল — $countString দিন বাকি',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'সক্রিয়';

  @override
  String get modulesStatusAvailable => 'উপলব্ধ';

  @override
  String get modulesBuyFailed =>
      'কেনাকাটা শুরু করা যায়নি। আবার চেষ্টা করুন বা আপনার কেনাকাটা পুনরুদ্ধার করুন।';

  @override
  String get modulesRestoreDone => 'পুনরুদ্ধার সম্পন্ন হয়েছে।';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return 'ইনস্টল করা অ্যাপ থেকে $name সক্রিয় করা হয়েছে।';
  }

  @override
  String get modulesLicenseNotFound =>
      'লাইসেন্স স্বয়ংক্রিয়ভাবে পাওয়া যায়নি। EastmarkHK e-Invoicing → সেটিংস খুলুন, আপনার সক্রিয়করণ কোড কপি করুন, তারপর «ওয়েব কোড সক্রিয় করুন» বেছে নিন।';

  @override
  String get modulesRenewalNote =>
      'App Store-এর মাধ্যমে স্বয়ংক্রিয় নবীকরণ। সেটিংস → Apple ID → সাবস্ক্রিপশনে সাবস্ক্রিপশন পরিচালনা করুন।';

  @override
  String get modulesWebStoreNote =>
      'অথবা eastmarkhk.com-এ সাবস্ক্রাইব করুন এবং ইমেইলে প্রাপ্ত কোড দিয়ে সক্রিয় করুন।';

  @override
  String get modulesHaveEinvoicing =>
      'আমার কাছে ইতিমধ্যে EastmarkHK e-Invoicing আছে';

  @override
  String get modulesTry7Days => '৭ দিন চেষ্টা করুন';

  @override
  String get modulesSubscribe => 'সাবস্ক্রাইব করুন';

  @override
  String get modulesRestore => 'কেনাকাটা পুনরুদ্ধার করুন';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com সাবস্ক্রিপশন';

  @override
  String get modulesActivateWebCode => 'ওয়েব কোড সক্রিয় করুন';

  @override
  String get modulesUseInCrm => 'CRM-এ ব্যবহার করুন';

  @override
  String get modulesDontUseInCrm => 'CRM-এ ব্যবহার করবেন না';

  @override
  String get modulesBuyOnAppStore => 'App Store থেকে কিনুন';

  @override
  String get modulesStoreUnavailable =>
      'এই বিল্ডে App Store উপলব্ধ নেই। একটি App Store বিল্ড ব্যবহার করুন, অথবা eastmarkhk.com সাবস্ক্রিপশন সক্রিয় করুন।';

  @override
  String get modulesCheckingPurchases =>
      'App Store এবং eastmarkhk.com ক্রয় যাচাই করা হচ্ছে…';

  @override
  String get modulesCheckingAppStore => 'App Store ক্রয় যাচাই করা হচ্ছে…';

  @override
  String get modulesPerMonth => '/ মাস';

  @override
  String get modulesActivationSubtitleAppStore =>
      'আপনি কি eastmarkhk.com-এ সাবস্ক্রাইব করেছেন? ইমেইলে প্রাপ্ত কোড পেস্ট করুন। iPhone/iPad-এ, সক্রিয়করণের আগে App Store বা সাইটের মাধ্যমে প্রাথমিক কেনাকাটা করা হয়।';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com-এ সাবস্ক্রাইব করুন, তারপর এই ডিভাইসের সাথে যুক্ত সক্রিয়করণ কোড পেস্ট করুন।';

  @override
  String get modulesMachineId => 'মেশিন আইডি';

  @override
  String get modulesCopy => 'কপি';

  @override
  String get modulesSubscriptionEmailLabel => 'সাবস্ক্রিপশন ইমেইল';

  @override
  String get modulesActivationCodeLabel => 'সক্রিয়করণ কোড';

  @override
  String get modulesActivationCodeHint =>
      'কেনাকাটার পরে প্রাপ্ত কোড পেস্ট করুন';

  @override
  String get modulesActivate => 'সক্রিয় করুন';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com-এ কিনুন';

  @override
  String get modulesRequestCodeByEmail => 'ইমেইলের মাধ্যমে কোডের অনুরোধ করুন';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com-এর মাধ্যমে সক্রিয় করা হয়েছে';
  }

  @override
  String get modulesMachineIdCopied => 'মেশিন আইডি কপি হয়েছে';

  @override
  String get modulesEmailRequired => 'আপনার সাবস্ক্রিপশন ইমেইল লিখুন';

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
  String get invPickClientTitle => 'একজন ক্লায়েন্ট বেছে নিন';

  @override
  String get invPickClientSearch => 'নাম, কর শনাক্তকারী, দেশ দিয়ে খুঁজুন…';

  @override
  String get invPickClientEmpty => 'কোনো মিলে যাওয়া ক্লায়েন্ট নেই।';

  @override
  String get invPickClientButton => 'ক্লায়েন্ট নির্বাচন করুন';

  @override
  String get invClientRequired => 'সংরক্ষণের আগে একজন ক্লায়েন্ট বেছে নিন।';

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
  String get invSave => 'সংরক্ষণ করুন';

  @override
  String get invSaving => 'সংরক্ষণ করা হচ্ছে…';

  @override
  String invEditQuote(String number) {
    return 'কোটেশন $number সম্পাদনা করুন';
  }

  @override
  String invEditInvoice(String number) {
    return 'চালান $number সম্পাদনা করুন';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number সংরক্ষিত হয়েছে।';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'সংরক্ষণ করা যায়নি: $error';
  }

  @override
  String get invEditDocument => 'সম্পাদনা করুন';

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
      'কোটেশন এবং চালান — EastmarkHK e-Invoicing ডেটা (রসিদ ও রিমাইন্ডার: স্বতন্ত্র অ্যাপ)';

  @override
  String get invOpenStandalone => 'e-Invoicing খুলুন';

  @override
  String get invLaunchStandalone => 'e-Invoicing চালু করুন';

  @override
  String get invRemoteConnectionTooltip => 'দূরবর্তী সংযোগ';

  @override
  String invTabQuotes(int count) {
    return 'কোটেশন ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'চালান ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'কোনো কোটেশন নেই — জেতা সুযোগ থেকে বা উপরের বোতাম থেকে একটি তৈরি করুন।';

  @override
  String get invEmptyInvoices => 'কোনো চালান নেই।';

  @override
  String get invEmptyCompanyDocs => 'কোনো কোটেশন বা চালান নেই।';

  @override
  String get invQuotesSection => 'কোটেশন';

  @override
  String get invInvoicesSection => 'চালান';

  @override
  String get invCompanyFooter =>
      'নথিগুলি EastmarkHK e-Invoicing দ্বারা পরিচালিত — পাঠানো, PDF, রসিদ এবং রিমাইন্ডার স্বতন্ত্র অ্যাপে।';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing দূরবর্তী মোডে আছে — সংযোগ কনফিগার করা হয়নি।';

  @override
  String get invConfigure => 'কনফিগার করুন';

  @override
  String get invAppNotDetected =>
      'e-Invoicing অ্যাপ শনাক্ত হয়নি — এই রেকর্ড থেকে কোটেশন ও চালান তৈরি করতে EastmarkHK e-Invoicing ইনস্টল/চালু করুন।';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing দূরবর্তী স্টোরেজের জন্য কনফিগার করা আছে। CRM-কে একই API-তে সংযুক্ত করতে এখানে একই তথ্য দিন — e-Invoicing → সেটিংস → দূরবর্তী স্টোরেজের একই মান।';

  @override
  String get invLaunchOnceBody =>
      'শেয়ার করা ডেটাবেস আরম্ভ করতে একবার EastmarkHK e-Invoicing চালু করুন, তারপর এখানে ফিরে আসুন।';

  @override
  String get invAcquireAppStoreBody =>
      'এই মডিউলটি EastmarkHK e-Invoicing ব্যবহার করে। App Store থেকে ডাউনলোড ও সাবস্ক্রাইব করুন, একবার চালু করুন, তারপর এখানে ফিরে আসুন।';

  @override
  String get invAcquireWebBody =>
      'এই মডিউলটি EastmarkHK e-Invoicing ব্যবহার করে। eastmarkhk.com-এ ডাউনলোড ও সাবস্ক্রাইব করুন, একবার চালু করুন, তারপর এখানে ফিরে আসুন।';

  @override
  String get invConfigureRemote => 'দূরবর্তী সংযোগ কনফিগার করুন';

  @override
  String get invViewOnAppStore => 'App Store-এ দেখুন';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com-এ দেখুন';

  @override
  String get invRetry => 'আবার চেষ্টা করুন';

  @override
  String get invDocInvoice => 'চালান';

  @override
  String get invDocQuote => 'কোটেশন';

  @override
  String get invDocClient => 'ক্লায়েন্ট';

  @override
  String get invDocStatus => 'অবস্থা';

  @override
  String get invDocDate => 'তারিখ';

  @override
  String get invOpenInStandalone => 'e-Invoicing-এ খুলুন';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing খোলা যায়নি — এটি ইনস্টল করা আছে কিনা যাচাই করুন।';

  @override
  String get invCreateInvoiceFromQuote => 'চালান তৈরি করুন';

  @override
  String get invCreatingInvoice => 'চালান তৈরি হচ্ছে…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'কোটেশন থেকে চালান $number তৈরি হয়েছে।';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'এই কোটেশনের ইতিমধ্যে চালান হয়ে গেছে।';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'চালান তৈরি করা যায়নি: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing লিঙ্ক';

  @override
  String get invLinkStatusLinked => 'e-Invoicing ক্লায়েন্ট লিঙ্ক করা আছে';

  @override
  String get invLinkStatusNone => 'কোনো e-Invoicing লিঙ্ক সংরক্ষিত নেই';

  @override
  String get invUnlinkCustomer => 'e-Invoicing ক্লায়েন্ট আনলিঙ্ক করুন';

  @override
  String get invUnlinkConfirmTitle => 'ক্লায়েন্ট আনলিঙ্ক করবেন?';

  @override
  String get invUnlinkConfirmBody =>
      'পরবর্তী কোটেশন বা চালান আবার e-Invoicing-এ ক্লায়েন্ট বেছে নিতে বা তৈরি করতে বলবে।';

  @override
  String get invUnlinkDone => 'e-Invoicing লিঙ্ক সরানো হয়েছে।';

  @override
  String get invAppStoreUrlMissing =>
      'এই বিল্ডের জন্য e-Invoicing এখনো App Store-এ তালিকাভুক্ত নয়। eastmarkhk.com ব্যবহার করুন বা ইতিমধ্যে ইনস্টল করা অ্যাপ চালু করুন।';

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
      'শেয়ার করা ডেটাবেস: এই ডিভাইসটি পুনরায় সংযুক্ত করতে সেটিংসে সিঙ্ক পাসওয়ার্ড লিখুন।';

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

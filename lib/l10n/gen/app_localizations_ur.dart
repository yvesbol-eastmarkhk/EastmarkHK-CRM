// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get commonSave => 'محفوظ کریں';

  @override
  String get commonDelete => 'حذف کریں';

  @override
  String get commonEdit => 'ترمیم کریں';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'صارف نام';

  @override
  String get commonDisplayNameLabel => 'ظاہری نام';

  @override
  String get commonPasswordLabel => 'پاس ورڈ';

  @override
  String get commonConfirmPasswordLabel => 'پاس ورڈ کی تصدیق کریں';

  @override
  String get commonPasswordMismatch => 'پاس ورڈ مماثل نہیں ہیں';

  @override
  String get commonUsernameTaken => 'یہ صارف نام پہلے سے استعمال میں ہے';

  @override
  String get commonChoosePassword => 'ایک پاس ورڈ منتخب کریں';

  @override
  String get commonRequiredFields => 'نام اور صارف نام ضروری ہیں';

  @override
  String get passwordFieldShow => 'دکھائیں';

  @override
  String get passwordFieldHide => 'چھپائیں';

  @override
  String loginWelcomeBack(String name) {
    return 'خوش آمدید، $name';
  }

  @override
  String get loginTitle => 'لاگ ان';

  @override
  String get loginVerifying => 'تصدیق ہو رہی ہے…';

  @override
  String get loginUnlockTouchId => 'Touch ID سے ان لاک کریں';

  @override
  String get loginOr => 'یا';

  @override
  String get loginRequiredFields => 'صارف نام اور پاس ورڈ درکار ہیں';

  @override
  String get loginInvalidCredentials => 'غلط صارف نام یا پاس ورڈ';

  @override
  String get loginSubmit => 'لاگ ان کریں';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'خوش آمدید';

  @override
  String get bootstrapSubtitle =>
      'اپنے CRM کو محفوظ بنانے کے لیے ایڈمنسٹریٹر اکاؤنٹ بنائیں۔';

  @override
  String get bootstrapSubmit => 'ایڈمنسٹریٹر اکاؤنٹ بنائیں';

  @override
  String get commonAdd => 'شامل کریں';

  @override
  String get commonCreate => 'بنائیں';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get commonNoName => '(کوئی نام نہیں)';

  @override
  String get commonNotesLabel => 'نوٹس';

  @override
  String get commonEmailLabel => 'ای میل';

  @override
  String get commonPhoneLabel => 'فون';

  @override
  String get commonFirstNameLabel => 'پہلا نام';

  @override
  String get commonLastNameLabel => 'آخری نام';

  @override
  String get commonCompanyNameLabel => 'کمپنی کا نام';

  @override
  String messagingCannotOpen(String target) {
    return '$target کو کھولا نہیں جا سکا۔';
  }

  @override
  String get messagingEmailAppLabel => 'ای میل ایپ';

  @override
  String get messagingPhoneAppLabel => 'فون ایپ';

  @override
  String messagingIncompleteId(String label) {
    return '$label کھولنے کے لیے شناخت کنندہ نامکمل ہے۔';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label کو کھولا نہیں جا سکا — کیا ایپ انسٹال ہے؟';
  }

  @override
  String get messagingWechatNote =>
      'WeChat کسی مخصوص رابطے کا عوامی لنک فراہم نہیں کرتا — ایپ کھل جائے گی، لیکن گفتگو کو دستی طور پر منتخب کرنا ہوگا۔';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk کسی مخصوص رابطے کا عوامی لنک فراہم نہیں کرتا — ایپ کھل جائے گی، لیکن گفتگو کو دستی طور پر منتخب کرنا ہوگا۔';

  @override
  String get messagingPhoneCallLabel => 'فون کال';

  @override
  String get companyDeleteOpportunityConfirm => 'کیا یہ موقع حذف کریں؟';

  @override
  String get companyDeleteContactConfirm => 'کیا یہ رابطہ حذف کریں؟';

  @override
  String get companyDeleteTaskConfirm => 'کیا یہ کام حذف کریں؟';

  @override
  String get companyDeleteConfirmTitle => 'کیا اس کلائنٹ کو حذف کریں؟';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — اس کے رابطے، مواقع، کام اور تاریخ اس کے ساتھ حذف ہو جائیں گے۔';
  }

  @override
  String get companyNewNoteTitle => 'نیا نوٹ';

  @override
  String get companyNoteFieldLabel => 'نوٹ (یا اسے بولیں)';

  @override
  String get companyTabOverview => 'جائزہ';

  @override
  String get companyTabActivity => 'سرگرمی';

  @override
  String get companyTabTasks => 'کام';

  @override
  String get companyTabDeals => 'مواقع';

  @override
  String get companyContactsTitle => 'رابطے';

  @override
  String get companyNoContacts => 'کوئی رابطہ نہیں';

  @override
  String get companyNoActivity => 'کوئی سرگرمی نہیں — ایک نوٹ شامل کریں۔';

  @override
  String get companyNoTasks => 'کوئی کام نہیں';

  @override
  String get companyNoDeals => 'کوئی موقع نہیں';

  @override
  String get companyNoteButtonLabel => 'نوٹ';

  @override
  String get companyNewClientTitle => 'نیا کلائنٹ';

  @override
  String get companyEditClientTitle => 'کلائنٹ میں ترمیم کریں';

  @override
  String get companyWebsiteLabel => 'ویب سائٹ';

  @override
  String get companyPeppolLabel => 'Peppol شناخت';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'ٹیگز (کوما سے الگ کیے گئے)';

  @override
  String get companyNewContactTitle => 'نیا رابطہ';

  @override
  String get companyEditContactTitle => 'رابطے میں ترمیم کریں';

  @override
  String get companyAppLabel => 'ایپ';

  @override
  String get companyIdentifierNumberLabel => 'شناخت کنندہ / نمبر';

  @override
  String get companyOpenTooltip => 'کھولیں';

  @override
  String get companyRemoveTooltip => 'ہٹائیں';

  @override
  String get companyRoleFieldLabel => 'کردار (مثلاً خریدار)';

  @override
  String get companyMessagingTitle => 'پیغام رسانی';

  @override
  String get companyNoMessagingHint =>
      'کوئی پیغام رسانی چینل شامل نہیں کیا گیا — WhatsApp، WeChat، iMessage…';

  @override
  String get companyNoContactInfo =>
      'ابھی تک کوئی رابطہ کی معلومات شامل نہیں کی گئیں۔';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsSubtitle => 'ایپ کی یک بارگی ترتیب۔';

  @override
  String get settingsLanguagesTitle => 'زبانیں اور کرنسی';

  @override
  String get settingsAppLanguageLabel => 'ایپ کی زبان';

  @override
  String get settingsDictationLanguageLabel => 'ڈکٹیشن کی زبان';

  @override
  String get settingsCurrencyLabel => 'کرنسی';

  @override
  String get settingsFormatsHint =>
      'رقوم 1,234.56 کی صورت میں دکھائی جاتی ہیں (کوما = ہزار، نقطہ = اعشاریہ) اور تاریخیں dd/mm/yyyy کی صورت میں، انٹرفیس کی زبان سے قطع نظر۔';

  @override
  String get settingsCompanyTitle => 'کمپنی';

  @override
  String get settingsCompanySubtitle =>
      'اس CRM کو استعمال کرنے والی کمپنی کی شناخت — بعد میں ہیڈر (white-label) اور PDF دستاویز کے سرورق میں دوبارہ استعمال ہوگی۔';

  @override
  String get settingsSyncTitle => 'مطابقت سازی';

  @override
  String get settingsSyncSubtitle =>
      'پہلے سے طے شدہ طور پر، تمام ڈیٹا اس ڈیوائس پر مقامی طور پر (SQLite) رہتا ہے۔';

  @override
  String get settingsSyncLocalTitle => 'اسٹینڈ اَلون (صرف مقامی)';

  @override
  String get settingsSyncLocalSubtitle =>
      'کوئی ڈیٹا اس ڈیوائس سے باہر نہیں بھیجا جاتا';

  @override
  String get settingsSyncRemoteTitle => 'مشترکہ ڈیٹابیس (ریموٹ)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite سرور کے ساتھ مطابقت رکھتا ہے (دیکھیں server/crm-sync/)';

  @override
  String get settingsServerLabel => 'سرور';

  @override
  String get settingsAccountLabel => 'اکاؤنٹ';

  @override
  String get settingsSyncPasswordHint =>
      'ڈیوائس کی محفوظ کی چین میں محفوظ — کبھی بھی ڈیٹابیس میں نہیں۔';

  @override
  String get settingsSyncNowButton => 'ابھی مطابقت کریں';

  @override
  String get settingsSyncPollHint =>
      'پس منظر میں ہر 25 سیکنڈ میں خودکار پُل؛ ہر تبدیلی کے بعد فوری پش (ریموٹ موڈ فعال)۔ ٹائپنگ کے دوران کوئی پُل نہیں۔';

  @override
  String get settingsSyncMissingFields => 'سرور، اکاؤنٹ اور پاس ورڈ درکار ہیں';

  @override
  String get settingsModulesTitle => 'ماڈیولز';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing، اسکینر، مطابقت سازی… — 7 دن کا ٹرائل یا لائسنس ایکٹیویشن۔';

  @override
  String get settingsBrowseModules => 'ماڈیولز دیکھیں';

  @override
  String get settingsImportExportTitle => 'درآمد / برآمد';

  @override
  String get settingsImportExportSubtitle =>
      'کلائنٹس، رابطے اور مواقع CSV کے طور پر؛ رابطے vCard سے۔';

  @override
  String get settingsPipelineTitle => 'پائپ لائن';

  @override
  String get settingsPipelineSubtitle =>
      'مراحل اور ان کے لیبلز کو حسب ضرورت بنائیں۔';

  @override
  String get settingsConfigureStages => 'مراحل ترتیب دیں';

  @override
  String get settingsBackupTitle => 'مقامی بیک اپ';

  @override
  String get settingsBackupSubtitle =>
      'آپ کے SQLite ڈیٹابیس کی ایک کاپی برآمد کرتا ہے — اپ ڈیٹ سے پہلے یا آرکائیونگ کے لیے مفید۔';

  @override
  String get settingsExportDbButton => 'ڈیٹابیس برآمد کریں (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM بیک اپ';

  @override
  String settingsExportError(String error) {
    return 'برآمد ناکام ہوئی: $error';
  }

  @override
  String get settingsUsersTitle => 'صارفین';

  @override
  String get settingsUsersSubtitleAdmin =>
      'اکاؤنٹس، کردار اور پاس ورڈز — منتظم اور صارف۔';

  @override
  String get settingsUsersSubtitleLocked => 'صرف منتظمین کے لیے۔';

  @override
  String get settingsManageUsersButton => 'صارفین کا انتظام کریں';

  @override
  String get settingsUsersLockedHint =>
      'صارفین اور ان کے پاس ورڈز کو دیکھنے یا ترمیم کرنے کے لیے منتظم اکاؤنٹ سے سائن ان کریں۔';

  @override
  String get settingsSaveKeychainError =>
      'ترتیبات محفوظ ہو گئیں، لیکن محفوظ کی چین دستیاب نہیں ہے — مطابقت سازی کا پاس ورڈ محفوظ نہیں کیا جا سکا (مکمل ری بلڈ کے بعد ایپ دوبارہ شروع کریں)۔';

  @override
  String get settingsSaved => 'ترتیبات محفوظ ہو گئیں';

  @override
  String get settingsLogoutConfirmTitle => 'سائن آؤٹ کریں؟';

  @override
  String get settingsLogoutConfirmDetail =>
      'واپس آنے کے لیے آپ کو اپنا پاس ورڈ (یا Touch ID) درج کرنا ہوگا۔';

  @override
  String get settingsLogoutButton => 'سائن آؤٹ';

  @override
  String get settingsLogoTitle => 'کمپنی کا لوگو';

  @override
  String get settingsLogoSubtitle =>
      'ایپ کے اوپری حصے اور بینر میں دکھایا جاتا ہے۔';

  @override
  String get settingsLogoEmpty =>
      'کوئی لوگو نہیں — اپنی کمپنی کا لوگو شامل کریں';

  @override
  String get settingsLogoChoose => 'ایک تصویر منتخب کریں';

  @override
  String get settingsLogoChange => 'لوگو تبدیل کریں';

  @override
  String get usersDeleteSelfError => 'آپ اپنا اکاؤنٹ حذف نہیں کر سکتے';

  @override
  String get usersDeleteConfirmTitle => 'کیا اس صارف کو حذف کریں؟';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM تک رسائی کھو دے گا۔';
  }

  @override
  String get usersTitle => 'صارفین';

  @override
  String get usersSubtitle => 'اکاؤنٹس، کردار اور پاس ورڈز۔';

  @override
  String get usersAddButton => 'صارف';

  @override
  String get usersEmptyTitle => 'کوئی صارف نہیں';

  @override
  String get usersEmptySubtitle => 'پہلا اکاؤنٹ بنائیں — یہ منتظم ہوگا۔';

  @override
  String get usersEmptyAction => 'نیا صارف';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (آپ)';
  }

  @override
  String get usersNewTitle => 'نیا صارف';

  @override
  String get usersEditTitle => 'صارف میں ترمیم کریں';

  @override
  String get usersLoginIdLabel => 'لاگ ان شناخت';

  @override
  String get usersRoleLabel => 'کردار';

  @override
  String get usersNewPasswordLabel =>
      'نیا پاس ورڈ (تبدیل نہ کرنے کے لیے خالی چھوڑ دیں)';

  @override
  String get usersTouchIdTitle => 'اس ڈیوائس پر Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'پاس ورڈ دوبارہ ٹائپ کیے بغیر ان لاک کریں، صرف اس ڈیوائس پر۔';

  @override
  String get roleAdministrator => 'منتظم';

  @override
  String get roleUser => 'صارف';

  @override
  String get dashboardTitleEmbedded => 'ڈیش بورڈ';

  @override
  String get dashboardTitle => 'آج';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString کارروائیاں زیر التوا',
      one: '$countString کارروائی زیر التوا',
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
      other: '+$countString مزید — سب دیکھیں',
      one: '+$countString مزید — سب دیکھیں',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'تمام سیلز نمائندے';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (میں)';
  }

  @override
  String get dashboardEmptyTitle => 'آپ کا CRM تیار ہے';

  @override
  String get dashboardEmptySubtitle =>
      'اپنا پہلا کلائنٹ شامل کریں، CSV فائل درآمد کریں، یا آنے والے ماڈیولز دریافت کریں۔';

  @override
  String get dashboardNothingScheduled =>
      'کچھ بھی شیڈول نہیں — آپ کے فالو اپس یہاں ظاہر ہوں گے۔';

  @override
  String get dashboardBucketOverdue => 'مدت ختم';

  @override
  String get dashboardBucketToday => 'آج';

  @override
  String get dashboardBucketWeek => 'اس ہفتے';

  @override
  String get dashboardBucketLater => 'بعد میں';

  @override
  String get dashboardContactedButton => 'رابطہ کیا گیا';

  @override
  String get dashboardDoneButton => 'مکمل';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'برتر کلائنٹس (کھلی پائپ لائن)';

  @override
  String get dashboardPipelineByStage => 'مرحلے کے لحاظ سے پائپ لائن';

  @override
  String get dashboardNoOpportunitiesYet => 'ابھی تک کوئی موقع نہیں';

  @override
  String get dashboardWonLostByMonth => 'ماہ کے لحاظ سے جیتا / ہارا';

  @override
  String get dashboardNoClosuresYet => 'ابھی تک کوئی کلوزر ریکارڈ نہیں ہوا۔';

  @override
  String get dashboardRecentActivity => 'حالیہ سرگرمی';

  @override
  String get dashboardNoActivityYet => 'ابھی تک کوئی سرگرمی نہیں۔';

  @override
  String get metricClients => 'کلائنٹس';

  @override
  String get metricOpportunities => 'مواقع';

  @override
  String get metricPipeline => 'پائپ لائن';

  @override
  String get metricForecast => 'پیش گوئی';

  @override
  String get metricTasks => 'کام';

  @override
  String get metricOverdue => 'مدت ختم';

  @override
  String get productTagline => 'پہلے دن سے وقت بچائیں۔';

  @override
  String get placeholderDashboardHint =>
      'جائزہ: پائپ لائن، فالو اپس اور حالیہ سرگرمی۔';

  @override
  String get placeholderTodayTitle => 'آپ کا دن';

  @override
  String get placeholderTodayHint =>
      'بائیں طرف ایک فالو اپ منتخب کریں۔\nکلائنٹ یہاں کھلے گا — اسکرین تبدیل کیے بغیر۔';

  @override
  String get placeholderClientsTitle => 'کلائنٹ کارڈ';

  @override
  String get placeholderClientsHint =>
      'فہرست سے ایک کلائنٹ منتخب کریں،\nیا + بٹن سے ایک نیا بنائیں۔';

  @override
  String get placeholderPipelineHint =>
      'کالموں کے درمیان ایک کارڈ گھسیٹیں۔\nکلائنٹ کارڈ کھولنے کے لیے کلک کریں۔';

  @override
  String get placeholderTasksHint =>
      'متعلقہ کلائنٹ دیکھنے کے لیے ایک کام منتخب کریں۔';

  @override
  String get modulesSubtitleAppStore =>
      'App Store کے ذریعے سبسکرائب کریں، یا eastmarkhk.com پر پہلے سے خریدی گئی سبسکرپشن کو فعال کریں۔';

  @override
  String get modulesSubtitleWebStore =>
      'مفت آزمائش، eastmarkhk.com پر خریداری — EastmarkHK e-Invoicing ایپ جیسی ہی سبسکرپشن۔';

  @override
  String get modulesStatusActiveAppStore => 'فعال — App Store';

  @override
  String get modulesStatusActiveWeb => 'فعال — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'آزمائش — $countString دن باقی',
      one: 'آزمائش — $countString دن باقی',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'فعال';

  @override
  String get modulesStatusAvailable => 'دستیاب';

  @override
  String get modulesBuyFailed =>
      'خریداری شروع نہیں ہو سکی۔ دوبارہ کوشش کریں یا اپنی خریداریاں بحال کریں۔';

  @override
  String get modulesRestoreDone => 'بحالی مکمل ہو گئی۔';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name انسٹال شدہ ایپ سے فعال کیا گیا۔';
  }

  @override
  String get modulesLicenseNotFound =>
      'لائسنس خودکار طور پر نہیں ملا۔ EastmarkHK e-Invoicing → ترتیبات کھولیں، اپنا ایکٹیویشن کوڈ کاپی کریں، پھر «ویب کوڈ فعال کریں» منتخب کریں۔';

  @override
  String get modulesRenewalNote =>
      'App Store کے ذریعے خودکار تجدید۔ ترتیبات → Apple ID → سبسکرپشنز میں سبسکرپشن کا انتظام کریں۔';

  @override
  String get modulesWebStoreNote =>
      'یا eastmarkhk.com پر سبسکرائب کریں اور ای میل سے موصول کوڈ سے فعال کریں۔';

  @override
  String get modulesHaveEinvoicing =>
      'میرے پاس پہلے سے EastmarkHK e-Invoicing ہے';

  @override
  String get modulesTry7Days => '7 دن آزمائیں';

  @override
  String get modulesSubscribe => 'سبسکرائب کریں';

  @override
  String get modulesRestore => 'خریداریاں بحال کریں';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com سبسکرپشن';

  @override
  String get modulesActivateWebCode => 'ویب کوڈ فعال کریں';

  @override
  String get modulesUseInCrm => 'CRM میں استعمال کریں';

  @override
  String get modulesDontUseInCrm => 'CRM میں استعمال نہ کریں';

  @override
  String get modulesBuyOnAppStore => 'App Store سے خریدیں';

  @override
  String get modulesStoreUnavailable =>
      'اس بلڈ میں App Store دستیاب نہیں ہے۔ App Store بلڈ استعمال کریں، یا eastmarkhk.com سبسکرپشن فعال کریں۔';

  @override
  String get modulesCheckingPurchases =>
      'App Store اور eastmarkhk.com کی خریداریاں چیک کی جا رہی ہیں…';

  @override
  String get modulesCheckingAppStore =>
      'App Store کی خریداریاں چیک کی جا رہی ہیں…';

  @override
  String get modulesPerMonth => '/ ماہ';

  @override
  String get modulesActivationSubtitleAppStore =>
      'کیا آپ نے eastmarkhk.com پر سبسکرائب کیا ہے؟ ای میل سے موصول کوڈ پیسٹ کریں۔ iPhone/iPad پر، ابتدائی خریداری ایکٹیویشن سے پہلے App Store یا سائٹ کے ذریعے ہوتی ہے۔';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com پر سبسکرائب کریں، پھر اس ڈیوائس سے منسلک ایکٹیویشن کوڈ پیسٹ کریں۔';

  @override
  String get modulesMachineId => 'مشین آئی ڈی';

  @override
  String get modulesCopy => 'کاپی کریں';

  @override
  String get modulesSubscriptionEmailLabel => 'سبسکرپشن ای میل';

  @override
  String get modulesActivationCodeLabel => 'ایکٹیویشن کوڈ';

  @override
  String get modulesActivationCodeHint => 'خریداری کے بعد موصول کوڈ پیسٹ کریں';

  @override
  String get modulesActivate => 'فعال کریں';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com پر خریدیں';

  @override
  String get modulesRequestCodeByEmail => 'ای میل کے ذریعے کوڈ کی درخواست کریں';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name eastmarkhk.com کے ذریعے فعال کیا گیا';
  }

  @override
  String get modulesMachineIdCopied => 'مشین آئی ڈی کاپی ہو گئی';

  @override
  String get modulesEmailRequired => 'اپنی سبسکرپشن ای میل درج کریں';

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
  String get invPickClientTitle => 'کلائنٹ منتخب کریں';

  @override
  String get invPickClientSearch => 'نام، ٹیکس ID، ملک کے ذریعے تلاش کریں…';

  @override
  String get invPickClientEmpty => 'کوئی مماثل کلائنٹ نہیں۔';

  @override
  String get invPickClientButton => 'کلائنٹ منتخب کریں';

  @override
  String get invClientRequired => 'محفوظ کرنے سے پہلے ایک کلائنٹ منتخب کریں۔';

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
  String get invSave => 'محفوظ کریں';

  @override
  String get invSaving => 'محفوظ کیا جا رہا ہے…';

  @override
  String invEditQuote(String number) {
    return 'کوٹیشن $number میں ترمیم کریں';
  }

  @override
  String invEditInvoice(String number) {
    return 'انوائس $number میں ترمیم کریں';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number محفوظ ہو گیا۔';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'محفوظ نہیں کیا جا سکا: $error';
  }

  @override
  String get invEditDocument => 'ترمیم کریں';

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
      'کوٹیشنز اور انوائسز — EastmarkHK e-Invoicing ڈیٹا (رسیدیں اور یاد دہانیاں: علیحدہ ایپ)';

  @override
  String get invOpenStandalone => 'e-Invoicing کھولیں';

  @override
  String get invLaunchStandalone => 'e-Invoicing لانچ کریں';

  @override
  String get invRemoteConnectionTooltip => 'ریموٹ کنکشن';

  @override
  String invTabQuotes(int count) {
    return 'کوٹیشنز ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'انوائسز ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'کوئی کوٹیشن نہیں — جیتے ہوئے موقع سے یا اوپر دیے گئے بٹن سے ایک بنائیں۔';

  @override
  String get invEmptyInvoices => 'کوئی انوائس نہیں۔';

  @override
  String get invEmptyCompanyDocs => 'کوئی کوٹیشن یا انوائس نہیں۔';

  @override
  String get invQuotesSection => 'کوٹیشنز';

  @override
  String get invInvoicesSection => 'انوائسز';

  @override
  String get invCompanyFooter =>
      'دستاویزات EastmarkHK e-Invoicing کے ذریعے منظم — بھیجنا، PDF، رسیدیں اور یاد دہانیاں علیحدہ ایپ میں۔';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing ریموٹ موڈ میں ہے — کنکشن کنفیگر نہیں ہے۔';

  @override
  String get invConfigure => 'کنفیگر کریں';

  @override
  String get invAppNotDetected =>
      'e-Invoicing ایپ کا پتہ نہیں چلا — اس ریکارڈ سے کوٹیشنز اور انوائسز بنانے کے لیے EastmarkHK e-Invoicing انسٹال/لانچ کریں۔';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing ریموٹ سٹوریج کے لیے کنفیگر ہے۔ CRM کو اسی API سے جوڑنے کے لیے یہاں وہی اسناد درج کریں — e-Invoicing → ترتیبات → ریموٹ سٹوریج جیسی ہی قدریں۔';

  @override
  String get invLaunchOnceBody =>
      'مشترکہ ڈیٹا بیس شروع کرنے کے لیے ایک بار EastmarkHK e-Invoicing لانچ کریں، پھر یہاں واپس آئیں۔';

  @override
  String get invAcquireAppStoreBody =>
      'یہ ماڈیول EastmarkHK e-Invoicing استعمال کرتا ہے۔ App Store سے ڈاؤن لوڈ کریں اور سبسکرائب کریں، ایک بار لانچ کریں، پھر یہاں واپس آئیں۔';

  @override
  String get invAcquireWebBody =>
      'یہ ماڈیول EastmarkHK e-Invoicing استعمال کرتا ہے۔ eastmarkhk.com پر ڈاؤن لوڈ کریں اور سبسکرائب کریں، ایک بار لانچ کریں، پھر یہاں واپس آئیں۔';

  @override
  String get invConfigureRemote => 'ریموٹ کنکشن کنفیگر کریں';

  @override
  String get invViewOnAppStore => 'App Store پر دیکھیں';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com پر دیکھیں';

  @override
  String get invRetry => 'دوبارہ کوشش کریں';

  @override
  String get invDocInvoice => 'انوائس';

  @override
  String get invDocQuote => 'کوٹیشن';

  @override
  String get invDocClient => 'کلائنٹ';

  @override
  String get invDocStatus => 'حیثیت';

  @override
  String get invDocDate => 'تاریخ';

  @override
  String get invOpenInStandalone => 'e-Invoicing میں کھولیں';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing نہیں کھل سکا — چیک کریں کہ یہ انسٹال ہے۔';

  @override
  String get invCreateInvoiceFromQuote => 'انوائس بنائیں';

  @override
  String get invCreatingInvoice => 'انوائس بنایا جا رہا ہے…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'کوٹیشن سے انوائس $number بنایا گیا۔';
  }

  @override
  String get invQuoteAlreadyInvoiced =>
      'اس کوٹیشن کا پہلے ہی انوائس بن چکا ہے۔';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'انوائس نہیں بنایا جا سکا: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing لنک';

  @override
  String get invLinkStatusLinked => 'e-Invoicing کلائنٹ منسلک ہے';

  @override
  String get invLinkStatusNone => 'کوئی محفوظ شدہ e-Invoicing لنک نہیں';

  @override
  String get invUnlinkCustomer => 'e-Invoicing کلائنٹ کا لنک ختم کریں';

  @override
  String get invUnlinkConfirmTitle => 'کلائنٹ کا لنک ختم کریں؟';

  @override
  String get invUnlinkConfirmBody =>
      'اگلا کوٹیشن یا انوائس دوبارہ e-Invoicing میں کلائنٹ منتخب کرنے یا بنانے کے لیے کہے گا۔';

  @override
  String get invUnlinkDone => 'e-Invoicing لنک ہٹا دیا گیا۔';

  @override
  String get invAppStoreUrlMissing =>
      'اس بلڈ کے لیے e-Invoicing ابھی تک App Store پر درج نہیں ہے۔ eastmarkhk.com استعمال کریں یا پہلے سے انسٹال ایپ لانچ کریں۔';

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
      'مشترکہ ڈیٹا بیس: اس آلے کو دوبارہ منسلک کرنے کے لیے ترتیبات میں سنک پاس ورڈ درج کریں۔';

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

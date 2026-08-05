// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonSave => 'שמירה';

  @override
  String get commonDelete => 'מחיקה';

  @override
  String get commonEdit => 'עריכה';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'שם משתמש';

  @override
  String get commonDisplayNameLabel => 'שם תצוגה';

  @override
  String get commonPasswordLabel => 'סיסמה';

  @override
  String get commonConfirmPasswordLabel => 'אימות סיסמה';

  @override
  String get commonPasswordMismatch => 'הסיסמאות אינן תואמות';

  @override
  String get commonUsernameTaken => 'שם המשתמש הזה כבר תפוס';

  @override
  String get commonChoosePassword => 'בחר סיסמה';

  @override
  String get commonRequiredFields => 'יש להזין שם ושם משתמש';

  @override
  String get passwordFieldShow => 'הצג';

  @override
  String get passwordFieldHide => 'הסתר';

  @override
  String loginWelcomeBack(String name) {
    return 'ברוך שובך, $name';
  }

  @override
  String get loginTitle => 'התחברות';

  @override
  String get loginVerifying => 'מאמת…';

  @override
  String get loginUnlockTouchId => 'שחרר נעילה עם Touch ID';

  @override
  String get loginOr => 'או';

  @override
  String get loginRequiredFields => 'נדרשים שם משתמש וסיסמה';

  @override
  String get loginInvalidCredentials => 'שם משתמש או סיסמה שגויים';

  @override
  String get loginSubmit => 'התחבר';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'ברוכים הבאים';

  @override
  String get bootstrapSubtitle => 'צור חשבון מנהל כדי לאבטח את ה-CRM שלך.';

  @override
  String get bootstrapSubmit => 'צור חשבון מנהל';

  @override
  String get commonAdd => 'הוספה';

  @override
  String get commonCreate => 'יצירה';

  @override
  String get commonClose => 'סגירה';

  @override
  String get commonNoName => '(ללא שם)';

  @override
  String get commonNotesLabel => 'הערות';

  @override
  String get commonEmailLabel => 'דוא\"ל';

  @override
  String get commonPhoneLabel => 'טלפון';

  @override
  String get commonFirstNameLabel => 'שם פרטי';

  @override
  String get commonLastNameLabel => 'שם משפחה';

  @override
  String get commonCompanyNameLabel => 'שם החברה';

  @override
  String messagingCannotOpen(String target) {
    return 'לא ניתן לפתוח את $target.';
  }

  @override
  String get messagingEmailAppLabel => 'אפליקציית הדוא\"ל';

  @override
  String get messagingPhoneAppLabel => 'אפליקציית הטלפון';

  @override
  String messagingIncompleteId(String label) {
    return 'מזהה לא שלם לפתיחת $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'לא ניתן לפתוח את $label — האם האפליקציה מותקנת?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat לא מספקת קישור ציבורי לאיש קשר מסוים — האפליקציה תיפתח, אך יש לבחור את השיחה באופן ידני.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk לא מספקת קישור ציבורי לאיש קשר מסוים — האפליקציה תיפתח, אך יש לבחור את השיחה באופן ידני.';

  @override
  String get messagingPhoneCallLabel => 'שיחת טלפון';

  @override
  String get companyDeleteOpportunityConfirm => 'למחוק את ההזדמנות הזו?';

  @override
  String get companyDeleteContactConfirm => 'למחוק את איש הקשר הזה?';

  @override
  String get companyDeleteTaskConfirm => 'למחוק את המשימה הזו?';

  @override
  String get companyDeleteConfirmTitle => 'למחוק את הלקוח הזה?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — אנשי הקשר, ההזדמנויות, המשימות וההיסטוריה שלו יימחקו יחד איתו.';
  }

  @override
  String get companyNewNoteTitle => 'הערה חדשה';

  @override
  String get companyNoteFieldLabel => 'הערה (או הכתיבו אותה)';

  @override
  String get companyTabOverview => 'סקירה כללית';

  @override
  String get companyTabActivity => 'פעילות';

  @override
  String get companyTabTasks => 'משימות';

  @override
  String get companyTabDeals => 'הזדמנויות';

  @override
  String get companyContactsTitle => 'אנשי קשר';

  @override
  String get companyNoContacts => 'אין אנשי קשר';

  @override
  String get companyNoActivity => 'אין פעילות — הוסיפו הערה.';

  @override
  String get companyNoTasks => 'אין משימות';

  @override
  String get companyNoDeals => 'אין הזדמנויות';

  @override
  String get companyNoteButtonLabel => 'הערה';

  @override
  String get companyNewClientTitle => 'לקוח חדש';

  @override
  String get companyEditClientTitle => 'עריכת לקוח';

  @override
  String get companyWebsiteLabel => 'אתר אינטרנט';

  @override
  String get companyPeppolLabel => 'מזהה Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'תגיות (מופרדות בפסיקים)';

  @override
  String get companyNewContactTitle => 'איש קשר חדש';

  @override
  String get companyEditContactTitle => 'עריכת איש קשר';

  @override
  String get companyAppLabel => 'אפליקציה';

  @override
  String get companyIdentifierNumberLabel => 'מזהה / מספר';

  @override
  String get companyOpenTooltip => 'פתיחה';

  @override
  String get companyRemoveTooltip => 'הסרה';

  @override
  String get companyRoleFieldLabel => 'תפקיד (למשל, רוכש)';

  @override
  String get companyMessagingTitle => 'העברת הודעות';

  @override
  String get companyNoMessagingHint =>
      'לא נוסף ערוץ הודעות — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'טרם נוספו פרטי התקשרות.';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get settingsSubtitle => 'הגדרה חד-פעמית של האפליקציה.';

  @override
  String get settingsLanguagesTitle => 'שפות ומטבע';

  @override
  String get settingsAppLanguageLabel => 'שפת האפליקציה';

  @override
  String get settingsDictationLanguageLabel => 'שפת ההכתבה';

  @override
  String get settingsCurrencyLabel => 'מטבע';

  @override
  String get settingsFormatsHint =>
      'סכומים מוצגים כ-1,234.56 (פסיק = אלפים, נקודה = עשרוני) ותאריכים כ-dd/mm/yyyy, ללא קשר לשפת הממשק.';

  @override
  String get settingsCompanyTitle => 'חברה';

  @override
  String get settingsCompanySubtitle =>
      'זהות החברה המשתמשת ב-CRM זה — תשמש בהמשך בכותרת (white-label) ובכותרות מסמכי PDF.';

  @override
  String get settingsSyncTitle => 'סנכרון';

  @override
  String get settingsSyncSubtitle =>
      'כברירת מחדל, כל הנתונים נשארים מקומיים (SQLite) במכשיר זה.';

  @override
  String get settingsSyncLocalTitle => 'עצמאי (מקומי בלבד)';

  @override
  String get settingsSyncLocalSubtitle => 'לא נשלחים נתונים מחוץ למכשיר זה';

  @override
  String get settingsSyncRemoteTitle => 'מסד נתונים משותף (מרוחק)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'מסתנכרן עם שרת PHP + SQLite (ראו server/crm-sync/)';

  @override
  String get settingsServerLabel => 'שרת';

  @override
  String get settingsAccountLabel => 'חשבון';

  @override
  String get settingsSyncPasswordHint =>
      'נשמר במחזיק המפתחות המאובטח של המכשיר — לעולם לא במסד הנתונים.';

  @override
  String get settingsSyncNowButton => 'סנכרון עכשיו';

  @override
  String get settingsSyncPollHint =>
      'משיכה אוטומטית כל 25 שניות ברקע; שליחה מיידית לאחר כל שינוי (מצב מרוחק פעיל). אין משיכה בזמן הקלדה.';

  @override
  String get settingsSyncMissingFields => 'נדרשים שרת, חשבון וסיסמה';

  @override
  String get settingsModulesTitle => 'מודולים';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, סורק, סנכרון… — תקופת ניסיון של 7 ימים או הפעלת רישיון.';

  @override
  String get settingsBrowseModules => 'עיון במודולים';

  @override
  String get settingsImportExportTitle => 'ייבוא / ייצוא';

  @override
  String get settingsImportExportSubtitle =>
      'לקוחות, אנשי קשר והזדמנויות כקובץ CSV; אנשי קשר מ-vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'התאימו אישית את השלבים והתוויות שלהם.';

  @override
  String get settingsConfigureStages => 'הגדרת שלבים';

  @override
  String get settingsBackupTitle => 'גיבוי מקומי';

  @override
  String get settingsBackupSubtitle =>
      'מייצא עותק של מסד הנתונים SQLite שלכם — שימושי לפני עדכון או לצורך ארכוב.';

  @override
  String get settingsExportDbButton => 'ייצוא מסד נתונים (.db)';

  @override
  String get settingsBackupShareText => 'גיבוי EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'הייצוא נכשל: $error';
  }

  @override
  String get settingsUsersTitle => 'משתמשים';

  @override
  String get settingsUsersSubtitleAdmin =>
      'חשבונות, תפקידים וסיסמאות — מנהל ומשתמש.';

  @override
  String get settingsUsersSubtitleLocked => 'למנהלים בלבד.';

  @override
  String get settingsManageUsersButton => 'ניהול משתמשים';

  @override
  String get settingsUsersLockedHint =>
      'היכנסו עם חשבון מנהל כדי לצפות במשתמשים ובסיסמאות שלהם או לערוך אותם.';

  @override
  String get settingsSaveKeychainError =>
      'ההגדרות נשמרו, אך מחזיק המפתחות המאובטח אינו זמין — לא ניתן היה לשמור את סיסמת הסנכרון (הפעילו מחדש את האפליקציה לאחר בנייה מחדש מלאה).';

  @override
  String get settingsSaved => 'ההגדרות נשמרו';

  @override
  String get settingsLogoutConfirmTitle => 'להתנתק?';

  @override
  String get settingsLogoutConfirmDetail =>
      'יהיה עליכם להזין את הסיסמה (או Touch ID) כדי לחזור.';

  @override
  String get settingsLogoutButton => 'התנתקות';

  @override
  String get settingsLogoTitle => 'לוגו החברה';

  @override
  String get settingsLogoSubtitle => 'מוצג בראש האפליקציה ובבאנר.';

  @override
  String get settingsLogoEmpty => 'אין לוגו — הוסיפו את הלוגו של החברה שלכם';

  @override
  String get settingsLogoChoose => 'בחירת תמונה';

  @override
  String get settingsLogoChange => 'שינוי לוגו';

  @override
  String get usersDeleteSelfError => 'אינכם יכולים למחוק את החשבון שלכם עצמכם';

  @override
  String get usersDeleteConfirmTitle => 'למחוק את המשתמש הזה?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) יאבד גישה ל-CRM.';
  }

  @override
  String get usersTitle => 'משתמשים';

  @override
  String get usersSubtitle => 'חשבונות, תפקידים וסיסמאות.';

  @override
  String get usersAddButton => 'משתמש';

  @override
  String get usersEmptyTitle => 'אין משתמשים';

  @override
  String get usersEmptySubtitle => 'צרו את החשבון הראשון — הוא יהיה מנהל.';

  @override
  String get usersEmptyAction => 'משתמש חדש';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (אתם)';
  }

  @override
  String get usersNewTitle => 'משתמש חדש';

  @override
  String get usersEditTitle => 'עריכת משתמש';

  @override
  String get usersLoginIdLabel => 'מזהה כניסה';

  @override
  String get usersRoleLabel => 'תפקיד';

  @override
  String get usersNewPasswordLabel => 'סיסמה חדשה (השאירו ריק כדי לא לשנות)';

  @override
  String get usersTouchIdTitle => 'Touch ID במכשיר זה';

  @override
  String get usersTouchIdSubtitle =>
      'ביטול נעילה ללא הקלדת הסיסמה מחדש, במכשיר זה בלבד.';

  @override
  String get roleAdministrator => 'מנהל';

  @override
  String get roleUser => 'משתמש';

  @override
  String get dashboardTitleEmbedded => 'לוח בקרה';

  @override
  String get dashboardTitle => 'היום';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString פעולות לטיפול',
      two: '2 פעולות לטיפול',
      one: 'פעולה אחת לטיפול',
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
      other: 'עוד $countString — הצג הכול',
      two: 'עוד 2 — הצג הכול',
      one: 'עוד אחת — הצג הכול',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'כל אנשי המכירות';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (אני)';
  }

  @override
  String get dashboardEmptyTitle => 'ה-CRM שלכם מוכן';

  @override
  String get dashboardEmptySubtitle =>
      'הוסיפו את הלקוח הראשון שלכם, ייבאו קובץ CSV או גלו מודולים עתידיים.';

  @override
  String get dashboardNothingScheduled =>
      'שום דבר לא מתוזמן — המעקבים שלכם יופיעו כאן.';

  @override
  String get dashboardBucketOverdue => 'באיחור';

  @override
  String get dashboardBucketToday => 'היום';

  @override
  String get dashboardBucketWeek => 'השבוע';

  @override
  String get dashboardBucketLater => 'מאוחר יותר';

  @override
  String get dashboardContactedButton => 'יצרנו קשר';

  @override
  String get dashboardDoneButton => 'בוצע';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'לקוחות מובילים (Pipeline פתוח)';

  @override
  String get dashboardPipelineByStage => 'Pipeline לפי שלב';

  @override
  String get dashboardNoOpportunitiesYet => 'עדיין אין הזדמנויות';

  @override
  String get dashboardWonLostByMonth => 'נצחונות / הפסדים לפי חודש';

  @override
  String get dashboardNoClosuresYet => 'עדיין לא נרשמו סגירות.';

  @override
  String get dashboardRecentActivity => 'פעילות אחרונה';

  @override
  String get dashboardNoActivityYet => 'עדיין אין פעילות.';

  @override
  String get metricClients => 'לקוחות';

  @override
  String get metricOpportunities => 'הזדמנויות';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'תחזית';

  @override
  String get metricTasks => 'משימות';

  @override
  String get metricOverdue => 'באיחור';

  @override
  String get productTagline => 'חסכו זמן מהיום הראשון.';

  @override
  String get placeholderDashboardHint =>
      'סקירה כללית: Pipeline, מעקבים ופעילות אחרונה.';

  @override
  String get placeholderTodayTitle => 'היום שלכם';

  @override
  String get placeholderTodayHint =>
      'בחרו מעקב בצד שמאל.\nהלקוח ייפתח כאן — ללא מעבר מסך.';

  @override
  String get placeholderClientsTitle => 'כרטיס לקוח';

  @override
  String get placeholderClientsHint =>
      'בחרו לקוח מהרשימה,\nאו צרו אחד עם כפתור ה-+.';

  @override
  String get placeholderPipelineHint =>
      'גררו כרטיס בין עמודות.\nלחצו כדי לפתוח את כרטיס הלקוח.';

  @override
  String get placeholderTasksHint => 'בחרו משימה כדי לראות את הלקוח הקשור.';

  @override
  String get modulesSubtitleAppStore =>
      'הירשמו דרך ה-App Store, או הפעילו מנוי שכבר נרכש ב-‎eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'ניסיון חינם, רכישה ב-‎eastmarkhk.com — אותו מנוי כמו אפליקציית EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'פעיל — App Store';

  @override
  String get modulesStatusActiveWeb => 'פעיל — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ניסיון — נותרו $countString ימים',
      two: 'ניסיון — נותרו $countString ימים',
      one: 'ניסיון — נותר יום $countString אחד',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'פעיל';

  @override
  String get modulesStatusAvailable => 'זמין';

  @override
  String get modulesBuyFailed =>
      'לא ניתן היה להתחיל את הרכישה. נסו שוב או שחזרו את הרכישות.';

  @override
  String get modulesRestoreDone => 'השחזור הושלם.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name הופעל מהאפליקציה המותקנת.';
  }

  @override
  String get modulesLicenseNotFound =>
      'לא נמצא רישיון באופן אוטומטי. פתחו את EastmarkHK e-Invoicing ← הגדרות, העתיקו את קוד ההפעלה ובחרו «הפעלת קוד אתר».';

  @override
  String get modulesRenewalNote =>
      'חידוש אוטומטי דרך ה-App Store. נהלו את המנוי בהגדרות ← Apple ID ← מנויים.';

  @override
  String get modulesWebStoreNote =>
      'או הירשמו ב-‎eastmarkhk.com והפעילו עם הקוד שהתקבל בדוא״ל.';

  @override
  String get modulesHaveEinvoicing => 'כבר יש לי EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'נסו 7 ימים';

  @override
  String get modulesSubscribe => 'הירשמו';

  @override
  String get modulesRestore => 'שחזור רכישות';

  @override
  String get modulesWebSubscription => 'מנוי eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'הפעלת קוד אתר';

  @override
  String get modulesUseInCrm => 'שימוש ב-CRM';

  @override
  String get modulesDontUseInCrm => 'לא לשימוש ב-CRM';

  @override
  String get modulesBuyOnAppStore => 'קנייה ב-App Store';

  @override
  String get modulesStoreUnavailable =>
      'App Store אינו זמין בגרסה זו. השתמש בגרסת App Store, או הפעל מנוי ב-eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'בודק רכישות מ-App Store ומ-eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'בודק רכישות מ-App Store…';

  @override
  String get modulesPerMonth => '/ חודש';

  @override
  String get modulesActivationSubtitleAppStore =>
      'נרשמתם ב-‎eastmarkhk.com? הדביקו את הקוד שהתקבל בדוא״ל. ב-iPhone/iPad הרכישה הראשונית מתבצעת דרך ה-App Store או האתר לפני ההפעלה.';

  @override
  String get modulesActivationSubtitleWeb =>
      'הירשמו ב-‎eastmarkhk.com, ולאחר מכן הדביקו את קוד ההפעלה המקושר למכשיר זה.';

  @override
  String get modulesMachineId => 'מזהה מכונה';

  @override
  String get modulesCopy => 'העתקה';

  @override
  String get modulesSubscriptionEmailLabel => 'דוא״ל המנוי';

  @override
  String get modulesActivationCodeLabel => 'קוד הפעלה';

  @override
  String get modulesActivationCodeHint => 'הדביקו את הקוד שהתקבל לאחר הרכישה';

  @override
  String get modulesActivate => 'הפעלה';

  @override
  String get modulesBuyOnWebsite => 'רכישה ב-‎eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'בקשת קוד בדוא״ל';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name הופעל דרך eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'מזהה המכונה הועתק';

  @override
  String get modulesEmailRequired => 'הזינו את דוא״ל המנוי שלכם';

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
  String get invPickClientTitle => 'בחירת לקוח';

  @override
  String get invPickClientSearch => 'חיפוש לפי שם, מספר עוסק, מדינה…';

  @override
  String get invPickClientEmpty => 'לא נמצא לקוח מתאים.';

  @override
  String get invPickClientButton => 'בחר לקוח';

  @override
  String get invClientRequired => 'בחר לקוח לפני השמירה.';

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
  String get invSave => 'שמור';

  @override
  String get invSaving => 'שומר…';

  @override
  String invEditQuote(String number) {
    return 'עריכת הצעת מחיר $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'עריכת חשבונית $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number נשמר.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'לא ניתן היה לשמור: $error';
  }

  @override
  String get invEditDocument => 'עריכה';

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
      'הצעות מחיר וחשבוניות — נתונים מ-EastmarkHK e-Invoicing (קבלות ותזכורות: אפליקציה עצמאית)';

  @override
  String get invOpenStandalone => 'פתח את e-Invoicing';

  @override
  String get invLaunchStandalone => 'הפעל את e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'חיבור מרוחק';

  @override
  String invTabQuotes(int count) {
    return 'הצעות מחיר ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'חשבוניות ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'אין הצעות מחיר — צור אחת מהזדמנות שנסגרה בהצלחה או מהכפתור למעלה.';

  @override
  String get invEmptyInvoices => 'אין חשבוניות.';

  @override
  String get invEmptyCompanyDocs => 'אין הצעות מחיר או חשבוניות.';

  @override
  String get invQuotesSection => 'הצעות מחיר';

  @override
  String get invInvoicesSection => 'חשבוניות';

  @override
  String get invCompanyFooter =>
      'המסמכים מנוהלים על ידי EastmarkHK e-Invoicing — שליחה, PDF, קבלות ותזכורות באפליקציה העצמאית.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing במצב מרוחק — החיבור לא הוגדר.';

  @override
  String get invConfigure => 'הגדר';

  @override
  String get invAppNotDetected =>
      'אפליקציית e-Invoicing לא זוהתה — התקן/הפעל את EastmarkHK e-Invoicing כדי ליצור הצעות מחיר וחשבוניות מרשומה זו.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing מוגדרת לאחסון מרוחק. הזן כאן את אותם פרטי גישה כדי לחבר את ה-CRM לאותו API — אותם ערכים כמו ב-e-Invoicing ← הגדרות ← אחסון מרוחק.';

  @override
  String get invLaunchOnceBody =>
      'הפעל את EastmarkHK e-Invoicing פעם אחת כדי לאתחל את מסד הנתונים המשותף, ואז חזור לכאן.';

  @override
  String get invAcquireAppStoreBody =>
      'מודול זה משתמש ב-EastmarkHK e-Invoicing. הורד והירשם דרך App Store, הפעל פעם אחת, ואז חזור לכאן.';

  @override
  String get invAcquireWebBody =>
      'מודול זה משתמש ב-EastmarkHK e-Invoicing. הורד והירשם ב-eastmarkhk.com, הפעל פעם אחת, ואז חזור לכאן.';

  @override
  String get invConfigureRemote => 'הגדר חיבור מרוחק';

  @override
  String get invViewOnAppStore => 'צפה ב-App Store';

  @override
  String get invViewOnWebsite => 'צפה ב-eastmarkhk.com';

  @override
  String get invRetry => 'נסה שוב';

  @override
  String get invDocInvoice => 'חשבונית';

  @override
  String get invDocQuote => 'הצעת מחיר';

  @override
  String get invDocClient => 'לקוח';

  @override
  String get invDocStatus => 'סטטוס';

  @override
  String get invDocDate => 'תאריך';

  @override
  String get invOpenInStandalone => 'פתח ב-e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'לא ניתן היה לפתוח את e-Invoicing — ודא שהיא מותקנת.';

  @override
  String get invCreateInvoiceFromQuote => 'צור חשבונית';

  @override
  String get invCreatingInvoice => 'יוצר חשבונית…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'חשבונית $number נוצרה מהצעת המחיר.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'כבר הופקה חשבונית להצעת מחיר זו.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'לא ניתן היה ליצור את החשבונית: $error';
  }

  @override
  String get invLinkMenu => 'קישור ל-e-Invoicing';

  @override
  String get invLinkStatusLinked => 'לקוח e-Invoicing מקושר';

  @override
  String get invLinkStatusNone => 'אין קישור שמור ל-e-Invoicing';

  @override
  String get invUnlinkCustomer => 'בטל קישור ללקוח e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'לבטל את קישור הלקוח?';

  @override
  String get invUnlinkConfirmBody =>
      'בהצעת המחיר או בחשבונית הבאה תתבקש שוב לבחור או ליצור את הלקוח ב-e-Invoicing.';

  @override
  String get invUnlinkDone => 'קישור ה-e-Invoicing הוסר.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing עדיין אינה רשומה ב-App Store עבור גרסה זו. השתמש ב-eastmarkhk.com או הפעל אפליקציה שכבר מותקנת.';

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
      'מסד נתונים משותף: הזן את סיסמת הסנכרון בהגדרות כדי לחבר מחדש מכשיר זה.';

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
  String get activityTaskCreated => 'המשימה נוצרה';

  @override
  String get dictationOfflineTip =>
      'הכתבה לא מקוונת לרוב קולטת רעש (טלוויזיה) במקום את קולכם. הפעילו «זיהוי דיבור מקוון» בהגדרות Windows → פרטיות → דיבור, הפחיתו רעש ונסו שוב.';

  @override
  String get dictationLanguageFallbackTip =>
      'וריאנט השפה הזה אינו מותקן ב-Windows — נעשה שימוש בהתאמה קרובה. התקינו את חבילת הדיבור הרצויה בהגדרות → שעה ושפה → דיבור.';

  @override
  String get dictationStarting => 'מתחילים הכתבה…';

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

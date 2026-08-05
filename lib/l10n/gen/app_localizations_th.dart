// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonSave => 'บันทึก';

  @override
  String get commonDelete => 'ลบ';

  @override
  String get commonEdit => 'แก้ไข';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'ชื่อผู้ใช้';

  @override
  String get commonDisplayNameLabel => 'ชื่อที่แสดง';

  @override
  String get commonPasswordLabel => 'รหัสผ่าน';

  @override
  String get commonConfirmPasswordLabel => 'ยืนยันรหัสผ่าน';

  @override
  String get commonPasswordMismatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get commonUsernameTaken => 'ชื่อผู้ใช้นี้ถูกใช้แล้ว';

  @override
  String get commonChoosePassword => 'กรุณาตั้งรหัสผ่าน';

  @override
  String get commonRequiredFields => 'ต้องระบุชื่อและชื่อผู้ใช้';

  @override
  String get passwordFieldShow => 'แสดง';

  @override
  String get passwordFieldHide => 'ซ่อน';

  @override
  String loginWelcomeBack(String name) {
    return 'ยินดีต้อนรับกลับ, $name';
  }

  @override
  String get loginTitle => 'เข้าสู่ระบบ';

  @override
  String get loginVerifying => 'กำลังตรวจสอบ…';

  @override
  String get loginUnlockTouchId => 'ปลดล็อกด้วย Touch ID';

  @override
  String get loginOr => 'หรือ';

  @override
  String get loginRequiredFields => 'ต้องระบุชื่อผู้ใช้และรหัสผ่าน';

  @override
  String get loginInvalidCredentials => 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get loginSubmit => 'เข้าสู่ระบบ';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'ยินดีต้อนรับ';

  @override
  String get bootstrapSubtitle =>
      'สร้างบัญชีผู้ดูแลระบบเพื่อรักษาความปลอดภัยให้ CRM ของคุณ';

  @override
  String get bootstrapSubmit => 'สร้างบัญชีผู้ดูแลระบบ';

  @override
  String get commonAdd => 'เพิ่ม';

  @override
  String get commonCreate => 'สร้าง';

  @override
  String get commonClose => 'ปิด';

  @override
  String get commonNoName => '(ไม่มีชื่อ)';

  @override
  String get commonNotesLabel => 'บันทึกย่อ';

  @override
  String get commonEmailLabel => 'อีเมล';

  @override
  String get commonPhoneLabel => 'โทรศัพท์';

  @override
  String get commonFirstNameLabel => 'ชื่อ';

  @override
  String get commonLastNameLabel => 'นามสกุล';

  @override
  String get commonCompanyNameLabel => 'ชื่อบริษัท';

  @override
  String messagingCannotOpen(String target) {
    return 'ไม่สามารถเปิด $target ได้';
  }

  @override
  String get messagingEmailAppLabel => 'แอปอีเมล';

  @override
  String get messagingPhoneAppLabel => 'แอปโทรศัพท์';

  @override
  String messagingIncompleteId(String label) {
    return 'ตัวระบุไม่สมบูรณ์สำหรับการเปิด $label';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'ไม่สามารถเปิด $label ได้ — ติดตั้งแอปแล้วหรือยัง?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat ไม่มีลิงก์สาธารณะไปยังผู้ติดต่อรายใดรายหนึ่ง — แอปจะเปิดขึ้น แต่ต้องเลือกบทสนทนาด้วยตนเอง';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk ไม่มีลิงก์สาธารณะไปยังผู้ติดต่อรายใดรายหนึ่ง — แอปจะเปิดขึ้น แต่ต้องเลือกบทสนทนาด้วยตนเอง';

  @override
  String get messagingPhoneCallLabel => 'โทรออก';

  @override
  String get companyDeleteOpportunityConfirm => 'ลบโอกาสนี้หรือไม่?';

  @override
  String get companyDeleteContactConfirm => 'ลบผู้ติดต่อนี้หรือไม่?';

  @override
  String get companyDeleteTaskConfirm => 'ลบงานนี้หรือไม่?';

  @override
  String get companyDeleteConfirmTitle => 'ลบลูกค้ารายนี้หรือไม่?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — ผู้ติดต่อ โอกาส งาน และประวัติของลูกค้ารายนี้จะถูกลบไปด้วย';
  }

  @override
  String get companyNewNoteTitle => 'บันทึกย่อใหม่';

  @override
  String get companyNoteFieldLabel => 'บันทึกย่อ (หรือพูดเพื่อบันทึก)';

  @override
  String get companyTabOverview => 'ภาพรวม';

  @override
  String get companyTabActivity => 'กิจกรรม';

  @override
  String get companyTabTasks => 'งาน';

  @override
  String get companyTabDeals => 'โอกาส';

  @override
  String get companyContactsTitle => 'ผู้ติดต่อ';

  @override
  String get companyNoContacts => 'ไม่มีผู้ติดต่อ';

  @override
  String get companyNoActivity => 'ไม่มีกิจกรรม — เพิ่มบันทึกย่อ';

  @override
  String get companyNoTasks => 'ไม่มีงาน';

  @override
  String get companyNoDeals => 'ไม่มีโอกาส';

  @override
  String get companyNoteButtonLabel => 'บันทึกย่อ';

  @override
  String get companyNewClientTitle => 'ลูกค้าใหม่';

  @override
  String get companyEditClientTitle => 'แก้ไขลูกค้า';

  @override
  String get companyWebsiteLabel => 'เว็บไซต์';

  @override
  String get companyPeppolLabel => 'รหัส Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'แท็ก (คั่นด้วยจุลภาค)';

  @override
  String get companyNewContactTitle => 'ผู้ติดต่อใหม่';

  @override
  String get companyEditContactTitle => 'แก้ไขผู้ติดต่อ';

  @override
  String get companyAppLabel => 'แอป';

  @override
  String get companyIdentifierNumberLabel => 'ตัวระบุ / หมายเลข';

  @override
  String get companyOpenTooltip => 'เปิด';

  @override
  String get companyRemoveTooltip => 'ลบออก';

  @override
  String get companyRoleFieldLabel => 'บทบาท (เช่น ผู้ซื้อ)';

  @override
  String get companyMessagingTitle => 'การรับส่งข้อความ';

  @override
  String get companyNoMessagingHint =>
      'ยังไม่ได้เพิ่มช่องทางการรับส่งข้อความ — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'ยังไม่มีการเพิ่มข้อมูลการติดต่อ';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get settingsSubtitle => 'การกำหนดค่าแอปแบบครั้งเดียว';

  @override
  String get settingsLanguagesTitle => 'ภาษาและสกุลเงิน';

  @override
  String get settingsAppLanguageLabel => 'ภาษาของแอป';

  @override
  String get settingsDictationLanguageLabel => 'ภาษาการบอกข้อความ';

  @override
  String get settingsCurrencyLabel => 'สกุลเงิน';

  @override
  String get settingsFormatsHint =>
      'จำนวนเงินแสดงเป็น 1,234.56 (จุลภาค = หลักพัน, จุด = ทศนิยม) และวันที่แสดงเป็น dd/mm/yyyy โดยไม่ขึ้นกับภาษาของอินเทอร์เฟซ';

  @override
  String get settingsCompanyTitle => 'บริษัท';

  @override
  String get settingsCompanySubtitle =>
      'ข้อมูลบริษัทที่ใช้ CRM นี้ — จะถูกนำไปใช้ซ้ำภายหลังในส่วนหัว (white-label) และส่วนหัวของเอกสาร PDF';

  @override
  String get settingsSyncTitle => 'การซิงค์';

  @override
  String get settingsSyncSubtitle =>
      'โดยค่าเริ่มต้น ข้อมูลทั้งหมดจะเก็บไว้ในเครื่อง (SQLite) บนอุปกรณ์นี้';

  @override
  String get settingsSyncLocalTitle => 'แบบสแตนด์อโลน (ในเครื่องเท่านั้น)';

  @override
  String get settingsSyncLocalSubtitle => 'ไม่มีการส่งข้อมูลออกนอกอุปกรณ์นี้';

  @override
  String get settingsSyncRemoteTitle => 'ฐานข้อมูลที่ใช้ร่วมกัน (ระยะไกล)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'ซิงค์กับเซิร์ฟเวอร์ PHP + SQLite (ดู server/crm-sync/)';

  @override
  String get settingsServerLabel => 'เซิร์ฟเวอร์';

  @override
  String get settingsAccountLabel => 'บัญชี';

  @override
  String get settingsSyncPasswordHint =>
      'จัดเก็บในพวงกุญแจที่ปลอดภัยของอุปกรณ์ — ไม่เคยอยู่ในฐานข้อมูล';

  @override
  String get settingsSyncNowButton => 'ซิงค์เดี๋ยวนี้';

  @override
  String get settingsSyncPollHint =>
      'ดึงข้อมูลอัตโนมัติทุก 25 วินาทีในเบื้องหลัง; ส่งทันทีหลังการเปลี่ยนแปลงแต่ละครั้ง (โหมดระยะไกลทำงานอยู่) ไม่มีการดึงข้อมูลระหว่างพิมพ์';

  @override
  String get settingsSyncMissingFields => 'ต้องมีเซิร์ฟเวอร์ บัญชี และรหัสผ่าน';

  @override
  String get settingsModulesTitle => 'โมดูล';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, เครื่องสแกน, การซิงค์… — ทดลองใช้ 7 วันหรือเปิดใช้งานใบอนุญาต';

  @override
  String get settingsBrowseModules => 'เรียกดูโมดูล';

  @override
  String get settingsImportExportTitle => 'นำเข้า / ส่งออก';

  @override
  String get settingsImportExportSubtitle =>
      'ลูกค้า ผู้ติดต่อ และโอกาสในรูปแบบ CSV; ผู้ติดต่อจาก vCard';

  @override
  String get settingsPipelineTitle => 'ไปป์ไลน์';

  @override
  String get settingsPipelineSubtitle => 'ปรับแต่งขั้นตอนและป้ายกำกับ';

  @override
  String get settingsConfigureStages => 'กำหนดค่าขั้นตอน';

  @override
  String get settingsBackupTitle => 'สำรองข้อมูลในเครื่อง';

  @override
  String get settingsBackupSubtitle =>
      'ส่งออกสำเนาฐานข้อมูล SQLite ของคุณ — มีประโยชน์ก่อนอัปเดตหรือสำหรับการเก็บถาวร';

  @override
  String get settingsExportDbButton => 'ส่งออกฐานข้อมูล (.db)';

  @override
  String get settingsBackupShareText => 'ข้อมูลสำรอง EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'ส่งออกล้มเหลว: $error';
  }

  @override
  String get settingsUsersTitle => 'ผู้ใช้';

  @override
  String get settingsUsersSubtitleAdmin =>
      'บัญชี บทบาท และรหัสผ่าน — ผู้ดูแลระบบและผู้ใช้';

  @override
  String get settingsUsersSubtitleLocked => 'สำหรับผู้ดูแลระบบเท่านั้น';

  @override
  String get settingsManageUsersButton => 'จัดการผู้ใช้';

  @override
  String get settingsUsersLockedHint =>
      'เข้าสู่ระบบด้วยบัญชีผู้ดูแลระบบเพื่อดูหรือแก้ไขผู้ใช้และรหัสผ่านของพวกเขา';

  @override
  String get settingsSaveKeychainError =>
      'บันทึกการตั้งค่าแล้ว แต่พวงกุญแจที่ปลอดภัยไม่พร้อมใช้งาน — ไม่สามารถบันทึกรหัสผ่านการซิงค์ได้ (รีสตาร์ทแอปหลังจากสร้างใหม่ทั้งหมด)';

  @override
  String get settingsSaved => 'บันทึกการตั้งค่าแล้ว';

  @override
  String get settingsLogoutConfirmTitle => 'ออกจากระบบหรือไม่?';

  @override
  String get settingsLogoutConfirmDetail =>
      'คุณจะต้องป้อนรหัสผ่าน (หรือ Touch ID) เพื่อกลับมา';

  @override
  String get settingsLogoutButton => 'ออกจากระบบ';

  @override
  String get settingsLogoTitle => 'โลโก้บริษัท';

  @override
  String get settingsLogoSubtitle => 'แสดงที่ด้านบนของแอปและในแบนเนอร์';

  @override
  String get settingsLogoEmpty => 'ไม่มีโลโก้ — เพิ่มโลโก้บริษัทของคุณ';

  @override
  String get settingsLogoChoose => 'เลือกรูปภาพ';

  @override
  String get settingsLogoChange => 'เปลี่ยนโลโก้';

  @override
  String get usersDeleteSelfError => 'คุณไม่สามารถลบบัญชีของตัวเองได้';

  @override
  String get usersDeleteConfirmTitle => 'ลบผู้ใช้รายนี้หรือไม่?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) จะสูญเสียการเข้าถึง CRM';
  }

  @override
  String get usersTitle => 'ผู้ใช้';

  @override
  String get usersSubtitle => 'บัญชี บทบาท และรหัสผ่าน';

  @override
  String get usersAddButton => 'ผู้ใช้';

  @override
  String get usersEmptyTitle => 'ไม่มีผู้ใช้';

  @override
  String get usersEmptySubtitle => 'สร้างบัญชีแรก — บัญชีนี้จะเป็นผู้ดูแลระบบ';

  @override
  String get usersEmptyAction => 'ผู้ใช้ใหม่';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (คุณ)';
  }

  @override
  String get usersNewTitle => 'ผู้ใช้ใหม่';

  @override
  String get usersEditTitle => 'แก้ไขผู้ใช้';

  @override
  String get usersLoginIdLabel => 'รหัสเข้าสู่ระบบ';

  @override
  String get usersRoleLabel => 'บทบาท';

  @override
  String get usersNewPasswordLabel =>
      'รหัสผ่านใหม่ (เว้นว่างไว้หากไม่ต้องการเปลี่ยน)';

  @override
  String get usersTouchIdTitle => 'Touch ID บนอุปกรณ์นี้';

  @override
  String get usersTouchIdSubtitle =>
      'ปลดล็อกโดยไม่ต้องพิมพ์รหัสผ่านซ้ำ เฉพาะบนอุปกรณ์นี้เท่านั้น';

  @override
  String get roleAdministrator => 'ผู้ดูแลระบบ';

  @override
  String get roleUser => 'ผู้ใช้';

  @override
  String get dashboardTitleEmbedded => 'แดชบอร์ด';

  @override
  String get dashboardTitle => 'วันนี้';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString รายการที่ต้องดำเนินการ',
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
      other: '+อีก $countString รายการ — ดูทั้งหมด',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'พนักงานขายทั้งหมด';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ฉัน)';
  }

  @override
  String get dashboardEmptyTitle => 'CRM ของคุณพร้อมแล้ว';

  @override
  String get dashboardEmptySubtitle =>
      'เพิ่มลูกค้ารายแรกของคุณ นำเข้าไฟล์ CSV หรือสำรวจโมดูลที่จะมาถึง';

  @override
  String get dashboardNothingScheduled =>
      'ไม่มีกำหนดการ — การติดตามผลของคุณจะปรากฏที่นี่';

  @override
  String get dashboardBucketOverdue => 'เกินกำหนด';

  @override
  String get dashboardBucketToday => 'วันนี้';

  @override
  String get dashboardBucketWeek => 'สัปดาห์นี้';

  @override
  String get dashboardBucketLater => 'ภายหลัง';

  @override
  String get dashboardContactedButton => 'ติดต่อแล้ว';

  @override
  String get dashboardDoneButton => 'เสร็จสิ้น';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'ลูกค้าชั้นนำ (ไปป์ไลน์ที่เปิดอยู่)';

  @override
  String get dashboardPipelineByStage => 'ไปป์ไลน์ตามขั้นตอน';

  @override
  String get dashboardNoOpportunitiesYet => 'ยังไม่มีโอกาส';

  @override
  String get dashboardWonLostByMonth => 'ชนะ / แพ้ ตามเดือน';

  @override
  String get dashboardNoClosuresYet => 'ยังไม่มีการปิดดีลที่บันทึกไว้';

  @override
  String get dashboardRecentActivity => 'กิจกรรมล่าสุด';

  @override
  String get dashboardNoActivityYet => 'ยังไม่มีกิจกรรม';

  @override
  String get metricClients => 'ลูกค้า';

  @override
  String get metricOpportunities => 'โอกาส';

  @override
  String get metricPipeline => 'ไปป์ไลน์';

  @override
  String get metricForecast => 'การคาดการณ์';

  @override
  String get metricTasks => 'งาน';

  @override
  String get metricOverdue => 'เกินกำหนด';

  @override
  String get productTagline => 'ประหยัดเวลาตั้งแต่วันแรก';

  @override
  String get placeholderDashboardHint =>
      'ภาพรวม: ไปป์ไลน์ การติดตามผล และกิจกรรมล่าสุด';

  @override
  String get placeholderTodayTitle => 'วันของคุณ';

  @override
  String get placeholderTodayHint =>
      'เลือกการติดตามผลทางด้านซ้าย\nลูกค้าจะเปิดที่นี่ — โดยไม่ต้องเปลี่ยนหน้าจอ';

  @override
  String get placeholderClientsTitle => 'ข้อมูลลูกค้า';

  @override
  String get placeholderClientsHint =>
      'เลือกลูกค้าจากรายการ\nหรือสร้างใหม่ด้วยปุ่ม +';

  @override
  String get placeholderPipelineHint =>
      'ลากการ์ดระหว่างคอลัมน์\nคลิกเพื่อเปิดข้อมูลลูกค้า';

  @override
  String get placeholderTasksHint => 'เลือกงานเพื่อดูลูกค้าที่เกี่ยวข้อง';

  @override
  String get modulesSubtitleAppStore =>
      'สมัครสมาชิกผ่าน App Store หรือเปิดใช้งานการสมัครสมาชิกที่ซื้อไว้แล้วบน eastmarkhk.com';

  @override
  String get modulesSubtitleWebStore =>
      'ทดลองใช้ฟรี ซื้อบน eastmarkhk.com — การสมัครสมาชิกเดียวกับแอป EastmarkHK e-Invoicing';

  @override
  String get modulesStatusActiveAppStore => 'เปิดใช้งาน — App Store';

  @override
  String get modulesStatusActiveWeb => 'เปิดใช้งาน — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ทดลองใช้ — เหลือ $countString วัน',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'เปิดใช้งาน';

  @override
  String get modulesStatusAvailable => 'พร้อมใช้งาน';

  @override
  String get modulesBuyFailed =>
      'ไม่สามารถเริ่มการซื้อได้ โปรดลองอีกครั้งหรือกู้คืนการซื้อของคุณ';

  @override
  String get modulesRestoreDone => 'กู้คืนเรียบร้อยแล้ว';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return 'เปิดใช้งาน $name จากแอปที่ติดตั้งแล้ว';
  }

  @override
  String get modulesLicenseNotFound =>
      'ไม่พบใบอนุญาตโดยอัตโนมัติ เปิด EastmarkHK e-Invoicing → การตั้งค่า คัดลอกรหัสเปิดใช้งานของคุณ แล้วเลือก \'เปิดใช้งานรหัสเว็บ\'';

  @override
  String get modulesRenewalNote =>
      'ต่ออายุอัตโนมัติผ่าน App Store จัดการการสมัครสมาชิกในการตั้งค่า → Apple ID → การสมัครสมาชิก';

  @override
  String get modulesWebStoreNote =>
      'หรือสมัครสมาชิกบน eastmarkhk.com และเปิดใช้งานด้วยรหัสที่ได้รับทางอีเมล';

  @override
  String get modulesHaveEinvoicing => 'ฉันมี EastmarkHK e-Invoicing อยู่แล้ว';

  @override
  String get modulesTry7Days => 'ทดลองใช้ 7 วัน';

  @override
  String get modulesSubscribe => 'สมัครสมาชิก';

  @override
  String get modulesRestore => 'กู้คืนการซื้อ';

  @override
  String get modulesWebSubscription => 'การสมัครสมาชิก eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'เปิดใช้งานรหัสเว็บ';

  @override
  String get modulesUseInCrm => 'ใช้ใน CRM';

  @override
  String get modulesDontUseInCrm => 'ไม่ใช้งานใน CRM';

  @override
  String get modulesBuyOnAppStore => 'ซื้อบน App Store';

  @override
  String get modulesStoreUnavailable =>
      'App Store ไม่พร้อมใช้งานในบิลด์นี้ ใช้บิลด์ App Store หรือเปิดใช้งานการสมัครสมาชิก eastmarkhk.com';

  @override
  String get modulesCheckingPurchases =>
      'กำลังตรวจสอบการซื้อจาก App Store และ eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'กำลังตรวจสอบการซื้อจาก App Store…';

  @override
  String get modulesPerMonth => '/ เดือน';

  @override
  String get modulesActivationSubtitleAppStore =>
      'สมัครสมาชิกบน eastmarkhk.com แล้วหรือยัง? วางรหัสที่ได้รับทางอีเมล บน iPhone/iPad การซื้อครั้งแรกทำผ่าน App Store หรือเว็บไซต์ก่อนการเปิดใช้งาน';

  @override
  String get modulesActivationSubtitleWeb =>
      'สมัครสมาชิกบน eastmarkhk.com จากนั้นวางรหัสเปิดใช้งานที่เชื่อมโยงกับอุปกรณ์นี้';

  @override
  String get modulesMachineId => 'รหัสเครื่อง';

  @override
  String get modulesCopy => 'คัดลอก';

  @override
  String get modulesSubscriptionEmailLabel => 'อีเมลการสมัครสมาชิก';

  @override
  String get modulesActivationCodeLabel => 'รหัสเปิดใช้งาน';

  @override
  String get modulesActivationCodeHint => 'วางรหัสที่ได้รับหลังการซื้อ';

  @override
  String get modulesActivate => 'เปิดใช้งาน';

  @override
  String get modulesBuyOnWebsite => 'ซื้อบน eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'ขอรหัสทางอีเมล';

  @override
  String modulesActivatedViaWebsite(String name) {
    return 'เปิดใช้งาน $name ผ่าน eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'คัดลอกรหัสเครื่องแล้ว';

  @override
  String get modulesEmailRequired => 'กรอกอีเมลการสมัครสมาชิกของคุณ';

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
  String get invPickClientTitle => 'เลือกลูกค้า';

  @override
  String get invPickClientSearch =>
      'ค้นหาด้วยชื่อ เลขประจำตัวผู้เสียภาษี ประเทศ…';

  @override
  String get invPickClientEmpty => 'ไม่มีลูกค้าที่ตรงกัน';

  @override
  String get invPickClientButton => 'เลือกลูกค้า';

  @override
  String get invClientRequired => 'เลือกลูกค้าก่อนบันทึก';

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
  String get invSave => 'บันทึก';

  @override
  String get invSaving => 'กำลังบันทึก…';

  @override
  String invEditQuote(String number) {
    return 'แก้ไขใบเสนอราคา $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'แก้ไขใบแจ้งหนี้ $number';
  }

  @override
  String invDocumentSaved(String number) {
    return 'บันทึก $number แล้ว';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'ไม่สามารถบันทึกได้: $error';
  }

  @override
  String get invEditDocument => 'แก้ไข';

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
      'ใบเสนอราคาและใบแจ้งหนี้ — ข้อมูลจาก EastmarkHK e-Invoicing (ใบเสร็จและการแจ้งเตือน: แอปแบบสแตนด์อโลน)';

  @override
  String get invOpenStandalone => 'เปิด e-Invoicing';

  @override
  String get invLaunchStandalone => 'เปิดใช้งาน e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'การเชื่อมต่อระยะไกล';

  @override
  String invTabQuotes(int count) {
    return 'ใบเสนอราคา ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'ใบแจ้งหนี้ ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'ไม่มีใบเสนอราคา — สร้างจากโอกาสที่ปิดการขายสำเร็จ หรือปุ่มด้านบน';

  @override
  String get invEmptyInvoices => 'ไม่มีใบแจ้งหนี้';

  @override
  String get invEmptyCompanyDocs => 'ไม่มีใบเสนอราคาหรือใบแจ้งหนี้';

  @override
  String get invQuotesSection => 'ใบเสนอราคา';

  @override
  String get invInvoicesSection => 'ใบแจ้งหนี้';

  @override
  String get invCompanyFooter =>
      'เอกสารจัดการโดย EastmarkHK e-Invoicing — การส่ง, PDF, ใบเสร็จ และการแจ้งเตือนในแอปแบบสแตนด์อโลน';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing อยู่ในโหมดระยะไกล — ยังไม่ได้กำหนดค่าการเชื่อมต่อ';

  @override
  String get invConfigure => 'กำหนดค่า';

  @override
  String get invAppNotDetected =>
      'ไม่พบแอป e-Invoicing — ติดตั้ง/เปิดใช้งาน EastmarkHK e-Invoicing เพื่อสร้างใบเสนอราคาและใบแจ้งหนี้จากบันทึกนี้';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing ถูกกำหนดค่าให้ใช้พื้นที่จัดเก็บระยะไกล ป้อนข้อมูลรับรองเดียวกันที่นี่เพื่อเชื่อมต่อ CRM กับ API เดียวกัน — ค่าเดียวกับใน e-Invoicing → การตั้งค่า → พื้นที่จัดเก็บระยะไกล';

  @override
  String get invLaunchOnceBody =>
      'เปิดใช้งาน EastmarkHK e-Invoicing หนึ่งครั้งเพื่อเริ่มต้นฐานข้อมูลที่แชร์ จากนั้นกลับมาที่นี่';

  @override
  String get invAcquireAppStoreBody =>
      'โมดูลนี้ใช้ EastmarkHK e-Invoicing ดาวน์โหลดและสมัครสมาชิกผ่าน App Store เปิดใช้งานหนึ่งครั้ง แล้วกลับมาที่นี่';

  @override
  String get invAcquireWebBody =>
      'โมดูลนี้ใช้ EastmarkHK e-Invoicing ดาวน์โหลดและสมัครสมาชิกที่ eastmarkhk.com เปิดใช้งานหนึ่งครั้ง แล้วกลับมาที่นี่';

  @override
  String get invConfigureRemote => 'กำหนดค่าการเชื่อมต่อระยะไกล';

  @override
  String get invViewOnAppStore => 'ดูบน App Store';

  @override
  String get invViewOnWebsite => 'ดูที่ eastmarkhk.com';

  @override
  String get invRetry => 'ลองอีกครั้ง';

  @override
  String get invDocInvoice => 'ใบแจ้งหนี้';

  @override
  String get invDocQuote => 'ใบเสนอราคา';

  @override
  String get invDocClient => 'ลูกค้า';

  @override
  String get invDocStatus => 'สถานะ';

  @override
  String get invDocDate => 'วันที่';

  @override
  String get invOpenInStandalone => 'เปิดใน e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'ไม่สามารถเปิด e-Invoicing ได้ — ตรวจสอบว่าได้ติดตั้งแล้ว';

  @override
  String get invCreateInvoiceFromQuote => 'สร้างใบแจ้งหนี้';

  @override
  String get invCreatingInvoice => 'กำลังสร้างใบแจ้งหนี้…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'สร้างใบแจ้งหนี้ $number จากใบเสนอราคาแล้ว';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'ใบเสนอราคานี้ถูกออกใบแจ้งหนี้แล้ว';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'ไม่สามารถสร้างใบแจ้งหนี้ได้: $error';
  }

  @override
  String get invLinkMenu => 'การเชื่อมโยง e-Invoicing';

  @override
  String get invLinkStatusLinked => 'เชื่อมโยงลูกค้า e-Invoicing แล้ว';

  @override
  String get invLinkStatusNone => 'ไม่มีการเชื่อมโยง e-Invoicing ที่บันทึกไว้';

  @override
  String get invUnlinkCustomer => 'ยกเลิกการเชื่อมโยงลูกค้า e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'ยกเลิกการเชื่อมโยงลูกค้าหรือไม่';

  @override
  String get invUnlinkConfirmBody =>
      'ใบเสนอราคาหรือใบแจ้งหนี้ครั้งถัดไปจะขอให้คุณเลือกหรือสร้างลูกค้าใน e-Invoicing อีกครั้ง';

  @override
  String get invUnlinkDone => 'ยกเลิกการเชื่อมโยง e-Invoicing แล้ว';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing ยังไม่ปรากฏใน App Store สำหรับบิลด์นี้ ใช้ eastmarkhk.com หรือเปิดใช้งานแอปที่ติดตั้งไว้แล้ว';

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
      'ฐานข้อมูลที่แชร์: ป้อนรหัสผ่านการซิงค์ในการตั้งค่าเพื่อเชื่อมต่ออุปกรณ์นี้ใหม่';

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
  String get activityTaskCreated => 'สร้างงานแล้ว';

  @override
  String get dictationOfflineTip =>
      'การบอกพิมพ์แบบออฟไลน์มักจับเสียงรบกวน (ทีวี) แทนเสียงของคุณ เปิด «การรู้จำเสียงออนไลน์» ใน การตั้งค่า Windows → ความเป็นส่วนตัว → คำพูด ลดเสียงรบกวนแล้วลองใหม่';

  @override
  String get dictationLanguageFallbackTip =>
      'ตัวแปรภาษานี้ไม่ได้ติดตั้งบน Windows — จะใช้ตัวแปรที่ใกล้เคียง ติดตั้งแพ็กเสียงที่ต้องการใน การตั้งค่า → เวลาและภาษา → คำพูด';

  @override
  String get dictationStarting => 'กำลังเริ่มการบอกพิมพ์…';

  @override
  String get invChooseLinePhotoTitle => 'Choose photo for the PDF';

  @override
  String get invChooseNewPhoto => 'Choose another file…';

  @override
  String get invNoPhoto => 'No photo';
}

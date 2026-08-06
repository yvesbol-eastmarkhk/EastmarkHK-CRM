// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '儲存';

  @override
  String get commonDelete => '刪除';

  @override
  String get commonEdit => '編輯';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => '帳號';

  @override
  String get commonDisplayNameLabel => '顯示名稱';

  @override
  String get commonPasswordLabel => '密碼';

  @override
  String get commonConfirmPasswordLabel => '確認密碼';

  @override
  String get commonPasswordMismatch => '兩次密碼不一致';

  @override
  String get commonUsernameTaken => '此帳號已被使用';

  @override
  String get commonChoosePassword => '請設定密碼';

  @override
  String get commonRequiredFields => '姓名和帳號為必填項目';

  @override
  String get passwordFieldShow => '顯示';

  @override
  String get passwordFieldHide => '隱藏';

  @override
  String loginWelcomeBack(String name) {
    return '歡迎回來，$name';
  }

  @override
  String get loginTitle => '登入';

  @override
  String get loginVerifying => '驗證中…';

  @override
  String get loginUnlockTouchId => '使用 Touch ID 解鎖';

  @override
  String get loginUnlockWindowsHello => 'Déverrouiller avec Windows Hello';

  @override
  String get loginOr => '或';

  @override
  String get loginRequiredFields => '請輸入帳號和密碼';

  @override
  String get loginInvalidCredentials => '帳號或密碼錯誤';

  @override
  String get loginSubmit => '登入';

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
  String get bootstrapWelcome => '歡迎';

  @override
  String get bootstrapSubtitle => '建立管理員帳戶以保護您的 CRM。';

  @override
  String get bootstrapSubmit => '建立管理員帳戶';

  @override
  String get commonAdd => '新增';

  @override
  String get commonCreate => '建立';

  @override
  String get commonClose => '關閉';

  @override
  String get commonNoName => '(無名稱)';

  @override
  String get commonNotesLabel => '備註';

  @override
  String get commonEmailLabel => '電郵';

  @override
  String get commonPhoneLabel => '電話';

  @override
  String get commonFirstNameLabel => '名字';

  @override
  String get commonLastNameLabel => '姓氏';

  @override
  String get commonCompanyNameLabel => '公司名稱';

  @override
  String messagingCannotOpen(String target) {
    return '無法開啟 $target。';
  }

  @override
  String get messagingEmailAppLabel => '電郵應用程式';

  @override
  String get messagingPhoneAppLabel => '電話應用程式';

  @override
  String messagingIncompleteId(String label) {
    return '開啟 $label 的識別碼不完整。';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '無法開啟 $label — 是否已安裝該應用程式？';
  }

  @override
  String get messagingWechatNote =>
      'WeChat 不提供指向特定聯絡人的公開連結 — 應用程式會開啟，但需要自行選擇對話。';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk 不提供指向特定聯絡人的公開連結 — 應用程式會開啟，但需要自行選擇對話。';

  @override
  String get messagingPhoneCallLabel => '電話通話';

  @override
  String get companyDeleteOpportunityConfirm => '刪除此商機？';

  @override
  String get companyDeleteContactConfirm => '刪除此聯絡人？';

  @override
  String get companyDeleteTaskConfirm => '刪除此工作？';

  @override
  String get companyDeleteConfirmTitle => '刪除此客戶？';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — 其聯絡人、商機、工作及歷史記錄將一併刪除。';
  }

  @override
  String get companyNewNoteTitle => '新備註';

  @override
  String get companyNoteFieldLabel => '備註（或口述）';

  @override
  String get companyTabOverview => '概覽';

  @override
  String get companyTabActivity => '活動';

  @override
  String get companyTabTasks => '工作';

  @override
  String get companyTabDeals => '商機';

  @override
  String get companyContactsTitle => '聯絡人';

  @override
  String get companyNoContacts => '沒有聯絡人';

  @override
  String get companyNoActivity => '沒有活動 — 新增一則備註。';

  @override
  String get companyNoTasks => '沒有工作';

  @override
  String get companyNoDeals => '沒有商機';

  @override
  String get companyNoteButtonLabel => '備註';

  @override
  String get companyNewClientTitle => '新客戶';

  @override
  String get companyEditClientTitle => '編輯客戶';

  @override
  String get companyWebsiteLabel => '網站';

  @override
  String get companyPeppolLabel => 'Peppol 識別碼';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol：$value';
  }

  @override
  String get companyTagsLabel => '標籤（以逗號分隔）';

  @override
  String get companyNewContactTitle => '新聯絡人';

  @override
  String get companyEditContactTitle => '編輯聯絡人';

  @override
  String get companyAppLabel => '應用程式';

  @override
  String get companyIdentifierNumberLabel => '識別碼 / 號碼';

  @override
  String get companyOpenTooltip => '開啟';

  @override
  String get companyRemoveTooltip => '移除';

  @override
  String get companyRoleFieldLabel => '職務（例如：採購）';

  @override
  String get companyMessagingTitle => '通訊';

  @override
  String get companyNoMessagingHint => '尚未新增通訊管道 — WhatsApp、WeChat、iMessage…';

  @override
  String get companyNoContactInfo => '尚未新增聯絡資訊。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsSubtitle => '應用程式的一次性設定。';

  @override
  String get settingsLanguagesTitle => '語言與貨幣';

  @override
  String get settingsAppLanguageLabel => '應用程式語言';

  @override
  String get settingsDictationLanguageLabel => '口述語言';

  @override
  String get settingsCurrencyLabel => '貨幣';

  @override
  String get settingsFormatsHint =>
      '金額顯示格式為 1,234.56（逗號=千位，句點=小數），日期格式為 dd/mm/yyyy，與介面語言無關。';

  @override
  String get settingsCompanyTitle => '公司';

  @override
  String get settingsCompanySubtitle =>
      '使用此 CRM 的公司資料 — 稍後將在頁首（白標）及 PDF 文件標頭中重複使用。';

  @override
  String get settingsSyncTitle => '同步';

  @override
  String get settingsSyncSubtitle => '預設情況下，所有資料都保留在此裝置本機（SQLite）。';

  @override
  String get settingsSyncLocalTitle => '獨立模式（僅限本機）';

  @override
  String get settingsSyncLocalSubtitle => '沒有資料傳送到此裝置以外';

  @override
  String get settingsSyncRemoteTitle => '共用資料庫（遠端）';

  @override
  String get settingsSyncRemoteSubtitle =>
      '與 PHP + SQLite 伺服器同步（參閱 server/crm-sync/）';

  @override
  String get settingsServerLabel => '伺服器';

  @override
  String get settingsAccountLabel => '帳戶';

  @override
  String get settingsSyncPasswordHint => '儲存在裝置的安全鑰匙圈中 — 絕不儲存在資料庫中。';

  @override
  String get settingsSyncNowButton => '立即同步';

  @override
  String get settingsSyncPollHint =>
      '每 25 秒在背景自動拉取；每次變更後立即推送（遠端模式啟用中）。輸入期間不會拉取。';

  @override
  String get settingsSyncMissingFields => '需要伺服器、帳戶及密碼';

  @override
  String get settingsModulesTitle => '模組';

  @override
  String get settingsModulesSubtitle => 'EastmarkHK 電子發票、掃描器、同步… — 7 天試用或授權啟用。';

  @override
  String get settingsBrowseModules => '瀏覽模組';

  @override
  String get settingsImportExportTitle => '匯入／匯出';

  @override
  String get settingsImportExportSubtitle =>
      '客戶、聯絡人及商機以 CSV 匯出；聯絡人可從 vCard 匯入。';

  @override
  String get settingsPipelineTitle => '銷售流程';

  @override
  String get settingsPipelineSubtitle => '自訂階段及其標籤。';

  @override
  String get settingsConfigureStages => '設定階段';

  @override
  String get settingsBackupTitle => '本機備份';

  @override
  String get settingsBackupSubtitle => '匯出 SQLite 資料庫的副本 — 適用於更新前或封存用途。';

  @override
  String get settingsExportDbButton => '匯出資料庫（.db）';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM 備份';

  @override
  String settingsExportError(String error) {
    return '匯出失敗：$error';
  }

  @override
  String get settingsUsersTitle => '使用者';

  @override
  String get settingsUsersSubtitleAdmin => '帳戶、角色及密碼 — 管理員與使用者。';

  @override
  String get settingsUsersSubtitleLocked => '僅限管理員。';

  @override
  String get settingsManageUsersButton => '管理使用者';

  @override
  String get settingsUsersLockedHint => '請以管理員帳戶登入，以檢視或編輯使用者及其密碼。';

  @override
  String get settingsSaveKeychainError =>
      '設定已儲存，但安全鑰匙圈無法使用 — 無法儲存同步密碼（完整重建後請重新啟動應用程式）。';

  @override
  String get settingsSaved => '設定已儲存';

  @override
  String get settingsLogoutConfirmTitle => '要登出嗎？';

  @override
  String get settingsLogoutConfirmDetail => '您需要輸入密碼（或 Touch ID）才能返回。';

  @override
  String get settingsLogoutButton => '登出';

  @override
  String get settingsLogoTitle => '公司標誌';

  @override
  String get settingsLogoSubtitle => '顯示於應用程式頂部及橫幅中。';

  @override
  String get settingsLogoEmpty => '沒有標誌 — 新增貴公司的標誌';

  @override
  String get settingsLogoChoose => '選擇圖片';

  @override
  String get settingsLogoChange => '變更標誌';

  @override
  String get usersDeleteSelfError => '無法刪除您自己的帳戶';

  @override
  String get usersDeleteConfirmTitle => '刪除此使用者？';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName（$username）將失去 CRM 存取權限。';
  }

  @override
  String get usersTitle => '使用者';

  @override
  String get usersSubtitle => '帳戶、角色及密碼。';

  @override
  String get usersAddButton => '使用者';

  @override
  String get usersEmptyTitle => '沒有使用者';

  @override
  String get usersEmptySubtitle => '建立第一個帳戶 — 該帳戶將成為管理員。';

  @override
  String get usersEmptyAction => '新使用者';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name（您）';
  }

  @override
  String get usersNewTitle => '新使用者';

  @override
  String get usersEditTitle => '編輯使用者';

  @override
  String get usersLoginIdLabel => '登入帳號';

  @override
  String get usersRoleLabel => '角色';

  @override
  String get usersNewPasswordLabel => '新密碼（留空則不變更）';

  @override
  String get usersTouchIdTitle => '此裝置上的 Touch ID';

  @override
  String get usersTouchIdSubtitle => '免重新輸入密碼即可解鎖 — 僅限此裝置。';

  @override
  String get roleAdministrator => '管理員';

  @override
  String get roleUser => '使用者';

  @override
  String get dashboardTitleEmbedded => '儀表板';

  @override
  String get dashboardTitle => '今天';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 項待處理事項',
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
      other: '還有 $countString 項 — 查看全部',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => '所有業務代表';

  @override
  String dashboardMeSuffix(String name) {
    return '$name（我）';
  }

  @override
  String get dashboardEmptyTitle => '您的 CRM 已就緒';

  @override
  String get dashboardEmptySubtitle => '新增您的第一位客戶、匯入 CSV 檔案，或探索即將推出的模組。';

  @override
  String get dashboardNothingScheduled => '沒有排程 — 您的跟進事項將顯示於此。';

  @override
  String get dashboardBucketOverdue => '逾期';

  @override
  String get dashboardBucketToday => '今天';

  @override
  String get dashboardBucketWeek => '本週';

  @override
  String get dashboardBucketLater => '稍後';

  @override
  String get dashboardContactedButton => '已聯絡';

  @override
  String get dashboardDoneButton => '已完成';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => '主要客戶（進行中的銷售流程）';

  @override
  String get dashboardPipelineByStage => '依階段劃分的銷售流程';

  @override
  String get dashboardNoOpportunitiesYet => '尚無商機';

  @override
  String get dashboardWonLostByMonth => '每月成交／流失';

  @override
  String get dashboardNoClosuresYet => '尚無成交記錄。';

  @override
  String get dashboardRecentActivity => '最近活動';

  @override
  String get dashboardNoActivityYet => '目前沒有活動。';

  @override
  String get metricClients => '客戶';

  @override
  String get metricOpportunities => '商機';

  @override
  String get metricPipeline => '銷售流程';

  @override
  String get metricForecast => '預測營收';

  @override
  String get metricTasks => '工作';

  @override
  String get metricOverdue => '逾期';

  @override
  String get productTagline => '從第一天起就節省時間。';

  @override
  String get placeholderDashboardHint => '概覽：銷售流程、跟進事項及最近活動。';

  @override
  String get placeholderTodayTitle => '您的一天';

  @override
  String get placeholderTodayHint => '從左側選擇一項跟進事項。\n客戶資料會在此開啟 — 無需切換畫面。';

  @override
  String get placeholderClientsTitle => '客戶資料';

  @override
  String get placeholderClientsHint => '從清單中選擇客戶，\n或使用「+」按鈕建立新客戶。';

  @override
  String get placeholderPipelineHint => '在欄位之間拖曳卡片。\n點按以開啟客戶資料。';

  @override
  String get placeholderTasksHint => '選擇一項工作以查看相關客戶。';

  @override
  String get modulesSubtitleAppStore =>
      '通过 App Store 订阅，或激活已在 eastmarkhk.com 上购买的订阅。';

  @override
  String get modulesSubtitleWebStore =>
      '免费试用，在 eastmarkhk.com 购买 — 与 EastmarkHK e-Invoicing 应用相同的订阅。';

  @override
  String get modulesStatusActiveAppStore => '已激活 — App Store';

  @override
  String get modulesStatusActiveWeb => '已激活 — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '试用 — 还剩 $countString 天',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => '已激活';

  @override
  String get modulesStatusAvailable => '可用';

  @override
  String get modulesBuyFailed => '无法开始购买。请重试或恢复您的购买。';

  @override
  String get modulesRestoreDone => '恢复完成。';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '已从已安装的应用激活 $name。';
  }

  @override
  String get modulesLicenseNotFound =>
      '未自动找到许可证。打开 EastmarkHK e-Invoicing → 设置，复制您的激活码，然后选择「激活网页代码」。';

  @override
  String get modulesRenewalNote =>
      '通过 App Store 自动续订。请在 设置 → Apple ID → 订阅 中管理订阅。';

  @override
  String get modulesWebStoreNote => '或在 eastmarkhk.com 订阅，并使用通过电子邮件收到的代码激活。';

  @override
  String get modulesHaveEinvoicing => '我已拥有 EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => '试用 7 天';

  @override
  String get modulesSubscribe => '订阅';

  @override
  String get modulesRestore => '恢复购买';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com 订阅';

  @override
  String get modulesActivateWebCode => '激活网页代码';

  @override
  String get modulesUseInCrm => '在 CRM 中使用';

  @override
  String get modulesDontUseInCrm => '不在CRM中使用';

  @override
  String get modulesBuyOnAppStore => '在App Store购买';

  @override
  String get modulesStoreUnavailable =>
      '此版本不支持App Store。请使用App Store版本，或激活eastmarkhk.com订阅。';

  @override
  String get modulesCheckingPurchases => '正在检查App Store和eastmarkhk.com的购买情况…';

  @override
  String get modulesCheckingAppStore => '正在检查App Store购买情况…';

  @override
  String get modulesPerMonth => '/ 月';

  @override
  String get modulesActivationSubtitleAppStore =>
      '已在 eastmarkhk.com 订阅？请粘贴通过电子邮件收到的代码。在 iPhone/iPad 上，初次购买通过 App Store 或网站在激活前完成。';

  @override
  String get modulesActivationSubtitleWeb =>
      '在 eastmarkhk.com 订阅，然后粘贴与此设备关联的激活码。';

  @override
  String get modulesMachineId => '机器 ID';

  @override
  String get modulesCopy => '复制';

  @override
  String get modulesSubscriptionEmailLabel => '订阅邮箱';

  @override
  String get modulesActivationCodeLabel => '激活码';

  @override
  String get modulesActivationCodeHint => '粘贴购买后收到的代码';

  @override
  String get modulesActivate => '激活';

  @override
  String get modulesBuyOnWebsite => '在 eastmarkhk.com 购买';

  @override
  String get modulesRequestCodeByEmail => '通过电子邮件请求代码';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '已通过 eastmarkhk.com 激活 $name';
  }

  @override
  String get modulesMachineIdCopied => '机器 ID 已复制';

  @override
  String get modulesEmailRequired => '请输入您的订阅邮箱';

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
  String get invPickClientTitle => '选择客户';

  @override
  String get invPickClientSearch => '按名称、税号、国家搜索…';

  @override
  String get invPickClientEmpty => '没有匹配的客户。';

  @override
  String get invPickClientButton => '选择客户';

  @override
  String get invClientRequired => '保存前请选择客户。';

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
  String get invSave => '保存';

  @override
  String get invSaving => '正在保存…';

  @override
  String invEditQuote(String number) {
    return '编辑报价单 $number';
  }

  @override
  String invEditInvoice(String number) {
    return '编辑发票 $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number 已保存。';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return '无法保存：$error';
  }

  @override
  String get invEditDocument => '编辑';

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
      '报价单和发票 — 来自EastmarkHK e-Invoicing的数据（收据和提醒：独立应用程序）';

  @override
  String get invOpenStandalone => '打开e-Invoicing';

  @override
  String get invLaunchStandalone => '启动e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => '远程连接';

  @override
  String invTabQuotes(int count) {
    return '报价单（$count）';
  }

  @override
  String invTabInvoices(int count) {
    return '发票（$count）';
  }

  @override
  String get invEmptyQuotes => '暂无报价单 — 从已赢得的商机或上方按钮创建一个。';

  @override
  String get invEmptyInvoices => '暂无发票。';

  @override
  String get invEmptyCompanyDocs => '暂无报价单或发票。';

  @override
  String get invQuotesSection => '报价单';

  @override
  String get invInvoicesSection => '发票';

  @override
  String get invCompanyFooter =>
      '文档由EastmarkHK e-Invoicing管理 — 发送、PDF、收据和提醒均在独立应用程序中完成。';

  @override
  String get invRemoteNotConfigured => 'e-Invoicing处于远程模式 — 连接尚未配置。';

  @override
  String get invConfigure => '配置';

  @override
  String get invAppNotDetected =>
      '未检测到e-Invoicing应用 — 请安装/启动EastmarkHK e-Invoicing以从此记录创建报价单和发票。';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing已配置为远程存储。在此输入相同的凭据以将CRM连接到同一API — 与e-Invoicing→设置→远程存储中的值相同。';

  @override
  String get invLaunchOnceBody =>
      '先启动一次EastmarkHK e-Invoicing以初始化共享数据库，然后返回此处。';

  @override
  String get invAcquireAppStoreBody =>
      '此模块使用EastmarkHK e-Invoicing。请通过App Store下载并订阅，启动一次后返回此处。';

  @override
  String get invAcquireWebBody =>
      '此模块使用EastmarkHK e-Invoicing。请在eastmarkhk.com下载并订阅，启动一次后返回此处。';

  @override
  String get invConfigureRemote => '配置远程连接';

  @override
  String get invViewOnAppStore => '在App Store查看';

  @override
  String get invViewOnWebsite => '在eastmarkhk.com查看';

  @override
  String get invRetry => '重试';

  @override
  String get invDocInvoice => '发票';

  @override
  String get invDocQuote => '报价单';

  @override
  String get invDocClient => '客户';

  @override
  String get invDocStatus => '状态';

  @override
  String get invDocDate => '日期';

  @override
  String get invOpenInStandalone => '在e-Invoicing中打开';

  @override
  String get invOpenStandaloneFailed => '无法打开e-Invoicing — 请检查是否已安装。';

  @override
  String get invCreateInvoiceFromQuote => '创建发票';

  @override
  String get invCreatingInvoice => '正在创建发票…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return '已根据报价单创建发票 $number。';
  }

  @override
  String get invQuoteAlreadyInvoiced => '此报价单已开具发票。';

  @override
  String invCreateInvoiceFailed(String error) {
    return '无法创建发票：$error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing关联';

  @override
  String get invLinkStatusLinked => 'e-Invoicing客户已关联';

  @override
  String get invLinkStatusNone => '没有已保存的e-Invoicing关联';

  @override
  String get invUnlinkCustomer => '取消关联e-Invoicing客户';

  @override
  String get invUnlinkConfirmTitle => '取消关联客户？';

  @override
  String get invUnlinkConfirmBody =>
      '下一次创建报价单或发票时，系统将再次要求您在e-Invoicing中选择或创建客户。';

  @override
  String get invUnlinkDone => '已移除e-Invoicing关联。';

  @override
  String get invAppStoreUrlMissing =>
      '此版本的e-Invoicing尚未在App Store上架。请使用eastmarkhk.com或启动已安装的应用程序。';

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
    return '逾期 · $days 天 · $date';
  }

  @override
  String dueLabelToday(String date) {
    return '今天 · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return '明天 · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · $days 天后';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return '今天 · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return '明天 · $date';
  }

  @override
  String dueGroupWeekWithDate(String date) {
    return '本周 · $date';
  }

  @override
  String dueGroupWeekWithRange(String from, String to) {
    return '本周 · $from → $to';
  }

  @override
  String dueGroupLaterWithDate(String date) {
    return '稍后 · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return '稍后 · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip => '未启用同步 — 点按以设置';

  @override
  String get bannerSyncInProgressTooltip => '正在同步…';

  @override
  String get bannerSyncErrorTooltip => '同步错误 — 点按重试';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return '上次同步：$date';
  }

  @override
  String get bannerSyncIdleTooltip => '同步';

  @override
  String get bannerCompanyPlaceholder => '您的公司';

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
  String get shellSyncNeedsPassword => '共享数据库：请在设置中输入同步密码以重新连接此设备。';

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
  String get activityTaskCreated => '已创建任务';

  @override
  String get dictationOfflineTip =>
      '离线听写——常会识别到噪音（电视）而非您的声音。请在 Windows 设置 → 隐私 → 语音 中开启“联机语音识别”，降低环境噪音后重试。';

  @override
  String get dictationLanguageFallbackTip =>
      'Windows 未安装此语言变体——将使用相近变体。请在设置 → 时间和语言 → 语音中安装所需语音包。';

  @override
  String get dictationStarting => '正在启动听写…';

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

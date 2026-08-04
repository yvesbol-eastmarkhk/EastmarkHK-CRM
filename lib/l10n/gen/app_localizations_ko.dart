// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get commonCancel => '취소';

  @override
  String get commonSave => '저장';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonEdit => '편집';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => '아이디';

  @override
  String get commonDisplayNameLabel => '표시 이름';

  @override
  String get commonPasswordLabel => '비밀번호';

  @override
  String get commonConfirmPasswordLabel => '비밀번호 확인';

  @override
  String get commonPasswordMismatch => '비밀번호가 일치하지 않습니다';

  @override
  String get commonUsernameTaken => '이미 사용 중인 아이디입니다';

  @override
  String get commonChoosePassword => '비밀번호를 설정하세요';

  @override
  String get commonRequiredFields => '이름과 아이디는 필수입니다';

  @override
  String get passwordFieldShow => '표시';

  @override
  String get passwordFieldHide => '숨기기';

  @override
  String loginWelcomeBack(String name) {
    return '다시 오신 것을 환영합니다, $name님';
  }

  @override
  String get loginTitle => '로그인';

  @override
  String get loginVerifying => '확인 중…';

  @override
  String get loginUnlockTouchId => 'Touch ID로 잠금 해제';

  @override
  String get loginOr => '또는';

  @override
  String get loginRequiredFields => '아이디와 비밀번호가 필요합니다';

  @override
  String get loginInvalidCredentials => '아이디 또는 비밀번호가 올바르지 않습니다';

  @override
  String get loginSubmit => '로그인';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => '환영합니다';

  @override
  String get bootstrapSubtitle => 'CRM을 보호하려면 관리자 계정을 만드세요.';

  @override
  String get bootstrapSubmit => '관리자 계정 만들기';

  @override
  String get commonAdd => '추가';

  @override
  String get commonCreate => '만들기';

  @override
  String get commonClose => '닫기';

  @override
  String get commonNoName => '(이름 없음)';

  @override
  String get commonNotesLabel => '메모';

  @override
  String get commonEmailLabel => '이메일';

  @override
  String get commonPhoneLabel => '전화번호';

  @override
  String get commonFirstNameLabel => '이름';

  @override
  String get commonLastNameLabel => '성';

  @override
  String get commonCompanyNameLabel => '회사명';

  @override
  String messagingCannotOpen(String target) {
    return '$target을(를) 열 수 없습니다.';
  }

  @override
  String get messagingEmailAppLabel => '이메일 앱';

  @override
  String get messagingPhoneAppLabel => '전화 앱';

  @override
  String messagingIncompleteId(String label) {
    return '$label을(를) 열기 위한 식별자가 불완전합니다.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label을(를) 열 수 없습니다 — 앱이 설치되어 있나요?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat은 특정 연락처로의 공개 링크를 제공하지 않습니다 — 앱은 열리지만 대화는 수동으로 선택해야 합니다.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk은 특정 연락처로의 공개 링크를 제공하지 않습니다 — 앱은 열리지만 대화는 수동으로 선택해야 합니다.';

  @override
  String get messagingPhoneCallLabel => '전화 통화';

  @override
  String get companyDeleteOpportunityConfirm => '이 영업 기회를 삭제하시겠습니까?';

  @override
  String get companyDeleteContactConfirm => '이 연락처를 삭제하시겠습니까?';

  @override
  String get companyDeleteTaskConfirm => '이 작업을 삭제하시겠습니까?';

  @override
  String get companyDeleteConfirmTitle => '이 고객을 삭제하시겠습니까?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — 연락처, 영업 기회, 작업 및 기록도 함께 삭제됩니다.';
  }

  @override
  String get companyNewNoteTitle => '새 메모';

  @override
  String get companyNoteFieldLabel => '메모 (또는 구술)';

  @override
  String get companyTabOverview => '개요';

  @override
  String get companyTabActivity => '활동';

  @override
  String get companyTabTasks => '작업';

  @override
  String get companyTabDeals => '영업 기회';

  @override
  String get companyContactsTitle => '연락처';

  @override
  String get companyNoContacts => '연락처 없음';

  @override
  String get companyNoActivity => '활동 없음 — 메모를 추가하세요.';

  @override
  String get companyNoTasks => '작업 없음';

  @override
  String get companyNoDeals => '영업 기회 없음';

  @override
  String get companyNoteButtonLabel => '메모';

  @override
  String get companyNewClientTitle => '새 고객';

  @override
  String get companyEditClientTitle => '고객 편집';

  @override
  String get companyWebsiteLabel => '웹사이트';

  @override
  String get companyPeppolLabel => 'Peppol ID';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => '태그 (쉼표로 구분)';

  @override
  String get companyNewContactTitle => '새 연락처';

  @override
  String get companyEditContactTitle => '연락처 편집';

  @override
  String get companyAppLabel => '앱';

  @override
  String get companyIdentifierNumberLabel => '식별자 / 번호';

  @override
  String get companyOpenTooltip => '열기';

  @override
  String get companyRemoveTooltip => '제거';

  @override
  String get companyRoleFieldLabel => '역할 (예: 구매 담당자)';

  @override
  String get companyMessagingTitle => '메시징';

  @override
  String get companyNoMessagingHint =>
      '메시징 채널이 추가되지 않았습니다 — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => '아직 추가된 연락처 정보가 없습니다.';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsSubtitle => '앱의 일회성 구성입니다.';

  @override
  String get settingsLanguagesTitle => '언어 및 통화';

  @override
  String get settingsAppLanguageLabel => '앱 언어';

  @override
  String get settingsDictationLanguageLabel => '받아쓰기 언어';

  @override
  String get settingsCurrencyLabel => '통화';

  @override
  String get settingsFormatsHint =>
      '금액은 1,234.56 형식으로(쉼표=천 단위, 마침표=소수점), 날짜는 dd/mm/yyyy 형식으로 인터페이스 언어와 관계없이 표시됩니다.';

  @override
  String get settingsCompanyTitle => '회사';

  @override
  String get settingsCompanySubtitle =>
      '이 CRM을 사용하는 회사 정보입니다 — 나중에 헤더(화이트 라벨) 및 PDF 문서 헤더에서 재사용됩니다.';

  @override
  String get settingsSyncTitle => '동기화';

  @override
  String get settingsSyncSubtitle => '기본적으로 모든 데이터는 이 기기에 로컬(SQLite)로 유지됩니다.';

  @override
  String get settingsSyncLocalTitle => '독립형 (로컬 전용)';

  @override
  String get settingsSyncLocalSubtitle => '이 기기 외부로 전송되는 데이터가 없습니다';

  @override
  String get settingsSyncRemoteTitle => '공유 데이터베이스 (원격)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite 서버와 동기화됩니다 (server/crm-sync/ 참조)';

  @override
  String get settingsServerLabel => '서버';

  @override
  String get settingsAccountLabel => '계정';

  @override
  String get settingsSyncPasswordHint =>
      '기기의 보안 키체인에 저장됩니다 — 데이터베이스에는 절대 저장되지 않습니다.';

  @override
  String get settingsSyncNowButton => '지금 동기화';

  @override
  String get settingsSyncPollHint =>
      '백그라운드에서 25초마다 자동 가져오기; 변경 사항마다 즉시 전송(원격 모드 활성화 시). 입력 중에는 가져오지 않습니다.';

  @override
  String get settingsSyncMissingFields => '서버, 계정, 비밀번호가 필요합니다';

  @override
  String get settingsModulesTitle => '모듈';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK 전자 인보이스, 스캐너, 동기화… — 7일 체험판 또는 라이선스 활성화.';

  @override
  String get settingsBrowseModules => '모듈 둘러보기';

  @override
  String get settingsImportExportTitle => '가져오기 / 내보내기';

  @override
  String get settingsImportExportSubtitle =>
      '고객, 연락처, 영업 기회를 CSV로; 연락처는 vCard에서.';

  @override
  String get settingsPipelineTitle => '파이프라인';

  @override
  String get settingsPipelineSubtitle => '단계와 라벨을 사용자 지정하세요.';

  @override
  String get settingsConfigureStages => '단계 구성';

  @override
  String get settingsBackupTitle => '로컬 백업';

  @override
  String get settingsBackupSubtitle =>
      'SQLite 데이터베이스 복사본을 내보냅니다 — 업데이트 전이나 보관용으로 유용합니다.';

  @override
  String get settingsExportDbButton => '데이터베이스 내보내기 (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM 백업';

  @override
  String settingsExportError(String error) {
    return '내보내기 실패: $error';
  }

  @override
  String get settingsUsersTitle => '사용자';

  @override
  String get settingsUsersSubtitleAdmin => '계정, 역할, 비밀번호 — 관리자 및 사용자.';

  @override
  String get settingsUsersSubtitleLocked => '관리자 전용.';

  @override
  String get settingsManageUsersButton => '사용자 관리';

  @override
  String get settingsUsersLockedHint => '사용자와 비밀번호를 보거나 편집하려면 관리자 계정으로 로그인하세요.';

  @override
  String get settingsSaveKeychainError =>
      '설정이 저장되었지만 보안 키체인을 사용할 수 없습니다 — 동기화 비밀번호를 저장하지 못했습니다(전체 재빌드 후 앱을 다시 시작하세요).';

  @override
  String get settingsSaved => '설정이 저장되었습니다';

  @override
  String get settingsLogoutConfirmTitle => '로그아웃하시겠습니까?';

  @override
  String get settingsLogoutConfirmDetail =>
      '돌아오려면 비밀번호(또는 Touch ID)를 입력해야 합니다.';

  @override
  String get settingsLogoutButton => '로그아웃';

  @override
  String get settingsLogoTitle => '회사 로고';

  @override
  String get settingsLogoSubtitle => '앱 상단과 배너에 표시됩니다.';

  @override
  String get settingsLogoEmpty => '로고 없음 — 회사 로고를 추가하세요';

  @override
  String get settingsLogoChoose => '이미지 선택';

  @override
  String get settingsLogoChange => '로고 변경';

  @override
  String get usersDeleteSelfError => '본인 계정은 삭제할 수 없습니다';

  @override
  String get usersDeleteConfirmTitle => '이 사용자를 삭제하시겠습니까?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName($username)님은 CRM에 대한 접근 권한을 잃게 됩니다.';
  }

  @override
  String get usersTitle => '사용자';

  @override
  String get usersSubtitle => '계정, 역할, 비밀번호.';

  @override
  String get usersAddButton => '사용자';

  @override
  String get usersEmptyTitle => '사용자 없음';

  @override
  String get usersEmptySubtitle => '첫 계정을 만드세요 — 관리자가 됩니다.';

  @override
  String get usersEmptyAction => '새 사용자';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (본인)';
  }

  @override
  String get usersNewTitle => '새 사용자';

  @override
  String get usersEditTitle => '사용자 편집';

  @override
  String get usersLoginIdLabel => '로그인 ID';

  @override
  String get usersRoleLabel => '역할';

  @override
  String get usersNewPasswordLabel => '새 비밀번호 (변경하지 않으려면 비워두세요)';

  @override
  String get usersTouchIdTitle => '이 기기에서 Touch ID';

  @override
  String get usersTouchIdSubtitle => '비밀번호를 다시 입력하지 않고 잠금 해제 — 이 기기에서만.';

  @override
  String get roleAdministrator => '관리자';

  @override
  String get roleUser => '사용자';

  @override
  String get dashboardTitleEmbedded => '대시보드';

  @override
  String get dashboardTitle => '오늘';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '처리할 작업 $countString건',
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
      other: '+$countString개 더 — 전체 보기',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => '모든 영업 담당자';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (나)';
  }

  @override
  String get dashboardEmptyTitle => 'CRM 준비 완료';

  @override
  String get dashboardEmptySubtitle =>
      '첫 고객을 추가하거나, CSV 파일을 가져오거나, 향후 모듈을 살펴보세요.';

  @override
  String get dashboardNothingScheduled => '예정된 일정 없음 — 후속 조치가 여기에 표시됩니다.';

  @override
  String get dashboardBucketOverdue => '기한 초과';

  @override
  String get dashboardBucketToday => '오늘';

  @override
  String get dashboardBucketWeek => '이번 주';

  @override
  String get dashboardBucketLater => '나중에';

  @override
  String get dashboardContactedButton => '연락함';

  @override
  String get dashboardDoneButton => '완료';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => '상위 고객 (열려 있는 파이프라인)';

  @override
  String get dashboardPipelineByStage => '단계별 파이프라인';

  @override
  String get dashboardNoOpportunitiesYet => '아직 영업 기회 없음';

  @override
  String get dashboardWonLostByMonth => '월별 성사 / 실패';

  @override
  String get dashboardNoClosuresYet => '아직 기록된 마감 건이 없습니다.';

  @override
  String get dashboardRecentActivity => '최근 활동';

  @override
  String get dashboardNoActivityYet => '아직 활동이 없습니다.';

  @override
  String get metricClients => '고객';

  @override
  String get metricOpportunities => '영업 기회';

  @override
  String get metricPipeline => '파이프라인';

  @override
  String get metricForecast => '예측';

  @override
  String get metricTasks => '작업';

  @override
  String get metricOverdue => '기한 초과';

  @override
  String get productTagline => '첫날부터 시간을 절약하세요.';

  @override
  String get placeholderDashboardHint => '개요: 파이프라인, 후속 조치, 최근 활동.';

  @override
  String get placeholderTodayTitle => '오늘 하루';

  @override
  String get placeholderTodayHint =>
      '왼쪽에서 후속 조치를 선택하세요.\n화면 전환 없이 여기에서 고객이 열립니다.';

  @override
  String get placeholderClientsTitle => '고객 카드';

  @override
  String get placeholderClientsHint => '목록에서 고객을 선택하거나\n+ 버튼으로 새로 만드세요.';

  @override
  String get placeholderPipelineHint => '열 사이에서 카드를 드래그하세요.\n클릭하면 고객 카드가 열립니다.';

  @override
  String get placeholderTasksHint => '관련 고객을 보려면 작업을 선택하세요.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store에서 구독하거나 eastmarkhk.com에서 이미 구매한 구독을 활성화하세요.';

  @override
  String get modulesSubtitleWebStore =>
      '무료 체험, eastmarkhk.com에서 구매 — EastmarkHK e-Invoicing 앱과 동일한 구독.';

  @override
  String get modulesStatusActiveAppStore => '활성 — App Store';

  @override
  String get modulesStatusActiveWeb => '활성 — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '체험 — $countString일 남음',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => '활성';

  @override
  String get modulesStatusAvailable => '사용 가능';

  @override
  String get modulesBuyFailed => '구매를 시작할 수 없습니다. 다시 시도하거나 구입 항목을 복원하세요.';

  @override
  String get modulesRestoreDone => '복원이 완료되었습니다.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '설치된 앱에서 $name을(를) 활성화했습니다.';
  }

  @override
  String get modulesLicenseNotFound =>
      '라이선스를 자동으로 찾을 수 없습니다. EastmarkHK e-Invoicing → 설정을 열고 활성화 코드를 복사한 다음 «웹 코드 활성화»를 선택하세요.';

  @override
  String get modulesRenewalNote =>
      'App Store를 통한 자동 갱신. 구독은 설정 → Apple ID → 구독에서 관리할 수 있습니다.';

  @override
  String get modulesWebStoreNote =>
      '또는 eastmarkhk.com에서 구독하고 이메일로 받은 코드로 활성화하세요.';

  @override
  String get modulesHaveEinvoicing => '이미 EastmarkHK e-Invoicing을 보유하고 있습니다';

  @override
  String get modulesTry7Days => '7일 체험';

  @override
  String get modulesSubscribe => '구독';

  @override
  String get modulesRestore => '구입 항목 복원';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com 구독';

  @override
  String get modulesActivateWebCode => '웹 코드 활성화';

  @override
  String get modulesUseInCrm => 'CRM에서 사용';

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
  String get modulesPerMonth => '/ 월';

  @override
  String get modulesActivationSubtitleAppStore =>
      'eastmarkhk.com에서 구독하셨나요? 이메일로 받은 코드를 붙여넣으세요. iPhone/iPad에서는 활성화 전에 App Store 또는 사이트를 통해 초기 구매가 이루어집니다.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com에서 구독한 다음 이 기기에 연결된 활성화 코드를 붙여넣으세요.';

  @override
  String get modulesMachineId => '머신 ID';

  @override
  String get modulesCopy => '복사';

  @override
  String get modulesSubscriptionEmailLabel => '구독 이메일';

  @override
  String get modulesActivationCodeLabel => '활성화 코드';

  @override
  String get modulesActivationCodeHint => '구매 후 받은 코드를 붙여넣으세요';

  @override
  String get modulesActivate => '활성화';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com에서 구매';

  @override
  String get modulesRequestCodeByEmail => '이메일로 코드 요청';

  @override
  String modulesActivatedViaWebsite(String name) {
    return 'eastmarkhk.com을 통해 $name을(를) 활성화했습니다';
  }

  @override
  String get modulesMachineIdCopied => '머신 ID가 복사되었습니다';

  @override
  String get modulesEmailRequired => '구독 이메일을 입력하세요';

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

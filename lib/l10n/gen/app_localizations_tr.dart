// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Kullanıcı adı';

  @override
  String get commonDisplayNameLabel => 'Görünen ad';

  @override
  String get commonPasswordLabel => 'Şifre';

  @override
  String get commonConfirmPasswordLabel => 'Şifreyi onayla';

  @override
  String get commonPasswordMismatch => 'Şifreler eşleşmiyor';

  @override
  String get commonUsernameTaken => 'Bu kullanıcı adı zaten kullanılıyor';

  @override
  String get commonChoosePassword => 'Bir şifre seçin';

  @override
  String get commonRequiredFields => 'Ad ve kullanıcı adı gereklidir';

  @override
  String get passwordFieldShow => 'Göster';

  @override
  String get passwordFieldHide => 'Gizle';

  @override
  String loginWelcomeBack(String name) {
    return 'Tekrar hoş geldiniz, $name';
  }

  @override
  String get loginTitle => 'Giriş';

  @override
  String get loginVerifying => 'Doğrulanıyor…';

  @override
  String get loginUnlockTouchId => 'Touch ID ile kilidi aç';

  @override
  String get loginOr => 'veya';

  @override
  String get loginRequiredFields => 'Kullanıcı adı ve şifre gereklidir';

  @override
  String get loginInvalidCredentials => 'Kullanıcı adı veya şifre hatalı';

  @override
  String get loginSubmit => 'Giriş yap';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Hoş geldiniz';

  @override
  String get bootstrapSubtitle =>
      'CRM\'inizi korumak için yönetici hesabı oluşturun.';

  @override
  String get bootstrapSubmit => 'Yönetici hesabı oluştur';

  @override
  String get commonAdd => 'Ekle';

  @override
  String get commonCreate => 'Oluştur';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonNoName => '(isim yok)';

  @override
  String get commonNotesLabel => 'Notlar';

  @override
  String get commonEmailLabel => 'E-posta';

  @override
  String get commonPhoneLabel => 'Telefon';

  @override
  String get commonFirstNameLabel => 'Ad';

  @override
  String get commonLastNameLabel => 'Soyad';

  @override
  String get commonCompanyNameLabel => 'Şirket adı';

  @override
  String messagingCannotOpen(String target) {
    return '$target açılamıyor.';
  }

  @override
  String get messagingEmailAppLabel => 'e-posta uygulaması';

  @override
  String get messagingPhoneAppLabel => 'telefon uygulaması';

  @override
  String messagingIncompleteId(String label) {
    return '$label açmak için tanımlayıcı eksik.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return '$label açılamıyor — uygulama yüklü mü?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat belirli bir kişiye genel bir bağlantı sunmuyor — uygulama açılır, ancak konuşma elle seçilmelidir.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk belirli bir kişiye genel bir bağlantı sunmuyor — uygulama açılır, ancak konuşma elle seçilmelidir.';

  @override
  String get messagingPhoneCallLabel => 'Telefon araması';

  @override
  String get companyDeleteOpportunityConfirm => 'Bu fırsat silinsin mi?';

  @override
  String get companyDeleteContactConfirm => 'Bu kişi silinsin mi?';

  @override
  String get companyDeleteTaskConfirm => 'Bu görev silinsin mi?';

  @override
  String get companyDeleteConfirmTitle => 'Bu müşteri silinsin mi?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — kişileri, fırsatları, görevleri ve geçmişi de onunla birlikte silinecek.';
  }

  @override
  String get companyNewNoteTitle => 'Yeni not';

  @override
  String get companyNoteFieldLabel => 'Not (veya sesli olarak söyleyin)';

  @override
  String get companyTabOverview => 'Genel bakış';

  @override
  String get companyTabActivity => 'Etkinlik';

  @override
  String get companyTabTasks => 'Görevler';

  @override
  String get companyTabDeals => 'Fırsatlar';

  @override
  String get companyContactsTitle => 'Kişiler';

  @override
  String get companyNoContacts => 'Kişi yok';

  @override
  String get companyNoActivity => 'Etkinlik yok — bir not ekleyin.';

  @override
  String get companyNoTasks => 'Görev yok';

  @override
  String get companyNoDeals => 'Fırsat yok';

  @override
  String get companyNoteButtonLabel => 'Not';

  @override
  String get companyNewClientTitle => 'Yeni müşteri';

  @override
  String get companyEditClientTitle => 'Müşteriyi düzenle';

  @override
  String get companyWebsiteLabel => 'Web sitesi';

  @override
  String get companyPeppolLabel => 'Peppol kimliği';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Etiketler (virgülle ayrılmış)';

  @override
  String get companyNewContactTitle => 'Yeni kişi';

  @override
  String get companyEditContactTitle => 'Kişiyi düzenle';

  @override
  String get companyAppLabel => 'Uygulama';

  @override
  String get companyIdentifierNumberLabel => 'Tanımlayıcı / numara';

  @override
  String get companyOpenTooltip => 'Aç';

  @override
  String get companyRemoveTooltip => 'Kaldır';

  @override
  String get companyRoleFieldLabel => 'Rol (örn. Satın alıcı)';

  @override
  String get companyMessagingTitle => 'Mesajlaşma';

  @override
  String get companyNoMessagingHint =>
      'Mesajlaşma kanalı eklenmedi — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo => 'Henüz iletişim bilgisi eklenmedi.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsSubtitle => 'Uygulamanın tek seferlik yapılandırması.';

  @override
  String get settingsLanguagesTitle => 'Diller ve para birimi';

  @override
  String get settingsAppLanguageLabel => 'Uygulama dili';

  @override
  String get settingsDictationLanguageLabel => 'Dikte dili';

  @override
  String get settingsCurrencyLabel => 'Para birimi';

  @override
  String get settingsFormatsHint =>
      'Tutarlar 1.234,56 biçiminde (nokta = binlik, virgül = ondalık), tarihler ise arayüz dilinden bağımsız olarak gg/aa/yyyy biçiminde gösterilir.';

  @override
  String get settingsCompanyTitle => 'Şirket';

  @override
  String get settingsCompanySubtitle =>
      'Bu CRM\'i kullanan şirketin kimliği — daha sonra üst bilgide (white-label) ve PDF belge başlıklarında yeniden kullanılır.';

  @override
  String get settingsSyncTitle => 'Senkronizasyon';

  @override
  String get settingsSyncSubtitle =>
      'Varsayılan olarak tüm veriler bu cihazda yerel olarak (SQLite) kalır.';

  @override
  String get settingsSyncLocalTitle => 'Bağımsız (yalnızca yerel)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Hiçbir veri bu cihazın dışına gönderilmez';

  @override
  String get settingsSyncRemoteTitle => 'Paylaşılan veritabanı (uzak)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'PHP + SQLite sunucusuyla senkronize olur (bkz. server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Sunucu';

  @override
  String get settingsAccountLabel => 'Hesap';

  @override
  String get settingsSyncPasswordHint =>
      'Cihazın güvenli anahtarlığında saklanır — asla veritabanında değil.';

  @override
  String get settingsSyncNowButton => 'Şimdi senkronize et';

  @override
  String get settingsSyncPollHint =>
      'Arka planda her 25 saniyede bir otomatik çekme; her değişiklikten sonra anında gönderme (uzak mod etkin). Yazma sırasında çekme yapılmaz.';

  @override
  String get settingsSyncMissingFields => 'Sunucu, hesap ve parola gerekli';

  @override
  String get settingsModulesTitle => 'Modüller';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Fatura, Tarayıcı, Senkronizasyon… — 7 günlük deneme veya lisans etkinleştirme.';

  @override
  String get settingsBrowseModules => 'Modüllere göz at';

  @override
  String get settingsImportExportTitle => 'İçe / dışa aktar';

  @override
  String get settingsImportExportSubtitle =>
      'Müşteriler, kişiler ve fırsatlar CSV olarak; kişiler vCard\'dan.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Aşamaları ve etiketlerini özelleştirin.';

  @override
  String get settingsConfigureStages => 'Aşamaları yapılandır';

  @override
  String get settingsBackupTitle => 'Yerel yedekleme';

  @override
  String get settingsBackupSubtitle =>
      'SQLite veritabanınızın bir kopyasını dışa aktarır — güncellemeden önce veya arşivleme için kullanışlıdır.';

  @override
  String get settingsExportDbButton => 'Veritabanını dışa aktar (.db)';

  @override
  String get settingsBackupShareText => 'EastmarkHK CRM yedeği';

  @override
  String settingsExportError(String error) {
    return 'Dışa aktarma başarısız oldu: $error';
  }

  @override
  String get settingsUsersTitle => 'Kullanıcılar';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Hesaplar, roller ve parolalar — yönetici ve kullanıcı.';

  @override
  String get settingsUsersSubtitleLocked => 'Yalnızca yöneticiler için.';

  @override
  String get settingsManageUsersButton => 'Kullanıcıları yönet';

  @override
  String get settingsUsersLockedHint =>
      'Kullanıcıları ve parolalarını görüntülemek veya düzenlemek için bir yönetici hesabıyla giriş yapın.';

  @override
  String get settingsSaveKeychainError =>
      'Ayarlar kaydedildi, ancak güvenli anahtarlık kullanılamıyor — senkronizasyon parolası kaydedilemedi (tam bir yeniden derlemeden sonra uygulamayı yeniden başlatın).';

  @override
  String get settingsSaved => 'Ayarlar kaydedildi';

  @override
  String get settingsLogoutConfirmTitle => 'Çıkış yapılsın mı?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Geri dönmek için parolanızı (veya Touch ID) girmeniz gerekecek.';

  @override
  String get settingsLogoutButton => 'Çıkış yap';

  @override
  String get settingsLogoTitle => 'Şirket logosu';

  @override
  String get settingsLogoSubtitle =>
      'Uygulamanın üst kısmında ve bannerda gösterilir.';

  @override
  String get settingsLogoEmpty => 'Logo yok — şirketinizin logosunu ekleyin';

  @override
  String get settingsLogoChoose => 'Bir görsel seç';

  @override
  String get settingsLogoChange => 'Logoyu değiştir';

  @override
  String get usersDeleteSelfError => 'Kendi hesabınızı silemezsiniz';

  @override
  String get usersDeleteConfirmTitle => 'Bu kullanıcı silinsin mi?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) CRM\'e erişimini kaybedecek.';
  }

  @override
  String get usersTitle => 'Kullanıcılar';

  @override
  String get usersSubtitle => 'Hesaplar, roller ve parolalar.';

  @override
  String get usersAddButton => 'Kullanıcı';

  @override
  String get usersEmptyTitle => 'Kullanıcı yok';

  @override
  String get usersEmptySubtitle => 'İlk hesabı oluşturun — yönetici olacaktır.';

  @override
  String get usersEmptyAction => 'Yeni kullanıcı';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (siz)';
  }

  @override
  String get usersNewTitle => 'Yeni kullanıcı';

  @override
  String get usersEditTitle => 'Kullanıcıyı düzenle';

  @override
  String get usersLoginIdLabel => 'Giriş kimliği';

  @override
  String get usersRoleLabel => 'Rol';

  @override
  String get usersNewPasswordLabel =>
      'Yeni parola (değiştirmemek için boş bırakın)';

  @override
  String get usersTouchIdTitle => 'Bu cihazda Touch ID';

  @override
  String get usersTouchIdSubtitle =>
      'Parolayı yeniden girmeden kilidi açma, yalnızca bu cihazda.';

  @override
  String get roleAdministrator => 'Yönetici';

  @override
  String get roleUser => 'Kullanıcı';

  @override
  String get dashboardTitleEmbedded => 'Kontrol paneli';

  @override
  String get dashboardTitle => 'Bugün';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'İşlenecek $countString işlem',
      one: 'İşlenecek $countString işlem',
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
      other: '+$countString tane daha — tümünü gör',
      one: '+$countString tane daha — tümünü gör',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Tüm satış temsilcileri';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (ben)';
  }

  @override
  String get dashboardEmptyTitle => 'CRM\'iniz hazır';

  @override
  String get dashboardEmptySubtitle =>
      'İlk müşterinizi ekleyin, bir CSV dosyası içe aktarın veya yaklaşan modülleri keşfedin.';

  @override
  String get dashboardNothingScheduled =>
      'Planlanmış bir şey yok — takip işlemleriniz burada görünecek.';

  @override
  String get dashboardBucketOverdue => 'Gecikmiş';

  @override
  String get dashboardBucketToday => 'Bugün';

  @override
  String get dashboardBucketWeek => 'Bu hafta';

  @override
  String get dashboardBucketLater => 'Daha sonra';

  @override
  String get dashboardContactedButton => 'İletişime geçildi';

  @override
  String get dashboardDoneButton => 'Tamamlandı';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'En iyi müşteriler (açık pipeline)';

  @override
  String get dashboardPipelineByStage => 'Aşamaya göre pipeline';

  @override
  String get dashboardNoOpportunitiesYet => 'Henüz fırsat yok';

  @override
  String get dashboardWonLostByMonth => 'Aya göre kazanılan / kaybedilen';

  @override
  String get dashboardNoClosuresYet => 'Henüz kaydedilmiş kapanış yok.';

  @override
  String get dashboardRecentActivity => 'Son etkinlik';

  @override
  String get dashboardNoActivityYet => 'Henüz etkinlik yok.';

  @override
  String get metricClients => 'Müşteriler';

  @override
  String get metricOpportunities => 'Fırsatlar';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Tahmin';

  @override
  String get metricTasks => 'Görevler';

  @override
  String get metricOverdue => 'Gecikmiş';

  @override
  String get productTagline => 'İlk günden itibaren zaman kazanın.';

  @override
  String get placeholderDashboardHint =>
      'Genel bakış: pipeline, takipler ve son etkinlik.';

  @override
  String get placeholderTodayTitle => 'Gününüz';

  @override
  String get placeholderTodayHint =>
      'Solda bir takip seçin.\nMüşteri burada açılır — ekran değiştirmeden.';

  @override
  String get placeholderClientsTitle => 'Müşteri kartı';

  @override
  String get placeholderClientsHint =>
      'Listeden bir müşteri seçin\nveya + düğmesiyle yeni bir tane oluşturun.';

  @override
  String get placeholderPipelineHint =>
      'Bir kartı sütunlar arasında sürükleyin.\nMüşteri kartını açmak için tıklayın.';

  @override
  String get placeholderTasksHint =>
      'İlgili müşteriyi görmek için bir görev seçin.';

  @override
  String get modulesSubtitleAppStore =>
      'App Store üzerinden abone olun veya eastmarkhk.com\'da zaten satın aldığınız bir aboneliği etkinleştirin.';

  @override
  String get modulesSubtitleWebStore =>
      'Ücretsiz deneme, eastmarkhk.com\'da satın alma — EastmarkHK e-Invoicing uygulamasıyla aynı abonelik.';

  @override
  String get modulesStatusActiveAppStore => 'Aktif — App Store';

  @override
  String get modulesStatusActiveWeb => 'Aktif — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deneme — $countString gün kaldı',
      one: 'Deneme — $countString gün kaldı',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Aktif';

  @override
  String get modulesStatusAvailable => 'Kullanılabilir';

  @override
  String get modulesBuyFailed =>
      'Satın alma başlatılamadı. Tekrar deneyin veya satın alımlarınızı geri yükleyin.';

  @override
  String get modulesRestoreDone => 'Geri yükleme tamamlandı.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name, yüklü uygulamadan etkinleştirildi.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Lisans otomatik olarak bulunamadı. EastmarkHK e-Invoicing → Ayarlar\'ı açın, etkinleştirme kodunuzu kopyalayın ve \'Web kodu etkinleştir\'i seçin.';

  @override
  String get modulesRenewalNote =>
      'App Store üzerinden otomatik yenileme. Aboneliği Ayarlar → Apple ID → Abonelikler bölümünde yönetin.';

  @override
  String get modulesWebStoreNote =>
      'Veya eastmarkhk.com\'da abone olun ve e-postayla aldığınız kodla etkinleştirin.';

  @override
  String get modulesHaveEinvoicing => 'Zaten EastmarkHK e-Invoicing\'e sahibim';

  @override
  String get modulesTry7Days => '7 gün dene';

  @override
  String get modulesSubscribe => 'Abone ol';

  @override
  String get modulesRestore => 'Satın alımları geri yükle';

  @override
  String get modulesWebSubscription => 'eastmarkhk.com aboneliği';

  @override
  String get modulesActivateWebCode => 'Web kodu etkinleştir';

  @override
  String get modulesUseInCrm => 'CRM\'de kullan';

  @override
  String get modulesDontUseInCrm => 'CRM\'de kullanma';

  @override
  String get modulesBuyOnAppStore => 'App Store\'dan satın al';

  @override
  String get modulesStoreUnavailable =>
      'Bu derlemede App Store kullanılamıyor. Bir App Store derlemesi kullanın veya eastmarkhk.com aboneliğini etkinleştirin.';

  @override
  String get modulesCheckingPurchases =>
      'App Store ve eastmarkhk.com satın alımları kontrol ediliyor…';

  @override
  String get modulesCheckingAppStore =>
      'App Store satın alımları kontrol ediliyor…';

  @override
  String get modulesPerMonth => '/ ay';

  @override
  String get modulesActivationSubtitleAppStore =>
      'eastmarkhk.com\'da abone oldunuz mu? E-postayla aldığınız kodu yapıştırın. iPhone/iPad\'de ilk satın alma, etkinleştirmeden önce App Store veya site üzerinden yapılır.';

  @override
  String get modulesActivationSubtitleWeb =>
      'eastmarkhk.com\'da abone olun, ardından bu cihaza bağlı etkinleştirme kodunu yapıştırın.';

  @override
  String get modulesMachineId => 'Makine Kimliği';

  @override
  String get modulesCopy => 'Kopyala';

  @override
  String get modulesSubscriptionEmailLabel => 'Abonelik e-postası';

  @override
  String get modulesActivationCodeLabel => 'Etkinleştirme kodu';

  @override
  String get modulesActivationCodeHint =>
      'Satın alma sonrası aldığınız kodu yapıştırın';

  @override
  String get modulesActivate => 'Etkinleştir';

  @override
  String get modulesBuyOnWebsite => 'eastmarkhk.com\'da satın al';

  @override
  String get modulesRequestCodeByEmail => 'E-postayla kod iste';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name, eastmarkhk.com üzerinden etkinleştirildi';
  }

  @override
  String get modulesMachineIdCopied => 'Makine Kimliği kopyalandı';

  @override
  String get modulesEmailRequired => 'Abonelik e-postanızı girin';

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
  String get invPickClientTitle => 'Müşteri seç';

  @override
  String get invPickClientSearch => 'Ad, vergi numarası, ülkeye göre ara…';

  @override
  String get invPickClientEmpty => 'Eşleşen müşteri yok.';

  @override
  String get invPickClientButton => 'Müşteri seç';

  @override
  String get invClientRequired => 'Kaydetmeden önce bir müşteri seçin.';

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
  String get invSave => 'Kaydet';

  @override
  String get invSaving => 'Kaydediliyor…';

  @override
  String invEditQuote(String number) {
    return '$number teklifini düzenle';
  }

  @override
  String invEditInvoice(String number) {
    return '$number faturasını düzenle';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number kaydedildi.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get invEditDocument => 'Düzenle';

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
      'Teklifler ve faturalar — EastmarkHK e-Invoicing verileri (makbuzlar ve hatırlatmalar: bağımsız uygulama)';

  @override
  String get invOpenStandalone => 'e-Invoicing\'i aç';

  @override
  String get invLaunchStandalone => 'e-Invoicing\'i başlat';

  @override
  String get invRemoteConnectionTooltip => 'Uzaktan bağlantı';

  @override
  String invTabQuotes(int count) {
    return 'Teklifler ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Faturalar ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Teklif yok — kazanılan bir fırsattan veya yukarıdaki düğmeden bir tane oluşturun.';

  @override
  String get invEmptyInvoices => 'Fatura yok.';

  @override
  String get invEmptyCompanyDocs => 'Teklif veya fatura yok.';

  @override
  String get invQuotesSection => 'TEKLİFLER';

  @override
  String get invInvoicesSection => 'FATURALAR';

  @override
  String get invCompanyFooter =>
      'Belgeler EastmarkHK e-Invoicing tarafından yönetilir — gönderim, PDF, makbuzlar ve hatırlatmalar bağımsız uygulamada.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing uzaktan modda — bağlantı yapılandırılmadı.';

  @override
  String get invConfigure => 'Yapılandır';

  @override
  String get invAppNotDetected =>
      'e-Invoicing uygulaması algılanmadı — bu kayıttan teklif ve fatura oluşturmak için EastmarkHK e-Invoicing\'i yükleyin/başlatın.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing uzak depolama için yapılandırılmış. CRM\'yi aynı API\'ye bağlamak için buraya aynı kimlik bilgilerini girin — e-Invoicing → Ayarlar → Uzak depolama ile aynı değerler.';

  @override
  String get invLaunchOnceBody =>
      'Paylaşılan veritabanını başlatmak için EastmarkHK e-Invoicing\'i bir kez başlatın, ardından buraya geri dönün.';

  @override
  String get invAcquireAppStoreBody =>
      'Bu modül EastmarkHK e-Invoicing kullanır. App Store\'dan indirip abone olun, bir kez başlatın, ardından buraya geri dönün.';

  @override
  String get invAcquireWebBody =>
      'Bu modül EastmarkHK e-Invoicing kullanır. eastmarkhk.com üzerinden indirip abone olun, bir kez başlatın, ardından buraya geri dönün.';

  @override
  String get invConfigureRemote => 'Uzaktan bağlantıyı yapılandır';

  @override
  String get invViewOnAppStore => 'App Store\'da görüntüle';

  @override
  String get invViewOnWebsite => 'eastmarkhk.com\'da görüntüle';

  @override
  String get invRetry => 'Yeniden dene';

  @override
  String get invDocInvoice => 'Fatura';

  @override
  String get invDocQuote => 'Teklif';

  @override
  String get invDocClient => 'Müşteri';

  @override
  String get invDocStatus => 'Durum';

  @override
  String get invDocDate => 'Tarih';

  @override
  String get invOpenInStandalone => 'e-Invoicing\'de aç';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing açılamadı — yüklü olduğunu kontrol edin.';

  @override
  String get invCreateInvoiceFromQuote => 'Fatura oluştur';

  @override
  String get invCreatingInvoice => 'Fatura oluşturuluyor…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return '$number faturası tekliften oluşturuldu.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Bu teklif zaten faturalandırıldı.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Fatura oluşturulamadı: $error';
  }

  @override
  String get invLinkMenu => 'e-Invoicing bağlantısı';

  @override
  String get invLinkStatusLinked => 'e-Invoicing müşterisi bağlandı';

  @override
  String get invLinkStatusNone => 'Kayıtlı e-Invoicing bağlantısı yok';

  @override
  String get invUnlinkCustomer => 'e-Invoicing müşteri bağlantısını kaldır';

  @override
  String get invUnlinkConfirmTitle => 'Müşteri bağlantısı kaldırılsın mı?';

  @override
  String get invUnlinkConfirmBody =>
      'Bir sonraki teklif veya fatura, e-Invoicing\'de müşteriyi tekrar seçmenizi veya oluşturmanızı isteyecek.';

  @override
  String get invUnlinkDone => 'e-Invoicing bağlantısı kaldırıldı.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing bu derleme için henüz App Store\'da listelenmedi. eastmarkhk.com\'u kullanın veya zaten yüklü bir uygulamayı başlatın.';

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
      'Paylaşılan veritabanı: bu cihazı yeniden bağlamak için Ayarlar\'da senkronizasyon şifresini girin.';

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
  String get activityTaskCreated => 'Görev oluşturuldu';

  @override
  String get dictationOfflineTip =>
      'Çevrimdışı dikte — genelde sesiniz yerine gürültüyü (TV) alır. Windows Ayarları → Gizlilik → Konuşma içinde «Çevrimiçi konuşma tanıma»yı açın, gürültüyü azaltın ve yeniden deneyin.';

  @override
  String get dictationLanguageFallbackTip =>
      'Bu dil varyantı Windows’ta yüklü değil — yakın bir eşleşme kullanılıyor. İstediğiniz konuşma paketini Ayarlar → Saat ve dil → Konuşma bölümünden yükleyin.';

  @override
  String get dictationStarting => 'Dikte başlatılıyor…';

  @override
  String get invChooseLinePhotoTitle => 'Choose photo for the PDF';

  @override
  String get invChooseNewPhoto => 'Choose another file…';

  @override
  String get invNoPhoto => 'No photo';
}

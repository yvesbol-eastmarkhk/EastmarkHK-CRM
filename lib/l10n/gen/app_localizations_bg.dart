// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get commonCancel => 'Отказ';

  @override
  String get commonSave => 'Запази';

  @override
  String get commonDelete => 'Изтрий';

  @override
  String get commonEdit => 'Редактирай';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Потребителско име';

  @override
  String get commonDisplayNameLabel => 'Показвано име';

  @override
  String get commonPasswordLabel => 'Парола';

  @override
  String get commonConfirmPasswordLabel => 'Потвърди паролата';

  @override
  String get commonPasswordMismatch => 'Паролите не съвпадат';

  @override
  String get commonUsernameTaken => 'Това потребителско име вече е заето';

  @override
  String get commonChoosePassword => 'Изберете парола';

  @override
  String get commonRequiredFields =>
      'Името и потребителското име са задължителни';

  @override
  String get passwordFieldShow => 'Покажи';

  @override
  String get passwordFieldHide => 'Скрий';

  @override
  String loginWelcomeBack(String name) {
    return 'Добре дошли отново, $name';
  }

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginVerifying => 'Проверка…';

  @override
  String get loginUnlockTouchId => 'Отключване с Touch ID';

  @override
  String get loginUnlockWindowsHello => 'Déverrouiller avec Windows Hello';

  @override
  String get loginOr => 'или';

  @override
  String get loginRequiredFields => 'Изисква се потребителско име и парола';

  @override
  String get loginInvalidCredentials => 'Грешно потребителско име или парола';

  @override
  String get loginSubmit => 'Вход';

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
  String get bootstrapWelcome => 'Добре дошли';

  @override
  String get bootstrapSubtitle =>
      'Създайте администраторски акаунт, за да защитите вашия CRM.';

  @override
  String get bootstrapSubmit => 'Създаване на администраторски акаунт';

  @override
  String get commonAdd => 'Добавяне';

  @override
  String get commonCreate => 'Създаване';

  @override
  String get commonClose => 'Затваряне';

  @override
  String get commonNoName => '(без име)';

  @override
  String get commonNotesLabel => 'Бележки';

  @override
  String get commonEmailLabel => 'Имейл';

  @override
  String get commonPhoneLabel => 'Телефон';

  @override
  String get commonFirstNameLabel => 'Име';

  @override
  String get commonLastNameLabel => 'Фамилия';

  @override
  String get commonCompanyNameLabel => 'Име на фирмата';

  @override
  String messagingCannotOpen(String target) {
    return 'Не може да се отвори $target.';
  }

  @override
  String get messagingEmailAppLabel => 'приложението за имейл';

  @override
  String get messagingPhoneAppLabel => 'приложението за телефон';

  @override
  String messagingIncompleteId(String label) {
    return 'Непълен идентификатор за отваряне на $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Не може да се отвори $label — инсталирано ли е приложението?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat не предоставя публична връзка към конкретен контакт — приложението ще се отвори, но разговорът трябва да се избере ръчно.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk не предоставя публична връзка към конкретен контакт — приложението ще се отвори, но разговорът трябва да се избере ръчно.';

  @override
  String get messagingPhoneCallLabel => 'Телефонно обаждане';

  @override
  String get companyDeleteOpportunityConfirm =>
      'Изтриване на тази възможност за сделка?';

  @override
  String get companyDeleteContactConfirm => 'Изтриване на този контакт?';

  @override
  String get companyDeleteTaskConfirm => 'Изтриване на тази задача?';

  @override
  String get companyDeleteConfirmTitle => 'Изтриване на този клиент?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — контактите, възможностите за сделки, задачите и историята му ще бъдат изтрити заедно с него.';
  }

  @override
  String get companyNewNoteTitle => 'Нова бележка';

  @override
  String get companyNoteFieldLabel => 'Бележка (или я продиктувайте)';

  @override
  String get companyTabOverview => 'Общ преглед';

  @override
  String get companyTabActivity => 'Дейност';

  @override
  String get companyTabTasks => 'Задачи';

  @override
  String get companyTabDeals => 'Възможности за сделки';

  @override
  String get companyContactsTitle => 'Контакти';

  @override
  String get companyNoContacts => 'Няма контакти';

  @override
  String get companyNoActivity => 'Няма дейност — добавете бележка.';

  @override
  String get companyNoTasks => 'Няма задачи';

  @override
  String get companyNoDeals => 'Няма възможности за сделки';

  @override
  String get companyNoteButtonLabel => 'Бележка';

  @override
  String get companyNewClientTitle => 'Нов клиент';

  @override
  String get companyEditClientTitle => 'Редактиране на клиент';

  @override
  String get companyWebsiteLabel => 'Уебсайт';

  @override
  String get companyPeppolLabel => 'Peppol идентификатор';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Тагове (разделени със запетая)';

  @override
  String get companyNewContactTitle => 'Нов контакт';

  @override
  String get companyEditContactTitle => 'Редактиране на контакт';

  @override
  String get companyAppLabel => 'Приложение';

  @override
  String get companyIdentifierNumberLabel => 'Идентификатор / номер';

  @override
  String get companyOpenTooltip => 'Отвори';

  @override
  String get companyRemoveTooltip => 'Премахни';

  @override
  String get companyRoleFieldLabel => 'Роля (напр. Купувач)';

  @override
  String get companyMessagingTitle => 'Съобщения';

  @override
  String get companyNoMessagingHint =>
      'Не е добавен канал за съобщения — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Все още няма добавена информация за контакт.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSubtitle => 'Еднократна настройка на приложението.';

  @override
  String get settingsLanguagesTitle => 'Езици и валута';

  @override
  String get settingsAppLanguageLabel => 'Език на приложението';

  @override
  String get settingsDictationLanguageLabel => 'Език за диктовка';

  @override
  String get settingsCurrencyLabel => 'Валута';

  @override
  String get settingsFormatsHint =>
      'Сумите се показват като 1,234.56 (запетая = хиляди, точка = десетични), а датите — като дд.мм.гггг, независимо от езика на интерфейса.';

  @override
  String get settingsCompanyTitle => 'Фирма';

  @override
  String get settingsCompanySubtitle =>
      'Данни на фирмата, използваща тази CRM — използвани по-късно в заглавната част (white-label) и заглавията на PDF документи.';

  @override
  String get settingsSyncTitle => 'Синхронизация';

  @override
  String get settingsSyncSubtitle =>
      'По подразбиране всички данни остават локално (SQLite) на това устройство.';

  @override
  String get settingsSyncLocalTitle => 'Самостоятелен (само локално)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Никакви данни не се изпращат извън това устройство';

  @override
  String get settingsSyncRemoteTitle => 'Споделена база данни (отдалечена)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Синхронизира се със сървър PHP + SQLite (вж. server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Сървър';

  @override
  String get settingsAccountLabel => 'Акаунт';

  @override
  String get settingsSyncPasswordHint =>
      'Съхранено в защитения ключодържател на устройството — никога в базата данни.';

  @override
  String get settingsSyncNowButton => 'Синхронизирай сега';

  @override
  String get settingsSyncPollHint =>
      'Автоматично изтегляне на всеки 25 сек. във фонов режим; незабавно изпращане след всяка промяна (активен отдалечен режим). Без изтегляне по време на писане.';

  @override
  String get settingsSyncMissingFields => 'Изисква се сървър, акаунт и парола';

  @override
  String get settingsModulesTitle => 'Модули';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, скенер, синхронизация… — 7-дневен пробен период или активиране на лиценз.';

  @override
  String get settingsBrowseModules => 'Разглеждане на модули';

  @override
  String get settingsImportExportTitle => 'Импорт / експорт';

  @override
  String get settingsImportExportSubtitle =>
      'Клиенти, контакти и възможности за сделки като CSV; контакти от vCard.';

  @override
  String get settingsPipelineTitle => 'Фуния за продажби';

  @override
  String get settingsPipelineSubtitle =>
      'Персонализирайте етапите и техните надписи.';

  @override
  String get settingsConfigureStages => 'Конфигуриране на етапи';

  @override
  String get settingsBackupTitle => 'Локално резервно копие';

  @override
  String get settingsBackupSubtitle =>
      'Експортира копие на вашата SQLite база данни — полезно преди актуализация или за архивиране.';

  @override
  String get settingsExportDbButton => 'Експортиране на база данни (.db)';

  @override
  String get settingsBackupShareText => 'Резервно копие на EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Неуспешен експорт: $error';
  }

  @override
  String get settingsUsersTitle => 'Потребители';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Акаунти, роли и пароли — администратор и потребител.';

  @override
  String get settingsUsersSubtitleLocked => 'Само за администратори.';

  @override
  String get settingsManageUsersButton => 'Управление на потребители';

  @override
  String get settingsUsersLockedHint =>
      'Влезте с администраторски акаунт, за да видите или редактирате потребителите и техните пароли.';

  @override
  String get settingsSaveKeychainError =>
      'Настройките са запазени, но защитеният ключодържател не е наличен — паролата за синхронизация не можа да бъде запазена (рестартирайте приложението след пълно преизграждане).';

  @override
  String get settingsSaved => 'Настройките са запазени';

  @override
  String get settingsLogoutConfirmTitle => 'Изход от акаунта?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Ще трябва да въведете паролата си (или Touch ID), за да се върнете.';

  @override
  String get settingsLogoutButton => 'Изход';

  @override
  String get settingsLogoTitle => 'Лого на фирмата';

  @override
  String get settingsLogoSubtitle =>
      'Показва се в горната част на приложението и в банера.';

  @override
  String get settingsLogoEmpty => 'Няма лого — добавете лого на вашата фирма';

  @override
  String get settingsLogoChoose => 'Изберете изображение';

  @override
  String get settingsLogoChange => 'Смяна на логото';

  @override
  String get usersDeleteSelfError =>
      'Не можете да изтриете собствения си акаунт';

  @override
  String get usersDeleteConfirmTitle => 'Изтриване на този потребител?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) ще загуби достъп до CRM.';
  }

  @override
  String get usersTitle => 'Потребители';

  @override
  String get usersSubtitle => 'Акаунти, роли и пароли.';

  @override
  String get usersAddButton => 'Потребител';

  @override
  String get usersEmptyTitle => 'Няма потребители';

  @override
  String get usersEmptySubtitle =>
      'Създайте първия акаунт — той ще бъде администратор.';

  @override
  String get usersEmptyAction => 'Нов потребител';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (вие)';
  }

  @override
  String get usersNewTitle => 'Нов потребител';

  @override
  String get usersEditTitle => 'Редактиране на потребител';

  @override
  String get usersLoginIdLabel => 'Идентификатор за вход';

  @override
  String get usersRoleLabel => 'Роля';

  @override
  String get usersNewPasswordLabel =>
      'Нова парола (оставете празно, за да не се променя)';

  @override
  String get usersTouchIdTitle => 'Touch ID на това устройство';

  @override
  String get usersTouchIdSubtitle =>
      'Отключване без повторно въвеждане на паролата, само на това устройство.';

  @override
  String get roleAdministrator => 'Администратор';

  @override
  String get roleUser => 'Потребител';

  @override
  String get dashboardTitleEmbedded => 'Табло';

  @override
  String get dashboardTitle => 'Днес';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString действия за обработка',
      one: '$countString действие за обработка',
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
      other: '+$countString още — виж всички',
      one: '+$countString още — виж всички',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Всички търговски представители';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (аз)';
  }

  @override
  String get dashboardEmptyTitle => 'Вашият CRM е готов';

  @override
  String get dashboardEmptySubtitle =>
      'Добавете първия си клиент, импортирайте CSV файл или разгледайте предстоящите модули.';

  @override
  String get dashboardNothingScheduled =>
      'Нищо не е планирано — последващите ви действия ще се показват тук.';

  @override
  String get dashboardBucketOverdue => 'Просрочено';

  @override
  String get dashboardBucketToday => 'Днес';

  @override
  String get dashboardBucketWeek => 'Тази седмица';

  @override
  String get dashboardBucketLater => 'По-късно';

  @override
  String get dashboardContactedButton => 'Осъществен контакт';

  @override
  String get dashboardDoneButton => 'Готово';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Топ клиенти (отворена фуния)';

  @override
  String get dashboardPipelineByStage => 'Фуния по етап';

  @override
  String get dashboardNoOpportunitiesYet =>
      'Все още няма възможности за сделки';

  @override
  String get dashboardWonLostByMonth => 'Спечелени / изгубени по месец';

  @override
  String get dashboardNoClosuresYet =>
      'Все още няма регистрирани приключвания.';

  @override
  String get dashboardRecentActivity => 'Скорошна дейност';

  @override
  String get dashboardNoActivityYet => 'Все още няма дейност.';

  @override
  String get metricClients => 'Клиенти';

  @override
  String get metricOpportunities => 'Възможности за сделки';

  @override
  String get metricPipeline => 'Фуния за продажби';

  @override
  String get metricForecast => 'Прогноза';

  @override
  String get metricTasks => 'Задачи';

  @override
  String get metricOverdue => 'Просрочено';

  @override
  String get productTagline => 'Спестявайте време от първия ден.';

  @override
  String get placeholderDashboardHint =>
      'Общ преглед: фуния, последващи действия и скорошна дейност.';

  @override
  String get placeholderTodayTitle => 'Вашият ден';

  @override
  String get placeholderTodayHint =>
      'Изберете последващо действие вляво.\nКлиентът се отваря тук — без смяна на екрана.';

  @override
  String get placeholderClientsTitle => 'Карта на клиента';

  @override
  String get placeholderClientsHint =>
      'Изберете клиент от списъка\nили създайте нов с бутона +.';

  @override
  String get placeholderPipelineHint =>
      'Плъзнете карта между колоните.\nНатиснете, за да отворите картата на клиента.';

  @override
  String get placeholderTasksHint =>
      'Изберете задача, за да видите свързания клиент.';

  @override
  String get modulesSubtitleAppStore =>
      'Абонирайте се през App Store или активирайте абонамент, вече закупен на eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Безплатен пробен период, покупка на eastmarkhk.com — същият абонамент като приложението EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Активен — App Store';

  @override
  String get modulesStatusActiveWeb => 'Активен — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пробен — остават $countString дни',
      one: 'Пробен — остава $countString ден',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Активен';

  @override
  String get modulesStatusAvailable => 'Наличен';

  @override
  String get modulesBuyFailed =>
      'Не може да се започне покупката. Опитайте отново или възстановете покупките си.';

  @override
  String get modulesRestoreDone => 'Възстановяването е завършено.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name е активиран от инсталираното приложение.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Лицензът не е намерен автоматично. Отворете EastmarkHK e-Invoicing → Настройки, копирайте кода за активация и изберете „Активиране на уеб код“.';

  @override
  String get modulesRenewalNote =>
      'Автоматично подновяване чрез App Store. Управлявайте абонамента в Настройки → Apple ID → Абонаменти.';

  @override
  String get modulesWebStoreNote =>
      'Или се абонирайте на eastmarkhk.com и активирайте с кода, получен по имейл.';

  @override
  String get modulesHaveEinvoicing => 'Вече имам EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Пробвам 7 дни';

  @override
  String get modulesSubscribe => 'Абонирайте се';

  @override
  String get modulesRestore => 'Възстановяване на покупките';

  @override
  String get modulesWebSubscription => 'Абонамент eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Активиране на уеб код';

  @override
  String get modulesUseInCrm => 'Използване в CRM';

  @override
  String get modulesDontUseInCrm => 'Да не се използва в CRM';

  @override
  String get modulesBuyOnAppStore => 'Купи от App Store';

  @override
  String get modulesStoreUnavailable =>
      'App Store не е достъпен в тази версия. Използвайте версия за App Store или активирайте абонамент на eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Проверка на покупки от App Store и eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Проверка на покупки от App Store…';

  @override
  String get modulesPerMonth => '/ месец';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Абонирали сте се на eastmarkhk.com? Поставете кода, получен по имейл. На iPhone/iPad първоначалната покупка се прави през App Store или сайта преди активация.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Абонирайте се на eastmarkhk.com, след което поставете кода за активация, свързан с това устройство.';

  @override
  String get modulesMachineId => 'Идентификатор на устройството';

  @override
  String get modulesCopy => 'Копиране';

  @override
  String get modulesSubscriptionEmailLabel => 'Имейл за абонамента';

  @override
  String get modulesActivationCodeLabel => 'Код за активация';

  @override
  String get modulesActivationCodeHint =>
      'Поставете кода, получен след покупката';

  @override
  String get modulesActivate => 'Активиране';

  @override
  String get modulesBuyOnWebsite => 'Купуване на eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Заявка за код по имейл';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name е активиран чрез eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied =>
      'Идентификаторът на устройството е копиран';

  @override
  String get modulesEmailRequired => 'Въведете имейла си за абонамента';

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
  String get invPickClientTitle => 'Избор на клиент';

  @override
  String get invPickClientSearch => 'Търсене по име, данъчен номер, държава…';

  @override
  String get invPickClientEmpty => 'Няма съответстващ клиент.';

  @override
  String get invPickClientButton => 'Избор на клиент';

  @override
  String get invClientRequired => 'Изберете клиент преди запис.';

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
  String get invSave => 'Запази';

  @override
  String get invSaving => 'Записване…';

  @override
  String invEditQuote(String number) {
    return 'Редактиране на оферта $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Редактиране на фактура $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number записан(a).';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Записът не бе възможен: $error';
  }

  @override
  String get invEditDocument => 'Редактиране';

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
      'Оферти и фактури — данни от EastmarkHK e-Invoicing (разписки и напомняния: самостоятелно приложение)';

  @override
  String get invOpenStandalone => 'Отвори e-Invoicing';

  @override
  String get invLaunchStandalone => 'Стартирай e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Отдалечена връзка';

  @override
  String invTabQuotes(int count) {
    return 'Оферти ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Фактури ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Няма оферти — създайте от спечелена възможност или бутона по-горе.';

  @override
  String get invEmptyInvoices => 'Няма фактури.';

  @override
  String get invEmptyCompanyDocs => 'Няма оферти или фактури.';

  @override
  String get invQuotesSection => 'ОФЕРТИ';

  @override
  String get invInvoicesSection => 'ФАКТУРИ';

  @override
  String get invCompanyFooter =>
      'Документите се управляват от EastmarkHK e-Invoicing — изпращане, PDF, разписки и напомняния в самостоятелното приложение.';

  @override
  String get invRemoteNotConfigured =>
      'e-Invoicing е в отдалечен режим — връзката не е конфигурирана.';

  @override
  String get invConfigure => 'Конфигуриране';

  @override
  String get invAppNotDetected =>
      'Приложението e-Invoicing не е открито — инсталирайте/стартирайте EastmarkHK e-Invoicing, за да създавате оферти и фактури от този запис.';

  @override
  String get invRemoteSetupBody =>
      'EastmarkHK e-Invoicing е конфигурирано за отдалечено съхранение. Въведете същите данни тук, за да свържете CRM към същото API — същите стойности като в e-Invoicing → Настройки → Отдалечено съхранение.';

  @override
  String get invLaunchOnceBody =>
      'Стартирайте EastmarkHK e-Invoicing веднъж, за да инициализирате споделената база данни, след което се върнете тук.';

  @override
  String get invAcquireAppStoreBody =>
      'Този модул използва EastmarkHK e-Invoicing. Изтеглете и абонирайте се от App Store, стартирайте го веднъж, след което се върнете тук.';

  @override
  String get invAcquireWebBody =>
      'Този модул използва EastmarkHK e-Invoicing. Изтеглете и абонирайте се на eastmarkhk.com, стартирайте го веднъж, след което се върнете тук.';

  @override
  String get invConfigureRemote => 'Конфигуриране на отдалечена връзка';

  @override
  String get invViewOnAppStore => 'Виж в App Store';

  @override
  String get invViewOnWebsite => 'Виж на eastmarkhk.com';

  @override
  String get invRetry => 'Опитай отново';

  @override
  String get invDocInvoice => 'Фактура';

  @override
  String get invDocQuote => 'Оферта';

  @override
  String get invDocClient => 'Клиент';

  @override
  String get invDocStatus => 'Статус';

  @override
  String get invDocDate => 'Дата';

  @override
  String get invOpenInStandalone => 'Отвори в e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'e-Invoicing не можа да се отвори — проверете дали е инсталирано.';

  @override
  String get invCreateInvoiceFromQuote => 'Създай фактура';

  @override
  String get invCreatingInvoice => 'Създаване на фактура…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Фактура $number създадена от офертата.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Тази оферта вече е фактурирана.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Фактурата не можа да се създаде: $error';
  }

  @override
  String get invLinkMenu => 'Връзка с e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Клиент в e-Invoicing свързан';

  @override
  String get invLinkStatusNone => 'Няма запазена връзка с e-Invoicing';

  @override
  String get invUnlinkCustomer => 'Прекрати връзката с клиента в e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Прекратяване на връзката с клиента?';

  @override
  String get invUnlinkConfirmBody =>
      'Следващата оферта или фактура ще поиска отново избор или създаване на клиента в e-Invoicing.';

  @override
  String get invUnlinkDone => 'Връзката с e-Invoicing е прекратена.';

  @override
  String get invAppStoreUrlMissing =>
      'e-Invoicing все още не е листнато в App Store за тази версия. Използвайте eastmarkhk.com или стартирайте вече инсталирано приложение.';

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
      'Споделена база данни: въведете паролата за синхронизация в Настройки, за да свържете отново това устройство.';

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

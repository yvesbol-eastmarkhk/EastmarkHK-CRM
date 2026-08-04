// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonSave => 'Αποθήκευση';

  @override
  String get commonDelete => 'Διαγραφή';

  @override
  String get commonEdit => 'Επεξεργασία';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonUsernameLabel => 'Όνομα χρήστη';

  @override
  String get commonDisplayNameLabel => 'Εμφανιζόμενο όνομα';

  @override
  String get commonPasswordLabel => 'Κωδικός πρόσβασης';

  @override
  String get commonConfirmPasswordLabel => 'Επιβεβαίωση κωδικού πρόσβασης';

  @override
  String get commonPasswordMismatch => 'Οι κωδικοί πρόσβασης δεν ταιριάζουν';

  @override
  String get commonUsernameTaken => 'Αυτό το όνομα χρήστη χρησιμοποιείται ήδη';

  @override
  String get commonChoosePassword => 'Επιλέξτε έναν κωδικό πρόσβασης';

  @override
  String get commonRequiredFields =>
      'Το όνομα και το όνομα χρήστη είναι υποχρεωτικά';

  @override
  String get passwordFieldShow => 'Εμφάνιση';

  @override
  String get passwordFieldHide => 'Απόκρυψη';

  @override
  String loginWelcomeBack(String name) {
    return 'Καλώς ήρθατε ξανά, $name';
  }

  @override
  String get loginTitle => 'Σύνδεση';

  @override
  String get loginVerifying => 'Επαλήθευση…';

  @override
  String get loginUnlockTouchId => 'Ξεκλείδωμα με Touch ID';

  @override
  String get loginOr => 'ή';

  @override
  String get loginRequiredFields =>
      'Απαιτούνται όνομα χρήστη και κωδικός πρόσβασης';

  @override
  String get loginInvalidCredentials =>
      'Λανθασμένο όνομα χρήστη ή κωδικός πρόσβασης';

  @override
  String get loginSubmit => 'Σύνδεση';

  @override
  String get loginOtherAccount => 'Other account';

  @override
  String get loginUseSavedAccount => 'Back to saved account';

  @override
  String get bootstrapWelcome => 'Καλώς ήρθατε';

  @override
  String get bootstrapSubtitle =>
      'Δημιουργήστε τον λογαριασμό διαχειριστή για να προστατέψετε το CRM σας.';

  @override
  String get bootstrapSubmit => 'Δημιουργία λογαριασμού διαχειριστή';

  @override
  String get commonAdd => 'Προσθήκη';

  @override
  String get commonCreate => 'Δημιουργία';

  @override
  String get commonClose => 'Κλείσιμο';

  @override
  String get commonNoName => '(χωρίς όνομα)';

  @override
  String get commonNotesLabel => 'Σημειώσεις';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Τηλέφωνο';

  @override
  String get commonFirstNameLabel => 'Όνομα';

  @override
  String get commonLastNameLabel => 'Επώνυμο';

  @override
  String get commonCompanyNameLabel => 'Επωνυμία εταιρείας';

  @override
  String messagingCannotOpen(String target) {
    return 'Δεν είναι δυνατό το άνοιγμα του $target.';
  }

  @override
  String get messagingEmailAppLabel => 'την εφαρμογή email';

  @override
  String get messagingPhoneAppLabel => 'την εφαρμογή τηλεφώνου';

  @override
  String messagingIncompleteId(String label) {
    return 'Ελλιπές αναγνωριστικό για το άνοιγμα του $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Δεν είναι δυνατό το άνοιγμα του $label — είναι εγκατεστημένη η εφαρμογή;';
  }

  @override
  String get messagingWechatNote =>
      'Το WeChat δεν παρέχει δημόσιο σύνδεσμο σε συγκεκριμένη επαφή — η εφαρμογή θα ανοίξει, αλλά η συνομιλία πρέπει να επιλεγεί χειροκίνητα.';

  @override
  String get messagingKakaotalkNote =>
      'Το KakaoTalk δεν παρέχει δημόσιο σύνδεσμο σε συγκεκριμένη επαφή — η εφαρμογή θα ανοίξει, αλλά η συνομιλία πρέπει να επιλεγεί χειροκίνητα.';

  @override
  String get messagingPhoneCallLabel => 'Τηλεφωνική κλήση';

  @override
  String get companyDeleteOpportunityConfirm => 'Διαγραφή αυτής της ευκαιρίας;';

  @override
  String get companyDeleteContactConfirm => 'Διαγραφή αυτής της επαφής;';

  @override
  String get companyDeleteTaskConfirm => 'Διαγραφή αυτής της εργασίας;';

  @override
  String get companyDeleteConfirmTitle => 'Διαγραφή αυτού του πελάτη;';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — οι επαφές, οι ευκαιρίες, οι εργασίες και το ιστορικό του θα διαγραφούν μαζί του.';
  }

  @override
  String get companyNewNoteTitle => 'Νέα σημείωση';

  @override
  String get companyNoteFieldLabel => 'Σημείωση (ή υπαγορεύστε την)';

  @override
  String get companyTabOverview => 'Επισκόπηση';

  @override
  String get companyTabActivity => 'Δραστηριότητα';

  @override
  String get companyTabTasks => 'Εργασίες';

  @override
  String get companyTabDeals => 'Ευκαιρίες';

  @override
  String get companyContactsTitle => 'Επαφές';

  @override
  String get companyNoContacts => 'Καμία επαφή';

  @override
  String get companyNoActivity =>
      'Καμία δραστηριότητα — προσθέστε μια σημείωση.';

  @override
  String get companyNoTasks => 'Καμία εργασία';

  @override
  String get companyNoDeals => 'Καμία ευκαιρία';

  @override
  String get companyNoteButtonLabel => 'Σημείωση';

  @override
  String get companyNewClientTitle => 'Νέος πελάτης';

  @override
  String get companyEditClientTitle => 'Επεξεργασία πελάτη';

  @override
  String get companyWebsiteLabel => 'Ιστότοπος';

  @override
  String get companyPeppolLabel => 'Αναγνωριστικό Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol: $value';
  }

  @override
  String get companyTagsLabel => 'Ετικέτες (χωρισμένες με κόμμα)';

  @override
  String get companyNewContactTitle => 'Νέα επαφή';

  @override
  String get companyEditContactTitle => 'Επεξεργασία επαφής';

  @override
  String get companyAppLabel => 'Εφαρμογή';

  @override
  String get companyIdentifierNumberLabel => 'Αναγνωριστικό / αριθμός';

  @override
  String get companyOpenTooltip => 'Άνοιγμα';

  @override
  String get companyRemoveTooltip => 'Αφαίρεση';

  @override
  String get companyRoleFieldLabel => 'Ρόλος (π.χ. Αγοραστής)';

  @override
  String get companyMessagingTitle => 'Μηνύματα';

  @override
  String get companyNoMessagingHint =>
      'Δεν προστέθηκε κανάλι μηνυμάτων — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Δεν έχουν προστεθεί ακόμα στοιχεία επικοινωνίας.';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get settingsSubtitle => 'Εφάπαξ διαμόρφωση της εφαρμογής.';

  @override
  String get settingsLanguagesTitle => 'Γλώσσες & νόμισμα';

  @override
  String get settingsAppLanguageLabel => 'Γλώσσα εφαρμογής';

  @override
  String get settingsDictationLanguageLabel => 'Γλώσσα υπαγόρευσης';

  @override
  String get settingsCurrencyLabel => 'Νόμισμα';

  @override
  String get settingsFormatsHint =>
      'Τα ποσά εμφανίζονται ως 1.234,56 (τελεία = χιλιάδες, κόμμα = δεκαδικά) και οι ημερομηνίες ως ηη/μμ/εεεε, ανεξάρτητα από τη γλώσσα διεπαφής.';

  @override
  String get settingsCompanyTitle => 'Εταιρεία';

  @override
  String get settingsCompanySubtitle =>
      'Στοιχεία της εταιρείας που χρησιμοποιεί αυτό το CRM — χρησιμοποιούνται αργότερα στην κεφαλίδα (white-label) και στις κεφαλίδες εγγράφων PDF.';

  @override
  String get settingsSyncTitle => 'Συγχρονισμός';

  @override
  String get settingsSyncSubtitle =>
      'Από προεπιλογή, όλα τα δεδομένα παραμένουν τοπικά (SQLite) σε αυτή τη συσκευή.';

  @override
  String get settingsSyncLocalTitle => 'Αυτόνομο (μόνο τοπικά)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Δεν αποστέλλονται δεδομένα εκτός αυτής της συσκευής';

  @override
  String get settingsSyncRemoteTitle =>
      'Κοινόχρηστη βάση δεδομένων (απομακρυσμένη)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'Συγχρονίζεται με διακομιστή PHP + SQLite (βλ. server/crm-sync/)';

  @override
  String get settingsServerLabel => 'Διακομιστής';

  @override
  String get settingsAccountLabel => 'Λογαριασμός';

  @override
  String get settingsSyncPasswordHint =>
      'Αποθηκεύεται στην ασφαλή κλειδοθήκη της συσκευής — ποτέ στη βάση δεδομένων.';

  @override
  String get settingsSyncNowButton => 'Συγχρονισμός τώρα';

  @override
  String get settingsSyncPollHint =>
      'Αυτόματη λήψη κάθε 25 δευτ. στο παρασκήνιο· άμεση αποστολή μετά από κάθε αλλαγή (ενεργή απομακρυσμένη λειτουργία). Καμία λήψη κατά την πληκτρολόγηση.';

  @override
  String get settingsSyncMissingFields =>
      'Απαιτούνται διακομιστής, λογαριασμός και κωδικός πρόσβασης';

  @override
  String get settingsModulesTitle => 'Ενότητες';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Σαρωτής, Συγχρονισμός… — δοκιμή 7 ημερών ή ενεργοποίηση άδειας.';

  @override
  String get settingsBrowseModules => 'Περιήγηση στις ενότητες';

  @override
  String get settingsImportExportTitle => 'Εισαγωγή / εξαγωγή';

  @override
  String get settingsImportExportSubtitle =>
      'Πελάτες, επαφές και ευκαιρίες ως CSV· επαφές από vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Προσαρμόστε τα στάδια και τις ετικέτες τους.';

  @override
  String get settingsConfigureStages => 'Διαμόρφωση σταδίων';

  @override
  String get settingsBackupTitle => 'Τοπικό αντίγραφο ασφαλείας';

  @override
  String get settingsBackupSubtitle =>
      'Εξάγει ένα αντίγραφο της βάσης δεδομένων SQLite — χρήσιμο πριν από μια ενημέρωση ή για αρχειοθέτηση.';

  @override
  String get settingsExportDbButton => 'Εξαγωγή βάσης δεδομένων (.db)';

  @override
  String get settingsBackupShareText => 'Αντίγραφο ασφαλείας EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Η εξαγωγή απέτυχε: $error';
  }

  @override
  String get settingsUsersTitle => 'Χρήστες';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Λογαριασμοί, ρόλοι και κωδικοί πρόσβασης — διαχειριστής και χρήστης.';

  @override
  String get settingsUsersSubtitleLocked => 'Μόνο για διαχειριστές.';

  @override
  String get settingsManageUsersButton => 'Διαχείριση χρηστών';

  @override
  String get settingsUsersLockedHint =>
      'Συνδεθείτε με λογαριασμό διαχειριστή για να δείτε ή να επεξεργαστείτε τους χρήστες και τους κωδικούς πρόσβασής τους.';

  @override
  String get settingsSaveKeychainError =>
      'Οι ρυθμίσεις αποθηκεύτηκαν, αλλά η ασφαλής κλειδοθήκη δεν είναι διαθέσιμη — ο κωδικός πρόσβασης συγχρονισμού δεν αποθηκεύτηκε (επανεκκινήστε την εφαρμογή μετά από πλήρη επανακατασκευή).';

  @override
  String get settingsSaved => 'Οι ρυθμίσεις αποθηκεύτηκαν';

  @override
  String get settingsLogoutConfirmTitle => 'Αποσύνδεση;';

  @override
  String get settingsLogoutConfirmDetail =>
      'Θα χρειαστεί να εισαγάγετε τον κωδικό πρόσβασής σας (ή Touch ID) για να επιστρέψετε.';

  @override
  String get settingsLogoutButton => 'Αποσύνδεση';

  @override
  String get settingsLogoTitle => 'Λογότυπο εταιρείας';

  @override
  String get settingsLogoSubtitle =>
      'Εμφανίζεται στο επάνω μέρος της εφαρμογής και στο banner.';

  @override
  String get settingsLogoEmpty =>
      'Χωρίς λογότυπο — προσθέστε το λογότυπο της εταιρείας σας';

  @override
  String get settingsLogoChoose => 'Επιλογή εικόνας';

  @override
  String get settingsLogoChange => 'Αλλαγή λογότυπου';

  @override
  String get usersDeleteSelfError =>
      'Δεν μπορείτε να διαγράψετε τον δικό σας λογαριασμό';

  @override
  String get usersDeleteConfirmTitle => 'Διαγραφή αυτού του χρήστη;';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return 'Ο/Η $displayName ($username) θα χάσει την πρόσβαση στο CRM.';
  }

  @override
  String get usersTitle => 'Χρήστες';

  @override
  String get usersSubtitle => 'Λογαριασμοί, ρόλοι και κωδικοί πρόσβασης.';

  @override
  String get usersAddButton => 'Χρήστης';

  @override
  String get usersEmptyTitle => 'Κανένας χρήστης';

  @override
  String get usersEmptySubtitle =>
      'Δημιουργήστε τον πρώτο λογαριασμό — θα είναι διαχειριστής.';

  @override
  String get usersEmptyAction => 'Νέος χρήστης';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (εσείς)';
  }

  @override
  String get usersNewTitle => 'Νέος χρήστης';

  @override
  String get usersEditTitle => 'Επεξεργασία χρήστη';

  @override
  String get usersLoginIdLabel => 'Αναγνωριστικό σύνδεσης';

  @override
  String get usersRoleLabel => 'Ρόλος';

  @override
  String get usersNewPasswordLabel =>
      'Νέος κωδικός πρόσβασης (αφήστε κενό για να μην αλλάξει)';

  @override
  String get usersTouchIdTitle => 'Touch ID σε αυτή τη συσκευή';

  @override
  String get usersTouchIdSubtitle =>
      'Ξεκλείδωμα χωρίς επανεισαγωγή του κωδικού πρόσβασης, μόνο σε αυτή τη συσκευή.';

  @override
  String get roleAdministrator => 'Διαχειριστής';

  @override
  String get roleUser => 'Χρήστης';

  @override
  String get dashboardTitleEmbedded => 'Πίνακας ελέγχου';

  @override
  String get dashboardTitle => 'Σήμερα';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ενέργειες προς επεξεργασία',
      one: '$countString ενέργεια προς επεξεργασία',
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
      other: '+$countString ακόμα — προβολή όλων',
      one: '+$countString ακόμα — προβολή όλων',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Όλοι οι πωλητές';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (εγώ)';
  }

  @override
  String get dashboardEmptyTitle => 'Το CRM σας είναι έτοιμο';

  @override
  String get dashboardEmptySubtitle =>
      'Προσθέστε τον πρώτο σας πελάτη, εισαγάγετε ένα αρχείο CSV ή εξερευνήστε τις επερχόμενες ενότητες.';

  @override
  String get dashboardNothingScheduled =>
      'Τίποτα προγραμματισμένο — οι παρακολουθήσεις σας θα εμφανίζονται εδώ.';

  @override
  String get dashboardBucketOverdue => 'Εκπρόθεσμο';

  @override
  String get dashboardBucketToday => 'Σήμερα';

  @override
  String get dashboardBucketWeek => 'Αυτή την εβδομάδα';

  @override
  String get dashboardBucketLater => 'Αργότερα';

  @override
  String get dashboardContactedButton => 'Επικοινωνία έγινε';

  @override
  String get dashboardDoneButton => 'Ολοκληρώθηκε';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Κορυφαίοι πελάτες (ανοιχτό pipeline)';

  @override
  String get dashboardPipelineByStage => 'Pipeline ανά στάδιο';

  @override
  String get dashboardNoOpportunitiesYet => 'Δεν υπάρχουν ακόμα ευκαιρίες';

  @override
  String get dashboardWonLostByMonth => 'Κερδισμένα / χαμένα ανά μήνα';

  @override
  String get dashboardNoClosuresYet =>
      'Δεν έχουν καταγραφεί ακόμα ολοκληρώσεις.';

  @override
  String get dashboardRecentActivity => 'Πρόσφατη δραστηριότητα';

  @override
  String get dashboardNoActivityYet => 'Καμία δραστηριότητα ακόμα.';

  @override
  String get metricClients => 'Πελάτες';

  @override
  String get metricOpportunities => 'Ευκαιρίες';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'Πρόβλεψη';

  @override
  String get metricTasks => 'Εργασίες';

  @override
  String get metricOverdue => 'Εκπρόθεσμο';

  @override
  String get productTagline => 'Εξοικονομήστε χρόνο από την πρώτη ημέρα.';

  @override
  String get placeholderDashboardHint =>
      'Επισκόπηση: pipeline, παρακολουθήσεις και πρόσφατη δραστηριότητα.';

  @override
  String get placeholderTodayTitle => 'Η ημέρα σας';

  @override
  String get placeholderTodayHint =>
      'Επιλέξτε μια παρακολούθηση στα αριστερά.\nΟ πελάτης ανοίγει εδώ — χωρίς αλλαγή οθόνης.';

  @override
  String get placeholderClientsTitle => 'Κάρτα πελάτη';

  @override
  String get placeholderClientsHint =>
      'Επιλέξτε έναν πελάτη από τη λίστα\nή δημιουργήστε έναν με το κουμπί +.';

  @override
  String get placeholderPipelineHint =>
      'Σύρετε μια κάρτα ανάμεσα σε στήλες.\nΚάντε κλικ για να ανοίξετε την κάρτα πελάτη.';

  @override
  String get placeholderTasksHint =>
      'Επιλέξτε μια εργασία για να δείτε τον σχετικό πελάτη.';

  @override
  String get modulesSubtitleAppStore =>
      'Εγγραφείτε μέσω App Store ή ενεργοποιήστε μια συνδρομή που ήδη αγοράσατε στο eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Δωρεάν δοκιμή, αγορά στο eastmarkhk.com — ίδια συνδρομή με την εφαρμογή EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Ενεργό — App Store';

  @override
  String get modulesStatusActiveWeb => 'Ενεργό — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Δοκιμή — απομένουν $countString ημέρες',
      one: 'Δοκιμή — απομένει $countString ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Ενεργό';

  @override
  String get modulesStatusAvailable => 'Διαθέσιμο';

  @override
  String get modulesBuyFailed =>
      'Δεν ήταν δυνατή η έναρξη της αγοράς. Δοκιμάστε ξανά ή επαναφέρετε τις αγορές σας.';

  @override
  String get modulesRestoreDone => 'Η επαναφορά ολοκληρώθηκε.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return 'Το $name ενεργοποιήθηκε από την εγκατεστημένη εφαρμογή.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Δεν βρέθηκε άδεια αυτόματα. Ανοίξτε το EastmarkHK e-Invoicing → Ρυθμίσεις, αντιγράψτε τον κωδικό ενεργοποίησης και επιλέξτε «Ενεργοποίηση κωδικού ιστού».';

  @override
  String get modulesRenewalNote =>
      'Αυτόματη ανανέωση μέσω App Store. Διαχειριστείτε τη συνδρομή στις Ρυθμίσεις → Apple ID → Συνδρομές.';

  @override
  String get modulesWebStoreNote =>
      'Ή εγγραφείτε στο eastmarkhk.com και ενεργοποιήστε με τον κωδικό που λάβατε μέσω email.';

  @override
  String get modulesHaveEinvoicing => 'Έχω ήδη το EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Δοκιμή 7 ημερών';

  @override
  String get modulesSubscribe => 'Εγγραφή';

  @override
  String get modulesRestore => 'Επαναφορά αγορών';

  @override
  String get modulesWebSubscription => 'Συνδρομή eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Ενεργοποίηση κωδικού ιστού';

  @override
  String get modulesUseInCrm => 'Χρήση στο CRM';

  @override
  String get modulesDontUseInCrm => 'Να μη χρησιμοποιείται στο CRM';

  @override
  String get modulesBuyOnAppStore => 'Αγορά από το App Store';

  @override
  String get modulesStoreUnavailable =>
      'Το App Store δεν είναι διαθέσιμο σε αυτήν την έκδοση. Χρησιμοποιήστε έκδοση App Store ή ενεργοποιήστε συνδρομή eastmarkhk.com.';

  @override
  String get modulesCheckingPurchases =>
      'Έλεγχος αγορών App Store και eastmarkhk.com…';

  @override
  String get modulesCheckingAppStore => 'Έλεγχος αγορών App Store…';

  @override
  String get modulesPerMonth => '/ μήνα';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Εγγραφήκατε στο eastmarkhk.com; Επικολλήστε τον κωδικό που λάβατε μέσω email. Σε iPhone/iPad, η αρχική αγορά γίνεται μέσω App Store ή του ιστότοπου πριν την ενεργοποίηση.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Εγγραφείτε στο eastmarkhk.com και επικολλήστε τον κωδικό ενεργοποίησης που συνδέεται με αυτή τη συσκευή.';

  @override
  String get modulesMachineId => 'Αναγνωριστικό συσκευής';

  @override
  String get modulesCopy => 'Αντιγραφή';

  @override
  String get modulesSubscriptionEmailLabel => 'Email συνδρομής';

  @override
  String get modulesActivationCodeLabel => 'Κωδικός ενεργοποίησης';

  @override
  String get modulesActivationCodeHint =>
      'Επικολλήστε τον κωδικό που λάβατε μετά την αγορά';

  @override
  String get modulesActivate => 'Ενεργοποίηση';

  @override
  String get modulesBuyOnWebsite => 'Αγορά στο eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Αίτηση κωδικού μέσω email';

  @override
  String modulesActivatedViaWebsite(String name) {
    return 'Το $name ενεργοποιήθηκε μέσω eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'Το αναγνωριστικό συσκευής αντιγράφηκε';

  @override
  String get modulesEmailRequired => 'Εισαγάγετε το email της συνδρομής σας';

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
  String get invPickClientTitle => 'Επιλογή πελάτη';

  @override
  String get invPickClientSearch => 'Αναζήτηση με όνομα, ΑΦΜ, χώρα…';

  @override
  String get invPickClientEmpty => 'Δεν βρέθηκε αντίστοιχος πελάτης.';

  @override
  String get invPickClientButton => 'Επιλογή πελάτη';

  @override
  String get invClientRequired => 'Επιλέξτε πελάτη πριν την αποθήκευση.';

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
  String get invSave => 'Αποθήκευση';

  @override
  String get invSaving => 'Αποθήκευση…';

  @override
  String invEditQuote(String number) {
    return 'Επεξεργασία προσφοράς $number';
  }

  @override
  String invEditInvoice(String number) {
    return 'Επεξεργασία τιμολογίου $number';
  }

  @override
  String invDocumentSaved(String number) {
    return '$number αποθηκεύτηκε.';
  }

  @override
  String invDocumentSaveFailed(String error) {
    return 'Δεν ήταν δυνατή η αποθήκευση: $error';
  }

  @override
  String get invEditDocument => 'Επεξεργασία';

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
      'Προσφορές και τιμολόγια — δεδομένα EastmarkHK e-Invoicing (αποδείξεις και υπενθυμίσεις: αυτόνομη εφαρμογή)';

  @override
  String get invOpenStandalone => 'Άνοιγμα e-Invoicing';

  @override
  String get invLaunchStandalone => 'Εκκίνηση e-Invoicing';

  @override
  String get invRemoteConnectionTooltip => 'Απομακρυσμένη σύνδεση';

  @override
  String invTabQuotes(int count) {
    return 'Προσφορές ($count)';
  }

  @override
  String invTabInvoices(int count) {
    return 'Τιμολόγια ($count)';
  }

  @override
  String get invEmptyQuotes =>
      'Καμία προσφορά — δημιουργήστε μία από μια κερδισμένη ευκαιρία ή το παραπάνω κουμπί.';

  @override
  String get invEmptyInvoices => 'Κανένα τιμολόγιο.';

  @override
  String get invEmptyCompanyDocs => 'Καμία προσφορά ή τιμολόγιο.';

  @override
  String get invQuotesSection => 'ΠΡΟΣΦΟΡΕΣ';

  @override
  String get invInvoicesSection => 'ΤΙΜΟΛΟΓΙΑ';

  @override
  String get invCompanyFooter =>
      'Τα έγγραφα διαχειρίζονται από το EastmarkHK e-Invoicing — αποστολή, PDF, αποδείξεις και υπενθυμίσεις στην αυτόνομη εφαρμογή.';

  @override
  String get invRemoteNotConfigured =>
      'Το e-Invoicing βρίσκεται σε απομακρυσμένη λειτουργία — η σύνδεση δεν έχει ρυθμιστεί.';

  @override
  String get invConfigure => 'Ρύθμιση';

  @override
  String get invAppNotDetected =>
      'Δεν εντοπίστηκε η εφαρμογή e-Invoicing — εγκαταστήστε/εκκινήστε το EastmarkHK e-Invoicing για να δημιουργήσετε προσφορές και τιμολόγια από αυτήν την εγγραφή.';

  @override
  String get invRemoteSetupBody =>
      'Το EastmarkHK e-Invoicing έχει ρυθμιστεί για απομακρυσμένη αποθήκευση. Εισαγάγετε εδώ τα ίδια διαπιστευτήρια για να συνδέσετε το CRM στο ίδιο API — ίδιες τιμές όπως στο e-Invoicing → Ρυθμίσεις → Απομακρυσμένη αποθήκευση.';

  @override
  String get invLaunchOnceBody =>
      'Εκκινήστε το EastmarkHK e-Invoicing μία φορά για να αρχικοποιηθεί η κοινόχρηστη βάση δεδομένων και μετά επιστρέψτε εδώ.';

  @override
  String get invAcquireAppStoreBody =>
      'Αυτή η ενότητα χρησιμοποιεί το EastmarkHK e-Invoicing. Κατεβάστε το και εγγραφείτε συνδρομητής από το App Store, εκκινήστε το μία φορά και επιστρέψτε εδώ.';

  @override
  String get invAcquireWebBody =>
      'Αυτή η ενότητα χρησιμοποιεί το EastmarkHK e-Invoicing. Κατεβάστε το και εγγραφείτε συνδρομητής στο eastmarkhk.com, εκκινήστε το μία φορά και επιστρέψτε εδώ.';

  @override
  String get invConfigureRemote => 'Ρύθμιση απομακρυσμένης σύνδεσης';

  @override
  String get invViewOnAppStore => 'Προβολή στο App Store';

  @override
  String get invViewOnWebsite => 'Προβολή στο eastmarkhk.com';

  @override
  String get invRetry => 'Επανάληψη';

  @override
  String get invDocInvoice => 'Τιμολόγιο';

  @override
  String get invDocQuote => 'Προσφορά';

  @override
  String get invDocClient => 'Πελάτης';

  @override
  String get invDocStatus => 'Κατάσταση';

  @override
  String get invDocDate => 'Ημερομηνία';

  @override
  String get invOpenInStandalone => 'Άνοιγμα στο e-Invoicing';

  @override
  String get invOpenStandaloneFailed =>
      'Δεν ήταν δυνατό το άνοιγμα του e-Invoicing — βεβαιωθείτε ότι είναι εγκατεστημένο.';

  @override
  String get invCreateInvoiceFromQuote => 'Δημιουργία τιμολογίου';

  @override
  String get invCreatingInvoice => 'Δημιουργία τιμολογίου…';

  @override
  String invInvoiceCreatedFromQuote(String number) {
    return 'Το τιμολόγιο $number δημιουργήθηκε από την προσφορά.';
  }

  @override
  String get invQuoteAlreadyInvoiced => 'Αυτή η προσφορά έχει ήδη τιμολογηθεί.';

  @override
  String invCreateInvoiceFailed(String error) {
    return 'Δεν ήταν δυνατή η δημιουργία του τιμολογίου: $error';
  }

  @override
  String get invLinkMenu => 'Σύνδεση e-Invoicing';

  @override
  String get invLinkStatusLinked => 'Ο πελάτης e-Invoicing είναι συνδεδεμένος';

  @override
  String get invLinkStatusNone =>
      'Δεν υπάρχει αποθηκευμένη σύνδεση e-Invoicing';

  @override
  String get invUnlinkCustomer => 'Αποσύνδεση πελάτη e-Invoicing';

  @override
  String get invUnlinkConfirmTitle => 'Αποσύνδεση πελάτη;';

  @override
  String get invUnlinkConfirmBody =>
      'Η επόμενη προσφορά ή τιμολόγιο θα ζητήσει ξανά να επιλέξετε ή να δημιουργήσετε τον πελάτη στο e-Invoicing.';

  @override
  String get invUnlinkDone => 'Η σύνδεση e-Invoicing αφαιρέθηκε.';

  @override
  String get invAppStoreUrlMissing =>
      'Το e-Invoicing δεν είναι ακόμη καταχωρημένο στο App Store για αυτήν την έκδοση. Χρησιμοποιήστε το eastmarkhk.com ή εκκινήστε μια ήδη εγκατεστημένη εφαρμογή.';

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
      'Κοινόχρηστη βάση δεδομένων: εισαγάγετε τον κωδικό συγχρονισμού στις Ρυθμίσεις για να επανασυνδέσετε αυτήν τη συσκευή.';

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
  String get activityTaskCreated => 'Η εργασία δημιουργήθηκε';

  @override
  String get dictationOfflineTip =>
      'Η υπαγόρευση εκτός σύνδεσης συχνά συλλαμβάνει θόρυβο (TV) αντί της φωνής σας. Ενεργοποιήστε την «Αναγνώριση ομιλίας μέσω Διαδικτύου» στις Ρυθμίσεις Windows → Απόρρητο → Ομιλία, μειώστε τον θόρυβο και δοκιμάστε ξανά.';

  @override
  String get dictationLanguageFallbackTip =>
      'Αυτή η παραλλαγή γλώσσας δεν είναι εγκατεστημένη στα Windows — χρησιμοποιείται μια κοντινή. Εγκαταστήστε το επιθυμητό πακέτο ομιλίας στις Ρυθμίσεις → Ώρα και γλώσσα → Ομιλία.';

  @override
  String get dictationStarting => 'Έναρξη υπαγόρευσης…';
}

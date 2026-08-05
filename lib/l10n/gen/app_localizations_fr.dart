// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonSeeAll => 'Tout voir';

  @override
  String get commonUsernameLabel => 'Identifiant';

  @override
  String get commonDisplayNameLabel => 'Nom affiché';

  @override
  String get commonPasswordLabel => 'Mot de passe';

  @override
  String get commonConfirmPasswordLabel => 'Confirmer le mot de passe';

  @override
  String get commonPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get commonUsernameTaken => 'Cet identifiant est déjà utilisé';

  @override
  String get commonChoosePassword => 'Choisissez un mot de passe';

  @override
  String get commonRequiredFields => 'Nom et identifiant sont obligatoires';

  @override
  String get passwordFieldShow => 'Afficher';

  @override
  String get passwordFieldHide => 'Masquer';

  @override
  String loginWelcomeBack(String name) {
    return 'Bon retour, $name';
  }

  @override
  String get loginTitle => 'Connexion';

  @override
  String get loginVerifying => 'Vérification…';

  @override
  String get loginUnlockTouchId => 'Déverrouiller avec Touch ID';

  @override
  String get loginOr => 'ou';

  @override
  String get loginRequiredFields => 'Identifiant et mot de passe requis';

  @override
  String get loginInvalidCredentials => 'Identifiant ou mot de passe incorrect';

  @override
  String get loginSubmit => 'Se connecter';

  @override
  String get loginOtherAccount => 'Autre compte';

  @override
  String get loginUseSavedAccount => 'Revenir au compte mémorisé';

  @override
  String get bootstrapWelcome => 'Bienvenue';

  @override
  String get bootstrapSubtitle =>
      'Créez le compte administrateur pour sécuriser votre CRM.';

  @override
  String get bootstrapSubmit => 'Créer le compte administrateur';

  @override
  String get commonAdd => 'Ajouter';

  @override
  String get commonCreate => 'Créer';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonNoName => '(sans nom)';

  @override
  String get commonNotesLabel => 'Notes';

  @override
  String get commonEmailLabel => 'Email';

  @override
  String get commonPhoneLabel => 'Téléphone';

  @override
  String get commonFirstNameLabel => 'Prénom';

  @override
  String get commonLastNameLabel => 'Nom';

  @override
  String get commonCompanyNameLabel => 'Nom de la société';

  @override
  String messagingCannotOpen(String target) {
    return 'Impossible d\'ouvrir $target.';
  }

  @override
  String get messagingEmailAppLabel => 'la messagerie email';

  @override
  String get messagingPhoneAppLabel => 'l\'appli téléphone';

  @override
  String messagingIncompleteId(String label) {
    return 'Identifiant incomplet pour ouvrir $label.';
  }

  @override
  String messagingCannotOpenApp(String label) {
    return 'Impossible d\'ouvrir $label — l\'appli est-elle installée ?';
  }

  @override
  String get messagingWechatNote =>
      'WeChat n\'expose pas de lien public vers un contact précis — l\'appli s\'ouvre, la conversation reste à sélectionner à la main.';

  @override
  String get messagingKakaotalkNote =>
      'KakaoTalk n\'expose pas de lien public vers un contact précis — l\'appli s\'ouvre, la conversation reste à sélectionner à la main.';

  @override
  String get messagingPhoneCallLabel => 'Appel téléphonique';

  @override
  String get companyDeleteOpportunityConfirm => 'Supprimer cette opportunité ?';

  @override
  String get companyDeleteContactConfirm => 'Supprimer ce contact ?';

  @override
  String get companyDeleteTaskConfirm => 'Supprimer cette tâche ?';

  @override
  String get companyDeleteConfirmTitle => 'Supprimer ce client ?';

  @override
  String companyDeleteConfirmDetail(String name) {
    return '$name — ses contacts, opportunités, tâches et son historique seront supprimés avec lui.';
  }

  @override
  String get companyNewNoteTitle => 'Nouvelle note';

  @override
  String get companyNoteFieldLabel => 'Note (ou dictez-la)';

  @override
  String get companyTabOverview => 'Aperçu';

  @override
  String get companyTabActivity => 'Activité';

  @override
  String get companyTabTasks => 'Tâches';

  @override
  String get companyTabDeals => 'Opportunités';

  @override
  String get companyContactsTitle => 'Contacts';

  @override
  String get companyNoContacts => 'Aucun contact';

  @override
  String get companyNoActivity => 'Aucune activité — ajoutez une note.';

  @override
  String get companyNoTasks => 'Aucune tâche';

  @override
  String get companyNoDeals => 'Aucune opportunité';

  @override
  String get companyNoteButtonLabel => 'Note';

  @override
  String get companyNewClientTitle => 'Nouveau client';

  @override
  String get companyEditClientTitle => 'Modifier le client';

  @override
  String get companyWebsiteLabel => 'Site web';

  @override
  String get companyPeppolLabel => 'Identifiant Peppol';

  @override
  String companyPeppolPrefix(String value) {
    return 'Peppol : $value';
  }

  @override
  String get companyTagsLabel => 'Tags (séparés par des virgules)';

  @override
  String get companyNewContactTitle => 'Nouveau contact';

  @override
  String get companyEditContactTitle => 'Modifier le contact';

  @override
  String get companyAppLabel => 'Appli';

  @override
  String get companyIdentifierNumberLabel => 'Identifiant / numéro';

  @override
  String get companyOpenTooltip => 'Ouvrir';

  @override
  String get companyRemoveTooltip => 'Retirer';

  @override
  String get companyRoleFieldLabel => 'Fonction (ex. Acheteur)';

  @override
  String get companyMessagingTitle => 'Messageries';

  @override
  String get companyNoMessagingHint =>
      'Aucune messagerie renseignée — WhatsApp, WeChat, iMessage…';

  @override
  String get companyNoContactInfo =>
      'Aucun moyen de contact renseigné pour le moment.';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsSubtitle => 'Configuration ponctuelle de l\'application.';

  @override
  String get settingsLanguagesTitle => 'Langues & devise';

  @override
  String get settingsAppLanguageLabel => 'Langue de l\'application';

  @override
  String get settingsDictationLanguageLabel => 'Langue de dictée';

  @override
  String get settingsCurrencyLabel => 'Devise';

  @override
  String get settingsFormatsHint =>
      'Montants affichés au format 1,234.56 (virgule = milliers, point = décimales) et dates au format jj/mm/aaaa, quelle que soit la langue de l\'interface.';

  @override
  String get settingsCompanyTitle => 'Société';

  @override
  String get settingsCompanySubtitle =>
      'Identité de la société qui utilise ce CRM — réutilisée plus tard dans le header (marque blanche) et l\'en-tête des documents PDF.';

  @override
  String get settingsSyncTitle => 'Synchronisation';

  @override
  String get settingsSyncSubtitle =>
      'Par défaut, toutes les données restent en local (SQLite) sur cet appareil.';

  @override
  String get settingsSyncLocalTitle => 'Standalone (local uniquement)';

  @override
  String get settingsSyncLocalSubtitle =>
      'Aucune donnée envoyée en dehors de cet appareil';

  @override
  String get settingsSyncRemoteTitle => 'Base partagée (remote)';

  @override
  String get settingsSyncRemoteSubtitle =>
      'HTTPS partagé : compte + mot de passe sur emhk.eastmarkhk.com/crm';

  @override
  String get settingsServerLabel => 'Serveur';

  @override
  String get settingsAccountLabel => 'Compte';

  @override
  String get settingsSyncPasswordHint =>
      'Mot de passe sync (trousseau — jamais dans la base).';

  @override
  String get settingsSyncNowButton => 'Synchroniser maintenant';

  @override
  String get settingsSyncPollHint =>
      'Pull automatique toutes les 25 s en tâche de fond ; push immédiat après chaque modification (mode remote actif). Pas de pull pendant une saisie en cours.';

  @override
  String get settingsSyncMissingFields =>
      'Serveur, compte et mot de passe requis';

  @override
  String get settingsModulesTitle => 'Modules';

  @override
  String get settingsModulesSubtitle =>
      'EastmarkHK e-Invoicing, Scanner, Sync… — essai 7 jours ou activation licence.';

  @override
  String get settingsBrowseModules => 'Parcourir les modules';

  @override
  String get settingsImportExportTitle => 'Import / export';

  @override
  String get settingsImportExportSubtitle =>
      'Clients, contacts et opportunités en CSV ; contacts depuis vCard.';

  @override
  String get settingsPipelineTitle => 'Pipeline';

  @override
  String get settingsPipelineSubtitle =>
      'Personnalisez les étapes et leurs libellés.';

  @override
  String get settingsConfigureStages => 'Configurer les étapes';

  @override
  String get settingsBackupTitle => 'Sauvegarde locale';

  @override
  String get settingsBackupSubtitle =>
      'Exporte une copie de votre base SQLite — utile avant une mise à jour ou pour archiver.';

  @override
  String get settingsExportDbButton => 'Exporter la base (.db)';

  @override
  String get settingsBackupShareText => 'Sauvegarde EastmarkHK CRM';

  @override
  String settingsExportError(String error) {
    return 'Export impossible : $error';
  }

  @override
  String get settingsUsersTitle => 'Utilisateurs';

  @override
  String get settingsUsersSubtitleAdmin =>
      'Comptes, rôles et mots de passe — administrateur et utilisateur.';

  @override
  String get settingsUsersSubtitleLocked => 'Réservé aux administrateurs.';

  @override
  String get settingsManageUsersButton => 'Gérer les utilisateurs';

  @override
  String get settingsUsersLockedHint =>
      'Connectez-vous avec un compte administrateur pour voir ou modifier les utilisateurs et leurs mots de passe.';

  @override
  String get settingsSaveKeychainError =>
      'Réglages enregistrés, mais le trousseau sécurisé est indisponible — le mot de passe de sync n\'a pas pu être stocké (relancez l\'app après une reconstruction complète).';

  @override
  String get settingsSaved => 'Réglages enregistrés';

  @override
  String get settingsLogoutConfirmTitle => 'Se déconnecter ?';

  @override
  String get settingsLogoutConfirmDetail =>
      'Vous devrez saisir votre mot de passe (ou Touch ID) pour revenir.';

  @override
  String get settingsLogoutButton => 'Se déconnecter';

  @override
  String get settingsLogoTitle => 'Logo de la société';

  @override
  String get settingsLogoSubtitle =>
      'Affiché en haut de l\'application et dans la bannière.';

  @override
  String get settingsLogoEmpty =>
      'Aucun logo — ajoutez celui de votre entreprise';

  @override
  String get settingsLogoChoose => 'Choisir une image';

  @override
  String get settingsLogoChange => 'Changer le logo';

  @override
  String get usersDeleteSelfError =>
      'Impossible de supprimer votre propre compte';

  @override
  String get usersDeleteConfirmTitle => 'Supprimer cet utilisateur ?';

  @override
  String usersDeleteConfirmDetail(String displayName, String username) {
    return '$displayName ($username) perdra l\'accès au CRM.';
  }

  @override
  String get usersTitle => 'Utilisateurs';

  @override
  String get usersSubtitle => 'Comptes, rôles et mots de passe.';

  @override
  String get usersAddButton => 'Utilisateur';

  @override
  String get usersEmptyTitle => 'Aucun utilisateur';

  @override
  String get usersEmptySubtitle =>
      'Créez le premier compte — il sera administrateur.';

  @override
  String get usersEmptyAction => 'Nouvel utilisateur';

  @override
  String usersDisplayNameSelf(String name) {
    return '$name (vous)';
  }

  @override
  String get usersNewTitle => 'Nouvel utilisateur';

  @override
  String get usersEditTitle => 'Modifier l\'utilisateur';

  @override
  String get usersLoginIdLabel => 'Identifiant de connexion';

  @override
  String get usersRoleLabel => 'Rôle';

  @override
  String get usersNewPasswordLabel =>
      'Nouveau mot de passe (laisser vide pour ne pas changer)';

  @override
  String get usersTouchIdTitle => 'Touch ID sur cet appareil';

  @override
  String get usersTouchIdSubtitle =>
      'Déverrouiller sans retaper le mot de passe, ici uniquement.';

  @override
  String get roleAdministrator => 'Administrateur';

  @override
  String get roleUser => 'Utilisateur';

  @override
  String get dashboardTitleEmbedded => 'Tableau de bord';

  @override
  String get dashboardTitle => 'Aujourd\'hui';

  @override
  String dashboardActionsToProcess(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString actions à traiter',
      one: '$countString action à traiter',
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
      other: '+$countString autres — voir tout',
      one: '+$countString autre — voir tout',
    );
    return '$_temp0';
  }

  @override
  String get dashboardAllReps => 'Tous les commerciaux';

  @override
  String dashboardMeSuffix(String name) {
    return '$name (moi)';
  }

  @override
  String get dashboardEmptyTitle => 'Votre CRM est prêt';

  @override
  String get dashboardEmptySubtitle =>
      'Ajoutez votre premier client, importez un fichier CSV ou explorez les modules à venir.';

  @override
  String get dashboardNothingScheduled =>
      'Rien de programmé — vos relances apparaîtront ici.';

  @override
  String get dashboardBucketOverdue => 'En retard';

  @override
  String get dashboardBucketToday => 'Aujourd\'hui';

  @override
  String get dashboardBucketWeek => 'Cette semaine';

  @override
  String get dashboardBucketLater => 'Plus tard';

  @override
  String get dashboardContactedButton => 'Contacté';

  @override
  String get dashboardDoneButton => 'Fait';

  @override
  String get dashboardOpenDeals => 'Affaires en cours';

  @override
  String get dashboardOpenDealsSeeAll => 'Voir tout';

  @override
  String get dashboardOpenDealsEmpty => 'Aucune affaire en cours.';

  @override
  String get dashboardTopClients => 'Top clients (pipeline ouvert)';

  @override
  String get dashboardPipelineByStage => 'Pipeline par étape';

  @override
  String get dashboardNoOpportunitiesYet => 'Pas encore d\'opportunités';

  @override
  String get dashboardWonLostByMonth => 'Gagné / Perdu par mois';

  @override
  String get dashboardNoClosuresYet => 'Pas encore de clôtures enregistrées.';

  @override
  String get dashboardRecentActivity => 'Activité récente';

  @override
  String get dashboardNoActivityYet => 'Aucune activité pour le moment.';

  @override
  String get metricClients => 'Clients';

  @override
  String get metricOpportunities => 'Opportunités';

  @override
  String get metricPipeline => 'Pipeline';

  @override
  String get metricForecast => 'CA prévi.';

  @override
  String get metricTasks => 'Tâches';

  @override
  String get metricOverdue => 'En retard';

  @override
  String get productTagline => 'Gagnez du temps dès le premier jour.';

  @override
  String get placeholderDashboardHint =>
      'Vue d\'ensemble : pipeline, relances et activité récente.';

  @override
  String get placeholderTodayTitle => 'Votre journée';

  @override
  String get placeholderTodayHint =>
      'Choisissez une relance à gauche.\nLe client s\'ouvre ici — sans changer d\'écran.';

  @override
  String get placeholderClientsTitle => 'Fiche client';

  @override
  String get placeholderClientsHint =>
      'Sélectionnez un client dans la liste,\n ou créez-en un avec le bouton +.';

  @override
  String get placeholderPipelineHint =>
      'Glissez une carte entre les colonnes.\nCliquez pour ouvrir la fiche client.';

  @override
  String get placeholderTasksHint =>
      'Sélectionnez une tâche pour voir le client concerné.';

  @override
  String get modulesSubtitleAppStore =>
      'Abonnez-vous via l\'App Store, ou activez un abonnement déjà acheté sur eastmarkhk.com.';

  @override
  String get modulesSubtitleWebStore =>
      'Essai gratuit, achat sur eastmarkhk.com — même abonnement que l\'app EastmarkHK e-Invoicing.';

  @override
  String get modulesStatusActiveAppStore => 'Actif — App Store';

  @override
  String get modulesStatusActiveWeb => 'Actif — eastmarkhk.com';

  @override
  String modulesStatusTrial(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Essai — $countString jours restants',
      one: 'Essai — $countString jour restant',
    );
    return '$_temp0';
  }

  @override
  String get modulesStatusActive => 'Actif';

  @override
  String get modulesStatusAvailable => 'Disponible';

  @override
  String get modulesBuyFailed =>
      'Impossible de lancer l\'achat. Réessayez ou restaurez vos achats.';

  @override
  String get modulesRestoreDone => 'Restauration terminée.';

  @override
  String modulesImportedFromEinvoicing(String name) {
    return '$name activé depuis l\'app installée.';
  }

  @override
  String get modulesLicenseNotFound =>
      'Licence introuvable automatiquement. Ouvrez EastmarkHK e-Invoicing → Réglages, copiez votre code d\'activation, puis « Activer un code web ».';

  @override
  String get modulesRenewalNote =>
      'Renouvellement automatique via l\'App Store. Gérez l\'abonnement dans Réglages → Apple ID → Abonnements.';

  @override
  String get modulesWebStoreNote =>
      'Ou abonnez-vous sur eastmarkhk.com et activez avec le code reçu par e-mail.';

  @override
  String get modulesHaveEinvoicing => 'J\'ai déjà EastmarkHK e-Invoicing';

  @override
  String get modulesTry7Days => 'Essayer 7 jours';

  @override
  String get modulesSubscribe => 'S\'abonner';

  @override
  String get modulesRestore => 'Restaurer les achats';

  @override
  String get modulesWebSubscription => 'Abonnement eastmarkhk.com';

  @override
  String get modulesActivateWebCode => 'Activer un code web';

  @override
  String get modulesUseInCrm => 'Utiliser dans le CRM';

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
  String get modulesPerMonth => '/ mois';

  @override
  String get modulesActivationSubtitleAppStore =>
      'Vous vous êtes abonné sur eastmarkhk.com ? Collez le code reçu par e-mail. Sur iPhone/iPad, l\'achat initial se fait via l\'App Store ou le site avant activation.';

  @override
  String get modulesActivationSubtitleWeb =>
      'Abonnez-vous sur eastmarkhk.com, puis collez le code d\'activation lié à cet appareil.';

  @override
  String get modulesMachineId => 'Machine ID';

  @override
  String get modulesCopy => 'Copier';

  @override
  String get modulesSubscriptionEmailLabel => 'E-mail d\'abonnement';

  @override
  String get modulesActivationCodeLabel => 'Code d\'activation';

  @override
  String get modulesActivationCodeHint => 'Collez le code reçu après achat';

  @override
  String get modulesActivate => 'Activer';

  @override
  String get modulesBuyOnWebsite => 'Acheter sur eastmarkhk.com';

  @override
  String get modulesRequestCodeByEmail => 'Demander un code par e-mail';

  @override
  String modulesActivatedViaWebsite(String name) {
    return '$name activé via eastmarkhk.com';
  }

  @override
  String get modulesMachineIdCopied => 'Machine ID copié';

  @override
  String get modulesEmailRequired => 'Indiquez votre e-mail d\'abonnement';

  @override
  String get invNewQuote => 'Nouveau devis';

  @override
  String get invNewInvoice => 'Nouvelle facture';

  @override
  String get invSectionQuote => 'Devis';

  @override
  String get invSectionInvoice => 'Facture';

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
  String get invFieldDueDate => 'Échéance';

  @override
  String get invFieldValidUntil => 'Valable jusqu\'au';

  @override
  String get invFieldStatus => 'Statut';

  @override
  String get invFieldVatPercent => 'TVA %';

  @override
  String get invStatusDraft => 'Brouillon';

  @override
  String get invStatusSent => 'Envoyée';

  @override
  String get invStatusAccepted => 'Accepté';

  @override
  String get invStatusRejected => 'Refusé';

  @override
  String get invStatusInvoiced => 'Facturé';

  @override
  String get invStatusPartial => 'Partiel';

  @override
  String get invStatusPaid => 'Payée';

  @override
  String get invStatusOverdue => 'En retard';

  @override
  String get invStatusCancelled => 'Annulée';

  @override
  String get invLinesTitle => 'Lignes';

  @override
  String get invNotesTitle => 'Notes';

  @override
  String get invCreate => 'Créer';

  @override
  String get invCreating => 'Création…';

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
  String get invAddFromCatalog => 'Ajouter depuis le catalogue';

  @override
  String get invAddFreeLine => 'Ajouter une ligne';

  @override
  String get invEmptyLines =>
      'Aucune ligne — ajoutez un produit du catalogue ou une ligne libre.';

  @override
  String get invUpdateProductTooltip => 'Mettre à jour le produit';

  @override
  String get invAddToCatalogTooltip => 'Ajouter au catalogue';

  @override
  String get invDeleteLineTooltip => 'Supprimer la ligne';

  @override
  String get invChangePhotoTooltip => 'Changer la photo';

  @override
  String get invAddPhotoTooltip => 'Ajouter une photo';

  @override
  String get invProductUpdated => 'Produit mis à jour (prix et photos).';

  @override
  String get invProductSaved =>
      'Ligne enregistrée dans le catalogue (avec photos).';

  @override
  String get invClientLinkedHint =>
      'Le client CRM est déjà lié : le document sera créé dans e-Invoicing pour ce même client.';

  @override
  String get invFooterHint =>
      'Le document est créé dans EastmarkHK e-Invoicing — mise en page, PDF, envoi et suivi se font dans l\'app e-Invoicing.';

  @override
  String get invNeedLines => 'Ajoutez au moins une ligne avec une description.';

  @override
  String get invSubtotalHt => 'Sous-total HT';

  @override
  String get invVat => 'TVA';

  @override
  String get invTotalTtc => 'Total TTC';

  @override
  String get invCatalogTitle => 'Catalogue produits';

  @override
  String get invCatalogSearch => 'Rechercher un produit…';

  @override
  String get invCatalogEmpty => 'Aucun produit — créez-les dans e-Invoicing.';

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
  String get shellFollowupTitle => 'Suivi';

  @override
  String get shellClientTitle => 'Client';

  @override
  String get shellModulesTooltip => 'Modules';

  @override
  String get shellAgendaLabel => 'Agenda';

  @override
  String get shellClientsLabel => 'Clients';

  @override
  String get shellTasksLabel => 'Suivis';

  @override
  String get shellNewFollowup => 'Suivi';

  @override
  String get shellNewClient => 'Client';

  @override
  String get shellModulesLabel => 'Modules';

  @override
  String get shellSettingsLabel => 'Réglages';

  @override
  String get tasksSelectPrompt => 'Sélectionnez une tâche';

  @override
  String dashOverviewSubtitle(String month) {
    return 'Vue d’ensemble · $month';
  }

  @override
  String get dashOpenFollowups => 'Suivis ouverts';

  @override
  String get dashOverdue => 'En retard';

  @override
  String get dashToApprove => 'À approuver';

  @override
  String get dashProspects => 'Prospects';

  @override
  String get dashActiveClients => 'Clients actifs';

  @override
  String get dashInactive => 'Inactifs / perdus';

  @override
  String get dashQuotes => 'Devis';

  @override
  String get dashOpenInvoices => 'Factures ouvertes';

  @override
  String get dashPaidInvoices => 'Factures payées';

  @override
  String get dashRecentActions => 'Dernières actions';

  @override
  String get dashNoRecentActions =>
      'Aucune action récente — les suivis, appels, e-mails et documents apparaîtront ici.';

  @override
  String get dashRecentDone => 'Réalisés récemment';

  @override
  String get dashNoClosed => 'Pas encore de suivis clôturés.';

  @override
  String get dashModules => 'Modules';

  @override
  String get dashOpenCaHint =>
      'CA ouvert : factures non payées (voir e-Invoicing pour le détail).';

  @override
  String get dashDoneBadge => 'Fait';

  @override
  String get dashPassedBadge => 'Passé';

  @override
  String get clientEmptyTitle => 'Sélectionnez un client';

  @override
  String get clientEmptySubtitle => 'Ou créez-en un pour démarrer le suivi.';

  @override
  String get clientEinvoiceBadge => 'E-facture / Peppol';

  @override
  String get clientNoContactsHint =>
      'Ajoutez au moins un contact (avec son rôle) pour cette entreprise.';

  @override
  String get clientFollowupsTitle => 'Suivi / tâches';

  @override
  String get clientPlanAction => 'Planifier';

  @override
  String get clientNoTasksHint =>
      'Planifiez les phases : premier contact, relance, rendez-vous…';

  @override
  String clientEinvoiceError(String error) {
    return 'E-facturation indisponible : $error';
  }

  @override
  String get clientPrimaryBadge => 'Principal';

  @override
  String get tasksTitle => 'Tâches';

  @override
  String get tasksNewButton => 'Nouvelle tâche';

  @override
  String tasksOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ouvertes',
      one: '1 ouverte',
    );
    return '$_temp0';
  }

  @override
  String get tasksAllReps => 'Tous les commerciaux';

  @override
  String get tasksAllDoneTitle => 'Tout est fait !';

  @override
  String get tasksAllDoneSubtitle =>
      'Ajoutez une tâche — ou dictez-la après un appel.';

  @override
  String get tasksClientLabel => 'Client';

  @override
  String get tasksClientOptional => 'Client (optionnel)';

  @override
  String get tasksClientRequired => 'Client *';

  @override
  String get tasksNoClient => 'Sans client (ex. exécuter une tâche perso)';

  @override
  String get tasksMessageHint =>
      'Message (ex. Appeler le client, exécuter une tâche…)';

  @override
  String get tasksDueLabel => 'Échéance';

  @override
  String get tasksNoDue => 'Pas d’échéance';

  @override
  String dueLabelOverdue(int days, String date) {
    return 'En retard · $days j · $date';
  }

  @override
  String dueLabelToday(String date) {
    return 'Aujourd’hui · $date';
  }

  @override
  String dueLabelTomorrow(String date) {
    return 'Demain · $date';
  }

  @override
  String dueLabelInDays(String weekdayDate, int days) {
    return '$weekdayDate · dans $days j';
  }

  @override
  String dueGroupTodayWithDate(String date) {
    return 'Aujourd’hui · $date';
  }

  @override
  String dueGroupTomorrowWithDate(String date) {
    return 'Demain · $date';
  }

  @override
  String dueGroupWeekWithDate(String date) {
    return 'Cette semaine · $date';
  }

  @override
  String dueGroupWeekWithRange(String from, String to) {
    return 'Cette semaine · $from → $to';
  }

  @override
  String dueGroupLaterWithDate(String date) {
    return 'Plus tard · $date';
  }

  @override
  String dueGroupLaterWithRange(String from, String to) {
    return 'Plus tard · $from → $to';
  }

  @override
  String get bannerSyncNotEnabledTooltip =>
      'Synchronisation non activée — cliquer pour l’activer';

  @override
  String get bannerSyncInProgressTooltip => 'Synchronisation en cours…';

  @override
  String get bannerSyncErrorTooltip => 'Erreur sync — cliquer pour réessayer';

  @override
  String bannerSyncLastAtTooltip(String date) {
    return 'Dernière sync : $date';
  }

  @override
  String get bannerSyncIdleTooltip => 'Synchroniser';

  @override
  String get bannerCompanyPlaceholder => 'Votre entreprise';

  @override
  String get tasksDateButton => 'Date';

  @override
  String get tasksTimeButton => 'Heure';

  @override
  String get tasksClearButton => 'Effacer';

  @override
  String get tasksAssignedTo => 'Assigné à';

  @override
  String get tasksUnassigned => 'Non assigné';

  @override
  String get tasksNewTaskTitle => 'Nouvelle tâche';

  @override
  String get pipelineNewOpportunity => 'Nouvelle opportunité';

  @override
  String get pipelineTitleLabel => 'Titre';

  @override
  String get pipelineAmountLabel => 'Montant';

  @override
  String get pipelineMoveTooltip => 'Déplacer';

  @override
  String get pipelineTitle => 'Pipeline';

  @override
  String get pipelineNoOpen => 'Aucune opportunité ouverte';

  @override
  String pipelineOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opportunités ouvertes',
      one: '1 opportunité ouverte',
    );
    return '$_temp0';
  }

  @override
  String get pipelineEmptyTitle => 'Votre pipeline est vide';

  @override
  String get pipelineEmptySubtitle =>
      'Créez une opportunité puis glissez-la d’étape en étape.';

  @override
  String get pipelineBoardEmptyTitle => 'Pipeline vide';

  @override
  String get pipelineBoardEmptySubtitle =>
      'Créez une opportunité, puis glissez-la entre les étapes.';

  @override
  String get pipelineDragHint => 'Glisser pour déplacer';

  @override
  String pipelineCreatedOn(String date) {
    return 'Créée le $date';
  }

  @override
  String pipelineStageSince(String date) {
    return 'Stade depuis le $date';
  }

  @override
  String get agendaTitle => 'Agenda';

  @override
  String get agendaToday => 'Aujourd’hui';

  @override
  String get agendaUpcoming => 'Prochains jours';

  @override
  String get agendaEmptyToday =>
      'Rien de prévu pour aujourd’hui. Planifiez un suivi.';

  @override
  String get agendaEmptyUpcoming => 'Aucune tâche planifiée bientôt.';

  @override
  String agendaPendingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tâches en attente d’approbation',
      one: '1 tâche en attente d’approbation',
    );
    return '$_temp0';
  }

  @override
  String get taskEditTooltip => 'Modifier';

  @override
  String get taskCloseTooltip => 'Fermer';

  @override
  String get taskClientSubtitle => 'Client';

  @override
  String get taskDueSubtitle => 'Échéance';

  @override
  String get taskValidationTitle => 'Validation';

  @override
  String get taskInfoHint =>
      'Cette entrée est informative. Marquez-la comme passée une fois prise en compte.';

  @override
  String get taskActionHint =>
      'Marquez comme exécutée, puis approuvez pour confirmer que c’est fait.';

  @override
  String get taskHistoryTitle => 'Historique';

  @override
  String get taskNoHistory =>
      'Aucun événement pour l’instant. Les devis, factures et changements de statut apparaîtront ici.';

  @override
  String get taskDoneByUs => 'Exécutée par nous';

  @override
  String get taskInfoOnly => 'Info seulement — passée';

  @override
  String get taskApprove => 'Approuver — confirmée faite';

  @override
  String get taskReopen => 'Rouvrir';

  @override
  String get taskReopenTask => 'Rouvrir la tâche';

  @override
  String get taskDeleteTitle => 'Supprimer cette tâche ?';

  @override
  String get taskViewDocument => 'Voir le document';

  @override
  String taskInvoiceTitle(String number) {
    return 'Facture $number';
  }

  @override
  String taskQuoteTitle(String number) {
    return 'Devis $number';
  }

  @override
  String logContactedTitle(String title) {
    return 'Contacté — $title';
  }

  @override
  String get logTypeLabel => 'Type de contact';

  @override
  String get logNoteLabel => 'Note (optionnel, ou dictez-la)';

  @override
  String get logNextFollowup => 'Prochaine relance';

  @override
  String get logCustom => 'Personnalisé';

  @override
  String logReplacesHint(String date) {
    return 'Remplace la relance déjà programmée le $date.';
  }

  @override
  String get logTomorrow => 'Demain';

  @override
  String get log3Days => '3 jours';

  @override
  String get log1Week => '1 semaine';

  @override
  String get log2Weeks => '2 semaines';

  @override
  String get logTypeField => 'Type';

  @override
  String get logContentLabel => 'Contenu';

  @override
  String get logDeleteTitle => 'Supprimer cette entrée ?';

  @override
  String get logDeleteBody => 'Cette action est définitive.';

  @override
  String logRelanceTitle(String title) {
    return 'Relancer : $title';
  }

  @override
  String get logKindNote => 'Note';

  @override
  String get logKindQuoteSent => 'Devis envoyé';

  @override
  String get logKindEmail => 'E-mail';

  @override
  String get logKindCall => 'Appel';

  @override
  String get logKindMeeting => 'Réunion';

  @override
  String get logKindReply => 'Réponse client';

  @override
  String get logKindRemark => 'Remarque';

  @override
  String get addressMultipleCities => 'Plusieurs villes trouvées';

  @override
  String get addressCnpj => 'CNPJ';

  @override
  String get addressAddress => 'Adresse';

  @override
  String get addressCountry => 'Pays';

  @override
  String get addressZip => 'Code postal';

  @override
  String get addressState => 'État';

  @override
  String get addressCity => 'Ville';

  @override
  String get loginResetPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get loginResetHint =>
      'Cet appareil uniquement — le mot de passe n’est pas partagé par la sync. Choisissez un compte local et définissez un nouveau mot de passe.';

  @override
  String get loginAccountLabel => 'Compte';

  @override
  String get loginNewPasswordLabel => 'Nouveau mot de passe';

  @override
  String get loginConfirmLabel => 'Confirmer';

  @override
  String get loginTooShort => 'Mot de passe trop court (4 caractères min.).';

  @override
  String get loginMismatch => 'Les mots de passe ne correspondent pas.';

  @override
  String get loginResetButton => 'Réinitialiser';

  @override
  String get currencySearchHint => 'Rechercher une devise…';

  @override
  String get currencyNone => 'Aucune devise trouvée';

  @override
  String get systemLanguage => 'Langue du système';

  @override
  String get noLanguage => 'Aucune langue trouvée';

  @override
  String get dictationUnavailable => 'Dictée indisponible sur cet appareil.';

  @override
  String get companyDeleteTitle => 'Supprimer ce client ?';

  @override
  String get companyListTitle => 'Clients';

  @override
  String companyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sociétés',
      one: '1 société',
    );
    return '$_temp0';
  }

  @override
  String get companyNewButton => 'Nouveau client';

  @override
  String get companySearchHint => 'Filtrer par nom, notes…';

  @override
  String get companyColumnClient => 'Client';

  @override
  String get companyColumnModified => 'Modifié';

  @override
  String get companyEmptyNoName => 'Aucun client';

  @override
  String get companyEmptyNoResult => 'Aucun résultat';

  @override
  String get companyEmptySubtitle =>
      'Ajoutez votre premier client — ou dictez-le avec le micro.';

  @override
  String get companyEmptySearchSubtitle => 'Essayez un autre terme.';

  @override
  String get taskEditorNewTitle => 'Planifier un suivi';

  @override
  String get taskEditorEditTitle => 'Modifier le suivi';

  @override
  String get taskEditorClientSection => 'Client';

  @override
  String get taskEditorClientOfTask => 'Client du suivi';

  @override
  String get taskEditorNoClient => 'Sans client (interne)';

  @override
  String get taskEditorChoose => 'Choisir…';

  @override
  String get taskEditorTypeSection => 'Type';

  @override
  String get taskEditorTitleField => 'Titre *';

  @override
  String get taskEditorTitleHint => 'Relancer le devis, appeler…';

  @override
  String get taskEditorWhatSection => 'Que faire ?';

  @override
  String get taskEditorActionHint => 'Choisissez l’action concrète à réaliser.';

  @override
  String get taskEditorMessaging => 'Messagerie';

  @override
  String get taskEditorNeedClient =>
      'Choisissez d’abord un client pour afficher le numéro ou l’e-mail.';

  @override
  String get taskEditorPhaseSection => 'Phase & échéance';

  @override
  String get taskEditorPhaseLabel => 'Phase du dossier';

  @override
  String get taskEditorChooseDue => 'Choisir date et heure';

  @override
  String get taskEditorSaveShortcut => 'Enregistrer (⌘S)';

  @override
  String get taskEditorNeedMessaging => 'Choisissez la messagerie à utiliser.';

  @override
  String get taskEditorNeedDue => 'Choisissez la date et l’heure du suivi.';

  @override
  String get taskEditorNeedTitle => 'Le titre de la tâche est obligatoire.';

  @override
  String get taskEditorSearchHint => 'Rechercher…';

  @override
  String get taskSuggestedMessage => 'Envoyer un message';

  @override
  String taskSuggestedPlatformMessage(String platform) {
    return 'Message $platform';
  }

  @override
  String get taskSuggestedCall => 'Appeler';

  @override
  String get taskSuggestedEmail => 'Envoyer un e-mail';

  @override
  String get taskSuggestedMeeting => 'Rendez-vous';

  @override
  String get taskSuggestedFollowup => 'Suivi';

  @override
  String get importTargetClient => 'Client cible';

  @override
  String get importCsvButton => 'Importer CSV';

  @override
  String get importModulesSoon => 'Modules (bientôt)';

  @override
  String get importExportCsvTitle => 'Export CSV';

  @override
  String get importExportClients => 'Clients';

  @override
  String get importExportContacts => 'Contacts';

  @override
  String get importExportOpportunities => 'Opportunités';

  @override
  String get importTitle => 'Import';

  @override
  String get importClientsCsv => 'Clients CSV';

  @override
  String get importContactsCsv => 'Contacts CSV';

  @override
  String get importOpportunitiesCsv => 'Opportunités CSV';

  @override
  String get importContactsVCard => 'Contacts vCard';

  @override
  String importExported(String path) {
    return 'Exporté : $path';
  }

  @override
  String importExportFailed(String error) {
    return 'Export impossible : $error';
  }

  @override
  String importResult(String label, int imported, int skipped) {
    return '$label : $imported importé(s), $skipped ignoré(s).';
  }

  @override
  String importFailed(String error) {
    return 'Import impossible : $error';
  }

  @override
  String get importNeedClientFirst =>
      'Créez d’abord un client pour y rattacher les contacts vCard.';

  @override
  String importVcardResult(int count) {
    return 'vCard : $count contact(s) importé(s).';
  }

  @override
  String importVcardFailed(String error) {
    return 'Import vCard impossible : $error';
  }

  @override
  String get cmdSearchHint => 'Rechercher ou taper une commande…';

  @override
  String get cmdSectionNavigation => 'Navigation';

  @override
  String get cmdGoDashboard => 'Aller au Tableau de bord';

  @override
  String get cmdGoToday => 'Aller à Aujourd’hui';

  @override
  String get cmdGoClients => 'Aller aux Clients';

  @override
  String get cmdGoPipeline => 'Aller au Pipeline';

  @override
  String get cmdGoTasks => 'Aller aux Tâches';

  @override
  String get cmdSectionCreate => 'Créer';

  @override
  String get cmdNewClient => 'Nouveau client';

  @override
  String get cmdNewTask => 'Nouvelle tâche';

  @override
  String get cmdSectionClients => 'Clients';

  @override
  String get cmdSectionContacts => 'Contacts';

  @override
  String get cmdSectionOpportunities => 'Opportunités';

  @override
  String get cmdSectionTasks => 'Tâches';

  @override
  String get cmdSectionNotes => 'Notes & activités';

  @override
  String get cmdNoResults => 'Aucun résultat';

  @override
  String get pipelineSettingsTitle => 'Étapes du pipeline';

  @override
  String get pipelineSettingsHint =>
      'Personnalisez les libellés et l’ordre des étapes ouvertes. Gagné et Perdu restent en fin de pipeline.';

  @override
  String get pipelineMoveUp => 'Monter';

  @override
  String get pipelineMoveDown => 'Descendre';

  @override
  String pipelineStepLabel(int index) {
    return 'Étape $index';
  }

  @override
  String get pipelineNewStage => 'Nouvelle étape';

  @override
  String get pipelineAddStage => 'Ajouter une étape';

  @override
  String get pipelineWon => 'Gagné';

  @override
  String get pipelineLost => 'Perdu';

  @override
  String get pipelineReset => 'Réinitialiser';

  @override
  String get oppNotFound => 'Affaire introuvable.';

  @override
  String get oppHistoryTitle => 'HISTORIQUE';

  @override
  String get oppEmptyTimeline =>
      'Rien pour l’instant — les notes, appels, tâches et devis/factures liés à cette affaire apparaîtront ici.';

  @override
  String get oppTaskLabel => 'Tâche';

  @override
  String oppTaskDue(String date) {
    return 'Tâche · échéance $date';
  }

  @override
  String get oppTaskMarkDone => 'Marquer fait';

  @override
  String get oppWon => 'Gagnée';

  @override
  String get oppLost => 'Perdue';

  @override
  String oppProbability(int value) {
    return 'Probabilité : $value%';
  }

  @override
  String oppClosePlanned(String date) {
    return 'Clôture prévue : $date';
  }

  @override
  String get eiProductsTitle => 'Produits';

  @override
  String get eiProductsSubtitle => 'Catalogue EastmarkHK e-Invoicing';

  @override
  String get eiNewProduct => 'Nouveau produit';

  @override
  String get eiProductSearch => 'Rechercher un produit…';

  @override
  String get eiNoProducts => 'Aucun produit pour l’instant.';

  @override
  String eiSaveFailed(String error) {
    return 'Enregistrement impossible : $error';
  }

  @override
  String get eiDeleteProductTitle => 'Supprimer ce produit ?';

  @override
  String eiDeleteFailed(String error) {
    return 'Suppression impossible : $error';
  }

  @override
  String get eiInfoSection => 'Informations';

  @override
  String get eiPriceSection => 'Prix et taxe';

  @override
  String get eiSellPrice => 'Prix de vente (TTC)';

  @override
  String get eiNfeSection => 'Classification fiscale NF-e Brésil';

  @override
  String get eiPhotosSection => 'Photos';

  @override
  String get eiCustomerTitle => 'Client e-Invoicing';

  @override
  String get eiUseExisting => 'Utiliser l’existant';

  @override
  String get eiOptional => 'Optionnel';

  @override
  String get eiImagesLabel => 'Images';

  @override
  String get eiTakePhoto => 'Prendre une photo';

  @override
  String get eiChooseLibrary => 'Choisir dans la photothèque';

  @override
  String get eiBrowseFiles => 'Parcourir les fichiers';

  @override
  String get eiPhotoSaveFailed => 'Impossible d’enregistrer la photo.';

  @override
  String get eiProductLabel => 'Produit';

  @override
  String get eiRemoteTitle => 'Connexion à e-Invoicing (mode distant)';

  @override
  String get eiRemoteUrl => 'URL de base';

  @override
  String get eiRemoteLogin => 'Login';

  @override
  String get invModuleTitle => 'e-Invoicing';

  @override
  String get queueDeleteTitle => 'Supprimer cette relance ?';

  @override
  String get queueEmpty => 'Aucune relance';

  @override
  String get tasksListDeleteTitle => 'Supprimer cette tâche ?';

  @override
  String get tasksListTitle => 'Tâches';

  @override
  String tasksListCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ouvertes',
      one: '1 ouverte',
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
      other: '$count sociétés',
      one: '1 société',
    );
    return '$_temp0';
  }

  @override
  String get colWiden => 'Élargir';

  @override
  String get colNarrow => 'Réduire';

  @override
  String get bannerTaskLabel => 'Tâche';

  @override
  String get activityInfoAdded => 'Info ajoutée au dossier';

  @override
  String get activityFollowupCreated => 'Suivi créé';

  @override
  String get activityDuePlanned => 'Échéance planifiée';

  @override
  String get activityFollowupUpdated => 'Suivi mis à jour';

  @override
  String get activityMarkedDone => 'Marquée exécutée';

  @override
  String get activityApproved => 'Approuvée — confirmée faite';

  @override
  String get activityPassed => 'Passée / info seulement';

  @override
  String get activityReopened => 'Rouverte';

  @override
  String get tasksOpenTitle => 'Tâches ouvertes';

  @override
  String get tasksPlanButton => 'Planifier';

  @override
  String get tasksNoneOpenTitle => 'Aucune tâche ouverte';

  @override
  String get tasksNoneOpenSubtitle =>
      'Planifiez ce qu’il y a à faire — aujourd’hui ou plus tard.';

  @override
  String get activityContactAdded => 'Contact ajouté au dossier';

  @override
  String get activityContactUpdated => 'Contact mis à jour';

  @override
  String get activityPendingApproval => 'En attente d’approbation';

  @override
  String settingsSyncOk(String message) {
    return 'OK — $message';
  }

  @override
  String settingsSyncError(String message) {
    return 'Erreur — $message';
  }

  @override
  String settingsSyncConnected(String message) {
    return 'Connexion OK — $message';
  }

  @override
  String get settingsFtpPassword => 'Mot de passe sync';

  @override
  String get settingsTestConnection => 'Tester la connexion';

  @override
  String get settingsNoModules =>
      'Aucun module activé. Parcourez la boutique pour essayer ou activer EastmarkHK e-Invoicing.';

  @override
  String settingsTrialRemaining(int days) {
    return 'Essai — $days j. restants';
  }

  @override
  String get settingsActiveInCrm => 'Actif — Utiliser dans le CRM';

  @override
  String get settingsEinvoiceDisplay => 'e-Invoicing — affichage';

  @override
  String get settingsEinvoiceDisplaySubtitle =>
      'Devis et factures créés aussi hors CRM : choisissez ce qui apparaît ici.';

  @override
  String get settingsLinkedToCrm => 'Liés au CRM';

  @override
  String get settingsAllEinvoicing => 'Tout e-Invoicing';

  @override
  String get settingsCrmOnlyDesc =>
      'Affiche uniquement les documents des clients rattachés au CRM (recommandé).';

  @override
  String get settingsAllDocsDesc =>
      'Affiche aussi les documents créés uniquement dans l’app e-Invoicing.';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsBuild => 'Build';

  @override
  String get settingsPrivacyReport => 'Privacy Report';

  @override
  String get settingsPrivacyReportSubtitle =>
      'EastmarkHK CRM — rapport de confidentialité';

  @override
  String get companyColumnNotes => 'Notes';

  @override
  String get companyWithoutName => '(Sans nom)';

  @override
  String get clientsSearchHint => 'Rechercher un client…';

  @override
  String get clientsNewButton => 'Nouveau';

  @override
  String get clientsEmptyTitle => 'Aucun client pour l’instant';

  @override
  String get clientsEmptySubtitle =>
      'Créez d’abord le client (prospect ou entreprise) pour suivre une affaire.';

  @override
  String get clientsEmptyCreateButton => 'Créer un client';

  @override
  String get clientsNoCountry => 'Pays non renseigné';

  @override
  String get clientsPanelSearch => 'Nom, notes…';

  @override
  String get clientsPanelNew => '+ Nouveau';

  @override
  String get clientNameRequired => 'Le nom de la société est obligatoire.';

  @override
  String get clientEditNewTitle => 'Nouveau client';

  @override
  String get clientEditModifyTitle => 'Modifier le client';

  @override
  String get companyNameLabel => 'Société';

  @override
  String get companyNameRequiredLabel => 'Nom de la société *';

  @override
  String get formRequired => 'Obligatoire';

  @override
  String get clientContactPerson => 'Personne de contact';

  @override
  String get clientEinvoicingSection => 'E-facturation';

  @override
  String get clientEinvoicingPeppol => 'Recevoir via e-facture / Peppol';

  @override
  String get clientEinvoicingPeppolHint =>
      'Si désactivé, les factures restent en email/PDF pour ce client.';

  @override
  String get clientPeppolIdLabel => 'Identifiant Peppol';

  @override
  String get clientPeppolVerify =>
      'Vérification Peppol — via le module e-Invoicing.';

  @override
  String get peppolVerify => 'Vérifier l’inscription Peppol';

  @override
  String get nfeTitle => 'Facture électronique (NF-e)';

  @override
  String get clientNfeHint =>
      'Brésil — pas de Peppol. Les documents suivent le régime NF-e / CNPJ.';

  @override
  String get clientNotesSection => 'Notes';

  @override
  String get clientNotesHint => 'Notes libres sur ce client…';

  @override
  String get clientEditSaveShortcut => 'Enregistrer (⌘S)';

  @override
  String get contactNameRequired => 'Indiquez au moins un prénom ou un nom.';

  @override
  String get contactNewTitle => 'Nouveau contact';

  @override
  String get contactEditTitle => 'Modifier le contact';

  @override
  String get contactIdentitySection => 'Identité';

  @override
  String get contactFirstName => 'Prénom';

  @override
  String get contactLastName => 'Nom';

  @override
  String get contactRoleLabel => 'Rôle dans l’entreprise';

  @override
  String get contactRoleHint => 'Acheteur, CEO, Comptabilité…';

  @override
  String get contactPrimary => 'Contact principal';

  @override
  String get contactPrimaryHint => 'Affiché en priorité sur la fiche client';

  @override
  String get contactDetailsSection => 'Coordonnées';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Téléphone';

  @override
  String contactPhoneFormat(String country) {
    return 'Format du pays $country';
  }

  @override
  String get contactNotesSection => 'Notes';

  @override
  String get contactSaveShortcut => 'Enregistrer (⌘S)';

  @override
  String get oppEditTitle => 'Modifier l’opportunité';

  @override
  String get oppStageLabel => 'Stade';

  @override
  String get oppClosePlannedLabel => 'Clôture prévue';

  @override
  String get oppNotSet => 'Non définie';

  @override
  String get oppFollowupScheduled => 'Relance programmée';

  @override
  String get oppFollowupReminder => 'Rappel de relance';

  @override
  String get oppFollowupOptional => 'Optionnel — planifiez un suivi client';

  @override
  String get oppRemoveFollowup => 'Retirer la relance';

  @override
  String get oppSchedule => 'Programmer';

  @override
  String get oppDetailsHint =>
      'Détails (produit, Incoterms, conditions de paiement, tableau…)';

  @override
  String get oppStageChanged => 'Changement de stade';

  @override
  String get oppCreated => 'Opportunité créée';

  @override
  String get oppWonTitle => 'Opportunité gagnée';

  @override
  String get oppCreateQuotePrompt =>
      'Créer un devis pré-rempli pour ce client ?';

  @override
  String get oppLater => 'Plus tard';

  @override
  String get oppCreateQuoteButton => 'Créer le devis';

  @override
  String get oppQuoteButton => 'Devis';

  @override
  String get oppInvoiceButton => 'Facture';

  @override
  String get stageContacted => 'Contacté';

  @override
  String get aiAssistant => 'Assistant IA';

  @override
  String get aiGenerating => 'Génération…';

  @override
  String get aiGenerateButton => 'Générer';

  @override
  String get aiUnavailable =>
      'Assistant IA indisponible — Apple Intelligence requis (macOS 26+, Apple Silicon). Saisie manuelle possible.';

  @override
  String get aiPromptHint =>
      'Décrivez le besoin client en langage naturel — l’IA locale d’Apple prépare le titre, les notes, le montant et la probabilité. Rien n’est enregistré sans votre validation.';

  @override
  String get aiPromptExample =>
      'Ex. : « 20 000 tags RFID pour Acme, prix FOB Shenzhen, livraison avant novembre, client déjà venu au salon »';

  @override
  String get taskNotesTitle => 'Notes';

  @override
  String get taskEditorNotesTitle => 'Notes';

  @override
  String get taskTileToApprove => 'À approuver';

  @override
  String get taskTileInfo => 'Info';

  @override
  String reachCallWithSource(String source) {
    return 'Appeler · $source';
  }

  @override
  String taskEmailClientRef(String ref) {
    return 'Ouvrir le client e-mail (réf. $ref)';
  }

  @override
  String get reachNoPhone =>
      'Aucun numéro sur ce client — ajoutez-le à la fiche.';

  @override
  String get reachNoEmail =>
      'Aucun e-mail sur ce client — ajoutez-le à la fiche.';

  @override
  String get reachCallLaunched => 'Appel lancé';

  @override
  String get reachEmailLabel => 'e-mail';

  @override
  String reachEmailOpened(String ref) {
    return 'E-mail ouvert · $ref';
  }

  @override
  String get queueGroupOverdue => 'En retard';

  @override
  String get queueGroupToday => 'Aujourd’hui';

  @override
  String get queueGroupTomorrow => 'Demain';

  @override
  String get queueGroupWeek => 'Cette semaine';

  @override
  String get queueGroupLater => 'Plus tard';

  @override
  String queueDeleteBody(String title) {
    return '« $title »';
  }

  @override
  String get queueNothingScheduled => 'Rien de programmé';

  @override
  String queueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count relances',
      one: '1 relance',
    );
    return '$_temp0';
  }

  @override
  String get queuePersonal => 'Perso';

  @override
  String get queueEmptySubtitle =>
      'Ajoutez des clients et des opportunités — les rappels apparaîtront ici.';

  @override
  String queueRemoveBody(String title) {
    return '« $title » sera retirée de votre file.';
  }

  @override
  String get linkClientTitle => 'Associer à un client';

  @override
  String get linkClientButton => 'Associer à un client';

  @override
  String get linkClientLabel => 'Client';

  @override
  String get actionNotFound => 'Relance introuvable';

  @override
  String get actionMessage => 'Message';

  @override
  String get actionContact => 'Contact';

  @override
  String get contactedReschedule => 'Contacté — reprogrammer';

  @override
  String get actionNotLinked => 'Non associé';

  @override
  String get viewFullProfile => 'Voir fiche complète';

  @override
  String get actionNoContact =>
      'Aucun contact — ajoutez-en depuis la fiche client.';

  @override
  String get actionEmailLabel => 'email';

  @override
  String get commonPhone => 'téléphone';

  @override
  String get boardNoOpenOpps => 'Aucune opportunité';

  @override
  String boardOpenCount(int count) {
    return '$count ouverte(s)';
  }

  @override
  String get colWidthLabel => 'Largeur de cette colonne';

  @override
  String tasksListDeleteBody(String title) {
    return '« $title »';
  }

  @override
  String tasksListOpenCount(int count) {
    return '$count ouverte(s)';
  }

  @override
  String get tasksListNew => '+ Tâche';

  @override
  String get tasksListEmpty => 'Aucune tâche';

  @override
  String get tasksListNoClient => 'Sans client';

  @override
  String get listFilterHint => 'Filtrer…';

  @override
  String get cmdNoName => '(sans nom)';

  @override
  String shellSyncError(String error) {
    return 'Sync : $error';
  }

  @override
  String get shellOk => 'OK';

  @override
  String get shellSyncNeedsPassword =>
      'Base partagée : saisissez le mot de passe sync dans Réglages pour reconnecter cet appareil.';

  @override
  String get shellSearch => 'Rechercher';

  @override
  String get shellDashboard => 'Tableau de bord';

  @override
  String get loginPasskeyNotConfigured =>
      'Passkey non configuré — connectez-vous une fois avec le mot de passe.';

  @override
  String get loginPasskeyRefused =>
      'Passkey / biométrie refusé — utilisez le mot de passe ou réinitialisez-le.';

  @override
  String get loginNoAccount => 'Aucun compte sur cet appareil.';

  @override
  String get loginAccountNotFound => 'Compte introuvable.';

  @override
  String get loginResetDone =>
      'Mot de passe réinitialisé — reconnectez-vous avec le nouveau mot de passe.';

  @override
  String get loginForgotPassword => 'Mot de passe oublié — réinitialiser';

  @override
  String get dictationStop => 'Arrêter la dictée';

  @override
  String get dictationStart => 'Dicter — appui long pour changer de langue';

  @override
  String get joditLoadFailed =>
      'L’éditeur n’a pas pu se charger. Réessayez, ou vérifiez que les fichiers Jodit sont bien inclus dans les assets de l’app.';

  @override
  String get languagePickerTitle => 'Langue de l’application';

  @override
  String get languageSearchHint => 'Rechercher une langue…';

  @override
  String get dictationLanguageSearchHint => 'Rechercher une langue…';

  @override
  String get dictationDesktopHint =>
      'Sur ordinateur, la dictée native peut être limitée ; le choix est mémorisé pour les appareils mobiles.';

  @override
  String get currencyPickerTitle => 'Devise';

  @override
  String get addressDistrict => 'Quartier';

  @override
  String get addressPhone => 'Téléphone';

  @override
  String get addressEmail => 'Email';

  @override
  String eiPriceHt(String amount) {
    return '$amount HT';
  }

  @override
  String eiRefAlreadyUsed(String ref) {
    return 'La référence « $ref » est déjà utilisée par un autre produit.';
  }

  @override
  String get eiEditProductTitle => 'Modifier le produit';

  @override
  String eiTaxRate(String rate) {
    return '$rate %';
  }

  @override
  String get eiRefLabel => 'Référence';

  @override
  String get eiRefHint => 'Laisser vide pour générer automatiquement (unique)';

  @override
  String get eiNameLabel => 'Nom';

  @override
  String get eiNameRequired => 'Indiquez un nom de produit.';

  @override
  String get eiDescriptionLabel => 'Description';

  @override
  String get eiPriceExclTax => 'Prix de vente (HT)';

  @override
  String get eiTaxNote => 'Note fiscale (ex. ICMS par État)';

  @override
  String get eiHsInfo =>
      'Le code HS/NCM est informatif (douane). Le taux produit est la référence article (TVA, ICMS…). Devis/factures gardent un taux unique au niveau du document pour les totaux.';

  @override
  String get eiCfop => 'CFOP';

  @override
  String get eiCfopHint => 'ex. 5102 / 6102';

  @override
  String get eiIcmsCst => 'ICMS CST/CSOSN';

  @override
  String get eiIcmsCstHint => 'ex. 40, 60, 102';

  @override
  String get eiPisCofins => 'PIS/COFINS CST';

  @override
  String get eiPisCofinsHint => 'ex. 07, 08, 99';

  @override
  String get eiNfeOverrideHint =>
      'Facultatif — remplace les valeurs NF-e par défaut de l’entreprise (Paramètres) pour cet article uniquement. Laisser vide pour utiliser les valeurs par défaut. Valider avec votre comptable avant utilisation en production.';

  @override
  String get eiNotesSection => 'Notes';

  @override
  String get eiSaveShortcut => 'Enregistrer (⌘S)';

  @override
  String get eiRemoteBody =>
      'e-Invoicing est configurée en stockage distant. Renseigne ici les mêmes identifiants que dans e-Invoicing → Réglages → Stockage distant, pour que le CRM puisse créer des devis/factures via la même API.';

  @override
  String get eiRemoteIndexHint =>
      'Sur le nouvel hébergement, le chemin /index.php est requis (pas de rewrite vers /einvoicing/…).';

  @override
  String get eiRemoteSuccess => 'Connexion réussie.';

  @override
  String eiRemoteFail(String error) {
    return 'Échec : $error';
  }

  @override
  String get eiRemoteTesting => 'Test en cours…';

  @override
  String get invModuleDisplayName => 'EastmarkHK e-Invoicing';

  @override
  String get invModuleDescription =>
      'Devis et factures créés depuis vos clients et opportunités CRM, gérés par l’app EastmarkHK e-Invoicing (incluse — App Store). Reçues, relances et envoi se pilotent dans l’app e-Invoicing.';

  @override
  String get invModulePrice => '5,99 €/mois';

  @override
  String get invInvoiceCreated => 'Facture créée';

  @override
  String get invQuoteCreated => 'Devis créé';

  @override
  String get invModuleAppNotFound =>
      'App e-Invoicing introuvable — installez-la depuis l’App Store et lancez-la une fois, puis réessayez.';

  @override
  String eiCustomerCheckFailed(String error) {
    return 'Vérification client impossible : $error';
  }

  @override
  String get quoteCreatedFromEinvoice => 'Créé depuis e-Invoicing';

  @override
  String quoteCreatedSnackbar(String type, String number) {
    return '$type $number créé dans e-Invoicing';
  }

  @override
  String quoteCreateFailed(String error) {
    return 'Création impossible : $error';
  }

  @override
  String get syncServerOk => 'serveur joignable, identifiants acceptés';

  @override
  String get syncInvalidResponse => 'Réponse serveur invalide';

  @override
  String get syncCancelled => 'Synchronisation annulée';

  @override
  String get syncInProgress => 'Synchronisation déjà en cours';

  @override
  String get syncUpToDate => 'À jour';

  @override
  String syncReceived(int count) {
    return '$count élément(s) reçu(s)';
  }

  @override
  String get syncSentNothingNew => 'Envoyé (rien de nouveau)';

  @override
  String syncSent(int count) {
    return '$count élément(s) envoyé(s)';
  }

  @override
  String syncSentPart(int count) {
    return '$count envoyé(s)';
  }

  @override
  String syncReceivedPart(int count) {
    return '$count reçu(s)';
  }

  @override
  String get syncPullFailed => 'Échec du pull';

  @override
  String get syncPushFailed => 'Échec du push';

  @override
  String get sync401 =>
      '401 — identifiants refusés (compte ou mot de passe incorrect)';

  @override
  String syncServerStatus(int code) {
    return 'Le serveur a répondu $code';
  }

  @override
  String get syncTimeout => 'Le serveur ne répond pas (délai dépassé)';

  @override
  String syncConnectError(String error) {
    return 'Connexion impossible : $error';
  }

  @override
  String get taskKindAction => 'À faire';

  @override
  String get taskKindInfo => 'Info';

  @override
  String get taskActionMessage => 'Message chat';

  @override
  String get taskActionCall => 'Téléphoner';

  @override
  String get taskActionEmail => 'E-mail';

  @override
  String get taskActionMeeting => 'Rendez-vous';

  @override
  String get taskActionOther => 'Autre';

  @override
  String get taskStatusOpen => 'Ouverte';

  @override
  String get taskStatusToApprove => 'À approuver';

  @override
  String get taskStatusApproved => 'Approuvée';

  @override
  String get taskStatusPassed => 'Passée';

  @override
  String get phaseProspect => 'Prospect';

  @override
  String get phaseFirstContact => 'Premier contact';

  @override
  String get phaseContacted => 'Contacté';

  @override
  String get phaseQualification => 'Qualification';

  @override
  String get phaseQuote => 'Devis';

  @override
  String get phaseNegotiation => 'Négociation';

  @override
  String get phaseClosing => 'Closing';

  @override
  String get phaseWon => 'Gagné';

  @override
  String get phaseLost => 'Perdu';

  @override
  String get phaseAfterSales => 'Suivi post-vente';

  @override
  String get clientStatusProspect => 'Prospect';

  @override
  String get clientStatusClient => 'Client';

  @override
  String get clientStatusInactive => 'Inactif';

  @override
  String get contactNoName => 'Sans nom';

  @override
  String get contactRoleDirector => 'Directeur / CEO';

  @override
  String get contactRoleManager => 'Gérant';

  @override
  String get contactRoleBuyer => 'Acheteur';

  @override
  String get contactRoleSales => 'Commercial';

  @override
  String get contactRoleAccounting => 'Comptabilité';

  @override
  String get contactRoleTechnical => 'Technique';

  @override
  String get contactRoleAssistant => 'Assistante';

  @override
  String get contactRoleDecisionMaker => 'Décideur';

  @override
  String get contactRoleOther => 'Autre';

  @override
  String get eiDocumentNotFound => 'Document introuvable dans e-Invoicing.';

  @override
  String get invLicenseActiveSite => 'Abonnement actif — eastmarkhk.com';

  @override
  String get invLicenseActiveAppStore => 'Abonnement actif — App Store';

  @override
  String get invLicenseTrial => 'Essai gratuit';

  @override
  String invOpenInvoicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count factures ouvertes',
      one: '1 facture ouverte',
    );
    return '$_temp0';
  }

  @override
  String get lineQty => 'Qté';

  @override
  String get lineUnitPriceHt => 'PU HT';

  @override
  String get lineUnitPriceVat => 'PU TVAC';

  @override
  String get lineTotalVat => 'Total TVAC';

  @override
  String get eiCreateClient => 'Créer le client';

  @override
  String get eiCreateNew => 'Créer un nouveau';

  @override
  String get eiContinue => 'Continuer';

  @override
  String eiClientCrm(String name) {
    return 'Client CRM : $name';
  }

  @override
  String get eiNoTaxCountry =>
      'Ce pays n’utilise pas de n° fiscal sur les documents (ex. Hong Kong). Le rattachement se fait par email, téléphone, nom, ou lien mémorisé après la première association.';

  @override
  String eiTaxIdMissing(String taxId) {
    return '$taxId manquant sur la fiche CRM. Recommandé pour la facturation électronique et pour éviter les doublons. Saisissez-le ci-dessous ou continuez sans.';
  }

  @override
  String eiSameTaxIdDifferentName(
    String taxId,
    String vatNumber,
    String eiName,
    String crmName,
  ) {
    return 'Même $taxId ($vatNumber) trouvé dans e-Invoicing, mais le nom est différent :\n• e-Invoicing : $eiName\n• CRM : $crmName\n\nUtiliser le client existant, ou en créer un nouveau ?';
  }

  @override
  String eiNameOnlyMatch(String name) {
    return 'Correspondance par nom uniquement (« $name »). Sans n° fiscal / email / téléphone commun, confirmez « Utiliser l’existant » ou créez un nouveau client (le lien sera mémorisé pour la prochaine fois).';
  }

  @override
  String get eiNoMatchNew =>
      'Aucun client correspondant dans e-Invoicing. Un nouveau client sera créé à partir de la fiche CRM.';

  @override
  String get eiNoMatchNewGeneric =>
      'Aucun client correspondant (email / téléphone / nom). Un nouveau client sera créé dans e-Invoicing et le lien sera mémorisé sur cette fiche CRM.';

  @override
  String eiClientFound(String name, String detail) {
    return 'Client trouvé dans e-Invoicing : $name$detail.';
  }

  @override
  String eiHitEmail(String email) {
    return ' — email $email';
  }

  @override
  String eiHitPhone(String phone) {
    return ' — tél. $phone';
  }

  @override
  String get eiHitName => ' — nom';

  @override
  String get eiHitLinked => ' — déjà lié';

  @override
  String get dictationLanguageTitle => 'Langue de dictée';

  @override
  String get eiAddPhoto => 'Ajouter une photo';

  @override
  String openExternalError(String label) {
    return 'Impossible d’ouvrir$label.';
  }

  @override
  String get syncPushFailedShort => 'Échec du push';

  @override
  String get reachEmailSent => 'E-mail ouvert';

  @override
  String get countryPickerTitle => 'Choisir un pays';

  @override
  String get countryPickerSearchHint => 'Rechercher un pays…';

  @override
  String alarmTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rappels',
      one: 'Rappel tâche',
    );
    return '$_temp0';
  }

  @override
  String get alarmMarkDone => 'Marquer fait';

  @override
  String get alarmPostpone15 => '+15 min';

  @override
  String get alarmPostpone1h => '+1 h';

  @override
  String get alarmClose1min => 'Fermer — rappel dans 10 min';

  @override
  String get richColorPickerTitle => 'Couleur du texte';

  @override
  String get eiHitEmailPlain => ' — email';

  @override
  String get eiHitPhonePlain => ' — tél.';

  @override
  String get tasksEditTaskTitle => 'Modifier la tâche';

  @override
  String get activityTaskCreated => 'Tâche créée';

  @override
  String get dictationOfflineTip =>
      'Dictée hors ligne — elle capture souvent le bruit (TV) au lieu de votre voix. Activez « Reconnaissance vocale en ligne » dans Paramètres Windows → Confidentialité → Discours, baissez le bruit, puis réessayez.';

  @override
  String get dictationLanguageFallbackTip =>
      'Cette variante de langue n’est pas installée sur Windows — une variante proche est utilisée. Installez le pack Speech souhaité dans Paramètres → Heure et langue → Speech.';

  @override
  String get dictationStarting => 'Démarrage de la dictée…';

  @override
  String get invChooseLinePhotoTitle => 'Choisir la photo pour le PDF';

  @override
  String get invChooseNewPhoto => 'Choisir un autre fichier…';

  @override
  String get invNoPhoto => 'Sans photo';

  @override
  String get modulesBuyOnMicrosoftStore => 'Obtenir sur le Microsoft Store';

  @override
  String get modulesMicrosoftStoreNote =>
      'Téléchargez EastmarkHK e-Invoicing depuis le Microsoft Store, puis revenez ici pour l’activer dans le CRM.';

  @override
  String get invAcquireMicrosoftStoreBody =>
      'Ce module utilise EastmarkHK e-Invoicing. Téléchargez-le depuis le Microsoft Store, lancez-le une fois, puis revenez ici.';

  @override
  String get invViewOnMicrosoftStore => 'Voir sur le Microsoft Store';
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nl'),
    Locale('no'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @commonCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get commonEdit;

  /// No description provided for @commonSeeAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout voir'**
  String get commonSeeAll;

  /// No description provided for @commonUsernameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant'**
  String get commonUsernameLabel;

  /// No description provided for @commonDisplayNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom affiché'**
  String get commonDisplayNameLabel;

  /// No description provided for @commonPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get commonPasswordLabel;

  /// No description provided for @commonConfirmPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get commonConfirmPasswordLabel;

  /// No description provided for @commonPasswordMismatch.
  ///
  /// In fr, this message translates to:
  /// **'Les mots de passe ne correspondent pas'**
  String get commonPasswordMismatch;

  /// No description provided for @commonUsernameTaken.
  ///
  /// In fr, this message translates to:
  /// **'Cet identifiant est déjà utilisé'**
  String get commonUsernameTaken;

  /// No description provided for @commonChoosePassword.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un mot de passe'**
  String get commonChoosePassword;

  /// No description provided for @commonRequiredFields.
  ///
  /// In fr, this message translates to:
  /// **'Nom et identifiant sont obligatoires'**
  String get commonRequiredFields;

  /// No description provided for @passwordFieldShow.
  ///
  /// In fr, this message translates to:
  /// **'Afficher'**
  String get passwordFieldShow;

  /// No description provided for @passwordFieldHide.
  ///
  /// In fr, this message translates to:
  /// **'Masquer'**
  String get passwordFieldHide;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In fr, this message translates to:
  /// **'Bon retour, {name}'**
  String loginWelcomeBack(String name);

  /// No description provided for @loginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get loginTitle;

  /// No description provided for @loginVerifying.
  ///
  /// In fr, this message translates to:
  /// **'Vérification…'**
  String get loginVerifying;

  /// No description provided for @loginUnlockTouchId.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouiller avec Touch ID'**
  String get loginUnlockTouchId;

  /// No description provided for @loginOr.
  ///
  /// In fr, this message translates to:
  /// **'ou'**
  String get loginOr;

  /// No description provided for @loginRequiredFields.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant et mot de passe requis'**
  String get loginRequiredFields;

  /// No description provided for @loginInvalidCredentials.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant ou mot de passe incorrect'**
  String get loginInvalidCredentials;

  /// No description provided for @loginSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginSubmit;

  /// No description provided for @loginOtherAccount.
  ///
  /// In fr, this message translates to:
  /// **'Autre compte'**
  String get loginOtherAccount;

  /// No description provided for @loginUseSavedAccount.
  ///
  /// In fr, this message translates to:
  /// **'Revenir au compte mémorisé'**
  String get loginUseSavedAccount;

  /// No description provided for @bootstrapWelcome.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get bootstrapWelcome;

  /// No description provided for @bootstrapSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez le compte administrateur pour sécuriser votre CRM.'**
  String get bootstrapSubtitle;

  /// No description provided for @bootstrapSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Créer le compte administrateur'**
  String get bootstrapSubmit;

  /// No description provided for @commonAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get commonAdd;

  /// No description provided for @commonCreate.
  ///
  /// In fr, this message translates to:
  /// **'Créer'**
  String get commonCreate;

  /// No description provided for @commonClose.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get commonClose;

  /// No description provided for @commonNoName.
  ///
  /// In fr, this message translates to:
  /// **'(sans nom)'**
  String get commonNoName;

  /// No description provided for @commonNotesLabel.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get commonNotesLabel;

  /// No description provided for @commonEmailLabel.
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get commonEmailLabel;

  /// No description provided for @commonPhoneLabel.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get commonPhoneLabel;

  /// No description provided for @commonFirstNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Prénom'**
  String get commonFirstNameLabel;

  /// No description provided for @commonLastNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get commonLastNameLabel;

  /// No description provided for @commonCompanyNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la société'**
  String get commonCompanyNameLabel;

  /// No description provided for @messagingCannotOpen.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir {target}.'**
  String messagingCannotOpen(String target);

  /// No description provided for @messagingEmailAppLabel.
  ///
  /// In fr, this message translates to:
  /// **'la messagerie email'**
  String get messagingEmailAppLabel;

  /// No description provided for @messagingPhoneAppLabel.
  ///
  /// In fr, this message translates to:
  /// **'l\'appli téléphone'**
  String get messagingPhoneAppLabel;

  /// No description provided for @messagingIncompleteId.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant incomplet pour ouvrir {label}.'**
  String messagingIncompleteId(String label);

  /// No description provided for @messagingCannotOpenApp.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir {label} — l\'appli est-elle installée ?'**
  String messagingCannotOpenApp(String label);

  /// No description provided for @messagingWechatNote.
  ///
  /// In fr, this message translates to:
  /// **'WeChat n\'expose pas de lien public vers un contact précis — l\'appli s\'ouvre, la conversation reste à sélectionner à la main.'**
  String get messagingWechatNote;

  /// No description provided for @messagingKakaotalkNote.
  ///
  /// In fr, this message translates to:
  /// **'KakaoTalk n\'expose pas de lien public vers un contact précis — l\'appli s\'ouvre, la conversation reste à sélectionner à la main.'**
  String get messagingKakaotalkNote;

  /// No description provided for @messagingPhoneCallLabel.
  ///
  /// In fr, this message translates to:
  /// **'Appel téléphonique'**
  String get messagingPhoneCallLabel;

  /// No description provided for @companyDeleteOpportunityConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette opportunité ?'**
  String get companyDeleteOpportunityConfirm;

  /// No description provided for @companyDeleteContactConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce contact ?'**
  String get companyDeleteContactConfirm;

  /// No description provided for @companyDeleteTaskConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette tâche ?'**
  String get companyDeleteTaskConfirm;

  /// No description provided for @companyDeleteConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce client ?'**
  String get companyDeleteConfirmTitle;

  /// No description provided for @companyDeleteConfirmDetail.
  ///
  /// In fr, this message translates to:
  /// **'{name} — ses contacts, opportunités, tâches et son historique seront supprimés avec lui.'**
  String companyDeleteConfirmDetail(String name);

  /// No description provided for @companyNewNoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle note'**
  String get companyNewNoteTitle;

  /// No description provided for @companyNoteFieldLabel.
  ///
  /// In fr, this message translates to:
  /// **'Note (ou dictez-la)'**
  String get companyNoteFieldLabel;

  /// No description provided for @companyTabOverview.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu'**
  String get companyTabOverview;

  /// No description provided for @companyTabActivity.
  ///
  /// In fr, this message translates to:
  /// **'Activité'**
  String get companyTabActivity;

  /// No description provided for @companyTabTasks.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get companyTabTasks;

  /// No description provided for @companyTabDeals.
  ///
  /// In fr, this message translates to:
  /// **'Opportunités'**
  String get companyTabDeals;

  /// No description provided for @companyContactsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get companyContactsTitle;

  /// No description provided for @companyNoContacts.
  ///
  /// In fr, this message translates to:
  /// **'Aucun contact'**
  String get companyNoContacts;

  /// No description provided for @companyNoActivity.
  ///
  /// In fr, this message translates to:
  /// **'Aucune activité — ajoutez une note.'**
  String get companyNoActivity;

  /// No description provided for @companyNoTasks.
  ///
  /// In fr, this message translates to:
  /// **'Aucune tâche'**
  String get companyNoTasks;

  /// No description provided for @companyNoDeals.
  ///
  /// In fr, this message translates to:
  /// **'Aucune opportunité'**
  String get companyNoDeals;

  /// No description provided for @companyNoteButtonLabel.
  ///
  /// In fr, this message translates to:
  /// **'Note'**
  String get companyNoteButtonLabel;

  /// No description provided for @companyNewClientTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau client'**
  String get companyNewClientTitle;

  /// No description provided for @companyEditClientTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le client'**
  String get companyEditClientTitle;

  /// No description provided for @companyWebsiteLabel.
  ///
  /// In fr, this message translates to:
  /// **'Site web'**
  String get companyWebsiteLabel;

  /// No description provided for @companyPeppolLabel.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant Peppol'**
  String get companyPeppolLabel;

  /// No description provided for @companyPeppolPrefix.
  ///
  /// In fr, this message translates to:
  /// **'Peppol : {value}'**
  String companyPeppolPrefix(String value);

  /// No description provided for @companyTagsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tags (séparés par des virgules)'**
  String get companyTagsLabel;

  /// No description provided for @companyNewContactTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau contact'**
  String get companyNewContactTitle;

  /// No description provided for @companyEditContactTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le contact'**
  String get companyEditContactTitle;

  /// No description provided for @companyAppLabel.
  ///
  /// In fr, this message translates to:
  /// **'Appli'**
  String get companyAppLabel;

  /// No description provided for @companyIdentifierNumberLabel.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant / numéro'**
  String get companyIdentifierNumberLabel;

  /// No description provided for @companyOpenTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir'**
  String get companyOpenTooltip;

  /// No description provided for @companyRemoveTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get companyRemoveTooltip;

  /// No description provided for @companyRoleFieldLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fonction (ex. Acheteur)'**
  String get companyRoleFieldLabel;

  /// No description provided for @companyMessagingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Messageries'**
  String get companyMessagingTitle;

  /// No description provided for @companyNoMessagingHint.
  ///
  /// In fr, this message translates to:
  /// **'Aucune messagerie renseignée — WhatsApp, WeChat, iMessage…'**
  String get companyNoMessagingHint;

  /// No description provided for @companyNoContactInfo.
  ///
  /// In fr, this message translates to:
  /// **'Aucun moyen de contact renseigné pour le moment.'**
  String get companyNoContactInfo;

  /// No description provided for @settingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get settingsTitle;

  /// No description provided for @settingsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Configuration ponctuelle de l\'application.'**
  String get settingsSubtitle;

  /// No description provided for @settingsLanguagesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Langues & devise'**
  String get settingsLanguagesTitle;

  /// No description provided for @settingsAppLanguageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Langue de l\'application'**
  String get settingsAppLanguageLabel;

  /// No description provided for @settingsDictationLanguageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Langue de dictée'**
  String get settingsDictationLanguageLabel;

  /// No description provided for @settingsCurrencyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Devise'**
  String get settingsCurrencyLabel;

  /// No description provided for @settingsFormatsHint.
  ///
  /// In fr, this message translates to:
  /// **'Montants affichés au format 1,234.56 (virgule = milliers, point = décimales) et dates au format jj/mm/aaaa, quelle que soit la langue de l\'interface.'**
  String get settingsFormatsHint;

  /// No description provided for @settingsCompanyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Société'**
  String get settingsCompanyTitle;

  /// No description provided for @settingsCompanySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Identité de la société qui utilise ce CRM — réutilisée plus tard dans le header (marque blanche) et l\'en-tête des documents PDF.'**
  String get settingsCompanySubtitle;

  /// No description provided for @settingsSyncTitle.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation'**
  String get settingsSyncTitle;

  /// No description provided for @settingsSyncSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Par défaut, toutes les données restent en local (SQLite) sur cet appareil.'**
  String get settingsSyncSubtitle;

  /// No description provided for @settingsSyncLocalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Standalone (local uniquement)'**
  String get settingsSyncLocalTitle;

  /// No description provided for @settingsSyncLocalSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune donnée envoyée en dehors de cet appareil'**
  String get settingsSyncLocalSubtitle;

  /// No description provided for @settingsSyncRemoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Base partagée (remote)'**
  String get settingsSyncRemoteTitle;

  /// No description provided for @settingsSyncRemoteSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'HTTPS partagé : compte + mot de passe sur emhk.eastmarkhk.com/crm'**
  String get settingsSyncRemoteSubtitle;

  /// No description provided for @settingsServerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Serveur'**
  String get settingsServerLabel;

  /// No description provided for @settingsAccountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get settingsAccountLabel;

  /// No description provided for @settingsSyncPasswordHint.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe sync (trousseau — jamais dans la base).'**
  String get settingsSyncPasswordHint;

  /// No description provided for @settingsSyncNowButton.
  ///
  /// In fr, this message translates to:
  /// **'Synchroniser maintenant'**
  String get settingsSyncNowButton;

  /// No description provided for @settingsSyncPollHint.
  ///
  /// In fr, this message translates to:
  /// **'Pull automatique toutes les 25 s en tâche de fond ; push immédiat après chaque modification (mode remote actif). Pas de pull pendant une saisie en cours.'**
  String get settingsSyncPollHint;

  /// No description provided for @settingsSyncMissingFields.
  ///
  /// In fr, this message translates to:
  /// **'Serveur, compte et mot de passe requis'**
  String get settingsSyncMissingFields;

  /// No description provided for @settingsModulesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modules'**
  String get settingsModulesTitle;

  /// No description provided for @settingsModulesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'EastmarkHK e-Invoicing, Scanner, Sync… — essai 7 jours ou activation licence.'**
  String get settingsModulesSubtitle;

  /// No description provided for @settingsBrowseModules.
  ///
  /// In fr, this message translates to:
  /// **'Parcourir les modules'**
  String get settingsBrowseModules;

  /// No description provided for @settingsImportExportTitle.
  ///
  /// In fr, this message translates to:
  /// **'Import / export'**
  String get settingsImportExportTitle;

  /// No description provided for @settingsImportExportSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Clients, contacts et opportunités en CSV ; contacts depuis vCard.'**
  String get settingsImportExportSubtitle;

  /// No description provided for @settingsPipelineTitle.
  ///
  /// In fr, this message translates to:
  /// **'Pipeline'**
  String get settingsPipelineTitle;

  /// No description provided for @settingsPipelineSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisez les étapes et leurs libellés.'**
  String get settingsPipelineSubtitle;

  /// No description provided for @settingsConfigureStages.
  ///
  /// In fr, this message translates to:
  /// **'Configurer les étapes'**
  String get settingsConfigureStages;

  /// No description provided for @settingsBackupTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarde locale'**
  String get settingsBackupTitle;

  /// No description provided for @settingsBackupSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Exporte une copie de votre base SQLite — utile avant une mise à jour ou pour archiver.'**
  String get settingsBackupSubtitle;

  /// No description provided for @settingsExportDbButton.
  ///
  /// In fr, this message translates to:
  /// **'Exporter la base (.db)'**
  String get settingsExportDbButton;

  /// No description provided for @settingsBackupShareText.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarde EastmarkHK CRM'**
  String get settingsBackupShareText;

  /// No description provided for @settingsExportError.
  ///
  /// In fr, this message translates to:
  /// **'Export impossible : {error}'**
  String settingsExportError(String error);

  /// No description provided for @settingsUsersTitle.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateurs'**
  String get settingsUsersTitle;

  /// No description provided for @settingsUsersSubtitleAdmin.
  ///
  /// In fr, this message translates to:
  /// **'Comptes, rôles et mots de passe — administrateur et utilisateur.'**
  String get settingsUsersSubtitleAdmin;

  /// No description provided for @settingsUsersSubtitleLocked.
  ///
  /// In fr, this message translates to:
  /// **'Réservé aux administrateurs.'**
  String get settingsUsersSubtitleLocked;

  /// No description provided for @settingsManageUsersButton.
  ///
  /// In fr, this message translates to:
  /// **'Gérer les utilisateurs'**
  String get settingsManageUsersButton;

  /// No description provided for @settingsUsersLockedHint.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous avec un compte administrateur pour voir ou modifier les utilisateurs et leurs mots de passe.'**
  String get settingsUsersLockedHint;

  /// No description provided for @settingsSaveKeychainError.
  ///
  /// In fr, this message translates to:
  /// **'Réglages enregistrés, mais le trousseau sécurisé est indisponible — le mot de passe de sync n\'a pas pu être stocké (relancez l\'app après une reconstruction complète).'**
  String get settingsSaveKeychainError;

  /// No description provided for @settingsSaved.
  ///
  /// In fr, this message translates to:
  /// **'Réglages enregistrés'**
  String get settingsSaved;

  /// No description provided for @settingsLogoutConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter ?'**
  String get settingsLogoutConfirmTitle;

  /// No description provided for @settingsLogoutConfirmDetail.
  ///
  /// In fr, this message translates to:
  /// **'Vous devrez saisir votre mot de passe (ou Touch ID) pour revenir.'**
  String get settingsLogoutConfirmDetail;

  /// No description provided for @settingsLogoutButton.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get settingsLogoutButton;

  /// No description provided for @settingsLogoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Logo de la société'**
  String get settingsLogoTitle;

  /// No description provided for @settingsLogoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Affiché en haut de l\'application et dans la bannière.'**
  String get settingsLogoSubtitle;

  /// No description provided for @settingsLogoEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun logo — ajoutez celui de votre entreprise'**
  String get settingsLogoEmpty;

  /// No description provided for @settingsLogoChoose.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une image'**
  String get settingsLogoChoose;

  /// No description provided for @settingsLogoChange.
  ///
  /// In fr, this message translates to:
  /// **'Changer le logo'**
  String get settingsLogoChange;

  /// No description provided for @usersDeleteSelfError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de supprimer votre propre compte'**
  String get usersDeleteSelfError;

  /// No description provided for @usersDeleteConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cet utilisateur ?'**
  String get usersDeleteConfirmTitle;

  /// No description provided for @usersDeleteConfirmDetail.
  ///
  /// In fr, this message translates to:
  /// **'{displayName} ({username}) perdra l\'accès au CRM.'**
  String usersDeleteConfirmDetail(String displayName, String username);

  /// No description provided for @usersTitle.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateurs'**
  String get usersTitle;

  /// No description provided for @usersSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comptes, rôles et mots de passe.'**
  String get usersSubtitle;

  /// No description provided for @usersAddButton.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateur'**
  String get usersAddButton;

  /// No description provided for @usersEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun utilisateur'**
  String get usersEmptyTitle;

  /// No description provided for @usersEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez le premier compte — il sera administrateur.'**
  String get usersEmptySubtitle;

  /// No description provided for @usersEmptyAction.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel utilisateur'**
  String get usersEmptyAction;

  /// No description provided for @usersDisplayNameSelf.
  ///
  /// In fr, this message translates to:
  /// **'{name} (vous)'**
  String usersDisplayNameSelf(String name);

  /// No description provided for @usersNewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel utilisateur'**
  String get usersNewTitle;

  /// No description provided for @usersEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l\'utilisateur'**
  String get usersEditTitle;

  /// No description provided for @usersLoginIdLabel.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant de connexion'**
  String get usersLoginIdLabel;

  /// No description provided for @usersRoleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rôle'**
  String get usersRoleLabel;

  /// No description provided for @usersNewPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe (laisser vide pour ne pas changer)'**
  String get usersNewPasswordLabel;

  /// No description provided for @usersTouchIdTitle.
  ///
  /// In fr, this message translates to:
  /// **'Touch ID sur cet appareil'**
  String get usersTouchIdTitle;

  /// No description provided for @usersTouchIdSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouiller sans retaper le mot de passe, ici uniquement.'**
  String get usersTouchIdSubtitle;

  /// No description provided for @roleAdministrator.
  ///
  /// In fr, this message translates to:
  /// **'Administrateur'**
  String get roleAdministrator;

  /// No description provided for @roleUser.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateur'**
  String get roleUser;

  /// No description provided for @dashboardTitleEmbedded.
  ///
  /// In fr, this message translates to:
  /// **'Tableau de bord'**
  String get dashboardTitleEmbedded;

  /// No description provided for @dashboardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get dashboardTitle;

  /// No description provided for @dashboardActionsToProcess.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} action à traiter} other{{count} actions à traiter}}'**
  String dashboardActionsToProcess(num count);

  /// No description provided for @dashboardMoreAgendaItems.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{+{count} autre — voir tout} other{+{count} autres — voir tout}}'**
  String dashboardMoreAgendaItems(num count);

  /// No description provided for @dashboardAllReps.
  ///
  /// In fr, this message translates to:
  /// **'Tous les commerciaux'**
  String get dashboardAllReps;

  /// No description provided for @dashboardMeSuffix.
  ///
  /// In fr, this message translates to:
  /// **'{name} (moi)'**
  String dashboardMeSuffix(String name);

  /// No description provided for @dashboardEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre CRM est prêt'**
  String get dashboardEmptyTitle;

  /// No description provided for @dashboardEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez votre premier client, importez un fichier CSV ou explorez les modules à venir.'**
  String get dashboardEmptySubtitle;

  /// No description provided for @dashboardNothingScheduled.
  ///
  /// In fr, this message translates to:
  /// **'Rien de programmé — vos relances apparaîtront ici.'**
  String get dashboardNothingScheduled;

  /// No description provided for @dashboardBucketOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard'**
  String get dashboardBucketOverdue;

  /// No description provided for @dashboardBucketToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get dashboardBucketToday;

  /// No description provided for @dashboardBucketWeek.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine'**
  String get dashboardBucketWeek;

  /// No description provided for @dashboardBucketLater.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get dashboardBucketLater;

  /// No description provided for @dashboardContactedButton.
  ///
  /// In fr, this message translates to:
  /// **'Contacté'**
  String get dashboardContactedButton;

  /// No description provided for @dashboardDoneButton.
  ///
  /// In fr, this message translates to:
  /// **'Fait'**
  String get dashboardDoneButton;

  /// No description provided for @dashboardOpenDeals.
  ///
  /// In fr, this message translates to:
  /// **'Affaires en cours'**
  String get dashboardOpenDeals;

  /// No description provided for @dashboardOpenDealsSeeAll.
  ///
  /// In fr, this message translates to:
  /// **'Voir tout'**
  String get dashboardOpenDealsSeeAll;

  /// No description provided for @dashboardOpenDealsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune affaire en cours.'**
  String get dashboardOpenDealsEmpty;

  /// No description provided for @dashboardTopClients.
  ///
  /// In fr, this message translates to:
  /// **'Top clients (pipeline ouvert)'**
  String get dashboardTopClients;

  /// No description provided for @dashboardPipelineByStage.
  ///
  /// In fr, this message translates to:
  /// **'Pipeline par étape'**
  String get dashboardPipelineByStage;

  /// No description provided for @dashboardNoOpportunitiesYet.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore d\'opportunités'**
  String get dashboardNoOpportunitiesYet;

  /// No description provided for @dashboardWonLostByMonth.
  ///
  /// In fr, this message translates to:
  /// **'Gagné / Perdu par mois'**
  String get dashboardWonLostByMonth;

  /// No description provided for @dashboardNoClosuresYet.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de clôtures enregistrées.'**
  String get dashboardNoClosuresYet;

  /// No description provided for @dashboardRecentActivity.
  ///
  /// In fr, this message translates to:
  /// **'Activité récente'**
  String get dashboardRecentActivity;

  /// No description provided for @dashboardNoActivityYet.
  ///
  /// In fr, this message translates to:
  /// **'Aucune activité pour le moment.'**
  String get dashboardNoActivityYet;

  /// No description provided for @metricClients.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get metricClients;

  /// No description provided for @metricOpportunities.
  ///
  /// In fr, this message translates to:
  /// **'Opportunités'**
  String get metricOpportunities;

  /// No description provided for @metricPipeline.
  ///
  /// In fr, this message translates to:
  /// **'Pipeline'**
  String get metricPipeline;

  /// No description provided for @metricForecast.
  ///
  /// In fr, this message translates to:
  /// **'CA prévi.'**
  String get metricForecast;

  /// No description provided for @metricTasks.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get metricTasks;

  /// No description provided for @metricOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard'**
  String get metricOverdue;

  /// No description provided for @productTagline.
  ///
  /// In fr, this message translates to:
  /// **'Gagnez du temps dès le premier jour.'**
  String get productTagline;

  /// No description provided for @placeholderDashboardHint.
  ///
  /// In fr, this message translates to:
  /// **'Vue d\'ensemble : pipeline, relances et activité récente.'**
  String get placeholderDashboardHint;

  /// No description provided for @placeholderTodayTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre journée'**
  String get placeholderTodayTitle;

  /// No description provided for @placeholderTodayHint.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez une relance à gauche.\nLe client s\'ouvre ici — sans changer d\'écran.'**
  String get placeholderTodayHint;

  /// No description provided for @placeholderClientsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fiche client'**
  String get placeholderClientsTitle;

  /// No description provided for @placeholderClientsHint.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez un client dans la liste,\n ou créez-en un avec le bouton +.'**
  String get placeholderClientsHint;

  /// No description provided for @placeholderPipelineHint.
  ///
  /// In fr, this message translates to:
  /// **'Glissez une carte entre les colonnes.\nCliquez pour ouvrir la fiche client.'**
  String get placeholderPipelineHint;

  /// No description provided for @placeholderTasksHint.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez une tâche pour voir le client concerné.'**
  String get placeholderTasksHint;

  /// No description provided for @modulesSubtitleAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Abonnez-vous via l\'App Store, ou activez un abonnement déjà acheté sur eastmarkhk.com.'**
  String get modulesSubtitleAppStore;

  /// No description provided for @modulesSubtitleWebStore.
  ///
  /// In fr, this message translates to:
  /// **'Essai gratuit, achat sur eastmarkhk.com — même abonnement que l\'app EastmarkHK e-Invoicing.'**
  String get modulesSubtitleWebStore;

  /// No description provided for @modulesStatusActiveAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Actif — App Store'**
  String get modulesStatusActiveAppStore;

  /// No description provided for @modulesStatusActiveWeb.
  ///
  /// In fr, this message translates to:
  /// **'Actif — eastmarkhk.com'**
  String get modulesStatusActiveWeb;

  /// No description provided for @modulesStatusTrial.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{Essai — {count} jour restant} other{Essai — {count} jours restants}}'**
  String modulesStatusTrial(num count);

  /// No description provided for @modulesStatusActive.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get modulesStatusActive;

  /// No description provided for @modulesStatusAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Disponible'**
  String get modulesStatusAvailable;

  /// No description provided for @modulesBuyFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de lancer l\'achat. Réessayez ou restaurez vos achats.'**
  String get modulesBuyFailed;

  /// No description provided for @modulesRestoreDone.
  ///
  /// In fr, this message translates to:
  /// **'Restauration terminée.'**
  String get modulesRestoreDone;

  /// No description provided for @modulesImportedFromEinvoicing.
  ///
  /// In fr, this message translates to:
  /// **'{name} activé depuis l\'app installée.'**
  String modulesImportedFromEinvoicing(String name);

  /// No description provided for @modulesLicenseNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Licence introuvable automatiquement. Ouvrez EastmarkHK e-Invoicing → Réglages, copiez votre code d\'activation, puis « Activer un code web ».'**
  String get modulesLicenseNotFound;

  /// No description provided for @modulesRenewalNote.
  ///
  /// In fr, this message translates to:
  /// **'Renouvellement automatique via l\'App Store. Gérez l\'abonnement dans Réglages → Apple ID → Abonnements.'**
  String get modulesRenewalNote;

  /// No description provided for @modulesWebStoreNote.
  ///
  /// In fr, this message translates to:
  /// **'Ou abonnez-vous sur eastmarkhk.com et activez avec le code reçu par e-mail.'**
  String get modulesWebStoreNote;

  /// No description provided for @modulesHaveEinvoicing.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai déjà EastmarkHK e-Invoicing'**
  String get modulesHaveEinvoicing;

  /// No description provided for @modulesTry7Days.
  ///
  /// In fr, this message translates to:
  /// **'Essayer 7 jours'**
  String get modulesTry7Days;

  /// No description provided for @modulesSubscribe.
  ///
  /// In fr, this message translates to:
  /// **'S\'abonner'**
  String get modulesSubscribe;

  /// No description provided for @modulesRestore.
  ///
  /// In fr, this message translates to:
  /// **'Restaurer les achats'**
  String get modulesRestore;

  /// No description provided for @modulesWebSubscription.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement eastmarkhk.com'**
  String get modulesWebSubscription;

  /// No description provided for @modulesActivateWebCode.
  ///
  /// In fr, this message translates to:
  /// **'Activer un code web'**
  String get modulesActivateWebCode;

  /// No description provided for @modulesUseInCrm.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser dans le CRM'**
  String get modulesUseInCrm;

  /// No description provided for @modulesDontUseInCrm.
  ///
  /// In fr, this message translates to:
  /// **'Ne pas utiliser dans le CRM'**
  String get modulesDontUseInCrm;

  /// No description provided for @modulesBuyOnAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Acheter sur l\'App Store'**
  String get modulesBuyOnAppStore;

  /// No description provided for @modulesStoreUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'L\'App Store n\'est pas disponible sur cette installation. Utilisez une build App Store, ou activez un abonnement eastmarkhk.com.'**
  String get modulesStoreUnavailable;

  /// No description provided for @modulesCheckingPurchases.
  ///
  /// In fr, this message translates to:
  /// **'Vérification des achats App Store et eastmarkhk.com…'**
  String get modulesCheckingPurchases;

  /// No description provided for @modulesCheckingAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Vérification des achats App Store…'**
  String get modulesCheckingAppStore;

  /// No description provided for @modulesPerMonth.
  ///
  /// In fr, this message translates to:
  /// **'/ mois'**
  String get modulesPerMonth;

  /// No description provided for @modulesActivationSubtitleAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Vous vous êtes abonné sur eastmarkhk.com ? Collez le code reçu par e-mail. Sur iPhone/iPad, l\'achat initial se fait via l\'App Store ou le site avant activation.'**
  String get modulesActivationSubtitleAppStore;

  /// No description provided for @modulesActivationSubtitleWeb.
  ///
  /// In fr, this message translates to:
  /// **'Abonnez-vous sur eastmarkhk.com, puis collez le code d\'activation lié à cet appareil.'**
  String get modulesActivationSubtitleWeb;

  /// No description provided for @modulesMachineId.
  ///
  /// In fr, this message translates to:
  /// **'Machine ID'**
  String get modulesMachineId;

  /// No description provided for @modulesCopy.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get modulesCopy;

  /// No description provided for @modulesSubscriptionEmailLabel.
  ///
  /// In fr, this message translates to:
  /// **'E-mail d\'abonnement'**
  String get modulesSubscriptionEmailLabel;

  /// No description provided for @modulesActivationCodeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Code d\'activation'**
  String get modulesActivationCodeLabel;

  /// No description provided for @modulesActivationCodeHint.
  ///
  /// In fr, this message translates to:
  /// **'Collez le code reçu après achat'**
  String get modulesActivationCodeHint;

  /// No description provided for @modulesActivate.
  ///
  /// In fr, this message translates to:
  /// **'Activer'**
  String get modulesActivate;

  /// No description provided for @modulesBuyOnWebsite.
  ///
  /// In fr, this message translates to:
  /// **'Acheter sur eastmarkhk.com'**
  String get modulesBuyOnWebsite;

  /// No description provided for @modulesRequestCodeByEmail.
  ///
  /// In fr, this message translates to:
  /// **'Demander un code par e-mail'**
  String get modulesRequestCodeByEmail;

  /// No description provided for @modulesActivatedViaWebsite.
  ///
  /// In fr, this message translates to:
  /// **'{name} activé via eastmarkhk.com'**
  String modulesActivatedViaWebsite(String name);

  /// No description provided for @modulesMachineIdCopied.
  ///
  /// In fr, this message translates to:
  /// **'Machine ID copié'**
  String get modulesMachineIdCopied;

  /// No description provided for @modulesEmailRequired.
  ///
  /// In fr, this message translates to:
  /// **'Indiquez votre e-mail d\'abonnement'**
  String get modulesEmailRequired;

  /// No description provided for @invNewQuote.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau devis'**
  String get invNewQuote;

  /// No description provided for @invNewInvoice.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle facture'**
  String get invNewInvoice;

  /// No description provided for @invSectionQuote.
  ///
  /// In fr, this message translates to:
  /// **'Devis'**
  String get invSectionQuote;

  /// No description provided for @invSectionInvoice.
  ///
  /// In fr, this message translates to:
  /// **'Facture'**
  String get invSectionInvoice;

  /// No description provided for @invFieldClient.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get invFieldClient;

  /// No description provided for @invPickClientTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un client'**
  String get invPickClientTitle;

  /// No description provided for @invPickClientSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher par nom, n° fiscal, pays…'**
  String get invPickClientSearch;

  /// No description provided for @invPickClientEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun client correspondant.'**
  String get invPickClientEmpty;

  /// No description provided for @invPickClientButton.
  ///
  /// In fr, this message translates to:
  /// **'Choisir le client'**
  String get invPickClientButton;

  /// No description provided for @invClientRequired.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un client avant d’enregistrer.'**
  String get invClientRequired;

  /// No description provided for @invFieldDate.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get invFieldDate;

  /// No description provided for @invFieldDueDate.
  ///
  /// In fr, this message translates to:
  /// **'Échéance'**
  String get invFieldDueDate;

  /// No description provided for @invFieldValidUntil.
  ///
  /// In fr, this message translates to:
  /// **'Valable jusqu\'au'**
  String get invFieldValidUntil;

  /// No description provided for @invFieldStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get invFieldStatus;

  /// No description provided for @invFieldVatPercent.
  ///
  /// In fr, this message translates to:
  /// **'TVA %'**
  String get invFieldVatPercent;

  /// No description provided for @invStatusDraft.
  ///
  /// In fr, this message translates to:
  /// **'Brouillon'**
  String get invStatusDraft;

  /// No description provided for @invStatusSent.
  ///
  /// In fr, this message translates to:
  /// **'Envoyée'**
  String get invStatusSent;

  /// No description provided for @invStatusAccepted.
  ///
  /// In fr, this message translates to:
  /// **'Accepté'**
  String get invStatusAccepted;

  /// No description provided for @invStatusRejected.
  ///
  /// In fr, this message translates to:
  /// **'Refusé'**
  String get invStatusRejected;

  /// No description provided for @invStatusInvoiced.
  ///
  /// In fr, this message translates to:
  /// **'Facturé'**
  String get invStatusInvoiced;

  /// No description provided for @invStatusPartial.
  ///
  /// In fr, this message translates to:
  /// **'Partiel'**
  String get invStatusPartial;

  /// No description provided for @invStatusPaid.
  ///
  /// In fr, this message translates to:
  /// **'Payée'**
  String get invStatusPaid;

  /// No description provided for @invStatusOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard'**
  String get invStatusOverdue;

  /// No description provided for @invStatusCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Annulée'**
  String get invStatusCancelled;

  /// No description provided for @invLinesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lignes'**
  String get invLinesTitle;

  /// No description provided for @invNotesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get invNotesTitle;

  /// No description provided for @invCreate.
  ///
  /// In fr, this message translates to:
  /// **'Créer'**
  String get invCreate;

  /// No description provided for @invCreating.
  ///
  /// In fr, this message translates to:
  /// **'Création…'**
  String get invCreating;

  /// No description provided for @invSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get invSave;

  /// No description provided for @invSaving.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement…'**
  String get invSaving;

  /// No description provided for @invEditQuote.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le devis {number}'**
  String invEditQuote(String number);

  /// No description provided for @invEditInvoice.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la facture {number}'**
  String invEditInvoice(String number);

  /// No description provided for @invDocumentSaved.
  ///
  /// In fr, this message translates to:
  /// **'{number} enregistré.'**
  String invDocumentSaved(String number);

  /// No description provided for @invDocumentSaveFailed.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible : {error}'**
  String invDocumentSaveFailed(String error);

  /// No description provided for @invEditDocument.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get invEditDocument;

  /// No description provided for @invAddFromCatalog.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter depuis le catalogue'**
  String get invAddFromCatalog;

  /// No description provided for @invAddFreeLine.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une ligne'**
  String get invAddFreeLine;

  /// No description provided for @invEmptyLines.
  ///
  /// In fr, this message translates to:
  /// **'Aucune ligne — ajoutez un produit du catalogue ou une ligne libre.'**
  String get invEmptyLines;

  /// No description provided for @invUpdateProductTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour le produit'**
  String get invUpdateProductTooltip;

  /// No description provided for @invAddToCatalogTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter au catalogue'**
  String get invAddToCatalogTooltip;

  /// No description provided for @invDeleteLineTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la ligne'**
  String get invDeleteLineTooltip;

  /// No description provided for @invChangePhotoTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Changer la photo'**
  String get invChangePhotoTooltip;

  /// No description provided for @invAddPhotoTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une photo'**
  String get invAddPhotoTooltip;

  /// No description provided for @invProductUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Produit mis à jour (prix et photos).'**
  String get invProductUpdated;

  /// No description provided for @invProductSaved.
  ///
  /// In fr, this message translates to:
  /// **'Ligne enregistrée dans le catalogue (avec photos).'**
  String get invProductSaved;

  /// No description provided for @invClientLinkedHint.
  ///
  /// In fr, this message translates to:
  /// **'Le client CRM est déjà lié : le document sera créé dans e-Invoicing pour ce même client.'**
  String get invClientLinkedHint;

  /// No description provided for @invFooterHint.
  ///
  /// In fr, this message translates to:
  /// **'Le document est créé dans EastmarkHK e-Invoicing — mise en page, PDF, envoi et suivi se font dans l\'app e-Invoicing.'**
  String get invFooterHint;

  /// No description provided for @invNeedLines.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez au moins une ligne avec une description.'**
  String get invNeedLines;

  /// No description provided for @invSubtotalHt.
  ///
  /// In fr, this message translates to:
  /// **'Sous-total HT'**
  String get invSubtotalHt;

  /// No description provided for @invVat.
  ///
  /// In fr, this message translates to:
  /// **'TVA'**
  String get invVat;

  /// No description provided for @invTotalTtc.
  ///
  /// In fr, this message translates to:
  /// **'Total TTC'**
  String get invTotalTtc;

  /// No description provided for @invCatalogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue produits'**
  String get invCatalogTitle;

  /// No description provided for @invCatalogSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un produit…'**
  String get invCatalogSearch;

  /// No description provided for @invCatalogEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun produit — créez-les dans e-Invoicing.'**
  String get invCatalogEmpty;

  /// No description provided for @invHomeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Devis et factures — données EastmarkHK e-Invoicing (reçues et relances : app standalone)'**
  String get invHomeSubtitle;

  /// No description provided for @invOpenStandalone.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir e-Invoicing'**
  String get invOpenStandalone;

  /// No description provided for @invLaunchStandalone.
  ///
  /// In fr, this message translates to:
  /// **'Lancer e-Invoicing'**
  String get invLaunchStandalone;

  /// No description provided for @invRemoteConnectionTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Connexion distante'**
  String get invRemoteConnectionTooltip;

  /// No description provided for @invTabQuotes.
  ///
  /// In fr, this message translates to:
  /// **'Devis ({count})'**
  String invTabQuotes(int count);

  /// No description provided for @invTabInvoices.
  ///
  /// In fr, this message translates to:
  /// **'Factures ({count})'**
  String invTabInvoices(int count);

  /// No description provided for @invEmptyQuotes.
  ///
  /// In fr, this message translates to:
  /// **'Aucun devis — créez-en un depuis une opportunité gagnée ou le bouton ci-dessus.'**
  String get invEmptyQuotes;

  /// No description provided for @invEmptyInvoices.
  ///
  /// In fr, this message translates to:
  /// **'Aucune facture.'**
  String get invEmptyInvoices;

  /// No description provided for @invEmptyCompanyDocs.
  ///
  /// In fr, this message translates to:
  /// **'Aucun devis ni facture.'**
  String get invEmptyCompanyDocs;

  /// No description provided for @invQuotesSection.
  ///
  /// In fr, this message translates to:
  /// **'DEVIS'**
  String get invQuotesSection;

  /// No description provided for @invInvoicesSection.
  ///
  /// In fr, this message translates to:
  /// **'FACTURES'**
  String get invInvoicesSection;

  /// No description provided for @invCompanyFooter.
  ///
  /// In fr, this message translates to:
  /// **'Documents gérés par EastmarkHK e-Invoicing — envoi, PDF, reçues et relances dans l\'app standalone.'**
  String get invCompanyFooter;

  /// No description provided for @invRemoteNotConfigured.
  ///
  /// In fr, this message translates to:
  /// **'e-Invoicing est en mode distant — connexion non configurée.'**
  String get invRemoteNotConfigured;

  /// No description provided for @invConfigure.
  ///
  /// In fr, this message translates to:
  /// **'Configurer'**
  String get invConfigure;

  /// No description provided for @invAppNotDetected.
  ///
  /// In fr, this message translates to:
  /// **'App e-Invoicing non détectée — installez/lancez EastmarkHK e-Invoicing pour créer des devis et factures depuis cette fiche.'**
  String get invAppNotDetected;

  /// No description provided for @invRemoteSetupBody.
  ///
  /// In fr, this message translates to:
  /// **'EastmarkHK e-Invoicing est configurée en mode « stockage distant ». Renseigne les mêmes identifiants ici pour connecter le CRM à la même API — mêmes valeurs que dans e-Invoicing → Réglages → Stockage distant.'**
  String get invRemoteSetupBody;

  /// No description provided for @invLaunchOnceBody.
  ///
  /// In fr, this message translates to:
  /// **'Lancez l\'app EastmarkHK e-Invoicing une première fois pour initialiser la base partagée, puis revenez ici.'**
  String get invLaunchOnceBody;

  /// No description provided for @invAcquireAppStoreBody.
  ///
  /// In fr, this message translates to:
  /// **'Le module utilise l\'app EastmarkHK e-Invoicing. Téléchargez-la et abonnez-vous depuis l\'App Store, lancez-la une fois, puis revenez ici.'**
  String get invAcquireAppStoreBody;

  /// No description provided for @invAcquireWebBody.
  ///
  /// In fr, this message translates to:
  /// **'Le module utilise l\'app EastmarkHK e-Invoicing. Téléchargez-la et souscrivez sur eastmarkhk.com, lancez-la une fois, puis revenez ici.'**
  String get invAcquireWebBody;

  /// No description provided for @invConfigureRemote.
  ///
  /// In fr, this message translates to:
  /// **'Configurer la connexion distante'**
  String get invConfigureRemote;

  /// No description provided for @invViewOnAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Voir sur l\'App Store'**
  String get invViewOnAppStore;

  /// No description provided for @invViewOnWebsite.
  ///
  /// In fr, this message translates to:
  /// **'Voir sur eastmarkhk.com'**
  String get invViewOnWebsite;

  /// No description provided for @invRetry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get invRetry;

  /// No description provided for @invDocInvoice.
  ///
  /// In fr, this message translates to:
  /// **'Facture'**
  String get invDocInvoice;

  /// No description provided for @invDocQuote.
  ///
  /// In fr, this message translates to:
  /// **'Devis'**
  String get invDocQuote;

  /// No description provided for @invDocClient.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get invDocClient;

  /// No description provided for @invDocStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get invDocStatus;

  /// No description provided for @invDocDate.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get invDocDate;

  /// No description provided for @invOpenInStandalone.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir dans e-Invoicing'**
  String get invOpenInStandalone;

  /// No description provided for @invOpenStandaloneFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir e-Invoicing — vérifie qu\'elle est bien installée.'**
  String get invOpenStandaloneFailed;

  /// No description provided for @invCreateInvoiceFromQuote.
  ///
  /// In fr, this message translates to:
  /// **'Créer la facture'**
  String get invCreateInvoiceFromQuote;

  /// No description provided for @invCreatingInvoice.
  ///
  /// In fr, this message translates to:
  /// **'Création de la facture…'**
  String get invCreatingInvoice;

  /// No description provided for @invInvoiceCreatedFromQuote.
  ///
  /// In fr, this message translates to:
  /// **'Facture {number} créée à partir du devis.'**
  String invInvoiceCreatedFromQuote(String number);

  /// No description provided for @invQuoteAlreadyInvoiced.
  ///
  /// In fr, this message translates to:
  /// **'Ce devis est déjà facturé.'**
  String get invQuoteAlreadyInvoiced;

  /// No description provided for @invCreateInvoiceFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de créer la facture : {error}'**
  String invCreateInvoiceFailed(String error);

  /// No description provided for @invLinkMenu.
  ///
  /// In fr, this message translates to:
  /// **'Lien e-Invoicing'**
  String get invLinkMenu;

  /// No description provided for @invLinkStatusLinked.
  ///
  /// In fr, this message translates to:
  /// **'Client e-Invoicing lié'**
  String get invLinkStatusLinked;

  /// No description provided for @invLinkStatusNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucun lien e-Invoicing mémorisé'**
  String get invLinkStatusNone;

  /// No description provided for @invUnlinkCustomer.
  ///
  /// In fr, this message translates to:
  /// **'Dissocier le client e-Invoicing'**
  String get invUnlinkCustomer;

  /// No description provided for @invUnlinkConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dissocier le client ?'**
  String get invUnlinkConfirmTitle;

  /// No description provided for @invUnlinkConfirmBody.
  ///
  /// In fr, this message translates to:
  /// **'Le prochain devis ou facture redemandera de choisir ou créer le client dans e-Invoicing.'**
  String get invUnlinkConfirmBody;

  /// No description provided for @invUnlinkDone.
  ///
  /// In fr, this message translates to:
  /// **'Lien e-Invoicing dissocié.'**
  String get invUnlinkDone;

  /// No description provided for @invAppStoreUrlMissing.
  ///
  /// In fr, this message translates to:
  /// **'L\'app e-Invoicing n\'est pas encore listée sur l\'App Store pour ce build. Utilisez eastmarkhk.com ou lancez l\'app déjà installée.'**
  String get invAppStoreUrlMissing;

  /// No description provided for @shellModuleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Module'**
  String get shellModuleTitle;

  /// No description provided for @shellFollowupTitle.
  ///
  /// In fr, this message translates to:
  /// **'Suivi'**
  String get shellFollowupTitle;

  /// No description provided for @shellClientTitle.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get shellClientTitle;

  /// No description provided for @shellModulesTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Modules'**
  String get shellModulesTooltip;

  /// No description provided for @shellAgendaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Agenda'**
  String get shellAgendaLabel;

  /// No description provided for @shellClientsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get shellClientsLabel;

  /// No description provided for @shellTasksLabel.
  ///
  /// In fr, this message translates to:
  /// **'Suivis'**
  String get shellTasksLabel;

  /// No description provided for @shellNewFollowup.
  ///
  /// In fr, this message translates to:
  /// **'Suivi'**
  String get shellNewFollowup;

  /// No description provided for @shellNewClient.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get shellNewClient;

  /// No description provided for @shellModulesLabel.
  ///
  /// In fr, this message translates to:
  /// **'Modules'**
  String get shellModulesLabel;

  /// No description provided for @shellSettingsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get shellSettingsLabel;

  /// No description provided for @tasksSelectPrompt.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez une tâche'**
  String get tasksSelectPrompt;

  /// No description provided for @dashOverviewSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vue d’ensemble · {month}'**
  String dashOverviewSubtitle(String month);

  /// No description provided for @dashOpenFollowups.
  ///
  /// In fr, this message translates to:
  /// **'Suivis ouverts'**
  String get dashOpenFollowups;

  /// No description provided for @dashOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard'**
  String get dashOverdue;

  /// No description provided for @dashToApprove.
  ///
  /// In fr, this message translates to:
  /// **'À approuver'**
  String get dashToApprove;

  /// No description provided for @dashProspects.
  ///
  /// In fr, this message translates to:
  /// **'Prospects'**
  String get dashProspects;

  /// No description provided for @dashActiveClients.
  ///
  /// In fr, this message translates to:
  /// **'Clients actifs'**
  String get dashActiveClients;

  /// No description provided for @dashInactive.
  ///
  /// In fr, this message translates to:
  /// **'Inactifs / perdus'**
  String get dashInactive;

  /// No description provided for @dashQuotes.
  ///
  /// In fr, this message translates to:
  /// **'Devis'**
  String get dashQuotes;

  /// No description provided for @dashOpenInvoices.
  ///
  /// In fr, this message translates to:
  /// **'Factures ouvertes'**
  String get dashOpenInvoices;

  /// No description provided for @dashPaidInvoices.
  ///
  /// In fr, this message translates to:
  /// **'Factures payées'**
  String get dashPaidInvoices;

  /// No description provided for @dashRecentActions.
  ///
  /// In fr, this message translates to:
  /// **'Dernières actions'**
  String get dashRecentActions;

  /// No description provided for @dashNoRecentActions.
  ///
  /// In fr, this message translates to:
  /// **'Aucune action récente — les suivis, appels, e-mails et documents apparaîtront ici.'**
  String get dashNoRecentActions;

  /// No description provided for @dashRecentDone.
  ///
  /// In fr, this message translates to:
  /// **'Réalisés récemment'**
  String get dashRecentDone;

  /// No description provided for @dashNoClosed.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de suivis clôturés.'**
  String get dashNoClosed;

  /// No description provided for @dashModules.
  ///
  /// In fr, this message translates to:
  /// **'Modules'**
  String get dashModules;

  /// No description provided for @dashOpenCaHint.
  ///
  /// In fr, this message translates to:
  /// **'CA ouvert : factures non payées (voir e-Invoicing pour le détail).'**
  String get dashOpenCaHint;

  /// No description provided for @dashDoneBadge.
  ///
  /// In fr, this message translates to:
  /// **'Fait'**
  String get dashDoneBadge;

  /// No description provided for @dashPassedBadge.
  ///
  /// In fr, this message translates to:
  /// **'Passé'**
  String get dashPassedBadge;

  /// No description provided for @clientEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez un client'**
  String get clientEmptyTitle;

  /// No description provided for @clientEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ou créez-en un pour démarrer le suivi.'**
  String get clientEmptySubtitle;

  /// No description provided for @clientEinvoiceBadge.
  ///
  /// In fr, this message translates to:
  /// **'E-facture / Peppol'**
  String get clientEinvoiceBadge;

  /// No description provided for @clientNoContactsHint.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez au moins un contact (avec son rôle) pour cette entreprise.'**
  String get clientNoContactsHint;

  /// No description provided for @clientFollowupsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Suivi / tâches'**
  String get clientFollowupsTitle;

  /// No description provided for @clientPlanAction.
  ///
  /// In fr, this message translates to:
  /// **'Planifier'**
  String get clientPlanAction;

  /// No description provided for @clientNoTasksHint.
  ///
  /// In fr, this message translates to:
  /// **'Planifiez les phases : premier contact, relance, rendez-vous…'**
  String get clientNoTasksHint;

  /// No description provided for @clientEinvoiceError.
  ///
  /// In fr, this message translates to:
  /// **'E-facturation indisponible : {error}'**
  String clientEinvoiceError(String error);

  /// No description provided for @clientPrimaryBadge.
  ///
  /// In fr, this message translates to:
  /// **'Principal'**
  String get clientPrimaryBadge;

  /// No description provided for @tasksTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get tasksTitle;

  /// No description provided for @tasksNewButton.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle tâche'**
  String get tasksNewButton;

  /// No description provided for @tasksOpenCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 ouverte} other{{count} ouvertes}}'**
  String tasksOpenCount(int count);

  /// No description provided for @tasksAllReps.
  ///
  /// In fr, this message translates to:
  /// **'Tous les commerciaux'**
  String get tasksAllReps;

  /// No description provided for @tasksAllDoneTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tout est fait !'**
  String get tasksAllDoneTitle;

  /// No description provided for @tasksAllDoneSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez une tâche — ou dictez-la après un appel.'**
  String get tasksAllDoneSubtitle;

  /// No description provided for @tasksClientLabel.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get tasksClientLabel;

  /// No description provided for @tasksClientOptional.
  ///
  /// In fr, this message translates to:
  /// **'Client (optionnel)'**
  String get tasksClientOptional;

  /// No description provided for @tasksClientRequired.
  ///
  /// In fr, this message translates to:
  /// **'Client *'**
  String get tasksClientRequired;

  /// No description provided for @tasksNoClient.
  ///
  /// In fr, this message translates to:
  /// **'Sans client (ex. exécuter une tâche perso)'**
  String get tasksNoClient;

  /// No description provided for @tasksMessageHint.
  ///
  /// In fr, this message translates to:
  /// **'Message (ex. Appeler le client, exécuter une tâche…)'**
  String get tasksMessageHint;

  /// No description provided for @tasksDueLabel.
  ///
  /// In fr, this message translates to:
  /// **'Échéance'**
  String get tasksDueLabel;

  /// No description provided for @tasksNoDue.
  ///
  /// In fr, this message translates to:
  /// **'Pas d’échéance'**
  String get tasksNoDue;

  /// No description provided for @dueLabelOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard · {days} j · {date}'**
  String dueLabelOverdue(int days, String date);

  /// No description provided for @dueLabelToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd’hui · {date}'**
  String dueLabelToday(String date);

  /// No description provided for @dueLabelTomorrow.
  ///
  /// In fr, this message translates to:
  /// **'Demain · {date}'**
  String dueLabelTomorrow(String date);

  /// No description provided for @dueLabelInDays.
  ///
  /// In fr, this message translates to:
  /// **'{weekdayDate} · dans {days} j'**
  String dueLabelInDays(String weekdayDate, int days);

  /// No description provided for @dueGroupTodayWithDate.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd’hui · {date}'**
  String dueGroupTodayWithDate(String date);

  /// No description provided for @dueGroupTomorrowWithDate.
  ///
  /// In fr, this message translates to:
  /// **'Demain · {date}'**
  String dueGroupTomorrowWithDate(String date);

  /// No description provided for @dueGroupWeekWithDate.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine · {date}'**
  String dueGroupWeekWithDate(String date);

  /// No description provided for @dueGroupWeekWithRange.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine · {from} → {to}'**
  String dueGroupWeekWithRange(String from, String to);

  /// No description provided for @dueGroupLaterWithDate.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard · {date}'**
  String dueGroupLaterWithDate(String date);

  /// No description provided for @dueGroupLaterWithRange.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard · {from} → {to}'**
  String dueGroupLaterWithRange(String from, String to);

  /// No description provided for @bannerSyncNotEnabledTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation non activée — cliquer pour l’activer'**
  String get bannerSyncNotEnabledTooltip;

  /// No description provided for @bannerSyncInProgressTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation en cours…'**
  String get bannerSyncInProgressTooltip;

  /// No description provided for @bannerSyncErrorTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Erreur sync — cliquer pour réessayer'**
  String get bannerSyncErrorTooltip;

  /// No description provided for @bannerSyncLastAtTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Dernière sync : {date}'**
  String bannerSyncLastAtTooltip(String date);

  /// No description provided for @bannerSyncIdleTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Synchroniser'**
  String get bannerSyncIdleTooltip;

  /// No description provided for @bannerCompanyPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Votre entreprise'**
  String get bannerCompanyPlaceholder;

  /// No description provided for @tasksDateButton.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get tasksDateButton;

  /// No description provided for @tasksTimeButton.
  ///
  /// In fr, this message translates to:
  /// **'Heure'**
  String get tasksTimeButton;

  /// No description provided for @tasksClearButton.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get tasksClearButton;

  /// No description provided for @tasksAssignedTo.
  ///
  /// In fr, this message translates to:
  /// **'Assigné à'**
  String get tasksAssignedTo;

  /// No description provided for @tasksUnassigned.
  ///
  /// In fr, this message translates to:
  /// **'Non assigné'**
  String get tasksUnassigned;

  /// No description provided for @tasksNewTaskTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle tâche'**
  String get tasksNewTaskTitle;

  /// No description provided for @pipelineNewOpportunity.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle opportunité'**
  String get pipelineNewOpportunity;

  /// No description provided for @pipelineTitleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Titre'**
  String get pipelineTitleLabel;

  /// No description provided for @pipelineAmountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Montant'**
  String get pipelineAmountLabel;

  /// No description provided for @pipelineMoveTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Déplacer'**
  String get pipelineMoveTooltip;

  /// No description provided for @pipelineTitle.
  ///
  /// In fr, this message translates to:
  /// **'Pipeline'**
  String get pipelineTitle;

  /// No description provided for @pipelineNoOpen.
  ///
  /// In fr, this message translates to:
  /// **'Aucune opportunité ouverte'**
  String get pipelineNoOpen;

  /// No description provided for @pipelineOpenCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 opportunité ouverte} other{{count} opportunités ouvertes}}'**
  String pipelineOpenCount(int count);

  /// No description provided for @pipelineEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre pipeline est vide'**
  String get pipelineEmptyTitle;

  /// No description provided for @pipelineEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez une opportunité puis glissez-la d’étape en étape.'**
  String get pipelineEmptySubtitle;

  /// No description provided for @pipelineBoardEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Pipeline vide'**
  String get pipelineBoardEmptyTitle;

  /// No description provided for @pipelineBoardEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez une opportunité, puis glissez-la entre les étapes.'**
  String get pipelineBoardEmptySubtitle;

  /// No description provided for @pipelineDragHint.
  ///
  /// In fr, this message translates to:
  /// **'Glisser pour déplacer'**
  String get pipelineDragHint;

  /// No description provided for @pipelineCreatedOn.
  ///
  /// In fr, this message translates to:
  /// **'Créée le {date}'**
  String pipelineCreatedOn(String date);

  /// No description provided for @pipelineStageSince.
  ///
  /// In fr, this message translates to:
  /// **'Stade depuis le {date}'**
  String pipelineStageSince(String date);

  /// No description provided for @agendaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Agenda'**
  String get agendaTitle;

  /// No description provided for @agendaToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd’hui'**
  String get agendaToday;

  /// No description provided for @agendaUpcoming.
  ///
  /// In fr, this message translates to:
  /// **'Prochains jours'**
  String get agendaUpcoming;

  /// No description provided for @agendaEmptyToday.
  ///
  /// In fr, this message translates to:
  /// **'Rien de prévu pour aujourd’hui. Planifiez un suivi.'**
  String get agendaEmptyToday;

  /// No description provided for @agendaEmptyUpcoming.
  ///
  /// In fr, this message translates to:
  /// **'Aucune tâche planifiée bientôt.'**
  String get agendaEmptyUpcoming;

  /// No description provided for @agendaPendingCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 tâche en attente d’approbation} other{{count} tâches en attente d’approbation}}'**
  String agendaPendingCount(int count);

  /// No description provided for @taskEditTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get taskEditTooltip;

  /// No description provided for @taskCloseTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get taskCloseTooltip;

  /// No description provided for @taskClientSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get taskClientSubtitle;

  /// No description provided for @taskDueSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Échéance'**
  String get taskDueSubtitle;

  /// No description provided for @taskValidationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Validation'**
  String get taskValidationTitle;

  /// No description provided for @taskInfoHint.
  ///
  /// In fr, this message translates to:
  /// **'Cette entrée est informative. Marquez-la comme passée une fois prise en compte.'**
  String get taskInfoHint;

  /// No description provided for @taskActionHint.
  ///
  /// In fr, this message translates to:
  /// **'Marquez comme exécutée, puis approuvez pour confirmer que c’est fait.'**
  String get taskActionHint;

  /// No description provided for @taskHistoryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get taskHistoryTitle;

  /// No description provided for @taskNoHistory.
  ///
  /// In fr, this message translates to:
  /// **'Aucun événement pour l’instant. Les devis, factures et changements de statut apparaîtront ici.'**
  String get taskNoHistory;

  /// No description provided for @taskDoneByUs.
  ///
  /// In fr, this message translates to:
  /// **'Exécutée par nous'**
  String get taskDoneByUs;

  /// No description provided for @taskInfoOnly.
  ///
  /// In fr, this message translates to:
  /// **'Info seulement — passée'**
  String get taskInfoOnly;

  /// No description provided for @taskApprove.
  ///
  /// In fr, this message translates to:
  /// **'Approuver — confirmée faite'**
  String get taskApprove;

  /// No description provided for @taskReopen.
  ///
  /// In fr, this message translates to:
  /// **'Rouvrir'**
  String get taskReopen;

  /// No description provided for @taskReopenTask.
  ///
  /// In fr, this message translates to:
  /// **'Rouvrir la tâche'**
  String get taskReopenTask;

  /// No description provided for @taskDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette tâche ?'**
  String get taskDeleteTitle;

  /// No description provided for @taskViewDocument.
  ///
  /// In fr, this message translates to:
  /// **'Voir le document'**
  String get taskViewDocument;

  /// No description provided for @taskInvoiceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facture {number}'**
  String taskInvoiceTitle(String number);

  /// No description provided for @taskQuoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Devis {number}'**
  String taskQuoteTitle(String number);

  /// No description provided for @logContactedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Contacté — {title}'**
  String logContactedTitle(String title);

  /// No description provided for @logTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de contact'**
  String get logTypeLabel;

  /// No description provided for @logNoteLabel.
  ///
  /// In fr, this message translates to:
  /// **'Note (optionnel, ou dictez-la)'**
  String get logNoteLabel;

  /// No description provided for @logNextFollowup.
  ///
  /// In fr, this message translates to:
  /// **'Prochaine relance'**
  String get logNextFollowup;

  /// No description provided for @logCustom.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisé'**
  String get logCustom;

  /// No description provided for @logReplacesHint.
  ///
  /// In fr, this message translates to:
  /// **'Remplace la relance déjà programmée le {date}.'**
  String logReplacesHint(String date);

  /// No description provided for @logTomorrow.
  ///
  /// In fr, this message translates to:
  /// **'Demain'**
  String get logTomorrow;

  /// No description provided for @log3Days.
  ///
  /// In fr, this message translates to:
  /// **'3 jours'**
  String get log3Days;

  /// No description provided for @log1Week.
  ///
  /// In fr, this message translates to:
  /// **'1 semaine'**
  String get log1Week;

  /// No description provided for @log2Weeks.
  ///
  /// In fr, this message translates to:
  /// **'2 semaines'**
  String get log2Weeks;

  /// No description provided for @logTypeField.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get logTypeField;

  /// No description provided for @logContentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Contenu'**
  String get logContentLabel;

  /// No description provided for @logDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette entrée ?'**
  String get logDeleteTitle;

  /// No description provided for @logDeleteBody.
  ///
  /// In fr, this message translates to:
  /// **'Cette action est définitive.'**
  String get logDeleteBody;

  /// No description provided for @logRelanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Relancer : {title}'**
  String logRelanceTitle(String title);

  /// No description provided for @logKindNote.
  ///
  /// In fr, this message translates to:
  /// **'Note'**
  String get logKindNote;

  /// No description provided for @logKindQuoteSent.
  ///
  /// In fr, this message translates to:
  /// **'Devis envoyé'**
  String get logKindQuoteSent;

  /// No description provided for @logKindEmail.
  ///
  /// In fr, this message translates to:
  /// **'E-mail'**
  String get logKindEmail;

  /// No description provided for @logKindCall.
  ///
  /// In fr, this message translates to:
  /// **'Appel'**
  String get logKindCall;

  /// No description provided for @logKindMeeting.
  ///
  /// In fr, this message translates to:
  /// **'Réunion'**
  String get logKindMeeting;

  /// No description provided for @logKindReply.
  ///
  /// In fr, this message translates to:
  /// **'Réponse client'**
  String get logKindReply;

  /// No description provided for @logKindRemark.
  ///
  /// In fr, this message translates to:
  /// **'Remarque'**
  String get logKindRemark;

  /// No description provided for @addressMultipleCities.
  ///
  /// In fr, this message translates to:
  /// **'Plusieurs villes trouvées'**
  String get addressMultipleCities;

  /// No description provided for @addressCnpj.
  ///
  /// In fr, this message translates to:
  /// **'CNPJ'**
  String get addressCnpj;

  /// No description provided for @addressAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get addressAddress;

  /// No description provided for @addressCountry.
  ///
  /// In fr, this message translates to:
  /// **'Pays'**
  String get addressCountry;

  /// No description provided for @addressZip.
  ///
  /// In fr, this message translates to:
  /// **'Code postal'**
  String get addressZip;

  /// No description provided for @addressState.
  ///
  /// In fr, this message translates to:
  /// **'État'**
  String get addressState;

  /// No description provided for @addressCity.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get addressCity;

  /// No description provided for @loginResetPasswordTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser le mot de passe'**
  String get loginResetPasswordTitle;

  /// No description provided for @loginResetHint.
  ///
  /// In fr, this message translates to:
  /// **'Cet appareil uniquement — le mot de passe n’est pas partagé par la sync. Choisissez un compte local et définissez un nouveau mot de passe.'**
  String get loginResetHint;

  /// No description provided for @loginAccountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get loginAccountLabel;

  /// No description provided for @loginNewPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get loginNewPasswordLabel;

  /// No description provided for @loginConfirmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get loginConfirmLabel;

  /// No description provided for @loginTooShort.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe trop court (4 caractères min.).'**
  String get loginTooShort;

  /// No description provided for @loginMismatch.
  ///
  /// In fr, this message translates to:
  /// **'Les mots de passe ne correspondent pas.'**
  String get loginMismatch;

  /// No description provided for @loginResetButton.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get loginResetButton;

  /// No description provided for @currencySearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une devise…'**
  String get currencySearchHint;

  /// No description provided for @currencyNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune devise trouvée'**
  String get currencyNone;

  /// No description provided for @systemLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Langue du système'**
  String get systemLanguage;

  /// No description provided for @noLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Aucune langue trouvée'**
  String get noLanguage;

  /// No description provided for @dictationUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Dictée indisponible sur cet appareil.'**
  String get dictationUnavailable;

  /// No description provided for @companyDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce client ?'**
  String get companyDeleteTitle;

  /// No description provided for @companyListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get companyListTitle;

  /// No description provided for @companyCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 société} other{{count} sociétés}}'**
  String companyCount(int count);

  /// No description provided for @companyNewButton.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau client'**
  String get companyNewButton;

  /// No description provided for @companySearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer par nom, notes…'**
  String get companySearchHint;

  /// No description provided for @companyColumnClient.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get companyColumnClient;

  /// No description provided for @companyColumnModified.
  ///
  /// In fr, this message translates to:
  /// **'Modifié'**
  String get companyColumnModified;

  /// No description provided for @companyEmptyNoName.
  ///
  /// In fr, this message translates to:
  /// **'Aucun client'**
  String get companyEmptyNoName;

  /// No description provided for @companyEmptyNoResult.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get companyEmptyNoResult;

  /// No description provided for @companyEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez votre premier client — ou dictez-le avec le micro.'**
  String get companyEmptySubtitle;

  /// No description provided for @companyEmptySearchSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Essayez un autre terme.'**
  String get companyEmptySearchSubtitle;

  /// No description provided for @taskEditorNewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Planifier un suivi'**
  String get taskEditorNewTitle;

  /// No description provided for @taskEditorEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le suivi'**
  String get taskEditorEditTitle;

  /// No description provided for @taskEditorClientSection.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get taskEditorClientSection;

  /// No description provided for @taskEditorClientOfTask.
  ///
  /// In fr, this message translates to:
  /// **'Client du suivi'**
  String get taskEditorClientOfTask;

  /// No description provided for @taskEditorNoClient.
  ///
  /// In fr, this message translates to:
  /// **'Sans client (interne)'**
  String get taskEditorNoClient;

  /// No description provided for @taskEditorChoose.
  ///
  /// In fr, this message translates to:
  /// **'Choisir…'**
  String get taskEditorChoose;

  /// No description provided for @taskEditorTypeSection.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get taskEditorTypeSection;

  /// No description provided for @taskEditorTitleField.
  ///
  /// In fr, this message translates to:
  /// **'Titre *'**
  String get taskEditorTitleField;

  /// No description provided for @taskEditorTitleHint.
  ///
  /// In fr, this message translates to:
  /// **'Relancer le devis, appeler…'**
  String get taskEditorTitleHint;

  /// No description provided for @taskEditorWhatSection.
  ///
  /// In fr, this message translates to:
  /// **'Que faire ?'**
  String get taskEditorWhatSection;

  /// No description provided for @taskEditorActionHint.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez l’action concrète à réaliser.'**
  String get taskEditorActionHint;

  /// No description provided for @taskEditorMessaging.
  ///
  /// In fr, this message translates to:
  /// **'Messagerie'**
  String get taskEditorMessaging;

  /// No description provided for @taskEditorNeedClient.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez d’abord un client pour afficher le numéro ou l’e-mail.'**
  String get taskEditorNeedClient;

  /// No description provided for @taskEditorPhaseSection.
  ///
  /// In fr, this message translates to:
  /// **'Phase & échéance'**
  String get taskEditorPhaseSection;

  /// No description provided for @taskEditorPhaseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Phase du dossier'**
  String get taskEditorPhaseLabel;

  /// No description provided for @taskEditorChooseDue.
  ///
  /// In fr, this message translates to:
  /// **'Choisir date et heure'**
  String get taskEditorChooseDue;

  /// No description provided for @taskEditorSaveShortcut.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer (⌘S)'**
  String get taskEditorSaveShortcut;

  /// No description provided for @taskEditorNeedMessaging.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez la messagerie à utiliser.'**
  String get taskEditorNeedMessaging;

  /// No description provided for @taskEditorNeedDue.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez la date et l’heure du suivi.'**
  String get taskEditorNeedDue;

  /// No description provided for @taskEditorNeedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Le titre de la tâche est obligatoire.'**
  String get taskEditorNeedTitle;

  /// No description provided for @taskEditorSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher…'**
  String get taskEditorSearchHint;

  /// No description provided for @taskSuggestedMessage.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer un message'**
  String get taskSuggestedMessage;

  /// No description provided for @taskSuggestedPlatformMessage.
  ///
  /// In fr, this message translates to:
  /// **'Message {platform}'**
  String taskSuggestedPlatformMessage(String platform);

  /// No description provided for @taskSuggestedCall.
  ///
  /// In fr, this message translates to:
  /// **'Appeler'**
  String get taskSuggestedCall;

  /// No description provided for @taskSuggestedEmail.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer un e-mail'**
  String get taskSuggestedEmail;

  /// No description provided for @taskSuggestedMeeting.
  ///
  /// In fr, this message translates to:
  /// **'Rendez-vous'**
  String get taskSuggestedMeeting;

  /// No description provided for @taskSuggestedFollowup.
  ///
  /// In fr, this message translates to:
  /// **'Suivi'**
  String get taskSuggestedFollowup;

  /// No description provided for @importTargetClient.
  ///
  /// In fr, this message translates to:
  /// **'Client cible'**
  String get importTargetClient;

  /// No description provided for @importCsvButton.
  ///
  /// In fr, this message translates to:
  /// **'Importer CSV'**
  String get importCsvButton;

  /// No description provided for @importModulesSoon.
  ///
  /// In fr, this message translates to:
  /// **'Modules (bientôt)'**
  String get importModulesSoon;

  /// No description provided for @importExportCsvTitle.
  ///
  /// In fr, this message translates to:
  /// **'Export CSV'**
  String get importExportCsvTitle;

  /// No description provided for @importExportClients.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get importExportClients;

  /// No description provided for @importExportContacts.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get importExportContacts;

  /// No description provided for @importExportOpportunities.
  ///
  /// In fr, this message translates to:
  /// **'Opportunités'**
  String get importExportOpportunities;

  /// No description provided for @importTitle.
  ///
  /// In fr, this message translates to:
  /// **'Import'**
  String get importTitle;

  /// No description provided for @importClientsCsv.
  ///
  /// In fr, this message translates to:
  /// **'Clients CSV'**
  String get importClientsCsv;

  /// No description provided for @importContactsCsv.
  ///
  /// In fr, this message translates to:
  /// **'Contacts CSV'**
  String get importContactsCsv;

  /// No description provided for @importOpportunitiesCsv.
  ///
  /// In fr, this message translates to:
  /// **'Opportunités CSV'**
  String get importOpportunitiesCsv;

  /// No description provided for @importContactsVCard.
  ///
  /// In fr, this message translates to:
  /// **'Contacts vCard'**
  String get importContactsVCard;

  /// No description provided for @importExported.
  ///
  /// In fr, this message translates to:
  /// **'Exporté : {path}'**
  String importExported(String path);

  /// No description provided for @importExportFailed.
  ///
  /// In fr, this message translates to:
  /// **'Export impossible : {error}'**
  String importExportFailed(String error);

  /// No description provided for @importResult.
  ///
  /// In fr, this message translates to:
  /// **'{label} : {imported} importé(s), {skipped} ignoré(s).'**
  String importResult(String label, int imported, int skipped);

  /// No description provided for @importFailed.
  ///
  /// In fr, this message translates to:
  /// **'Import impossible : {error}'**
  String importFailed(String error);

  /// No description provided for @importNeedClientFirst.
  ///
  /// In fr, this message translates to:
  /// **'Créez d’abord un client pour y rattacher les contacts vCard.'**
  String get importNeedClientFirst;

  /// No description provided for @importVcardResult.
  ///
  /// In fr, this message translates to:
  /// **'vCard : {count} contact(s) importé(s).'**
  String importVcardResult(int count);

  /// No description provided for @importVcardFailed.
  ///
  /// In fr, this message translates to:
  /// **'Import vCard impossible : {error}'**
  String importVcardFailed(String error);

  /// No description provided for @cmdSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher ou taper une commande…'**
  String get cmdSearchHint;

  /// No description provided for @cmdSectionNavigation.
  ///
  /// In fr, this message translates to:
  /// **'Navigation'**
  String get cmdSectionNavigation;

  /// No description provided for @cmdGoDashboard.
  ///
  /// In fr, this message translates to:
  /// **'Aller au Tableau de bord'**
  String get cmdGoDashboard;

  /// No description provided for @cmdGoToday.
  ///
  /// In fr, this message translates to:
  /// **'Aller à Aujourd’hui'**
  String get cmdGoToday;

  /// No description provided for @cmdGoClients.
  ///
  /// In fr, this message translates to:
  /// **'Aller aux Clients'**
  String get cmdGoClients;

  /// No description provided for @cmdGoPipeline.
  ///
  /// In fr, this message translates to:
  /// **'Aller au Pipeline'**
  String get cmdGoPipeline;

  /// No description provided for @cmdGoTasks.
  ///
  /// In fr, this message translates to:
  /// **'Aller aux Tâches'**
  String get cmdGoTasks;

  /// No description provided for @cmdSectionCreate.
  ///
  /// In fr, this message translates to:
  /// **'Créer'**
  String get cmdSectionCreate;

  /// No description provided for @cmdNewClient.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau client'**
  String get cmdNewClient;

  /// No description provided for @cmdNewTask.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle tâche'**
  String get cmdNewTask;

  /// No description provided for @cmdSectionClients.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get cmdSectionClients;

  /// No description provided for @cmdSectionContacts.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get cmdSectionContacts;

  /// No description provided for @cmdSectionOpportunities.
  ///
  /// In fr, this message translates to:
  /// **'Opportunités'**
  String get cmdSectionOpportunities;

  /// No description provided for @cmdSectionTasks.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get cmdSectionTasks;

  /// No description provided for @cmdSectionNotes.
  ///
  /// In fr, this message translates to:
  /// **'Notes & activités'**
  String get cmdSectionNotes;

  /// No description provided for @cmdNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get cmdNoResults;

  /// No description provided for @pipelineSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Étapes du pipeline'**
  String get pipelineSettingsTitle;

  /// No description provided for @pipelineSettingsHint.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisez les libellés et l’ordre des étapes ouvertes. Gagné et Perdu restent en fin de pipeline.'**
  String get pipelineSettingsHint;

  /// No description provided for @pipelineMoveUp.
  ///
  /// In fr, this message translates to:
  /// **'Monter'**
  String get pipelineMoveUp;

  /// No description provided for @pipelineMoveDown.
  ///
  /// In fr, this message translates to:
  /// **'Descendre'**
  String get pipelineMoveDown;

  /// No description provided for @pipelineStepLabel.
  ///
  /// In fr, this message translates to:
  /// **'Étape {index}'**
  String pipelineStepLabel(int index);

  /// No description provided for @pipelineNewStage.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle étape'**
  String get pipelineNewStage;

  /// No description provided for @pipelineAddStage.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une étape'**
  String get pipelineAddStage;

  /// No description provided for @pipelineWon.
  ///
  /// In fr, this message translates to:
  /// **'Gagné'**
  String get pipelineWon;

  /// No description provided for @pipelineLost.
  ///
  /// In fr, this message translates to:
  /// **'Perdu'**
  String get pipelineLost;

  /// No description provided for @pipelineReset.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get pipelineReset;

  /// No description provided for @oppNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Affaire introuvable.'**
  String get oppNotFound;

  /// No description provided for @oppHistoryTitle.
  ///
  /// In fr, this message translates to:
  /// **'HISTORIQUE'**
  String get oppHistoryTitle;

  /// No description provided for @oppEmptyTimeline.
  ///
  /// In fr, this message translates to:
  /// **'Rien pour l’instant — les notes, appels, tâches et devis/factures liés à cette affaire apparaîtront ici.'**
  String get oppEmptyTimeline;

  /// No description provided for @oppTaskLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tâche'**
  String get oppTaskLabel;

  /// No description provided for @oppTaskDue.
  ///
  /// In fr, this message translates to:
  /// **'Tâche · échéance {date}'**
  String oppTaskDue(String date);

  /// No description provided for @oppTaskMarkDone.
  ///
  /// In fr, this message translates to:
  /// **'Marquer fait'**
  String get oppTaskMarkDone;

  /// No description provided for @oppWon.
  ///
  /// In fr, this message translates to:
  /// **'Gagnée'**
  String get oppWon;

  /// No description provided for @oppLost.
  ///
  /// In fr, this message translates to:
  /// **'Perdue'**
  String get oppLost;

  /// No description provided for @oppProbability.
  ///
  /// In fr, this message translates to:
  /// **'Probabilité : {value}%'**
  String oppProbability(int value);

  /// No description provided for @oppClosePlanned.
  ///
  /// In fr, this message translates to:
  /// **'Clôture prévue : {date}'**
  String oppClosePlanned(String date);

  /// No description provided for @eiProductsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Produits'**
  String get eiProductsTitle;

  /// No description provided for @eiProductsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue EastmarkHK e-Invoicing'**
  String get eiProductsSubtitle;

  /// No description provided for @eiNewProduct.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau produit'**
  String get eiNewProduct;

  /// No description provided for @eiProductSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un produit…'**
  String get eiProductSearch;

  /// No description provided for @eiNoProducts.
  ///
  /// In fr, this message translates to:
  /// **'Aucun produit pour l’instant.'**
  String get eiNoProducts;

  /// No description provided for @eiSaveFailed.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible : {error}'**
  String eiSaveFailed(String error);

  /// No description provided for @eiDeleteProductTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce produit ?'**
  String get eiDeleteProductTitle;

  /// No description provided for @eiDeleteFailed.
  ///
  /// In fr, this message translates to:
  /// **'Suppression impossible : {error}'**
  String eiDeleteFailed(String error);

  /// No description provided for @eiInfoSection.
  ///
  /// In fr, this message translates to:
  /// **'Informations'**
  String get eiInfoSection;

  /// No description provided for @eiPriceSection.
  ///
  /// In fr, this message translates to:
  /// **'Prix et taxe'**
  String get eiPriceSection;

  /// No description provided for @eiSellPrice.
  ///
  /// In fr, this message translates to:
  /// **'Prix de vente (TTC)'**
  String get eiSellPrice;

  /// No description provided for @eiNfeSection.
  ///
  /// In fr, this message translates to:
  /// **'Classification fiscale NF-e Brésil'**
  String get eiNfeSection;

  /// No description provided for @eiPhotosSection.
  ///
  /// In fr, this message translates to:
  /// **'Photos'**
  String get eiPhotosSection;

  /// No description provided for @eiCustomerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Client e-Invoicing'**
  String get eiCustomerTitle;

  /// No description provided for @eiUseExisting.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser l’existant'**
  String get eiUseExisting;

  /// No description provided for @eiOptional.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel'**
  String get eiOptional;

  /// No description provided for @eiImagesLabel.
  ///
  /// In fr, this message translates to:
  /// **'Images'**
  String get eiImagesLabel;

  /// No description provided for @eiTakePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Prendre une photo'**
  String get eiTakePhoto;

  /// No description provided for @eiChooseLibrary.
  ///
  /// In fr, this message translates to:
  /// **'Choisir dans la photothèque'**
  String get eiChooseLibrary;

  /// No description provided for @eiBrowseFiles.
  ///
  /// In fr, this message translates to:
  /// **'Parcourir les fichiers'**
  String get eiBrowseFiles;

  /// No description provided for @eiPhotoSaveFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’enregistrer la photo.'**
  String get eiPhotoSaveFailed;

  /// No description provided for @eiProductLabel.
  ///
  /// In fr, this message translates to:
  /// **'Produit'**
  String get eiProductLabel;

  /// No description provided for @eiRemoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion à e-Invoicing (mode distant)'**
  String get eiRemoteTitle;

  /// No description provided for @eiRemoteUrl.
  ///
  /// In fr, this message translates to:
  /// **'URL de base'**
  String get eiRemoteUrl;

  /// No description provided for @eiRemoteLogin.
  ///
  /// In fr, this message translates to:
  /// **'Login'**
  String get eiRemoteLogin;

  /// No description provided for @invModuleTitle.
  ///
  /// In fr, this message translates to:
  /// **'e-Invoicing'**
  String get invModuleTitle;

  /// No description provided for @queueDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette relance ?'**
  String get queueDeleteTitle;

  /// No description provided for @queueEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune relance'**
  String get queueEmpty;

  /// No description provided for @tasksListDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette tâche ?'**
  String get tasksListDeleteTitle;

  /// No description provided for @tasksListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get tasksListTitle;

  /// No description provided for @tasksListCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 ouverte} other{{count} ouvertes}}'**
  String tasksListCount(int count);

  /// No description provided for @clientsListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Clients'**
  String get clientsListTitle;

  /// No description provided for @clientsListCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 société} other{{count} sociétés}}'**
  String clientsListCount(int count);

  /// No description provided for @colWiden.
  ///
  /// In fr, this message translates to:
  /// **'Élargir'**
  String get colWiden;

  /// No description provided for @colNarrow.
  ///
  /// In fr, this message translates to:
  /// **'Réduire'**
  String get colNarrow;

  /// No description provided for @bannerTaskLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tâche'**
  String get bannerTaskLabel;

  /// No description provided for @activityInfoAdded.
  ///
  /// In fr, this message translates to:
  /// **'Info ajoutée au dossier'**
  String get activityInfoAdded;

  /// No description provided for @activityFollowupCreated.
  ///
  /// In fr, this message translates to:
  /// **'Suivi créé'**
  String get activityFollowupCreated;

  /// No description provided for @activityDuePlanned.
  ///
  /// In fr, this message translates to:
  /// **'Échéance planifiée'**
  String get activityDuePlanned;

  /// No description provided for @activityFollowupUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Suivi mis à jour'**
  String get activityFollowupUpdated;

  /// No description provided for @activityMarkedDone.
  ///
  /// In fr, this message translates to:
  /// **'Marquée exécutée'**
  String get activityMarkedDone;

  /// No description provided for @activityApproved.
  ///
  /// In fr, this message translates to:
  /// **'Approuvée — confirmée faite'**
  String get activityApproved;

  /// No description provided for @activityPassed.
  ///
  /// In fr, this message translates to:
  /// **'Passée / info seulement'**
  String get activityPassed;

  /// No description provided for @activityReopened.
  ///
  /// In fr, this message translates to:
  /// **'Rouverte'**
  String get activityReopened;

  /// No description provided for @tasksOpenTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tâches ouvertes'**
  String get tasksOpenTitle;

  /// No description provided for @tasksPlanButton.
  ///
  /// In fr, this message translates to:
  /// **'Planifier'**
  String get tasksPlanButton;

  /// No description provided for @tasksNoneOpenTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune tâche ouverte'**
  String get tasksNoneOpenTitle;

  /// No description provided for @tasksNoneOpenSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Planifiez ce qu’il y a à faire — aujourd’hui ou plus tard.'**
  String get tasksNoneOpenSubtitle;

  /// No description provided for @activityContactAdded.
  ///
  /// In fr, this message translates to:
  /// **'Contact ajouté au dossier'**
  String get activityContactAdded;

  /// No description provided for @activityContactUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Contact mis à jour'**
  String get activityContactUpdated;

  /// No description provided for @activityPendingApproval.
  ///
  /// In fr, this message translates to:
  /// **'En attente d’approbation'**
  String get activityPendingApproval;

  /// No description provided for @settingsSyncOk.
  ///
  /// In fr, this message translates to:
  /// **'OK — {message}'**
  String settingsSyncOk(String message);

  /// No description provided for @settingsSyncError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur — {message}'**
  String settingsSyncError(String message);

  /// No description provided for @settingsSyncConnected.
  ///
  /// In fr, this message translates to:
  /// **'Connexion OK — {message}'**
  String settingsSyncConnected(String message);

  /// No description provided for @settingsFtpPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe sync'**
  String get settingsFtpPassword;

  /// No description provided for @settingsTestConnection.
  ///
  /// In fr, this message translates to:
  /// **'Tester la connexion'**
  String get settingsTestConnection;

  /// No description provided for @settingsNoModules.
  ///
  /// In fr, this message translates to:
  /// **'Aucun module activé. Parcourez la boutique pour essayer ou activer EastmarkHK e-Invoicing.'**
  String get settingsNoModules;

  /// No description provided for @settingsTrialRemaining.
  ///
  /// In fr, this message translates to:
  /// **'Essai — {days} j. restants'**
  String settingsTrialRemaining(int days);

  /// No description provided for @settingsActiveInCrm.
  ///
  /// In fr, this message translates to:
  /// **'Actif — Utiliser dans le CRM'**
  String get settingsActiveInCrm;

  /// No description provided for @settingsEinvoiceDisplay.
  ///
  /// In fr, this message translates to:
  /// **'e-Invoicing — affichage'**
  String get settingsEinvoiceDisplay;

  /// No description provided for @settingsEinvoiceDisplaySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Devis et factures créés aussi hors CRM : choisissez ce qui apparaît ici.'**
  String get settingsEinvoiceDisplaySubtitle;

  /// No description provided for @settingsLinkedToCrm.
  ///
  /// In fr, this message translates to:
  /// **'Liés au CRM'**
  String get settingsLinkedToCrm;

  /// No description provided for @settingsAllEinvoicing.
  ///
  /// In fr, this message translates to:
  /// **'Tout e-Invoicing'**
  String get settingsAllEinvoicing;

  /// No description provided for @settingsCrmOnlyDesc.
  ///
  /// In fr, this message translates to:
  /// **'Affiche uniquement les documents des clients rattachés au CRM (recommandé).'**
  String get settingsCrmOnlyDesc;

  /// No description provided for @settingsAllDocsDesc.
  ///
  /// In fr, this message translates to:
  /// **'Affiche aussi les documents créés uniquement dans l’app e-Invoicing.'**
  String get settingsAllDocsDesc;

  /// No description provided for @settingsAbout.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In fr, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @settingsBuild.
  ///
  /// In fr, this message translates to:
  /// **'Build'**
  String get settingsBuild;

  /// No description provided for @settingsPrivacyReport.
  ///
  /// In fr, this message translates to:
  /// **'Privacy Report'**
  String get settingsPrivacyReport;

  /// No description provided for @settingsPrivacyReportSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'EastmarkHK CRM — rapport de confidentialité'**
  String get settingsPrivacyReportSubtitle;

  /// No description provided for @companyColumnNotes.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get companyColumnNotes;

  /// No description provided for @companyWithoutName.
  ///
  /// In fr, this message translates to:
  /// **'(Sans nom)'**
  String get companyWithoutName;

  /// No description provided for @clientsSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un client…'**
  String get clientsSearchHint;

  /// No description provided for @clientsNewButton.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau'**
  String get clientsNewButton;

  /// No description provided for @clientsEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun client pour l’instant'**
  String get clientsEmptyTitle;

  /// No description provided for @clientsEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez d’abord le client (prospect ou entreprise) pour suivre une affaire.'**
  String get clientsEmptySubtitle;

  /// No description provided for @clientsEmptyCreateButton.
  ///
  /// In fr, this message translates to:
  /// **'Créer un client'**
  String get clientsEmptyCreateButton;

  /// No description provided for @clientsNoCountry.
  ///
  /// In fr, this message translates to:
  /// **'Pays non renseigné'**
  String get clientsNoCountry;

  /// No description provided for @clientsPanelSearch.
  ///
  /// In fr, this message translates to:
  /// **'Nom, notes…'**
  String get clientsPanelSearch;

  /// No description provided for @clientsPanelNew.
  ///
  /// In fr, this message translates to:
  /// **'+ Nouveau'**
  String get clientsPanelNew;

  /// No description provided for @clientNameRequired.
  ///
  /// In fr, this message translates to:
  /// **'Le nom de la société est obligatoire.'**
  String get clientNameRequired;

  /// No description provided for @clientEditNewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau client'**
  String get clientEditNewTitle;

  /// No description provided for @clientEditModifyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le client'**
  String get clientEditModifyTitle;

  /// No description provided for @companyNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Société'**
  String get companyNameLabel;

  /// No description provided for @companyNameRequiredLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la société *'**
  String get companyNameRequiredLabel;

  /// No description provided for @formRequired.
  ///
  /// In fr, this message translates to:
  /// **'Obligatoire'**
  String get formRequired;

  /// No description provided for @clientContactPerson.
  ///
  /// In fr, this message translates to:
  /// **'Personne de contact'**
  String get clientContactPerson;

  /// No description provided for @clientEinvoicingSection.
  ///
  /// In fr, this message translates to:
  /// **'E-facturation'**
  String get clientEinvoicingSection;

  /// No description provided for @clientEinvoicingPeppol.
  ///
  /// In fr, this message translates to:
  /// **'Recevoir via e-facture / Peppol'**
  String get clientEinvoicingPeppol;

  /// No description provided for @clientEinvoicingPeppolHint.
  ///
  /// In fr, this message translates to:
  /// **'Si désactivé, les factures restent en email/PDF pour ce client.'**
  String get clientEinvoicingPeppolHint;

  /// No description provided for @clientPeppolIdLabel.
  ///
  /// In fr, this message translates to:
  /// **'Identifiant Peppol'**
  String get clientPeppolIdLabel;

  /// No description provided for @clientPeppolVerify.
  ///
  /// In fr, this message translates to:
  /// **'Vérification Peppol — via le module e-Invoicing.'**
  String get clientPeppolVerify;

  /// No description provided for @peppolVerify.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier l’inscription Peppol'**
  String get peppolVerify;

  /// No description provided for @nfeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facture électronique (NF-e)'**
  String get nfeTitle;

  /// No description provided for @clientNfeHint.
  ///
  /// In fr, this message translates to:
  /// **'Brésil — pas de Peppol. Les documents suivent le régime NF-e / CNPJ.'**
  String get clientNfeHint;

  /// No description provided for @clientNotesSection.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get clientNotesSection;

  /// No description provided for @clientNotesHint.
  ///
  /// In fr, this message translates to:
  /// **'Notes libres sur ce client…'**
  String get clientNotesHint;

  /// No description provided for @clientEditSaveShortcut.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer (⌘S)'**
  String get clientEditSaveShortcut;

  /// No description provided for @contactNameRequired.
  ///
  /// In fr, this message translates to:
  /// **'Indiquez au moins un prénom ou un nom.'**
  String get contactNameRequired;

  /// No description provided for @contactNewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau contact'**
  String get contactNewTitle;

  /// No description provided for @contactEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le contact'**
  String get contactEditTitle;

  /// No description provided for @contactIdentitySection.
  ///
  /// In fr, this message translates to:
  /// **'Identité'**
  String get contactIdentitySection;

  /// No description provided for @contactFirstName.
  ///
  /// In fr, this message translates to:
  /// **'Prénom'**
  String get contactFirstName;

  /// No description provided for @contactLastName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get contactLastName;

  /// No description provided for @contactRoleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rôle dans l’entreprise'**
  String get contactRoleLabel;

  /// No description provided for @contactRoleHint.
  ///
  /// In fr, this message translates to:
  /// **'Acheteur, CEO, Comptabilité…'**
  String get contactRoleHint;

  /// No description provided for @contactPrimary.
  ///
  /// In fr, this message translates to:
  /// **'Contact principal'**
  String get contactPrimary;

  /// No description provided for @contactPrimaryHint.
  ///
  /// In fr, this message translates to:
  /// **'Affiché en priorité sur la fiche client'**
  String get contactPrimaryHint;

  /// No description provided for @contactDetailsSection.
  ///
  /// In fr, this message translates to:
  /// **'Coordonnées'**
  String get contactDetailsSection;

  /// No description provided for @contactEmail.
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactPhone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get contactPhone;

  /// No description provided for @contactPhoneFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format du pays {country}'**
  String contactPhoneFormat(String country);

  /// No description provided for @contactNotesSection.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get contactNotesSection;

  /// No description provided for @contactSaveShortcut.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer (⌘S)'**
  String get contactSaveShortcut;

  /// No description provided for @oppEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l’opportunité'**
  String get oppEditTitle;

  /// No description provided for @oppStageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Stade'**
  String get oppStageLabel;

  /// No description provided for @oppClosePlannedLabel.
  ///
  /// In fr, this message translates to:
  /// **'Clôture prévue'**
  String get oppClosePlannedLabel;

  /// No description provided for @oppNotSet.
  ///
  /// In fr, this message translates to:
  /// **'Non définie'**
  String get oppNotSet;

  /// No description provided for @oppFollowupScheduled.
  ///
  /// In fr, this message translates to:
  /// **'Relance programmée'**
  String get oppFollowupScheduled;

  /// No description provided for @oppFollowupReminder.
  ///
  /// In fr, this message translates to:
  /// **'Rappel de relance'**
  String get oppFollowupReminder;

  /// No description provided for @oppFollowupOptional.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel — planifiez un suivi client'**
  String get oppFollowupOptional;

  /// No description provided for @oppRemoveFollowup.
  ///
  /// In fr, this message translates to:
  /// **'Retirer la relance'**
  String get oppRemoveFollowup;

  /// No description provided for @oppSchedule.
  ///
  /// In fr, this message translates to:
  /// **'Programmer'**
  String get oppSchedule;

  /// No description provided for @oppDetailsHint.
  ///
  /// In fr, this message translates to:
  /// **'Détails (produit, Incoterms, conditions de paiement, tableau…)'**
  String get oppDetailsHint;

  /// No description provided for @oppStageChanged.
  ///
  /// In fr, this message translates to:
  /// **'Changement de stade'**
  String get oppStageChanged;

  /// No description provided for @oppCreated.
  ///
  /// In fr, this message translates to:
  /// **'Opportunité créée'**
  String get oppCreated;

  /// No description provided for @oppWonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Opportunité gagnée'**
  String get oppWonTitle;

  /// No description provided for @oppCreateQuotePrompt.
  ///
  /// In fr, this message translates to:
  /// **'Créer un devis pré-rempli pour ce client ?'**
  String get oppCreateQuotePrompt;

  /// No description provided for @oppLater.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get oppLater;

  /// No description provided for @oppCreateQuoteButton.
  ///
  /// In fr, this message translates to:
  /// **'Créer le devis'**
  String get oppCreateQuoteButton;

  /// No description provided for @oppQuoteButton.
  ///
  /// In fr, this message translates to:
  /// **'Devis'**
  String get oppQuoteButton;

  /// No description provided for @oppInvoiceButton.
  ///
  /// In fr, this message translates to:
  /// **'Facture'**
  String get oppInvoiceButton;

  /// No description provided for @stageContacted.
  ///
  /// In fr, this message translates to:
  /// **'Contacté'**
  String get stageContacted;

  /// No description provided for @aiAssistant.
  ///
  /// In fr, this message translates to:
  /// **'Assistant IA'**
  String get aiAssistant;

  /// No description provided for @aiGenerating.
  ///
  /// In fr, this message translates to:
  /// **'Génération…'**
  String get aiGenerating;

  /// No description provided for @aiGenerateButton.
  ///
  /// In fr, this message translates to:
  /// **'Générer'**
  String get aiGenerateButton;

  /// No description provided for @aiUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Assistant IA indisponible — Apple Intelligence requis (macOS 26+, Apple Silicon). Saisie manuelle possible.'**
  String get aiUnavailable;

  /// No description provided for @aiPromptHint.
  ///
  /// In fr, this message translates to:
  /// **'Décrivez le besoin client en langage naturel — l’IA locale d’Apple prépare le titre, les notes, le montant et la probabilité. Rien n’est enregistré sans votre validation.'**
  String get aiPromptHint;

  /// No description provided for @aiPromptExample.
  ///
  /// In fr, this message translates to:
  /// **'Ex. : « 20 000 tags RFID pour Acme, prix FOB Shenzhen, livraison avant novembre, client déjà venu au salon »'**
  String get aiPromptExample;

  /// No description provided for @taskNotesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get taskNotesTitle;

  /// No description provided for @taskEditorNotesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get taskEditorNotesTitle;

  /// No description provided for @taskTileToApprove.
  ///
  /// In fr, this message translates to:
  /// **'À approuver'**
  String get taskTileToApprove;

  /// No description provided for @taskTileInfo.
  ///
  /// In fr, this message translates to:
  /// **'Info'**
  String get taskTileInfo;

  /// No description provided for @reachCallWithSource.
  ///
  /// In fr, this message translates to:
  /// **'Appeler · {source}'**
  String reachCallWithSource(String source);

  /// No description provided for @taskEmailClientRef.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le client e-mail (réf. {ref})'**
  String taskEmailClientRef(String ref);

  /// No description provided for @reachNoPhone.
  ///
  /// In fr, this message translates to:
  /// **'Aucun numéro sur ce client — ajoutez-le à la fiche.'**
  String get reachNoPhone;

  /// No description provided for @reachNoEmail.
  ///
  /// In fr, this message translates to:
  /// **'Aucun e-mail sur ce client — ajoutez-le à la fiche.'**
  String get reachNoEmail;

  /// No description provided for @reachCallLaunched.
  ///
  /// In fr, this message translates to:
  /// **'Appel lancé'**
  String get reachCallLaunched;

  /// No description provided for @reachEmailLabel.
  ///
  /// In fr, this message translates to:
  /// **'e-mail'**
  String get reachEmailLabel;

  /// No description provided for @reachEmailOpened.
  ///
  /// In fr, this message translates to:
  /// **'E-mail ouvert · {ref}'**
  String reachEmailOpened(String ref);

  /// No description provided for @queueGroupOverdue.
  ///
  /// In fr, this message translates to:
  /// **'En retard'**
  String get queueGroupOverdue;

  /// No description provided for @queueGroupToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd’hui'**
  String get queueGroupToday;

  /// No description provided for @queueGroupTomorrow.
  ///
  /// In fr, this message translates to:
  /// **'Demain'**
  String get queueGroupTomorrow;

  /// No description provided for @queueGroupWeek.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine'**
  String get queueGroupWeek;

  /// No description provided for @queueGroupLater.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get queueGroupLater;

  /// No description provided for @queueDeleteBody.
  ///
  /// In fr, this message translates to:
  /// **'« {title} »'**
  String queueDeleteBody(String title);

  /// No description provided for @queueNothingScheduled.
  ///
  /// In fr, this message translates to:
  /// **'Rien de programmé'**
  String get queueNothingScheduled;

  /// No description provided for @queueCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 relance} other{{count} relances}}'**
  String queueCount(int count);

  /// No description provided for @queuePersonal.
  ///
  /// In fr, this message translates to:
  /// **'Perso'**
  String get queuePersonal;

  /// No description provided for @queueEmptySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez des clients et des opportunités — les rappels apparaîtront ici.'**
  String get queueEmptySubtitle;

  /// No description provided for @queueRemoveBody.
  ///
  /// In fr, this message translates to:
  /// **'« {title} » sera retirée de votre file.'**
  String queueRemoveBody(String title);

  /// No description provided for @linkClientTitle.
  ///
  /// In fr, this message translates to:
  /// **'Associer à un client'**
  String get linkClientTitle;

  /// No description provided for @linkClientButton.
  ///
  /// In fr, this message translates to:
  /// **'Associer à un client'**
  String get linkClientButton;

  /// No description provided for @linkClientLabel.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get linkClientLabel;

  /// No description provided for @actionNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Relance introuvable'**
  String get actionNotFound;

  /// No description provided for @actionMessage.
  ///
  /// In fr, this message translates to:
  /// **'Message'**
  String get actionMessage;

  /// No description provided for @actionContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get actionContact;

  /// No description provided for @contactedReschedule.
  ///
  /// In fr, this message translates to:
  /// **'Contacté — reprogrammer'**
  String get contactedReschedule;

  /// No description provided for @actionNotLinked.
  ///
  /// In fr, this message translates to:
  /// **'Non associé'**
  String get actionNotLinked;

  /// No description provided for @viewFullProfile.
  ///
  /// In fr, this message translates to:
  /// **'Voir fiche complète'**
  String get viewFullProfile;

  /// No description provided for @actionNoContact.
  ///
  /// In fr, this message translates to:
  /// **'Aucun contact — ajoutez-en depuis la fiche client.'**
  String get actionNoContact;

  /// No description provided for @actionEmailLabel.
  ///
  /// In fr, this message translates to:
  /// **'email'**
  String get actionEmailLabel;

  /// No description provided for @commonPhone.
  ///
  /// In fr, this message translates to:
  /// **'téléphone'**
  String get commonPhone;

  /// No description provided for @boardNoOpenOpps.
  ///
  /// In fr, this message translates to:
  /// **'Aucune opportunité'**
  String get boardNoOpenOpps;

  /// No description provided for @boardOpenCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} ouverte(s)'**
  String boardOpenCount(int count);

  /// No description provided for @colWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur de cette colonne'**
  String get colWidthLabel;

  /// No description provided for @tasksListDeleteBody.
  ///
  /// In fr, this message translates to:
  /// **'« {title} »'**
  String tasksListDeleteBody(String title);

  /// No description provided for @tasksListOpenCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} ouverte(s)'**
  String tasksListOpenCount(int count);

  /// No description provided for @tasksListNew.
  ///
  /// In fr, this message translates to:
  /// **'+ Tâche'**
  String get tasksListNew;

  /// No description provided for @tasksListEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune tâche'**
  String get tasksListEmpty;

  /// No description provided for @tasksListNoClient.
  ///
  /// In fr, this message translates to:
  /// **'Sans client'**
  String get tasksListNoClient;

  /// No description provided for @listFilterHint.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer…'**
  String get listFilterHint;

  /// No description provided for @cmdNoName.
  ///
  /// In fr, this message translates to:
  /// **'(sans nom)'**
  String get cmdNoName;

  /// No description provided for @shellSyncError.
  ///
  /// In fr, this message translates to:
  /// **'Sync : {error}'**
  String shellSyncError(String error);

  /// No description provided for @shellOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get shellOk;

  /// No description provided for @shellSyncNeedsPassword.
  ///
  /// In fr, this message translates to:
  /// **'Base partagée : saisissez le mot de passe sync dans Réglages pour reconnecter cet appareil.'**
  String get shellSyncNeedsPassword;

  /// No description provided for @shellSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get shellSearch;

  /// No description provided for @shellDashboard.
  ///
  /// In fr, this message translates to:
  /// **'Tableau de bord'**
  String get shellDashboard;

  /// No description provided for @loginPasskeyNotConfigured.
  ///
  /// In fr, this message translates to:
  /// **'Passkey non configuré — connectez-vous une fois avec le mot de passe.'**
  String get loginPasskeyNotConfigured;

  /// No description provided for @loginPasskeyRefused.
  ///
  /// In fr, this message translates to:
  /// **'Passkey / biométrie refusé — utilisez le mot de passe ou réinitialisez-le.'**
  String get loginPasskeyRefused;

  /// No description provided for @loginNoAccount.
  ///
  /// In fr, this message translates to:
  /// **'Aucun compte sur cet appareil.'**
  String get loginNoAccount;

  /// No description provided for @loginAccountNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Compte introuvable.'**
  String get loginAccountNotFound;

  /// No description provided for @loginResetDone.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe réinitialisé — reconnectez-vous avec le nouveau mot de passe.'**
  String get loginResetDone;

  /// No description provided for @loginForgotPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié — réinitialiser'**
  String get loginForgotPassword;

  /// No description provided for @dictationStop.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter la dictée'**
  String get dictationStop;

  /// No description provided for @dictationStart.
  ///
  /// In fr, this message translates to:
  /// **'Dicter — appui long pour changer de langue'**
  String get dictationStart;

  /// No description provided for @joditLoadFailed.
  ///
  /// In fr, this message translates to:
  /// **'L’éditeur n’a pas pu se charger. Réessayez, ou vérifiez que les fichiers Jodit sont bien inclus dans les assets de l’app.'**
  String get joditLoadFailed;

  /// No description provided for @languagePickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Langue de l’application'**
  String get languagePickerTitle;

  /// No description provided for @languageSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une langue…'**
  String get languageSearchHint;

  /// No description provided for @dictationLanguageSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une langue…'**
  String get dictationLanguageSearchHint;

  /// No description provided for @dictationDesktopHint.
  ///
  /// In fr, this message translates to:
  /// **'Sur ordinateur, la dictée native peut être limitée ; le choix est mémorisé pour les appareils mobiles.'**
  String get dictationDesktopHint;

  /// No description provided for @currencyPickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Devise'**
  String get currencyPickerTitle;

  /// No description provided for @addressDistrict.
  ///
  /// In fr, this message translates to:
  /// **'Quartier'**
  String get addressDistrict;

  /// No description provided for @addressPhone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get addressPhone;

  /// No description provided for @addressEmail.
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get addressEmail;

  /// No description provided for @eiPriceHt.
  ///
  /// In fr, this message translates to:
  /// **'{amount} HT'**
  String eiPriceHt(String amount);

  /// No description provided for @eiRefAlreadyUsed.
  ///
  /// In fr, this message translates to:
  /// **'La référence « {ref} » est déjà utilisée par un autre produit.'**
  String eiRefAlreadyUsed(String ref);

  /// No description provided for @eiEditProductTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le produit'**
  String get eiEditProductTitle;

  /// No description provided for @eiTaxRate.
  ///
  /// In fr, this message translates to:
  /// **'{rate} %'**
  String eiTaxRate(String rate);

  /// No description provided for @eiRefLabel.
  ///
  /// In fr, this message translates to:
  /// **'Référence'**
  String get eiRefLabel;

  /// No description provided for @eiRefHint.
  ///
  /// In fr, this message translates to:
  /// **'Laisser vide pour générer automatiquement (unique)'**
  String get eiRefHint;

  /// No description provided for @eiNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get eiNameLabel;

  /// No description provided for @eiNameRequired.
  ///
  /// In fr, this message translates to:
  /// **'Indiquez un nom de produit.'**
  String get eiNameRequired;

  /// No description provided for @eiDescriptionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get eiDescriptionLabel;

  /// No description provided for @eiPriceExclTax.
  ///
  /// In fr, this message translates to:
  /// **'Prix de vente (HT)'**
  String get eiPriceExclTax;

  /// No description provided for @eiTaxNote.
  ///
  /// In fr, this message translates to:
  /// **'Note fiscale (ex. ICMS par État)'**
  String get eiTaxNote;

  /// No description provided for @eiHsInfo.
  ///
  /// In fr, this message translates to:
  /// **'Le code HS/NCM est informatif (douane). Le taux produit est la référence article (TVA, ICMS…). Devis/factures gardent un taux unique au niveau du document pour les totaux.'**
  String get eiHsInfo;

  /// No description provided for @eiCfop.
  ///
  /// In fr, this message translates to:
  /// **'CFOP'**
  String get eiCfop;

  /// No description provided for @eiCfopHint.
  ///
  /// In fr, this message translates to:
  /// **'ex. 5102 / 6102'**
  String get eiCfopHint;

  /// No description provided for @eiIcmsCst.
  ///
  /// In fr, this message translates to:
  /// **'ICMS CST/CSOSN'**
  String get eiIcmsCst;

  /// No description provided for @eiIcmsCstHint.
  ///
  /// In fr, this message translates to:
  /// **'ex. 40, 60, 102'**
  String get eiIcmsCstHint;

  /// No description provided for @eiPisCofins.
  ///
  /// In fr, this message translates to:
  /// **'PIS/COFINS CST'**
  String get eiPisCofins;

  /// No description provided for @eiPisCofinsHint.
  ///
  /// In fr, this message translates to:
  /// **'ex. 07, 08, 99'**
  String get eiPisCofinsHint;

  /// No description provided for @eiNfeOverrideHint.
  ///
  /// In fr, this message translates to:
  /// **'Facultatif — remplace les valeurs NF-e par défaut de l’entreprise (Paramètres) pour cet article uniquement. Laisser vide pour utiliser les valeurs par défaut. Valider avec votre comptable avant utilisation en production.'**
  String get eiNfeOverrideHint;

  /// No description provided for @eiNotesSection.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get eiNotesSection;

  /// No description provided for @eiSaveShortcut.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer (⌘S)'**
  String get eiSaveShortcut;

  /// No description provided for @eiRemoteBody.
  ///
  /// In fr, this message translates to:
  /// **'e-Invoicing est configurée en stockage distant. Renseigne ici les mêmes identifiants que dans e-Invoicing → Réglages → Stockage distant, pour que le CRM puisse créer des devis/factures via la même API.'**
  String get eiRemoteBody;

  /// No description provided for @eiRemoteIndexHint.
  ///
  /// In fr, this message translates to:
  /// **'Sur le nouvel hébergement, le chemin /index.php est requis (pas de rewrite vers /einvoicing/…).'**
  String get eiRemoteIndexHint;

  /// No description provided for @eiRemoteSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Connexion réussie.'**
  String get eiRemoteSuccess;

  /// No description provided for @eiRemoteFail.
  ///
  /// In fr, this message translates to:
  /// **'Échec : {error}'**
  String eiRemoteFail(String error);

  /// No description provided for @eiRemoteTesting.
  ///
  /// In fr, this message translates to:
  /// **'Test en cours…'**
  String get eiRemoteTesting;

  /// No description provided for @invModuleDisplayName.
  ///
  /// In fr, this message translates to:
  /// **'EastmarkHK e-Invoicing'**
  String get invModuleDisplayName;

  /// No description provided for @invModuleDescription.
  ///
  /// In fr, this message translates to:
  /// **'Devis et factures créés depuis vos clients et opportunités CRM, gérés par l’app EastmarkHK e-Invoicing (incluse — App Store). Reçues, relances et envoi se pilotent dans l’app e-Invoicing.'**
  String get invModuleDescription;

  /// No description provided for @invModulePrice.
  ///
  /// In fr, this message translates to:
  /// **'5,99 €/mois'**
  String get invModulePrice;

  /// No description provided for @invInvoiceCreated.
  ///
  /// In fr, this message translates to:
  /// **'Facture créée'**
  String get invInvoiceCreated;

  /// No description provided for @invQuoteCreated.
  ///
  /// In fr, this message translates to:
  /// **'Devis créé'**
  String get invQuoteCreated;

  /// No description provided for @invModuleAppNotFound.
  ///
  /// In fr, this message translates to:
  /// **'App e-Invoicing introuvable — installez-la depuis l’App Store et lancez-la une fois, puis réessayez.'**
  String get invModuleAppNotFound;

  /// No description provided for @eiCustomerCheckFailed.
  ///
  /// In fr, this message translates to:
  /// **'Vérification client impossible : {error}'**
  String eiCustomerCheckFailed(String error);

  /// No description provided for @quoteCreatedFromEinvoice.
  ///
  /// In fr, this message translates to:
  /// **'Créé depuis e-Invoicing'**
  String get quoteCreatedFromEinvoice;

  /// No description provided for @quoteCreatedSnackbar.
  ///
  /// In fr, this message translates to:
  /// **'{type} {number} créé dans e-Invoicing'**
  String quoteCreatedSnackbar(String type, String number);

  /// No description provided for @quoteCreateFailed.
  ///
  /// In fr, this message translates to:
  /// **'Création impossible : {error}'**
  String quoteCreateFailed(String error);

  /// No description provided for @syncServerOk.
  ///
  /// In fr, this message translates to:
  /// **'serveur joignable, identifiants acceptés'**
  String get syncServerOk;

  /// No description provided for @syncInvalidResponse.
  ///
  /// In fr, this message translates to:
  /// **'Réponse serveur invalide'**
  String get syncInvalidResponse;

  /// No description provided for @syncCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation annulée'**
  String get syncCancelled;

  /// No description provided for @syncInProgress.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation déjà en cours'**
  String get syncInProgress;

  /// No description provided for @syncUpToDate.
  ///
  /// In fr, this message translates to:
  /// **'À jour'**
  String get syncUpToDate;

  /// No description provided for @syncReceived.
  ///
  /// In fr, this message translates to:
  /// **'{count} élément(s) reçu(s)'**
  String syncReceived(int count);

  /// No description provided for @syncSentNothingNew.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé (rien de nouveau)'**
  String get syncSentNothingNew;

  /// No description provided for @syncSent.
  ///
  /// In fr, this message translates to:
  /// **'{count} élément(s) envoyé(s)'**
  String syncSent(int count);

  /// No description provided for @syncSentPart.
  ///
  /// In fr, this message translates to:
  /// **'{count} envoyé(s)'**
  String syncSentPart(int count);

  /// No description provided for @syncReceivedPart.
  ///
  /// In fr, this message translates to:
  /// **'{count} reçu(s)'**
  String syncReceivedPart(int count);

  /// No description provided for @syncPullFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec du pull'**
  String get syncPullFailed;

  /// No description provided for @syncPushFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec du push'**
  String get syncPushFailed;

  /// No description provided for @sync401.
  ///
  /// In fr, this message translates to:
  /// **'401 — identifiants refusés (compte ou mot de passe incorrect)'**
  String get sync401;

  /// No description provided for @syncServerStatus.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur a répondu {code}'**
  String syncServerStatus(int code);

  /// No description provided for @syncTimeout.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur ne répond pas (délai dépassé)'**
  String get syncTimeout;

  /// No description provided for @syncConnectError.
  ///
  /// In fr, this message translates to:
  /// **'Connexion impossible : {error}'**
  String syncConnectError(String error);

  /// No description provided for @taskKindAction.
  ///
  /// In fr, this message translates to:
  /// **'À faire'**
  String get taskKindAction;

  /// No description provided for @taskKindInfo.
  ///
  /// In fr, this message translates to:
  /// **'Info'**
  String get taskKindInfo;

  /// No description provided for @taskActionMessage.
  ///
  /// In fr, this message translates to:
  /// **'Message chat'**
  String get taskActionMessage;

  /// No description provided for @taskActionCall.
  ///
  /// In fr, this message translates to:
  /// **'Téléphoner'**
  String get taskActionCall;

  /// No description provided for @taskActionEmail.
  ///
  /// In fr, this message translates to:
  /// **'E-mail'**
  String get taskActionEmail;

  /// No description provided for @taskActionMeeting.
  ///
  /// In fr, this message translates to:
  /// **'Rendez-vous'**
  String get taskActionMeeting;

  /// No description provided for @taskActionOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get taskActionOther;

  /// No description provided for @taskStatusOpen.
  ///
  /// In fr, this message translates to:
  /// **'Ouverte'**
  String get taskStatusOpen;

  /// No description provided for @taskStatusToApprove.
  ///
  /// In fr, this message translates to:
  /// **'À approuver'**
  String get taskStatusToApprove;

  /// No description provided for @taskStatusApproved.
  ///
  /// In fr, this message translates to:
  /// **'Approuvée'**
  String get taskStatusApproved;

  /// No description provided for @taskStatusPassed.
  ///
  /// In fr, this message translates to:
  /// **'Passée'**
  String get taskStatusPassed;

  /// No description provided for @phaseProspect.
  ///
  /// In fr, this message translates to:
  /// **'Prospect'**
  String get phaseProspect;

  /// No description provided for @phaseFirstContact.
  ///
  /// In fr, this message translates to:
  /// **'Premier contact'**
  String get phaseFirstContact;

  /// No description provided for @phaseContacted.
  ///
  /// In fr, this message translates to:
  /// **'Contacté'**
  String get phaseContacted;

  /// No description provided for @phaseQualification.
  ///
  /// In fr, this message translates to:
  /// **'Qualification'**
  String get phaseQualification;

  /// No description provided for @phaseQuote.
  ///
  /// In fr, this message translates to:
  /// **'Devis'**
  String get phaseQuote;

  /// No description provided for @phaseNegotiation.
  ///
  /// In fr, this message translates to:
  /// **'Négociation'**
  String get phaseNegotiation;

  /// No description provided for @phaseClosing.
  ///
  /// In fr, this message translates to:
  /// **'Closing'**
  String get phaseClosing;

  /// No description provided for @phaseWon.
  ///
  /// In fr, this message translates to:
  /// **'Gagné'**
  String get phaseWon;

  /// No description provided for @phaseLost.
  ///
  /// In fr, this message translates to:
  /// **'Perdu'**
  String get phaseLost;

  /// No description provided for @phaseAfterSales.
  ///
  /// In fr, this message translates to:
  /// **'Suivi post-vente'**
  String get phaseAfterSales;

  /// No description provided for @clientStatusProspect.
  ///
  /// In fr, this message translates to:
  /// **'Prospect'**
  String get clientStatusProspect;

  /// No description provided for @clientStatusClient.
  ///
  /// In fr, this message translates to:
  /// **'Client'**
  String get clientStatusClient;

  /// No description provided for @clientStatusInactive.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get clientStatusInactive;

  /// No description provided for @contactNoName.
  ///
  /// In fr, this message translates to:
  /// **'Sans nom'**
  String get contactNoName;

  /// No description provided for @contactRoleDirector.
  ///
  /// In fr, this message translates to:
  /// **'Directeur / CEO'**
  String get contactRoleDirector;

  /// No description provided for @contactRoleManager.
  ///
  /// In fr, this message translates to:
  /// **'Gérant'**
  String get contactRoleManager;

  /// No description provided for @contactRoleBuyer.
  ///
  /// In fr, this message translates to:
  /// **'Acheteur'**
  String get contactRoleBuyer;

  /// No description provided for @contactRoleSales.
  ///
  /// In fr, this message translates to:
  /// **'Commercial'**
  String get contactRoleSales;

  /// No description provided for @contactRoleAccounting.
  ///
  /// In fr, this message translates to:
  /// **'Comptabilité'**
  String get contactRoleAccounting;

  /// No description provided for @contactRoleTechnical.
  ///
  /// In fr, this message translates to:
  /// **'Technique'**
  String get contactRoleTechnical;

  /// No description provided for @contactRoleAssistant.
  ///
  /// In fr, this message translates to:
  /// **'Assistante'**
  String get contactRoleAssistant;

  /// No description provided for @contactRoleDecisionMaker.
  ///
  /// In fr, this message translates to:
  /// **'Décideur'**
  String get contactRoleDecisionMaker;

  /// No description provided for @contactRoleOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get contactRoleOther;

  /// No description provided for @eiDocumentNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Document introuvable dans e-Invoicing.'**
  String get eiDocumentNotFound;

  /// No description provided for @invLicenseActiveSite.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement actif — eastmarkhk.com'**
  String get invLicenseActiveSite;

  /// No description provided for @invLicenseActiveAppStore.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement actif — App Store'**
  String get invLicenseActiveAppStore;

  /// No description provided for @invLicenseTrial.
  ///
  /// In fr, this message translates to:
  /// **'Essai gratuit'**
  String get invLicenseTrial;

  /// No description provided for @invOpenInvoicesCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 facture ouverte} other{{count} factures ouvertes}}'**
  String invOpenInvoicesCount(int count);

  /// No description provided for @lineQty.
  ///
  /// In fr, this message translates to:
  /// **'Qté'**
  String get lineQty;

  /// No description provided for @lineUnitPriceHt.
  ///
  /// In fr, this message translates to:
  /// **'PU HT'**
  String get lineUnitPriceHt;

  /// No description provided for @lineUnitPriceVat.
  ///
  /// In fr, this message translates to:
  /// **'PU TVAC'**
  String get lineUnitPriceVat;

  /// No description provided for @lineTotalVat.
  ///
  /// In fr, this message translates to:
  /// **'Total TVAC'**
  String get lineTotalVat;

  /// No description provided for @eiCreateClient.
  ///
  /// In fr, this message translates to:
  /// **'Créer le client'**
  String get eiCreateClient;

  /// No description provided for @eiCreateNew.
  ///
  /// In fr, this message translates to:
  /// **'Créer un nouveau'**
  String get eiCreateNew;

  /// No description provided for @eiContinue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get eiContinue;

  /// No description provided for @eiClientCrm.
  ///
  /// In fr, this message translates to:
  /// **'Client CRM : {name}'**
  String eiClientCrm(String name);

  /// No description provided for @eiNoTaxCountry.
  ///
  /// In fr, this message translates to:
  /// **'Ce pays n’utilise pas de n° fiscal sur les documents (ex. Hong Kong). Le rattachement se fait par email, téléphone, nom, ou lien mémorisé après la première association.'**
  String get eiNoTaxCountry;

  /// No description provided for @eiTaxIdMissing.
  ///
  /// In fr, this message translates to:
  /// **'{taxId} manquant sur la fiche CRM. Recommandé pour la facturation électronique et pour éviter les doublons. Saisissez-le ci-dessous ou continuez sans.'**
  String eiTaxIdMissing(String taxId);

  /// No description provided for @eiSameTaxIdDifferentName.
  ///
  /// In fr, this message translates to:
  /// **'Même {taxId} ({vatNumber}) trouvé dans e-Invoicing, mais le nom est différent :\n• e-Invoicing : {eiName}\n• CRM : {crmName}\n\nUtiliser le client existant, ou en créer un nouveau ?'**
  String eiSameTaxIdDifferentName(
    String taxId,
    String vatNumber,
    String eiName,
    String crmName,
  );

  /// No description provided for @eiNameOnlyMatch.
  ///
  /// In fr, this message translates to:
  /// **'Correspondance par nom uniquement (« {name} »). Sans n° fiscal / email / téléphone commun, confirmez « Utiliser l’existant » ou créez un nouveau client (le lien sera mémorisé pour la prochaine fois).'**
  String eiNameOnlyMatch(String name);

  /// No description provided for @eiNoMatchNew.
  ///
  /// In fr, this message translates to:
  /// **'Aucun client correspondant dans e-Invoicing. Un nouveau client sera créé à partir de la fiche CRM.'**
  String get eiNoMatchNew;

  /// No description provided for @eiNoMatchNewGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Aucun client correspondant (email / téléphone / nom). Un nouveau client sera créé dans e-Invoicing et le lien sera mémorisé sur cette fiche CRM.'**
  String get eiNoMatchNewGeneric;

  /// No description provided for @eiClientFound.
  ///
  /// In fr, this message translates to:
  /// **'Client trouvé dans e-Invoicing : {name}{detail}.'**
  String eiClientFound(String name, String detail);

  /// No description provided for @eiHitEmail.
  ///
  /// In fr, this message translates to:
  /// **' — email {email}'**
  String eiHitEmail(String email);

  /// No description provided for @eiHitPhone.
  ///
  /// In fr, this message translates to:
  /// **' — tél. {phone}'**
  String eiHitPhone(String phone);

  /// No description provided for @eiHitName.
  ///
  /// In fr, this message translates to:
  /// **' — nom'**
  String get eiHitName;

  /// No description provided for @eiHitLinked.
  ///
  /// In fr, this message translates to:
  /// **' — déjà lié'**
  String get eiHitLinked;

  /// No description provided for @dictationLanguageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Langue de dictée'**
  String get dictationLanguageTitle;

  /// No description provided for @eiAddPhoto.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une photo'**
  String get eiAddPhoto;

  /// No description provided for @openExternalError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir{label}.'**
  String openExternalError(String label);

  /// No description provided for @syncPushFailedShort.
  ///
  /// In fr, this message translates to:
  /// **'Échec du push'**
  String get syncPushFailedShort;

  /// No description provided for @reachEmailSent.
  ///
  /// In fr, this message translates to:
  /// **'E-mail ouvert'**
  String get reachEmailSent;

  /// No description provided for @countryPickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un pays'**
  String get countryPickerTitle;

  /// No description provided for @countryPickerSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un pays…'**
  String get countryPickerSearchHint;

  /// No description provided for @alarmTitle.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{Rappel tâche} other{{count} rappels}}'**
  String alarmTitle(int count);

  /// No description provided for @alarmMarkDone.
  ///
  /// In fr, this message translates to:
  /// **'Marquer fait'**
  String get alarmMarkDone;

  /// No description provided for @alarmPostpone15.
  ///
  /// In fr, this message translates to:
  /// **'+15 min'**
  String get alarmPostpone15;

  /// No description provided for @alarmPostpone1h.
  ///
  /// In fr, this message translates to:
  /// **'+1 h'**
  String get alarmPostpone1h;

  /// No description provided for @alarmClose1min.
  ///
  /// In fr, this message translates to:
  /// **'Fermer — rappel dans 10 min'**
  String get alarmClose1min;

  /// No description provided for @richColorPickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Couleur du texte'**
  String get richColorPickerTitle;

  /// No description provided for @eiHitEmailPlain.
  ///
  /// In fr, this message translates to:
  /// **' — email'**
  String get eiHitEmailPlain;

  /// No description provided for @eiHitPhonePlain.
  ///
  /// In fr, this message translates to:
  /// **' — tél.'**
  String get eiHitPhonePlain;

  /// No description provided for @tasksEditTaskTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la tâche'**
  String get tasksEditTaskTitle;

  /// No description provided for @activityTaskCreated.
  ///
  /// In fr, this message translates to:
  /// **'Tâche créée'**
  String get activityTaskCreated;

  /// No description provided for @dictationOfflineTip.
  ///
  /// In fr, this message translates to:
  /// **'Dictée hors ligne — elle capture souvent le bruit (TV) au lieu de votre voix. Activez « Reconnaissance vocale en ligne » dans Paramètres Windows → Confidentialité → Discours, baissez le bruit, puis réessayez.'**
  String get dictationOfflineTip;

  /// No description provided for @dictationLanguageFallbackTip.
  ///
  /// In fr, this message translates to:
  /// **'Cette variante de langue n’est pas installée sur Windows — une variante proche est utilisée. Installez le pack Speech souhaité dans Paramètres → Heure et langue → Speech.'**
  String get dictationLanguageFallbackTip;

  /// No description provided for @dictationStarting.
  ///
  /// In fr, this message translates to:
  /// **'Démarrage de la dictée…'**
  String get dictationStarting;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fil',
    'fr',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'ms',
    'nl',
    'no',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

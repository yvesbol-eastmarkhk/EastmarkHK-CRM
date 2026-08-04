import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/app_database.dart';
import '../models/user_account.dart';
import 'auth_service.dart';
import 'device_passkey_service.dart';

/// Utilisateur actif de l'application sur cet appareil. Tant qu'aucun
/// compte n'existe (premier lancement), l'app se comporte comme si on
/// était administrateur — pas de friction avant d'avoir créé le premier
/// compte. Dès qu'un compte existe, une session doit être active pour
/// distinguer administrateur / utilisateur (contrôle des mots de passe).
class CurrentSession extends ChangeNotifier {
  CurrentSession._();
  static final CurrentSession instance = CurrentSession._();

  static const _prefKey = 'current_session_user_id';

  UserAccount? _user;
  UserAccount? get user => _user;

  bool _loaded = false;

  /// `true` si aucun compte n'existe encore (mode bootstrap : tout est permis).
  bool _noAccountsYet = false;

  /// `true` une fois qu'un mot de passe ou Touch ID a été validé au cours de
  /// CE lancement de l'app. Contrairement à [_user] (qui est mémorisé entre
  /// lancements pour préremplir l'écran de connexion), ce verrou est remis à
  /// zéro à chaque démarrage — comme AppLockService côté e-Invoicing : se
  /// souvenir du dernier utilisateur est un confort, pas une preuve d'identité.
  bool _unlockedThisSession = false;

  bool get isAdmin => _noAccountsYet || (_user?.isAdmin ?? false);

  /// Ancien flux « créer un admin pour sécuriser » — désactivé.
  /// Sans compte on entre directement dans le CRM (mode ouvert).
  bool get needsBootstrap => false;

  /// `true` si l'app doit afficher l'écran de connexion avant d'entrer dans
  /// le CRM (des comptes existent et aucun n'a encore été déverrouillé ce
  /// lancement-ci).
  bool get needsLogin => !_noAccountsYet && !_unlockedThisSession;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    // Nettoie les doublons sync (yvesbol / Yvesbol) avant de restaurer la session.
    final removed = await AppDatabase.instance.dedupeUsersByUsername();
    for (final id in removed) {
      try {
        await DevicePasskeyService.removeToken(id);
      } catch (_) {}
    }
    // Même nettoyage pour les sociétés (ex. import CSV réimporté, ou société
    // créée séparément sur 2 appareils avant leur 1ʳᵉ sync) — fusionne sans
    // perte (contacts/opportunités/tâches réattribués à la fiche gardée).
    try {
      await AppDatabase.instance.dedupeCompaniesByName();
    } catch (_) {}
    final accounts = await AppDatabase.instance.users();
    _noAccountsYet = accounts.isEmpty;
    final prefs = await SharedPreferences.getInstance();
    if (!_noAccountsYet) {
      final lastId = prefs.getString(_prefKey);
      if (lastId != null) {
        UserAccount? found;
        for (final a in accounts) {
          if (a.id == lastId) {
            found = a;
            break;
          }
        }
        if (found != null) {
          _user = found;
        } else {
          // Compte mémorisé soft-deleted ou absent — oublier.
          await prefs.remove(_prefKey);
          _user = null;
        }
      }
    } else {
      await prefs.remove(_prefKey);
    }
    _loaded = true;
  }

  Future<bool> login(String username, String password) async {
    final account = await AppDatabase.instance.userByUsername(username.trim());
    if (account == null) return false;
    if (!AuthService.verify(password, account.passwordHash, account.passwordSalt)) {
      return false;
    }
    _user = account;
    _noAccountsYet = false;
    _unlockedThisSession = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, account.id);
    return true;
  }

  /// À appeler après un déverrouillage réussi par Touch ID (voir
  /// DevicePasskeyService) — le compte était déjà connu (préchargé via
  /// [ensureLoaded]), seule l'identité reste à confirmer.
  void markUnlockedByBiometrics() {
    _unlockedThisSession = true;
    notifyListeners();
  }

  /// Reverrouille la session (passage en arrière-plan) — comme e-Invoicing.
  void lockSession() {
    if (_noAccountsYet) return;
    _unlockedThisSession = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    _unlockedThisSession = false;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefKey);
  }

  /// À appeler après la création du tout premier compte (bootstrap) pour
  /// sortir du mode "aucun compte" et se connecter directement dessus.
  Future<void> adoptAfterBootstrap(UserAccount account) async {
    _noAccountsYet = false;
    _user = account;
    _unlockedThisSession = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, account.id);
  }

  /// Recharge le compte actif depuis la base (après modification de son
  /// propre profil).
  Future<void> refresh() async {
    if (_user == null) return;
    final accounts = await AppDatabase.instance.users();
    for (final a in accounts) {
      if (a.id == _user!.id) {
        _user = a;
        notifyListeners();
        return;
      }
    }
  }
}

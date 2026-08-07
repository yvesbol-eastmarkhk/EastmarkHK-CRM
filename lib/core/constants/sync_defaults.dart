/// Valeurs d’exemple / migration pour la synchronisation CRM distante.
///
/// Sur une **nouvelle installation App Store**, les champs Réglages restent
/// vides — seules les hints génériques sont affichées. Les hôtes EastmarkHK
/// ne sont utilisés que pour migrer d’anciennes configs déjà enregistrées,
/// pas comme pré-remplissage produit.
abstract final class SyncDefaults {
  /// Hints UI (jamais persistés automatiquement).
  static const serverUrlHint = 'https://emhk.yourwebsite.extension/crm';
  static const accountHint = 'emhk.yourwebsite.extension';

  /// Cible de migration uniquement (anciens `crm.eastmarkhk.com` / comptes
  /// legacy déjà présents dans la base locale de l’utilisateur).
  static const legacyMigratedServerUrl = 'https://emhk.eastmarkhk.com/crm';
  static const legacyMigratedAccount = 'emhk@eastmarkhk.com';
}

import '../../l10n/gen/app_localizations.dart';

/// Les activités persistent leur titre au moment de la saisie (souvent en FR).
/// On re-traduit les libellés connus à l'affichage pour refléter la langue courante.
String localizedActivityTitle(AppLocalizations l10n, String title) =>
    switch (title) {
      'Note' => l10n.logKindNote,
      'Devis envoyé' => l10n.logKindQuoteSent,
      'E-mail' => l10n.logKindEmail,
      'Appel' => l10n.logKindCall,
      'Réunion' => l10n.logKindMeeting,
      'Réponse client' => l10n.logKindReply,
      'Remarque' => l10n.logKindRemark,
      'Changement de stade' => l10n.oppStageChanged,
      'Opportunité créée' => l10n.oppCreated,
      'Tâche créée' => l10n.activityTaskCreated,
      _ => title,
    };

/// Tips émis par [DesktopSpeechService] via codes stables → texte l10n.
String localizedDictationInfo(AppLocalizations l10n, String message) =>
    switch (message) {
      'tip:offlineEngine' => l10n.dictationOfflineTip,
      'tip:languageFallback' => l10n.dictationLanguageFallbackTip,
      _ => message,
    };

import 'package:flutter/services.dart';

/// Pont vers l'IA embarquée d'Apple (Foundation Models — Apple Intelligence,
/// macOS 26+, Apple Silicon), 100% gratuite et locale (aucune clé API,
/// aucun appel réseau). Voir macos/Runner/AiAssistant.swift pour
/// l'implémentation côté Swift.
///
/// Gratuit ne veut pas dire universellement disponible : Mac Intel,
/// versions de macOS/Xcode plus anciennes, ou Apple Intelligence désactivé
/// dans les Réglages système — dans tous ces cas, l'appel échoue proprement
/// et l'appelant retombe sur la saisie manuelle (jamais de plantage, jamais
/// de blocage de l'app).
class AiAssistantService {
  static const _channel = MethodChannel('eastmarkhk_crm/ai');

  /// Analyse une description libre du besoin client (ex: "20 tags RFID,
  /// il veut un prix FOB Shenzhen") et renvoie un titre + des notes prêts à
  /// relire dans le dialogue Opportunité — jamais enregistrés directement,
  /// l'utilisateur garde la main pour corriger avant de sauvegarder.
  static Future<AiOpportunityDraft?> draftOpportunity(String prompt) async {
    try {
      final result = await _channel.invokeMethod<Map>('draftOpportunity', {'prompt': prompt});
      if (result == null) return null;
      final title = result['title'] as String?;
      final notes = result['notes'] as String?;
      if (title == null || title.trim().isEmpty) return null;
      return AiOpportunityDraft(title: title.trim(), notes: (notes ?? '').trim());
    } on PlatformException {
      // Erreur remontée volontairement par le côté Swift (modèle
      // indisponible, Apple Intelligence désactivé, etc.) — pas un bug.
      return null;
    } on MissingPluginException {
      // Plateforme autre que macOS, ou build sans le pont (ex. avant la
      // prochaine reconstruction Xcode).
      return null;
    }
  }
}

class AiOpportunityDraft {
  AiOpportunityDraft({required this.title, required this.notes});
  final String title;
  final String notes;
}

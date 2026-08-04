import FlutterMacOS
import Foundation

#if canImport(FoundationModels)
import FoundationModels

/// Structure guidée pour la génération : le modèle d'Apple remplit ces champs
/// à partir de la description libre de l'utilisateur (guided generation,
/// donc jamais de JSON malformé).
@available(macOS 26.0, *)
@Generable
struct OpportunityDraft {
  @Guide(description: "Titre court et vendeur de l'opportunité commerciale, dans la langue de la description (ex. « 20 000 tags RFID — FOB Shenzhen »)")
  var title: String

  @Guide(description: "Notes structurées en texte simple : produit, quantité, Incoterms, conditions de paiement, prochaines étapes. Une ligne par point.")
  var notes: String

  @Guide(description: "Montant estimé du deal en nombre, uniquement s'il est mentionné ou calculable, sinon null")
  var amount: Double?

  @Guide(description: "Probabilité de gain entre 0 et 100 si elle peut être déduite du contexte, sinon null")
  var probability: Int?
}
#endif

/// Pont MethodChannel « eastmarkhk_crm/ai » vers Apple Foundation Models
/// (Apple Intelligence, macOS 26+, Apple Silicon). 100 % local et gratuit.
/// Contrepartie Dart : lib/core/services/ai_assistant_service.dart.
enum AiAssistant {
  static func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: "eastmarkhk_crm/ai", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      guard call.method == "draftOpportunity" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard let args = call.arguments as? [String: Any],
            let prompt = args["prompt"] as? String,
            !prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        result(FlutterError(code: "bad_args", message: "Prompt manquant", details: nil))
        return
      }

      #if canImport(FoundationModels)
      if #available(macOS 26.0, *) {
        let model = SystemLanguageModel.default
        guard case .available = model.availability else {
          result(FlutterError(
            code: "unavailable",
            message: "Apple Intelligence indisponible (désactivé, non supporté ou modèle non téléchargé)",
            details: nil))
          return
        }
        Task {
          do {
            let session = LanguageModelSession(instructions: """
              Tu es l'assistant d'un CRM de commerce international (sourcing Asie/Europe).
              À partir de la description d'un besoin client, prépare un brouillon
              d'opportunité commerciale. Réponds dans la langue de la description.
              N'invente aucun chiffre : laisse amount et probability vides s'ils
              ne sont pas déductibles du texte.
              """)
            let response = try await session.respond(to: prompt, generating: OpportunityDraft.self)
            let draft = response.content
            var payload: [String: Any] = [
              "title": draft.title,
              "notes": draft.notes,
            ]
            if let amount = draft.amount { payload["amount"] = amount }
            if let probability = draft.probability { payload["probability"] = probability }
            DispatchQueue.main.async { result(payload) }
          } catch {
            DispatchQueue.main.async {
              result(FlutterError(code: "ai_error", message: error.localizedDescription, details: nil))
            }
          }
        }
        return
      }
      #endif

      // Compilé sans le SDK macOS 26, ou exécuté sur un macOS plus ancien.
      result(FlutterError(
        code: "unavailable",
        message: "Apple Intelligence nécessite macOS 26+ sur Apple Silicon",
        details: nil))
    }
  }
}

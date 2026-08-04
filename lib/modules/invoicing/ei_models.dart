import 'dart:convert';

/// Comment le client e-Invoicing a été trouvé pour une fiche CRM.
enum EiCustomerMatchBy {
  linked,
  taxId,
  email,
  phone,
  name,
}

/// Client e-Invoicing trouvé lors de la résolution CRM → e-Invoicing.
class EiCustomerHit {
  const EiCustomerHit({
    this.id,
    this.uuid,
    required this.name,
    this.vatNumber = '',
    this.email = '',
    this.phone = '',
    this.matchBy = EiCustomerMatchBy.name,
  });

  final int? id;
  final String? uuid;
  final String name;
  final String vatNumber;
  final String email;
  final String phone;
  final EiCustomerMatchBy matchBy;
}

/// Aperçu du rattachement client avant création d'un devis/facture.
class EiCustomerPreview {
  const EiCustomerPreview({
    required this.taxIdLabel,
    required this.crmName,
    required this.crmTaxId,
    required this.taxIdExpected,
    required this.missingTaxId,
    this.alreadyLinked = false,
    this.byTaxId,
    this.byEmail,
    this.byPhone,
    this.byName,
  });

  final String taxIdLabel;
  final String crmName;
  final String crmTaxId;

  /// false pour HK, Macao, etc. — on n'exige pas de n° fiscal.
  final bool taxIdExpected;
  final bool missingTaxId;
  final bool alreadyLinked;
  final EiCustomerHit? byTaxId;
  final EiCustomerHit? byEmail;
  final EiCustomerHit? byPhone;
  final EiCustomerHit? byName;

  EiCustomerHit? get bestHit =>
      byTaxId ?? byEmail ?? byPhone ?? byName;

  bool get nameDiffersOnTaxMatch {
    final hit = byTaxId;
    if (hit == null) return false;
    return hit.name.trim().toLowerCase() != crmName.trim().toLowerCase();
  }

  bool get willCreateNew => !alreadyLinked && bestHit == null;

  /// Correspondance forte (lien, TVA, email, téléphone) — pas besoin de
  /// confirmer sauf si le nom diverge sur un match TVA.
  bool get strongMatch =>
      alreadyLinked || byTaxId != null || byEmail != null || byPhone != null;
}

/// Décision utilisateur après le dialogue de résolution client.
enum EiCustomerDecisionKind {
  /// Utiliser le client e-Invoicing existant.
  useExisting,

  /// Créer un nouveau client e-Invoicing depuis la fiche CRM.
  createNew,

  /// Annuler la création du document.
  cancel,
}

class EiCustomerDecision {
  const EiCustomerDecision({
    required this.kind,
    this.existing,
    this.updatedTaxId,
  });

  final EiCustomerDecisionKind kind;
  final EiCustomerHit? existing;

  /// N° TVA/CNPJ éventuellement saisi dans le dialogue (pays qui en attendent un).
  final String? updatedTaxId;

  static const cancel = EiCustomerDecision(kind: EiCustomerDecisionKind.cancel);
}

/// Ligne saisie dans l'éditeur CRM, écrite telle quelle dans e-Invoicing
/// (catalogue ou ligne libre — même modèle que `DocLine` côté e-Invoicing).
class EiLine {
  EiLine({
    this.description = '',
    this.qty = 1,
    this.unitPrice = 0,
    this.productId,
    this.productUuid,
    this.photoPath,
  });

  String description;
  double qty;
  double unitPrice;

  /// Produit du catalogue (null = ligne libre saisie manuellement).
  int? productId;
  String? productUuid;
  String? photoPath;

  double get total => qty * unitPrice;
}

/// Produit du catalogue e-Invoicing — mêmes champs que l’app e-Invoicing.
class EiProduct {
  EiProduct({
    this.id,
    required this.uuid,
    required this.name,
    this.ref = '',
    this.description = '',
    this.hsCode = '',
    this.taxRate = 0,
    this.taxNote = '',
    this.salePrice = 0,
    this.photoPaths = const [],
    this.notes = '',
    this.cfop = '',
    this.cstIcms = '',
    this.cstPisCofins = '',
  });

  final int? id;
  final String uuid;
  final String name;
  final String ref;
  final String description;
  final String hsCode;
  final double taxRate;
  final String taxNote;
  final double salePrice;
  final List<String> photoPaths;
  final String notes;
  final String cfop;
  final String cstIcms;
  final String cstPisCofins;

  String get mainPhotoPath => photoPaths.isEmpty ? '' : photoPaths.first;

  double get priceInclTax => salePrice * (1 + taxRate / 100);

  factory EiProduct.fromRow(Map<String, Object?> m) {
    var photos = <String>[];
    final raw = m['photo_paths'];
    if (raw is List) {
      photos = raw.map((e) => '$e').toList();
    } else if (raw is String && raw.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) photos = decoded.map((e) => '$e').toList();
      } catch (_) {}
    }
    return EiProduct(
      id: (m['id'] as num?)?.toInt(),
      uuid: (m['uuid'] as String?) ?? '',
      name: (m['name'] ?? '') as String,
      ref: (m['ref'] ?? '') as String,
      description: (m['description'] ?? '') as String,
      hsCode: (m['hs_code'] ?? '') as String,
      taxRate: (m['tax_rate'] as num? ?? 0).toDouble(),
      taxNote: (m['tax_note'] ?? '') as String,
      salePrice: (m['sale_price'] as num? ?? 0).toDouble(),
      photoPaths: photos,
      notes: (m['notes'] ?? '') as String,
      cfop: (m['cfop'] ?? '') as String,
      cstIcms: (m['cst_icms'] ?? '') as String,
      cstPisCofins: (m['cst_pis_cofins'] ?? '') as String,
    );
  }

  factory EiProduct.fromRemoteJson(Map<String, dynamic> m) =>
      EiProduct.fromRow(Map<String, Object?>.from(m));
}

/// Référence produit déjà utilisée (même règle que e-Invoicing).
class DuplicateProductRefException implements Exception {
  DuplicateProductRefException(this.ref);
  final String ref;

  @override
  String toString() => 'DuplicateProductRefException($ref)';
}

/// Document e-Invoicing chargé pour édition dans le CRM.
class EiEditableDocument {
  const EiEditableDocument({
    required this.isInvoice,
    required this.id,
    required this.uuid,
    required this.number,
    required this.status,
    required this.vatRate,
    required this.notes,
    required this.date,
    required this.dueOrValid,
    required this.customerId,
    required this.lines,
    this.customerUuid = '',
    this.customerName = '',
    this.crmCompanyId,
    this.quoteId,
    this.quoteUuid,
  });

  final bool isInvoice;
  final int id;
  final String uuid;
  final String number;
  final String status;
  final double vatRate;
  final String notes;
  final DateTime date;
  final DateTime dueOrValid;
  final int customerId;
  final String customerUuid;
  /// Nom client e-Invoicing (affiche si pas encore lié à une fiche CRM).
  final String customerName;
  final String? crmCompanyId;
  final int? quoteId;
  final String? quoteUuid;
  final List<EiLine> lines;
}

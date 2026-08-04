import 'package:flutter/material.dart';

import '../../../l10n/gen/app_localizations.dart';
import '../ei_models.dart';

/// Dialogue avant création devis/facture.
///
/// - Pays avec TVA/CNPJ : alerte si manquant, conflit de nom sur même n°.
/// - Pays sans n° fiscal (HK…) : rattachement par lien mémorisé, email,
///   téléphone ou nom — jamais d'exigence de n° de taxe.
Future<EiCustomerDecision> showEiCustomerResolveDialog(
  BuildContext context, {
  required EiCustomerPreview preview,
}) async {
  // Lien déjà mémorisé, ou match fort (TVA / email / téléphone) sans
  // divergence de nom sur TVA → silencieux.
  if (preview.alreadyLinked) {
    return EiCustomerDecision(
      kind: EiCustomerDecisionKind.useExisting,
      existing: preview.bestHit,
    );
  }
  if (preview.byTaxId != null && !preview.nameDiffersOnTaxMatch) {
    return EiCustomerDecision(
      kind: EiCustomerDecisionKind.useExisting,
      existing: preview.byTaxId,
    );
  }
  if (preview.byEmail != null || preview.byPhone != null) {
    return EiCustomerDecision(
      kind: EiCustomerDecisionKind.useExisting,
      existing: preview.byEmail ?? preview.byPhone,
    );
  }

  // Match nom seul, création, TVA manquante (pays concernés), ou nom ≠ TVA.
  final l10n = AppLocalizations.of(context);
  final taxCtrl = TextEditingController(text: preview.crmTaxId);
  try {
    final result = await showDialog<EiCustomerDecision>(
      context: context,
      builder: (ctx) {
        final existing = preview.bestHit;
        return AlertDialog(
          title: Text(l10n.eiCustomerTitle),
          content: SizedBox(
            width: 640,
            child: _ResolveBody(preview: preview, taxCtrl: taxCtrl),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, EiCustomerDecision.cancel),
              child: Text(l10n.commonCancel),
            ),
            if (existing != null)
              TextButton(
                onPressed: () => Navigator.pop(
                  ctx,
                  EiCustomerDecision(
                    kind: EiCustomerDecisionKind.useExisting,
                    existing: existing,
                    updatedTaxId: _taxIfChanged(taxCtrl, preview),
                  ),
                ),
                child: Text(l10n.eiUseExisting),
              ),
            FilledButton(
              onPressed: () {
                final createNew = existing == null ||
                    preview.nameDiffersOnTaxMatch ||
                    (preview.byName != null &&
                        preview.byTaxId == null &&
                        preview.byEmail == null &&
                        preview.byPhone == null);
                Navigator.pop(
                  ctx,
                  EiCustomerDecision(
                    kind: createNew
                        ? EiCustomerDecisionKind.createNew
                        : EiCustomerDecisionKind.useExisting,
                    existing: createNew ? null : existing,
                    updatedTaxId: _taxIfChanged(taxCtrl, preview),
                  ),
                );
              },
              child: Text(
                existing == null
                    ? 'Créer le client'
                    : preview.nameDiffersOnTaxMatch ||
                            (preview.byName != null && !preview.strongMatch)
                        ? 'Créer un nouveau'
                        : 'Continuer',
              ),
            ),
          ],
        );
      },
    );
    return result ?? EiCustomerDecision.cancel;
  } finally {
    taxCtrl.dispose();
  }
}

String? _taxIfChanged(
    TextEditingController ctrl, EiCustomerPreview preview) {
  if (!preview.taxIdExpected) return null;
  final t = ctrl.text.trim();
  if (t == preview.crmTaxId.trim()) return null;
  return t.isEmpty ? null : t;
}

class _ResolveBody extends StatelessWidget {
  const _ResolveBody({required this.preview, required this.taxCtrl});

  final EiCustomerPreview preview;
  final TextEditingController taxCtrl;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final p = preview;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.eiClientCrm(p.crmName),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        if (!p.taxIdExpected) ...[
          const SizedBox(height: 8),
          Text(
            l10n.eiNoTaxCountry,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
          ),
        ],
        const SizedBox(height: 12),
        if (p.missingTaxId && p.taxIdExpected) ...[
          _banner(
            context,
            color: scheme.errorContainer.withValues(alpha: 0.4),
            onColor: scheme.onErrorContainer,
            text: l10n.eiTaxIdMissing(p.taxIdLabel),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: taxCtrl,
            decoration: InputDecoration(
              labelText: p.taxIdLabel,
              border: const OutlineInputBorder(),
              hintText: l10n.eiOptional,
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (p.nameDiffersOnTaxMatch && p.byTaxId != null)
          _banner(
            context,
            color: scheme.tertiaryContainer.withValues(alpha: 0.55),
            onColor: scheme.onTertiaryContainer,
            text: l10n.eiSameTaxIdDifferentName(
              p.taxIdLabel,
              p.byTaxId!.vatNumber,
              p.byTaxId!.name,
              p.crmName,
            ),
          )
        else if (p.byName != null && !p.strongMatch)
          _banner(
            context,
            color: scheme.secondaryContainer.withValues(alpha: 0.55),
            onColor: scheme.onSecondaryContainer,
            text: l10n.eiNameOnlyMatch(p.byName!.name),
          )
        else if (p.willCreateNew)
          Text(
            p.taxIdExpected
                ? l10n.eiNoMatchNew
                : l10n.eiNoMatchNewGeneric,
            style: TextStyle(color: scheme.onSurfaceVariant),
          )
        else if (p.bestHit != null)
          Text(l10n.eiClientFound(p.bestHit!.name, _hitDetail(l10n, p.bestHit!))),
      ],
    );
  }

  String _hitDetail(AppLocalizations l10n, EiCustomerHit hit) {
    switch (hit.matchBy) {
      case EiCustomerMatchBy.taxId:
        return hit.vatNumber.isNotEmpty ? ' (${hit.vatNumber})' : '';
      case EiCustomerMatchBy.email:
        return hit.email.isNotEmpty ? l10n.eiHitEmail(hit.email) : l10n.eiHitEmailPlain;
      case EiCustomerMatchBy.phone:
        return hit.phone.isNotEmpty ? l10n.eiHitPhone(hit.phone) : l10n.eiHitPhonePlain;
      case EiCustomerMatchBy.name:
        return l10n.eiHitName;
      case EiCustomerMatchBy.linked:
        return l10n.eiHitLinked;
    }
  }

  Widget _banner(
    BuildContext context, {
    required Color color,
    required Color onColor,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: onColor)),
    );
  }
}

import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../models/models.dart';
import 'company_avatar.dart';
import 'safe_picker_dialog.dart';

/// Valeur de retour spéciale pour « Sans client » — distincte de `null`
/// (fermeture du dialogue sans choix, ex. tap en dehors).
class NoClientChoice {
  const NoClientChoice();
}

const noClientChoice = NoClientChoice();

/// Champ de sélection de client — remplace les `DropdownButtonFormField`
/// (liste plate sans recherche, difficilement utilisable avec 30+ clients).
/// Ouvre un [SafePickerDialog] avec barre de recherche, même présentation
/// que les sélecteurs pays/devise déjà utilisés dans l'app (dialogue de
/// taille fixe, bien contenu — pas un bottom sheet plein écran).
class CompanyPickerField extends StatelessWidget {
  const CompanyPickerField({
    super.key,
    required this.companies,
    required this.selectedId,
    required this.onSelected,
    this.label,
    this.allowNoClient = false,
  });

  final List<Company> companies;
  final String? selectedId;
  final ValueChanged<String?> onSelected;
  final String? label;
  final bool allowNoClient;

  Company? get _selected {
    final id = selectedId;
    if (id == null) return null;
    for (final c in companies) {
      if (c.id == id) return c;
    }
    return null;
  }

  Future<void> _open(BuildContext context) async {
    final result = await showCompanyPicker(
      context,
      companies: companies,
      selectedId: selectedId,
      allowNoClient: allowNoClient,
    );
    if (result == null) return;
    onSelected(result is NoClientChoice ? null : (result as Company).id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final company = _selected;
    // « Sans client » est une valeur choisie à part entière (pas un champ
    // vide) : le libellé doit se réduire en haut comme pour toute valeur
    // renseignée — sinon il se superpose visuellement au texte du champ
    // (`isEmpty: true` + un `child` non vide se chevauchent dans
    // `InputDecorator`, d'où le rendu illisible remonté par l'utilisateur).
    final hasValue = company != null || (allowNoClient && selectedId == null);
    return InkWell(
      onTap: () => _open(context),
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        isEmpty: !hasValue,
        decoration: InputDecoration(
          labelText: label ?? l10n.tasksClientLabel,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: !hasValue
            ? null
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (company != null) ...[
                    CompanyAvatar(name: company.name, radius: 12),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Text(
                      company?.name ?? l10n.tasksNoClient,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Retourne un [Company], un [NoClientChoice], ou `null` si fermé sans choix.
Future<Object?> showCompanyPicker(
  BuildContext context, {
  required List<Company> companies,
  String? selectedId,
  bool allowNoClient = false,
}) {
  return showDialog<Object?>(
    context: context,
    builder: (context) => _CompanyPickerDialog(
      companies: companies,
      selectedId: selectedId,
      allowNoClient: allowNoClient,
    ),
  );
}

class _CompanyPickerDialog extends StatefulWidget {
  const _CompanyPickerDialog({
    required this.companies,
    this.selectedId,
    this.allowNoClient = false,
  });

  final List<Company> companies;
  final String? selectedId;
  final bool allowNoClient;

  @override
  State<_CompanyPickerDialog> createState() => _CompanyPickerDialogState();
}

class _CompanyPickerDialogState extends State<_CompanyPickerDialog> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final q = _query.toLowerCase().trim();
    final filtered = q.isEmpty
        ? widget.companies
        : widget.companies.where((c) => c.name.toLowerCase().contains(q)).toList();

    return SafePickerDialog(
      title: l10n.tasksClientLabel,
      icon: Icons.business_outlined,
      searchHint: l10n.clientsSearchHint,
      onQueryChanged: (v) => setState(() => _query = v),
      child: ListView(
        children: [
          if (widget.allowNoClient)
            ListTile(
              leading: const Icon(Icons.person_off_outlined),
              title: Text(l10n.tasksNoClient),
              trailing: widget.selectedId == null
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () => Navigator.pop(context, noClientChoice),
            ),
          for (final company in filtered)
            ListTile(
              leading: CompanyAvatar(name: company.name, radius: 16),
              title: Text(company.name),
              trailing: widget.selectedId == company.id
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () => Navigator.pop(context, company),
            ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.cmdNoResults),
            ),
        ],
      ),
    );
  }
}

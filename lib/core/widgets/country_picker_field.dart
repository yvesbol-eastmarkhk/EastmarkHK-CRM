import 'package:flutter/material.dart';

import '../data/countries.dart';
import '../../l10n/gen/app_localizations.dart';
import 'country_flag_icon.dart';

/// Champ de sélection de pays (tous pays, avec drapeau et recherche).
/// Portage d'EastmarkHK e-Invoicing — utilisé pour l'adresse société et,
/// plus tard, l'adresse client.
class CountryPickerField extends StatelessWidget {
  const CountryPickerField({
    super.key,
    this.label,
    required this.selected,
    required this.onSelected,
  });

  final String? label;
  final CountryInfo? selected;
  final ValueChanged<CountryInfo> onSelected;

  Future<void> _openPicker(BuildContext context) async {
    final picked = await showCountrySearchSheet(context, selected: selected);
    if (picked != null) onSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final country = selected;
    return InkWell(
      onTap: () => _openPicker(context),
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        // `isEmpty: true` fait flotter le libellé en grand *dans* la zone de
        // contenu — s'il y a aussi un `child` avec du texte à cet endroit,
        // les deux se chevauchent (texte illisible). Donc pas de `child`
        // quand rien n'est sélectionné : le libellé sert déjà de repère.
        isEmpty: country == null,
        decoration: InputDecoration(
          labelText: label ?? l10n.addressCountry,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: country == null
            ? null
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CountryFlagIcon(
                    countryCode: country.code,
                    width: 22,
                    height: 16,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      country.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.2),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

Future<CountryInfo?> showCountrySearchSheet(
  BuildContext context, {
  CountryInfo? selected,
}) {
  return showModalBottomSheet<CountryInfo>(
    context: context,
    isScrollControlled: true,
    builder: (context) => CountrySearchSheet(selected: selected),
  );
}

class CountrySearchSheet extends StatefulWidget {
  const CountrySearchSheet({super.key, this.selected});
  final CountryInfo? selected;

  @override
  State<CountrySearchSheet> createState() => _CountrySearchSheetState();
}

class _CountrySearchSheetState extends State<CountrySearchSheet> {
  final _query = TextEditingController();
  List<CountryInfo> _filtered = CountryInfo.all;

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  void _filter(String value) {
    final q = value.toLowerCase().trim();
    setState(() {
      if (q.isEmpty) {
        _filtered = CountryInfo.all;
      } else {
        _filtered = CountryInfo.all
            .where((c) =>
                c.name.toLowerCase().contains(q) ||
                c.code.toLowerCase().contains(q) ||
                c.dialCode.contains(q))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final height = MediaQuery.sizeOf(context).height * 0.75;
    return SizedBox(
      height: height,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(l10n.countryPickerTitle, style: Theme.of(context).textTheme.titleMedium),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _query,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l10n.countryPickerSearchHint,
              ),
              onChanged: _filter,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final country = _filtered[index];
                final isSelected = widget.selected?.code == country.code;
                return ListTile(
                  leading: CountryFlagIcon(countryCode: country.code, width: 32, height: 22),
                  title: Text(country.name),
                  subtitle: Text('${country.code} · ${country.dialCode}'),
                  trailing: isSelected ? const Icon(Icons.check, color: Colors.green) : null,
                  onTap: () => Navigator.pop(context, country),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

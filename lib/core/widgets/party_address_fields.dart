import 'dart:async';

import 'package:flutter/material.dart';

import '../data/countries.dart';
import '../services/postal_lookup_service.dart';
import '../utils/phone_formatter.dart';
import '../utils/postal_code_formatter.dart';
import '../utils/responsive_form.dart';
import '../utils/vat_number.dart';
import 'country_flag_icon.dart';
import 'country_picker_field.dart';

/// Bloc identité + adresse réutilisable — société utilisatrice (Réglages)
/// et, plus tard, fiche client (module Facturation). Même moteur
/// qu'EastmarkHK e-Invoicing : pays avec drapeaux en premier, code postal
/// qui pré-remplit ville/état/quartier selon le pays, téléphone au format
/// international automatique (`+32 4 263 59 20` pour la Belgique…).
///
/// Ordre d'affichage : Nom (80%) | N° TVA/CNPJ (20%) — puis Pays — puis
/// Adresse — puis Code postal, Quartier/Bairro, État/Estado (seulement si
/// pertinents pour le pays), Ville — puis Téléphone | Email.
class PartyAddressFields extends StatefulWidget {
  const PartyAddressFields({
    super.key,
    required this.name,
    required this.countryCode,
    required this.taxId,
    required this.address,
    required this.district,
    required this.zip,
    required this.city,
    required this.state,
    required this.phone,
    required this.email,
    required this.onCountryChanged,
    required this.onTaxIdChanged,
    required this.onAddressChanged,
    required this.onDistrictChanged,
    required this.onZipChanged,
    required this.onCityChanged,
    required this.onStateChanged,
    required this.onPhoneChanged,
    required this.onEmailChanged,
    this.phoneCountryCode = '',
    this.onPhoneCountryChanged,
  });

  final Widget name;

  final String countryCode;
  final String taxId;
  final String address;
  final String district;
  final String zip;
  final String city;
  final String state;
  final String phone;
  final String phoneCountryCode;
  final String email;

  final ValueChanged<String> onCountryChanged;
  final ValueChanged<String> onTaxIdChanged;
  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onDistrictChanged;
  final ValueChanged<String> onZipChanged;
  final ValueChanged<String> onCityChanged;
  final ValueChanged<String> onStateChanged;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String>? onPhoneCountryChanged;
  final ValueChanged<String> onEmailChanged;

  @override
  State<PartyAddressFields> createState() => _PartyAddressFieldsState();
}

class _PartyAddressFieldsState extends State<PartyAddressFields> {
  late final TextEditingController _taxIdCtrl =
      TextEditingController(text: _initialTaxId());
  late final TextEditingController _addressCtrl = TextEditingController(text: widget.address);
  late final TextEditingController _districtCtrl = TextEditingController(text: widget.district);
  late final TextEditingController _zipCtrl = TextEditingController(text: widget.zip);
  late final TextEditingController _cityCtrl = TextEditingController(text: widget.city);
  late final TextEditingController _stateCtrl = TextEditingController(text: widget.state);
  late final TextEditingController _phoneCtrl =
      TextEditingController(text: formatPhoneInternational(widget.phone, _phoneIso));
  late final TextEditingController _emailCtrl = TextEditingController(text: widget.email);
  late final PhoneInputFormatter _phoneFormatter = PhoneInputFormatter(_phoneIso);
  late final VatInputFormatter _vatFormatter = VatInputFormatter(widget.countryCode);
  late final FocusNode _taxIdFocus = FocusNode();

  final _postalLookup = PostalLookupService();
  Timer? _debounce;
  bool _lookingUp = false;
  String? _lastLookupKey;

  String get _phoneIso => effectivePhoneCountry(widget.phoneCountryCode, widget.countryCode);

  String _initialTaxId() {
    if (widget.countryCode.toUpperCase() == 'BR') return widget.taxId;
    return VatNumber.formatLive(widget.taxId, widget.countryCode);
  }

  @override
  void initState() {
    super.initState();
    _taxIdFocus.addListener(_onTaxIdFocus);
  }

  /// Pré-remplit le préfixe pays (« BE » pour la Belgique…) dès que le
  /// champ prend le focus et est encore vide — l'utilisateur n'a qu'à
  /// taper les chiffres. Sans effet pour le Brésil (CNPJ, pas de préfixe).
  void _onTaxIdFocus() {
    if (!_taxIdFocus.hasFocus) return;
    if (widget.countryCode.toUpperCase() == 'BR') return;
    final prefix = VatNumber.vatPrefix(widget.countryCode);
    if (prefix.isEmpty) return;
    if (_taxIdCtrl.text.trim().isEmpty) {
      _setCtrl(_taxIdCtrl, prefix);
      widget.onTaxIdChanged(VatNumber.normalize(prefix, countryCode: widget.countryCode));
    }
  }

  @override
  void didUpdateWidget(PartyAddressFields old) {
    super.didUpdateWidget(old);
    if (old.countryCode == widget.countryCode &&
        old.phoneCountryCode == widget.phoneCountryCode) {
      return;
    }
    final oldPhoneIso = effectivePhoneCountry(old.phoneCountryCode, old.countryCode);
    final followedAddress = oldPhoneIso == old.countryCode.trim().toUpperCase();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (old.countryCode != widget.countryCode) {
        _vatFormatter.countryCode = widget.countryCode;
        if (followedAddress && widget.onPhoneCountryChanged != null) {
          // On ne réinterprète pas les chiffres de l'ancien pays sous le
          // nouvel indicatif (ex. "+32 4 263 59 20" → "+852 4263 5920" n'a
          // aucun sens, ce n'est pas le même numéro) : on repart d'un champ
          // vide avec le bon préfixe international.
          _resetPhoneForCountry(widget.countryCode);
        }
        if (widget.countryCode.toUpperCase() != 'BR') {
          final v = VatNumber.formatLive(_taxIdCtrl.text, widget.countryCode);
          if (_taxIdCtrl.text != v) _setCtrl(_taxIdCtrl, v);
          widget.onTaxIdChanged(VatNumber.normalize(v, countryCode: widget.countryCode));
        }
        _lastLookupKey = null;
      } else if (_phoneFormatter.countryCode != _phoneIso) {
        _applyPhoneCountry(_phoneIso, notify: false);
      }
    });
  }

  /// Repart d'un champ vide (juste le préfixe international) pour un
  /// changement de pays en cascade — contrairement à [_applyPhoneCountry]
  /// (choix manuel du pays du téléphone), ici il n'y a pas de numéro
  /// valide à reformater : l'ancien numéro appartenait à un autre pays.
  void _resetPhoneForCountry(String iso) {
    final code = iso.trim().toUpperCase();
    _phoneFormatter.countryCode = code;
    final prefix = phoneDialPrefix(code);
    if (_phoneCtrl.text != prefix) {
      _phoneCtrl.value =
          TextEditingValue(text: prefix, selection: TextSelection.collapsed(offset: prefix.length));
    }
    widget.onPhoneChanged('');
    widget.onPhoneCountryChanged?.call(code);
  }

  void _applyPhoneCountry(String iso, {required bool notify}) {
    final code = iso.trim().toUpperCase();
    _phoneFormatter.countryCode = code;
    final reformatted = formatPhoneInternational(_phoneCtrl.text, code);
    if (_phoneCtrl.text != reformatted) {
      _phoneCtrl.value =
          TextEditingValue(text: reformatted, selection: TextSelection.collapsed(offset: reformatted.length));
    }
    widget.onPhoneChanged(reformatted.trim());
    if (notify) widget.onPhoneCountryChanged?.call(code);
  }

  Future<void> _pickPhoneCountry() async {
    final picked = await showCountrySearchSheet(context, selected: CountryInfo.byCode(_phoneIso));
    if (picked == null || !mounted) return;
    _applyPhoneCountry(picked.code, notify: true);
  }

  void _setCtrl(TextEditingController c, String value) {
    if (c.text == value) return;
    c.value = TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length));
  }

  void _onTaxIdChanged(String v) {
    final iso = widget.countryCode;
    final formatted = iso.toUpperCase() == 'BR' ? v : VatNumber.formatLive(v, iso);
    if (formatted != v && iso.toUpperCase() != 'BR') _setCtrl(_taxIdCtrl, formatted);
    final stored =
        iso.toUpperCase() == 'BR' ? formatted : VatNumber.normalize(formatted, countryCode: iso);
    widget.onTaxIdChanged(stored);
  }

  void _onZipChanged(String raw) {
    final iso = widget.countryCode;
    final formatted = formatPostalCode(raw, iso);
    if (formatted != raw) {
      _zipCtrl.value = TextEditingValue(text: formatted, selection: TextSelection.collapsed(offset: formatted.length));
    }
    widget.onZipChanged(formatted);

    _debounce?.cancel();
    final significant = postalSignificantLength(formatted, iso);
    if (significant < minPostalLengthForLookup(iso)) return;
    _debounce = Timer(const Duration(milliseconds: 600), () => _lookup(formatted));
  }

  Future<void> _lookup(String zip) async {
    final iso = widget.countryCode;
    final key = postalLookupKey(iso, zip);
    if (key == _lastLookupKey) return;
    _lastLookupKey = key;
    setState(() => _lookingUp = true);
    try {
      final results = await _postalLookup.lookupAll(countryCode: iso, postalCode: zip);
      if (!mounted) return;
      if (results.length == 1) {
        _applyResult(results.first);
      } else if (results.length > 1) {
        final picked = await _pickPlace(results, iso);
        if (picked != null) _applyResult(picked);
      }
    } catch (_) {
      // Recherche silencieuse : saisie manuelle toujours possible.
    } finally {
      if (mounted) setState(() => _lookingUp = false);
    }
  }

  void _applyResult(PostalLookupResult r) {
    if (r.city.isNotEmpty) {
      _cityCtrl.text = r.city;
      widget.onCityChanged(r.city);
    }
    if (showStateField(widget.countryCode)) {
      final s = r.stateCode ?? r.state ?? '';
      if (s.isNotEmpty) {
        _stateCtrl.text = s;
        widget.onStateChanged(s);
      }
    }
    if (showDistrictField(widget.countryCode) && (r.district ?? '').isNotEmpty && _districtCtrl.text.isEmpty) {
      _districtCtrl.text = r.district!;
      widget.onDistrictChanged(r.district!);
    }
    if ((r.addressLine1 ?? '').isNotEmpty && _addressCtrl.text.isEmpty) {
      _addressCtrl.text = r.addressLine1!;
      widget.onAddressChanged(r.addressLine1!);
    }
  }

  Future<PostalLookupResult?> _pickPlace(List<PostalLookupResult> results, String iso) {
    return showDialog<PostalLookupResult>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Plusieurs villes trouvées'),
        content: SizedBox(
          width: 360,
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final r in results)
                ListTile(
                  title: Text(r.city),
                  subtitle: Text(r.labelForCountry(iso)),
                  onTap: () => Navigator.pop(ctx, r),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Annuler')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _taxIdFocus.removeListener(_onTaxIdFocus);
    _taxIdFocus.dispose();
    _taxIdCtrl.dispose();
    _addressCtrl.dispose();
    _districtCtrl.dispose();
    _zipCtrl.dispose();
    _cityCtrl.dispose();
    _stateCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iso = widget.countryCode;
    final usesDistrict = showDistrictField(iso);
    final usesState = showStateField(iso);
    final usesCnpj = showCnpjField(iso);
    final country = CountryInfo.byCode(iso);
    final taxLabel = taxIdLabelForCountry(iso);

    final usesZip = showPostalCodeField(iso);

    // La décision ligne/colonne se base sur la largeur réellement
    // disponible pour ce formulaire (celle du dialogue qui l'héberge),
    // pas sur la largeur de l'écran entier — sinon un dialogue étroit sur
    // un grand écran desktop force quand même une ligne unique et écrase
    // les champs les uns contre les autres.
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < kCompactFormBreakpoint;

        // Ligne 1 : Nom | Pays | TVA-CNPJ.
        final identityRow = formRowOrColumn(
          context: context,
          compact: compact,
          children: [
            formFlexChild(context: context, compact: compact, flex: 3, child: widget.name),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 2,
              child: CountryPickerField(
                label: 'Pays',
                selected: country,
                onSelected: (c) => widget.onCountryChanged(c.code),
              ),
            ),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 2,
              child: usesCnpj
                  ? TextFormField(
                      controller: _taxIdCtrl,
                      inputFormatters: [CnpjInputFormatter()],
                      decoration: const InputDecoration(
                          labelText: 'CNPJ', hintText: '00.000.000/0000-00', border: OutlineInputBorder()),
                      onChanged: _onTaxIdChanged,
                    )
                  : TextFormField(
                      controller: _taxIdCtrl,
                      focusNode: _taxIdFocus,
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [_vatFormatter],
                      decoration: InputDecoration(labelText: taxLabel, border: const OutlineInputBorder()),
                      onChanged: _onTaxIdChanged,
                    ),
            ),
          ],
        );

        // Ligne 2 : Adresse seule, pleine largeur.
        final addressRow = TextFormField(
          controller: _addressCtrl,
          decoration: const InputDecoration(labelText: 'Adresse', border: OutlineInputBorder()),
          onChanged: widget.onAddressChanged,
        );

        // Ligne 3 : Code postal | Quartier/Bairro | État | Ville — le code
        // postal en premier car il permet de déduire les champs suivants
        // (recherche automatique de la ville/quartier/état). Masqué pour
        // Hong Kong (pas de code postal) ; Bairro/État seulement pour les
        // pays qui les utilisent (Brésil…).
        final addressDetailsRow = formRowOrColumn(
          context: context,
          compact: compact,
          children: [
            if (usesZip)
              formFlexChild(
                context: context,
                compact: compact,
                flex: 2,
                child: TextFormField(
                  controller: _zipCtrl,
                  decoration: InputDecoration(
                    labelText: 'Code postal',
                    hintText: postalHintForCountry(iso),
                    border: const OutlineInputBorder(),
                    suffixIcon: _lookingUp
                        ? const Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                          )
                        : const Icon(Icons.search, size: 18),
                  ),
                  onChanged: _onZipChanged,
                ),
              ),
            if (usesDistrict)
              formFlexChild(
                context: context,
                compact: compact,
                flex: 2,
                child: TextFormField(
                  controller: _districtCtrl,
                  decoration: InputDecoration(
                      labelText: country?.districtLabel ?? 'Quartier', border: const OutlineInputBorder()),
                  onChanged: widget.onDistrictChanged,
                ),
              ),
            if (usesState)
              formFlexChild(
                context: context,
                compact: compact,
                flex: 1,
                child: TextFormField(
                  controller: _stateCtrl,
                  decoration: const InputDecoration(labelText: 'État', border: OutlineInputBorder()),
                  onChanged: widget.onStateChanged,
                ),
              ),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 2,
              child: TextFormField(
                controller: _cityCtrl,
                decoration: const InputDecoration(labelText: 'Ville', border: OutlineInputBorder()),
                onChanged: widget.onCityChanged,
              ),
            ),
          ],
        );

        final contactLine = formRowOrColumn(
          context: context,
          compact: compact,
          children: [
            formFlexChild(
              context: context,
              compact: compact,
              flex: 1,
              child: TextFormField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                inputFormatters: [_phoneFormatter],
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  hintText: phoneExampleHint(_phoneIso),
                  border: const OutlineInputBorder(),
                  prefixIcon: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: _pickPhoneCountry,
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CountryFlagIcon(countryCode: _phoneIso, width: 24, height: 17),
                            Icon(Icons.arrow_drop_down, size: 20, color: Theme.of(context).hintColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 58, minHeight: 24),
                ),
                onChanged: (v) => widget.onPhoneChanged(formatPhoneInternational(v, _phoneIso)),
              ),
            ),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 1,
              child: TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                onChanged: widget.onEmailChanged,
              ),
            ),
          ],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            identityRow,
            const SizedBox(height: 12),
            addressRow,
            const SizedBox(height: 12),
            addressDetailsRow,
            const SizedBox(height: 12),
            contactLine,
          ],
        );
      },
    );
  }
}

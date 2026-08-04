import 'dart:async';

import 'package:flutter/material.dart';

import '../data/countries.dart';
import '../../l10n/gen/app_localizations.dart';
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
    this.name,
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

  /// Si `null`, le nom est géré hors de ce bloc (ex. section Société e-Invoicing).
  final Widget? name;

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
        // Changement de pays → tout le bloc adresse repart de zéro
        // (sinon BE reste collé sur CNPJ, CP belge sur une fiche BR, etc.).
        _resetAddressFieldsForCountry(
          widget.countryCode,
          resetPhone: followedAddress || widget.onPhoneCountryChanged != null,
        );
      } else if (_phoneFormatter.countryCode != _phoneIso) {
        _applyPhoneCountry(_phoneIso, notify: false);
      }
    });
  }

  /// Vide n° fiscal, rue, CP, ville… après un changement de pays.
  /// Le téléphone suit le nouvel indicatif ; l'e-mail est conservé.
  void _resetAddressFieldsForCountry(String iso, {required bool resetPhone}) {
    final code = iso.trim().toUpperCase();
    _vatFormatter.countryCode = code;
    _lastLookupKey = null;

    _setCtrl(_taxIdCtrl, '');
    widget.onTaxIdChanged('');

    _setCtrl(_addressCtrl, '');
    widget.onAddressChanged('');

    _setCtrl(_districtCtrl, '');
    widget.onDistrictChanged('');

    _setCtrl(_zipCtrl, '');
    widget.onZipChanged('');

    _setCtrl(_cityCtrl, '');
    widget.onCityChanged('');

    _setCtrl(_stateCtrl, '');
    widget.onStateChanged('');

    if (resetPhone) {
      _resetPhoneForCountry(code);
    }
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
    final l10n = AppLocalizations.of(context);
    return showDialog<PostalLookupResult>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.addressMultipleCities),
        content: SizedBox(
          width: 460,
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
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.commonCancel)),
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
    final usesTaxId = showTaxIdField(iso);
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
        final l10n = AppLocalizations.of(context);
        final compact = constraints.maxWidth < kCompactFormBreakpoint;

        // Ligne principale Adresse :
        // Pays (largeur fixe pour le plus long nom) | Adresse (reste) |
        // n° fiscal après l'adresse si le pays en a un (sinon rien — ex. HK).
        final hasCountry = iso.trim().isNotEmpty;
        final showTax = hasCountry && usesTaxId;

        Widget taxField() => usesCnpj
            ? TextField(
                controller: _taxIdCtrl,
                inputFormatters: [CnpjInputFormatter()],
                decoration: InputDecoration(
                  labelText: l10n.addressCnpj,
                  hintText: '00.000.000/0000-00',
                  border: const OutlineInputBorder(),
                ),
                onChanged: _onTaxIdChanged,
              )
            : TextField(
                controller: _taxIdCtrl,
                inputFormatters: [_vatFormatter],
                decoration: InputDecoration(
                  labelText: taxLabel,
                  border: const OutlineInputBorder(),
                ),
                onChanged: _onTaxIdChanged,
              );

        final addressField = TextField(
          controller: _addressCtrl,
          decoration: InputDecoration(
            labelText: l10n.addressAddress,
            border: const OutlineInputBorder(),
          ),
          onChanged: widget.onAddressChanged,
        );

        // Largeur pays : assez pour « Saint Vincent and the Grenadines » + drapeau.
        const countryWidth = 280.0;

        final Widget countryAddressTaxRow;
        if (compact) {
          countryAddressTaxRow = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.name != null) ...[
                widget.name!,
                const SizedBox(height: 12),
              ],
              CountryPickerField(
                label: l10n.addressCountry,
                selected: country,
                onSelected: (c) => widget.onCountryChanged(c.code),
              ),
              const SizedBox(height: 12),
              addressField,
              if (showTax) ...[
                const SizedBox(height: 12),
                taxField(),
              ],
            ],
          );
        } else {
          countryAddressTaxRow = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.name != null) ...[
                widget.name!,
                const SizedBox(height: 12),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: countryWidth,
                    child: CountryPickerField(
                      label: l10n.addressCountry,
                      selected: country,
                      onSelected: (c) => widget.onCountryChanged(c.code),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(flex: 5, child: addressField),
                  if (showTax) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      flex: taxIdFlexForCountry(iso),
                      child: taxField(),
                    ),
                  ],
                ],
              ),
            ],
          );
        }

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
                child: TextField(
                  controller: _zipCtrl,
                  decoration: InputDecoration(
                    labelText: l10n.addressZip,
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
                child: TextField(
                  controller: _districtCtrl,
                  decoration: InputDecoration(
                      labelText: country?.districtLabel ?? l10n.addressDistrict, border: const OutlineInputBorder()),
                  onChanged: widget.onDistrictChanged,
                ),
              ),
            if (usesState)
              formFlexChild(
                context: context,
                compact: compact,
                flex: 1,
                child: TextField(
                  controller: _stateCtrl,
                  decoration: InputDecoration(labelText: l10n.addressState, border: const OutlineInputBorder()),
                  onChanged: widget.onStateChanged,
                ),
              ),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 2,
              child: TextField(
                controller: _cityCtrl,
                decoration: InputDecoration(labelText: l10n.addressCity, border: const OutlineInputBorder()),
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
              child: TextField(
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                inputFormatters: [_phoneFormatter],
                decoration: InputDecoration(
                  labelText: l10n.addressPhone,
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
                onChanged: (v) => widget.onPhoneChanged(
                    formatPhoneInternational(v, _phoneIso)),
              ),
            ),
            formFlexChild(
              context: context,
              compact: compact,
              flex: 1,
              child: TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: l10n.addressEmail, border: const OutlineInputBorder()),
                onChanged: widget.onEmailChanged,
              ),
            ),
          ],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            countryAddressTaxRow,
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

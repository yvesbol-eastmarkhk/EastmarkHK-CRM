import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/data/countries.dart';
import '../../core/utils/responsive_form.dart';
import '../../core/utils/rich_notes.dart';
import '../../core/widgets/dictation_field.dart';
import '../../core/widgets/eastmark_logo.dart';
import '../../core/widgets/party_address_fields.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/client.dart';
import '../../models/task.dart';
import '../../platform/desktop_chrome.dart';
import '../../widgets/section_card.dart';

/// Fiche client — même structure qu'EastmarkHK e-Invoicing :
/// Société → Adresse → E-facturation → Notes.
class ClientEditScreen extends StatefulWidget {
  const ClientEditScreen({super.key, required this.client});

  final Client client;

  @override
  State<ClientEditScreen> createState() => _ClientEditScreenState();
}

class _ClientEditScreenState extends State<ClientEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.client.name);
  late final _contact =
      TextEditingController(text: widget.client.contactName ?? '');
  late final _peppol = TextEditingController(text: widget.client.peppolId ?? '');
  late final _notes = TextEditingController(
    text: notesPlainText(widget.client.notes),
  );

  late String _country = widget.client.country ?? '';
  late String _taxId = widget.client.taxId ?? '';
  late String _address = widget.client.address ?? '';
  late String _district = widget.client.district ?? '';
  late String _zip = widget.client.zip ?? '';
  late String _city = widget.client.city ?? '';
  late String _state = widget.client.state ?? '';
  late String _phone = widget.client.phone ?? '';
  late String _phoneCountry = widget.client.phoneCountry ?? '';
  late String _email = widget.client.email ?? '';
  late bool _useEInvoicing = widget.client.useEInvoicing;
  late ClientStatus _status = widget.client.status;
  bool _saving = false;

  bool get _isNew => widget.client.name.isEmpty;

  @override
  void dispose() {
    _name.dispose();
    _contact.dispose();
    _peppol.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    final l10n = AppLocalizations.of(context);
    final name = _name.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.clientNameRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    final notes = _notes.text.trim();
    final c = widget.client
      ..name = name
      ..contactName =
          _contact.text.trim().isEmpty ? null : _contact.text.trim()
      ..country = _country.trim().isEmpty ? null : _country.trim().toUpperCase()
      ..taxId = _taxId.trim().isEmpty ? null : _taxId.trim()
      ..peppolId = countryUsesPeppol(_country) && _peppol.text.trim().isNotEmpty
          ? _peppol.text.trim()
          : null
      ..email = _email.trim().isEmpty ? null : _email.trim()
      ..phone = _phone.trim().isEmpty ? null : _phone.trim()
      ..phoneCountry = _phoneCountry.trim().isEmpty
          ? null
          : _phoneCountry.trim().toUpperCase()
      ..address = _address.trim().isEmpty ? null : _address.trim()
      ..district = _district.trim().isEmpty ? null : _district.trim()
      ..zip = _zip.trim().isEmpty ? null : _zip.trim()
      ..city = _city.trim().isEmpty ? null : _city.trim()
      ..state = _state.trim().isEmpty ? null : _state.trim()
      ..notes = notes.isEmpty ? null : notes
      ..useEInvoicing = (countryUsesPeppol(_country) ||
              countryUsesBrazilEInvoice(_country)) &&
          _useEInvoicing
      ..status = _status
      ..updatedAt = nowIso();

    if (mounted) Navigator.pop(context, c);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const teal = Color(0xFF2BA89A);
    const cancelRed = Color(0xFFB42318);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyS, meta: true): _save,
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): _save,
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F6F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: DesktopChrome.appBarLeadingWidth,
          leading: DesktopChrome.backLeading(context),
          title: Text(_isNew ? l10n.clientEditNewTitle : l10n.clientEditModifyTitle),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: EastmarkWordmark(height: 28),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: [
              SegmentedButton<ClientStatus>(
                segments: [
                  for (final s in ClientStatus.values)
                    ButtonSegment(
                      value: s,
                      label: Text(_statusLabel(l10n, s)),
                    ),
                ],
                selected: {_status},
                onSelectionChanged: (v) => setState(() => _status = v.first),
              ),
              const SizedBox(height: 16),

              // ── Société ──────────────────────────────────────────────
              SectionCard(
                title: l10n.companyNameLabel,
                children: [
                  formRowOrColumn(
                    context: context,
                    children: [
                      formFlexChild(
                        context: context,
                        child: DictationField(
                          controller: _name,
                          autofocus: _isNew,
                          decoration: InputDecoration(
                            labelText: l10n.companyNameRequiredLabel,
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? l10n.formRequired : null,
                        ),
                      ),
                      formFlexChild(
                        context: context,
                        child: DictationField(
                          controller: _contact,
                          decoration: InputDecoration(
                            labelText: l10n.clientContactPerson,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // ── Adresse ──────────────────────────────────────────────
              SectionCard(
                title: l10n.addressAddress,
                children: [
                  PartyAddressFields(
                    countryCode: _country,
                    taxId: _taxId,
                    address: _address,
                    district: _district,
                    zip: _zip,
                    city: _city,
                    state: _state,
                    phone: _phone,
                    phoneCountryCode: _phoneCountry,
                    email: _email,
                    onCountryChanged: (v) => setState(() {
                      final prev = _country;
                      _country = v;
                      // Les contrôleurs sont vidés dans PartyAddressFields ;
                      // on aligne l'état parent pour la sauvegarde.
                      _taxId = '';
                      _address = '';
                      _district = '';
                      _zip = '';
                      _city = '';
                      _state = '';
                      _phone = '';
                      _phoneCountry = v;
                      // Sortie UE → plus de Peppol.
                      if (!countryUsesPeppol(v)) {
                        _peppol.clear();
                      }
                      // Hors UE et hors Brésil → pas d'e-facture dédiée.
                      if (!countryUsesPeppol(v) &&
                          !countryUsesBrazilEInvoice(v)) {
                        _useEInvoicing = false;
                      }
                      // Changement de régime fiscal : reset switch si besoin.
                      if (countryUsesPeppol(prev) != countryUsesPeppol(v) ||
                          countryUsesBrazilEInvoice(prev) !=
                              countryUsesBrazilEInvoice(v)) {
                        _useEInvoicing = false;
                      }
                    }),
                    onTaxIdChanged: (v) => _taxId = v,
                    onAddressChanged: (v) => _address = v,
                    onDistrictChanged: (v) => _district = v,
                    onZipChanged: (v) => _zip = v,
                    onCityChanged: (v) => _city = v,
                    onStateChanged: (v) => _state = v,
                    onPhoneChanged: (v) => _phone = v,
                    onPhoneCountryChanged: (v) =>
                        setState(() => _phoneCountry = v),
                    onEmailChanged: (v) => _email = v,
                  ),
                ],
              ),

              // ── E-facturation : Peppol (UE) ou NF-e (Brésil) uniquement ──
              if (countryUsesPeppol(_country))
                SectionCard(
                  title: l10n.clientEinvoicingSection,
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.clientEinvoicingPeppol),
                      subtitle: Text(l10n.clientEinvoicingPeppolHint),
                      value: _useEInvoicing,
                      activeThumbColor: teal,
                      onChanged: (v) => setState(() => _useEInvoicing = v),
                    ),
                    if (_useEInvoicing) ...[
                      const SizedBox(height: 8),
                      DictationField(
                        controller: _peppol,
                        decoration: InputDecoration(
                          labelText: l10n.clientPeppolIdLabel,
                          border: OutlineInputBorder(),
                          hintText: '0208:…',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.clientPeppolVerify),
                              ),
                            );
                          },
                          icon: const Icon(Icons.hub_outlined),
                          label: Text(l10n.peppolVerify),
                        ),
                      ),
                    ],
                  ],
                )
              else if (countryUsesBrazilEInvoice(_country))
                SectionCard(
                  title: l10n.clientEinvoicingSection,
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.nfeTitle),
                      subtitle: Text(l10n.clientNfeHint),
                      value: _useEInvoicing,
                      activeThumbColor: teal,
                      onChanged: (v) => setState(() => _useEInvoicing = v),
                    ),
                  ],
                ),

              // ── Notes (texte + dictée — pas de WYSIWYG) ──────────────
              SectionCard(
                title: l10n.clientNotesSection,
                children: [
                  DictationField(
                    controller: _notes,
                    maxLines: 8,
                    hint: l10n.clientNotesHint,
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: cancelRed,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.commonCancel),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                    ),
                    onPressed: _saving ? null : _save,
                    icon: _saving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.check),
                    label: Text(l10n.clientEditSaveShortcut),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _statusLabel(AppLocalizations l10n, ClientStatus s) => switch (s) {
        ClientStatus.prospect => l10n.clientStatusProspect,
        ClientStatus.active => l10n.clientStatusClient,
        ClientStatus.inactive => l10n.clientStatusInactive,
      };
}

/// Ouvre la fiche client plein écran (comme e-Invoicing).
Future<Client?> showClientEditor(
  BuildContext context, {
  required Client client,
}) {
  return Navigator.of(context).push<Client>(
    MaterialPageRoute(
      builder: (_) => ClientEditScreen(client: client),
    ),
  );
}

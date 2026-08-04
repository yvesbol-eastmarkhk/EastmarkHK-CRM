import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/phone_formatter.dart';
import '../../core/utils/responsive_form.dart';
import '../../core/utils/rich_notes.dart';
import '../../core/widgets/dictation_field.dart';
import '../../core/widgets/eastmark_logo.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/contact.dart';
import '../../models/task.dart';
import '../../platform/desktop_chrome.dart';
import '../../widgets/section_card.dart';

/// Ouvre l’éditeur de contact plein écran — même style que la fiche client.
Future<Contact?> showContactEditor(
  BuildContext context, {
  required Contact contact,
  String? defaultPhoneCountry,
}) {
  return Navigator.of(context).push<Contact>(
    MaterialPageRoute(
      builder: (_) => ContactEditScreen(
        contact: contact,
        defaultPhoneCountry: defaultPhoneCountry,
      ),
    ),
  );
}

/// Fiche contact — structure alignée sur [ClientEditScreen].
class ContactEditScreen extends StatefulWidget {
  const ContactEditScreen({
    super.key,
    required this.contact,
    this.defaultPhoneCountry,
  });

  final Contact contact;
  final String? defaultPhoneCountry;

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

class _ContactEditScreenState extends State<ContactEditScreen> {
  late final TextEditingController _first =
      TextEditingController(text: widget.contact.firstName ?? '');
  late final TextEditingController _last =
      TextEditingController(text: widget.contact.lastName ?? '');
  late final TextEditingController _email =
      TextEditingController(text: widget.contact.email ?? '');
  late final TextEditingController _role =
      TextEditingController(text: widget.contact.role ?? '');
  late final TextEditingController _notes = TextEditingController(
    text: notesPlainText(widget.contact.notes),
  );

  late final String _phoneCountry =
      widget.contact.phoneCountry ?? widget.defaultPhoneCountry ?? '';
  late final TextEditingController _phone = TextEditingController(
    text: formatPhoneInternational(
      widget.contact.phone ?? '',
      _phoneCountry,
    ),
  );
  late bool _isPrimary = widget.contact.isPrimary;
  late final PhoneInputFormatter _phoneFormatter =
      PhoneInputFormatter(_phoneCountry);

  bool get _isNew =>
      (widget.contact.firstName ?? '').isEmpty &&
      (widget.contact.lastName ?? '').isEmpty;

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _phone.dispose();
    _role.dispose();
    _notes.dispose();
    super.dispose();
  }

  void _save() {
    final l10n = AppLocalizations.of(context);
    if (_first.text.trim().isEmpty && _last.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.contactNameRequired)),
      );
      return;
    }
    final notes = _notes.text.trim();
    final c = widget.contact
      ..firstName = _first.text.trim().isEmpty ? null : _first.text.trim()
      ..lastName = _last.text.trim().isEmpty ? null : _last.text.trim()
      ..email = _email.text.trim().isEmpty ? null : _email.text.trim()
      ..phone = _phone.text.trim().isEmpty ? null : _phone.text.trim()
      ..phoneCountry =
          _phoneCountry.trim().isEmpty ? null : _phoneCountry.trim().toUpperCase()
      ..role = _role.text.trim().isEmpty ? null : _role.text.trim()
      ..notes = notes.isEmpty ? null : notes
      ..isPrimary = _isPrimary
      ..updatedAt = nowIso();
    Navigator.of(context).pop(c);
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
          title: Text(_isNew ? l10n.contactNewTitle : l10n.contactEditTitle),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: EastmarkWordmark(height: 28),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          children: [
            SectionCard(
              title: l10n.contactIdentitySection,
              children: [
                formRowOrColumn(
                  context: context,
                  children: [
                    formFlexChild(
                      context: context,
                      child: DictationField(
                        controller: _first,
                        autofocus: _isNew,
                        decoration: InputDecoration(
                          labelText: l10n.contactFirstName,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    formFlexChild(
                      context: context,
                      child: DictationField(
                        controller: _last,
                        decoration: InputDecoration(
                          labelText: l10n.contactLastName,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                DictationField(
                  controller: _role,
                  decoration: InputDecoration(
                    labelText: l10n.contactRoleLabel,
                    hintText: l10n.contactRoleHint,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final r in kContactRoleSuggestions)
                      ActionChip(
                        label: Text(r, style: const TextStyle(fontSize: 12)),
                        onPressed: () => setState(() => _role.text = r),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.contactPrimary),
                  subtitle: Text(l10n.contactPrimaryHint),
                  value: _isPrimary,
                  onChanged: (v) => setState(() => _isPrimary = v),
                ),
              ],
            ),
            SectionCard(
              title: l10n.contactDetailsSection,
              children: [
                formRowOrColumn(
                  context: context,
                  children: [
                    formFlexChild(
                      context: context,
                      child: DictationField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: l10n.contactEmail,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    formFlexChild(
                      context: context,
                      child: DictationField(
                        controller: _phone,
                        decoration: InputDecoration(
                          labelText: l10n.contactPhone,
                          hintText: _phoneCountry.isEmpty
                              ? '+…'
                              : l10n.contactPhoneFormat(_phoneCountry),
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [_phoneFormatter],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SectionCard(
              title: l10n.contactNotesSection,
              children: [
                DictationField(
                  controller: _notes,
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: l10n.contactNotesSection,
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
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
                      horizontal: 22,
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
                      horizontal: 22,
                      vertical: 14,
                    ),
                  ),
                  onPressed: _save,
                  icon: const Icon(Icons.check),
                  label: Text(l10n.contactSaveShortcut),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

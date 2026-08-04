import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../core/data/countries.dart';
import '../../core/services/client_company_bridge.dart';
import '../../core/utils/responsive_layout.dart';
import '../../core/utils/rich_notes.dart';
import '../../core/widgets/country_flag_icon.dart';
import '../../core/widgets/empty_state.dart';
import '../../models/client.dart';
import '../../models/contact.dart';
import '../../modules/invoicing/widgets/company_invoicing_section.dart';
import '../../core/modules/module_registry.dart';
import '../../state/crm_state.dart';
import '../../theme/crm_tokens.dart';
import '../../widgets/badges.dart';
import '../../widgets/task_tile.dart';
import 'client_editor_dialog.dart';
import 'contact_editor_dialog.dart';

class ClientDetailScreen extends StatelessWidget {
  const ClientDetailScreen({
    super.key,
    required this.state,
    required this.onEditClient,
    required this.onNewTask,
  });

  final CrmState state;
  final VoidCallback onEditClient;
  final VoidCallback onNewTask;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final client = state.selectedClient;
    if (client == null) {
      return EmptyState(
        icon: Icons.apartment_outlined,
        title: l10n.clientEmptyTitle,
        subtitle: l10n.clientEmptySubtitle,
      );
    }

    final country = CountryInfo.byCode(client.country);
    final scheme = Theme.of(context).colorScheme;
    final phone = CrmLayout.isPhone(context);

    return ListView(
      padding: EdgeInsets.fromLTRB(
        phone ? 16 : 28,
        phone ? 12 : 24,
        phone ? 16 : 28,
        phone ? 88 : 40,
      ),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          client.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: phone ? 18 : 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                                color: const Color(0xFF2BA89A),
                              ),
                        ),
                      ),
                      if (!phone) ...[
                        const SizedBox(width: 12),
                        StatusBadge.client(client.status, l10n),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (country != null) ...[
                        CountryFlagIcon(countryCode: country.code),
                        const SizedBox(width: 8),
                        Flexible(child: Text(country.name)),
                        const SizedBox(width: 12),
                      ],
                      if (client.locationLabel.isNotEmpty)
                        Flexible(
                          child: Text(
                            client.city ?? '',
                            style: TextStyle(color: scheme.onSurfaceVariant),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (phone)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(
                    tooltip: l10n.taskEditTooltip,
                    onPressed: onEditClient,
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB)),
                  ),
                  const SizedBox(height: 6),
                  StatusBadge.client(client.status, l10n),
                ],
              )
            else
              FilledButton.tonalIcon(
                onPressed: onEditClient,
                icon: const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF2563EB)),
                label: Text(l10n.taskEditTooltip),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            if (client.taxId != null)
              _InfoChip(
                icon: Icons.badge_outlined,
                label: '${taxIdLabelForCountry(client.country)}: ${client.taxId}',
              ),
            if (client.contactName != null && client.contactName!.isNotEmpty)
              _InfoChip(icon: Icons.person_outline, label: client.contactName!),
            if (client.peppolId != null)
              _InfoChip(icon: Icons.qr_code_2_outlined, label: l10n.companyPeppolPrefix(client.peppolId!)),
            if (client.useEInvoicing)
              _InfoChip(icon: Icons.receipt_long_outlined, label: l10n.clientEinvoiceBadge),
            if (client.email != null)
              _InfoChip(icon: Icons.mail_outline, label: client.email!),
            if (client.phone != null)
              _InfoChip(icon: Icons.phone_outlined, label: client.phone!),
            if (client.website != null)
              _InfoChip(icon: Icons.language, label: client.website!),
            for (final tag in client.tags)
              _InfoChip(icon: Icons.sell_outlined, label: tag),
          ],
        ),
        if (_addressLine(client).isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            _addressLine(client),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
          ),
        ],
        if (!isBlankNotesHtml(client.notes)) ...[
          const SizedBox(height: 12),
          buildNotesPreview(context, client.notes!),
        ],
        if (ModuleRegistry.instance.isUsedInCrm('invoicing')) ...[
          const SizedBox(height: 28),
          _ClientInvoicingBlock(client: client),
        ],
        const SizedBox(height: 32),
        _SectionTitle(
          title: l10n.companyContactsTitle,
          actionLabel: l10n.commonAdd,
          onAction: () => _addContact(context, client),
        ),
        const SizedBox(height: 8),
        if (state.contacts.isEmpty)
          Text(
            l10n.clientNoContactsHint,
            style: TextStyle(color: scheme.onSurfaceVariant),
          )
        else
          ...state.contacts.map(
            (c) => _ContactCard(
              contact: c,
              onEdit: () => _editContact(context, c, client),
              onDelete: () => state.deleteContact(c.id, client.id),
            ),
          ),
        const SizedBox(height: 32),
        _SectionTitle(
          title: l10n.clientFollowupsTitle,
          actionLabel: l10n.clientPlanAction,
          onAction: onNewTask,
        ),
        const SizedBox(height: 8),
        if (state.clientTasks.isEmpty)
          Text(
            l10n.clientNoTasksHint,
            style: TextStyle(color: scheme.onSurfaceVariant),
          )
        else
          ...state.clientTasks.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TaskTile(
                task: t,
                selected: state.selectedTaskId == t.id,
                onTap: () => state.selectTask(t.id),
              ),
            ),
          ),
      ],
    );
  }

  String _addressLine(Client c) {
    final parts = <String>[
      if (c.address != null) c.address!,
      if (c.district != null) c.district!,
      [
        if (c.zip != null) c.zip!,
        if (c.city != null) c.city!,
        if (c.state != null) c.state!,
      ].where((e) => e.isNotEmpty).join(' '),
    ].where((e) => e.trim().isNotEmpty).toList();
    return parts.join(', ');
  }

  Future<void> _addContact(BuildContext context, Client client) async {
    final draft = state.newContactDraft(
      client.id,
      phoneCountry: client.phoneCountry ?? client.country,
    );
    final saved = await showContactEditor(
      context,
      contact: draft,
      defaultPhoneCountry: client.phoneCountry ?? client.country,
    );
    if (saved != null) await state.saveContact(saved);
  }

  Future<void> _editContact(
    BuildContext context,
    Contact contact,
    Client client,
  ) async {
    final saved = await showContactEditor(
      context,
      contact: contact,
      defaultPhoneCountry: client.phoneCountry ?? client.country,
    );
    if (saved != null) await state.saveContact(saved);
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        TextButton.icon(
          onPressed: onAction,
          icon: const Icon(Icons.add, size: 18),
          label: Text(actionLabel),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

  final Contact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  static const _teal = Color(0xFF2BA89A);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
            border: Border.all(
              color: Color.lerp(_teal, const Color(0xFF9AABBA), 0.55)!,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: _teal.withValues(alpha: 0.14),
                child: Text(
                  contact.displayName.isNotEmpty
                      ? contact.displayName[0].toUpperCase()
                      : '?',
                  style: const TextStyle(
                    color: _teal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            contact.displayName,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: _teal,
                                  fontSize: 15,
                                ),
                          ),
                        ),
                        if (contact.isPrimary) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: CrmTokens.onTrack.withValues(alpha: 0.12),
                              borderRadius:
                                  BorderRadius.circular(CrmTokens.radiusSm),
                            ),
                            child: Text(
                              l10n.clientPrimaryBadge,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: CrmTokens.onTrack,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (contact.role != null && contact.role!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        contact.role!,
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 6,
                      children: [
                        if (contact.email != null)
                          _InfoChip(
                            icon: Icons.mail_outline,
                            label: contact.email!,
                          ),
                        if (contact.phone != null)
                          _InfoChip(
                            icon: Icons.phone_outlined,
                            label: contact.phone!,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (v) {
                  if (v == 'edit') onEdit();
                  if (v == 'delete') onDelete();
                },
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'edit', child: Text(l10n.commonEdit)),
                  PopupMenuItem(value: 'delete', child: Text(l10n.commonDelete)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section e-Invoicing sur la fiche — miroir Company puis UI historique.
class _ClientInvoicingBlock extends StatefulWidget {
  const _ClientInvoicingBlock({required this.client});
  final Client client;

  @override
  State<_ClientInvoicingBlock> createState() => _ClientInvoicingBlockState();
}

class _ClientInvoicingBlockState extends State<_ClientInvoicingBlock> {
  bool _ready = false;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void didUpdateWidget(covariant _ClientInvoicingBlock old) {
    super.didUpdateWidget(old);
    if (old.client.id != widget.client.id ||
        old.client.updatedAt != widget.client.updatedAt) {
      _prepare();
    }
  }

  Future<void> _prepare() async {
    setState(() {
      _ready = false;
      _error = null;
    });
    try {
      await ClientCompanyBridge.ensureMirrored(widget.client);
      if (!mounted) return;
      setState(() => _ready = true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Text(
        AppLocalizations.of(context).clientEinvoiceError('$_error'),
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }
    if (!_ready) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return CompanyInvoicingSection(
      companyId: widget.client.id,
      onChanged: () {},
    );
  }
}

/// Helper re-export style — edit entry from shell.
Future<void> editSelectedClient(BuildContext context, CrmState state) async {
  final client = state.selectedClient;
  if (client == null) return;
  final saved = await showClientEditor(context, client: client);
  if (saved != null) await state.saveClient(saved);
}

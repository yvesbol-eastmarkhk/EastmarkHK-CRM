import 'package:flutter/material.dart';

import '../../core/data/countries.dart';
import '../../core/utils/responsive_layout.dart';
import '../../core/widgets/country_flag_icon.dart';
import '../../core/widgets/empty_state.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/client.dart';
import '../../state/crm_state.dart';
import '../../theme/crm_tokens.dart';
import '../../widgets/badges.dart';
import 'client_detail_screen.dart';

/// Liste des clients / prospects.
class ClientsScreen extends StatefulWidget {
  const ClientsScreen({
    super.key,
    required this.state,
    required this.onCreate,
  });

  final CrmState state;
  final VoidCallback onCreate;

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final all = widget.state.clients;
    final q = _query.trim().toLowerCase();
    final list = q.isEmpty
        ? all
        : all
            .where(
              (c) =>
                  c.name.toLowerCase().contains(q) ||
                  (c.city?.toLowerCase().contains(q) ?? false) ||
                  (c.country?.toLowerCase().contains(q) ?? false),
            )
            .toList();
    final phone = CrmLayout.isPhone(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(phone ? 16 : 20, phone ? 12 : 20, phone ? 16 : 20, 12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: l10n.clientsSearchHint,
                    prefixIcon: Icon(Icons.search, size: 20),
                    isDense: true,
                  ),
                  onChanged: (v) => setState(() => _query = v),
                ),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: widget.onCreate,
                icon: const Icon(Icons.add, size: 18),
                label: Text(l10n.clientsNewButton),
              ),
            ],
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? EmptyState(
                  icon: Icons.business_outlined,
                  title: all.isEmpty
                      ? l10n.clientsEmptyTitle
                      : l10n.companyEmptyNoResult,
                  subtitle: all.isEmpty
                      ? l10n.clientsEmptySubtitle
                      : l10n.companyEmptySearchSubtitle,
                  actionLabel: all.isEmpty ? l10n.clientsEmptyCreateButton : null,
                  onAction: all.isEmpty ? widget.onCreate : null,
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                  itemCount: list.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 2),
                  itemBuilder: (context, i) {
                    final c = list[i];
                    final selected = widget.state.selectedClientId == c.id;
                    return _ClientRow(
                      client: c,
                      selected: selected,
                      onTap: () => widget.state.selectClient(c.id),
                      onEdit: () async {
                        await widget.state.selectClient(c.id);
                        if (!context.mounted) return;
                        await editSelectedClient(context, widget.state);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _ClientRow extends StatelessWidget {
  const _ClientRow({
    required this.client,
    required this.selected,
    required this.onTap,
    required this.onEdit,
  });

  final Client client;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final country = CountryInfo.byCode(client.country);

    return Material(
      color: selected ? CrmTokens.taskSelectedBg : Colors.transparent,
      borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onEdit,
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: CrmTokens.avatarColor(client.name).withValues(alpha: 0.18),
                child: Text(
                  client.name.isNotEmpty ? client.name[0].toUpperCase() : '?',
                  style: TextStyle(
                    color: CrmTokens.avatarColor(client.name),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F5C52),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (country != null) ...[
                          CountryFlagIcon(
                            countryCode: country.code,
                            width: 18,
                            height: 13,
                          ),
                          const SizedBox(width: 6),
                        ],
                        Expanded(
                          child: Text(
                            client.locationLabel.isEmpty
                                ? l10n.clientsNoCountry
                                : client.locationLabel,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: scheme.onSurfaceVariant,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Toujours collés à droite, même si la ville est longue.
                        StatusBadge.client(client.status, l10n),
                        SizedBox(
                          width: 28,
                          height: 26,
                          child: IconButton(
                            tooltip: l10n.commonEdit,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            iconSize: 17,
                            icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB)),
                            onPressed: onEdit,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

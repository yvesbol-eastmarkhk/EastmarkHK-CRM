import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/screens/company_detail_screen.dart';
import '../core/widgets/company_avatar.dart';
import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/crm_tokens.dart';
import 'list_panel.dart';

/// Liste clients — panneau central du workspace.
class ClientsListPanel extends StatefulWidget {
  const ClientsListPanel({
    super.key,
    required this.workspace,
    required this.selectedCompanyId,
    required this.onSelectCompany,
    this.expand = false,
  });

  final CrmWorkspaceState workspace;
  final String? selectedCompanyId;
  final ValueChanged<String> onSelectCompany;
  final bool expand;

  @override
  State<ClientsListPanel> createState() => _ClientsListPanelState();
}

class _ClientsListPanelState extends State<ClientsListPanel> {
  final _search = TextEditingController();
  List<Company> _companies = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    widget.workspace.addListener(_load);
    _load();
  }

  @override
  void dispose() {
    widget.workspace.removeListener(_load);
    _search.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final list = await AppDatabase.instance.companies(search: _search.text);
    if (!mounted) return;
    setState(() {
      _companies = list;
      _loading = false;
    });
  }

  Future<void> _addCompany() async {
    final now = nowIso();
    final draft = Company(
      id: AppDatabase.newId(),
      name: '',
      createdAt: now,
      updatedAt: now,
    );
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => CompanyEditorDialog(company: draft, isNew: true),
    );
    if (ok != true) return;
    final id = draft.id;
    await _load();
    widget.workspace.bump();
    widget.onSelectCompany(id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListPanel(
      title: l10n.clientsListTitle,
      subtitle: l10n.clientsListCount(_companies.length),
      searchController: _search,
      searchHint: l10n.clientsPanelSearch,
      onSearchChanged: (_) => _load(),
      primaryActionLabel: l10n.clientsPanelNew,
      onPrimaryAction: _addCompany,
      expand: widget.expand,
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : _companies.isEmpty
              ? Center(
                  child: Text(
                    _search.text.isEmpty ? l10n.companyEmptyNoName : l10n.companyEmptyNoResult,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                )
              : ListView.builder(
                  itemCount: _companies.length,
                  itemBuilder: (_, i) {
                    final c = _companies[i];
                    return SelectableListTile(
                      selected: widget.selectedCompanyId == c.id,
                      leading: CompanyAvatar(name: c.name, radius: 14),
                      title: c.name.isEmpty ? l10n.companyWithoutName : c.name,
                      titleColor: c.name.isEmpty ? null : CrmTokens.fuchsia,
                      subtitle: c.notes,
                      onTap: () => widget.onSelectCompany(c.id),
                    );
                  },
                ),
    );
  }
}

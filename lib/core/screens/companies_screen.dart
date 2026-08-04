import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_data_table.dart';
import '../../ui/crm_page.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../utils/formatters.dart';
import '../widgets/company_avatar.dart';
import '../widgets/empty_state.dart';
import 'company_detail_screen.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  final _search = TextEditingController();
  List<Company> _companies = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
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
    await _load();
  }

  Future<void> _openCompany(Company c) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CompanyDetailScreen(companyId: c.id)),
    );
    _load();
  }

  Future<void> _deleteCompany(Company c) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.companyDeleteTitle),
        content: Text(c.name),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton.tonal(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.commonDelete)),
        ],
      ),
    );
    if (ok != true) return;
    await AppDatabase.instance.softDeleteCompany(c.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return CrmPage(
      title: l10n.companyListTitle,
      subtitle: l10n.companyCount(_companies.length),
      actions: [CrmPrimaryButton(label: l10n.companyNewButton, onPressed: _addCompany)],
      toolbar: TextField(
        controller: _search,
        onChanged: (_) => _load(),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, size: 18),
          hintText: l10n.companySearchHint,
          isDense: true,
        ),
      ),
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : CrmDataTable<Company>(
              columns: [
                CrmColumn(l10n.companyColumnClient, flex: 3),
                CrmColumn(l10n.companyColumnNotes, flex: 2),
                CrmColumn(l10n.companyColumnModified, flex: 1),
                CrmColumn('', width: 40),
              ],
              rows: _companies,
              onRowTap: _openCompany,
              empty: EmptyState(
                icon: Icons.business_outlined,
                title: _search.text.isEmpty ? l10n.companyEmptyNoName : l10n.companyEmptyNoResult,
                subtitle: _search.text.isEmpty
                    ? l10n.companyEmptySubtitle
                    : l10n.companyEmptySearchSubtitle,
                actionLabel: _search.text.isEmpty ? l10n.companyNewButton : null,
                onAction: _search.text.isEmpty ? _addCompany : null,
              ),
              rowBuilder: (c, _) => [
                CrmCell(
                  flex: 3,
                  child: Row(
                    children: [
                      CompanyAvatar(name: c.name, radius: 14),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          c.name.isEmpty ? l10n.companyWithoutName : c.name,
                          style: TextStyle(
                            fontSize: CrmTokens.titleSize,
                            fontWeight: FontWeight.w500,
                            color: c.name.isEmpty ? null : CrmTokens.fuchsia,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                CrmCell(
                  flex: 2,
                  child: Text(
                    c.notes ?? '—',
                    style: TextStyle(fontSize: CrmTokens.bodySize, color: scheme.onSurfaceVariant),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CrmCell(
                  flex: 1,
                  child: Text(
                    formatDateFr(c.updatedAt),
                    style: TextStyle(fontSize: CrmTokens.bodySize, color: scheme.onSurfaceVariant),
                  ),
                ),
                CrmCell(
                  width: 40,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz, size: 18, color: scheme.onSurfaceVariant),
                    onPressed: () => _deleteCompany(c),
                    tooltip: l10n.commonDelete,
                  ),
                ),
              ],
            ),
    );
  }
}

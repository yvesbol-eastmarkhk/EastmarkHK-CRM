import 'package:flutter/material.dart';

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
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer ce client ?'),
        content: Text(c.name),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          FilledButton.tonal(onPressed: () => Navigator.pop(ctx, true), child: const Text('Supprimer')),
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
    return CrmPage(
      title: 'Clients',
      subtitle: '${_companies.length} société${_companies.length > 1 ? 's' : ''}',
      actions: [CrmPrimaryButton(label: 'Nouveau client', onPressed: _addCompany)],
      toolbar: TextField(
        controller: _search,
        onChanged: (_) => _load(),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, size: 18),
          hintText: 'Filtrer par nom, notes…',
          isDense: true,
        ),
      ),
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : CrmDataTable<Company>(
              columns: const [
                CrmColumn('Client', flex: 3),
                CrmColumn('Notes', flex: 2),
                CrmColumn('Modifié', flex: 1),
                CrmColumn('', width: 40),
              ],
              rows: _companies,
              onRowTap: _openCompany,
              empty: EmptyState(
                icon: Icons.business_outlined,
                title: _search.text.isEmpty ? 'Aucun client' : 'Aucun résultat',
                subtitle: _search.text.isEmpty
                    ? 'Ajoutez votre premier client — ou dictez-le avec le micro.'
                    : 'Essayez un autre terme.',
                actionLabel: _search.text.isEmpty ? 'Nouveau client' : null,
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
                          c.name.isEmpty ? '(Sans nom)' : c.name,
                          style: const TextStyle(
                            fontSize: CrmTokens.titleSize,
                            fontWeight: FontWeight.w500,
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
                    tooltip: 'Supprimer',
                  ),
                ),
              ],
            ),
    );
  }
}

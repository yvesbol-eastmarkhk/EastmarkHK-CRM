import 'package:flutter/material.dart';

import '../../platform/entitlement_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../modules/crm_module.dart';
import '../modules/module_registry.dart';

/// Boutique modules — essai 7 jours, achat e-Invoice, activation licence.
class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  @override
  void initState() {
    super.initState();
    EntitlementService.instance.addListener(_refresh);
    ModuleRegistry.instance.addListener(_refresh);
  }

  @override
  void dispose() {
    EntitlementService.instance.removeListener(_refresh);
    ModuleRegistry.instance.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final modules = ModuleRegistry.instance.all;
    return CrmPage(
      title: 'Modules',
      subtitle: 'Activez e-Invoice et les autres apps EastmarkHK dans le CRM',
      child: ListView.separated(
        padding: const EdgeInsets.all(CrmTokens.pagePadding),
        itemCount: modules.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) => _ModuleCard(module: modules[i]),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({required this.module});

  final CrmModule module;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = EntitlementService.instance.isActive(module.id);
    final trialLeft = EntitlementService.instance.trialDaysRemaining(module.id);
    final rec = EntitlementService.instance.recordFor(module.id);

    String status;
    if (active && rec?.source == EntitlementSource.license) {
      status = 'Actif — licence e-Invoice';
    } else if (active && rec?.source == EntitlementSource.trial) {
      status = 'Essai — $trialLeft jour${trialLeft == 1 ? '' : 's'} restant${trialLeft == 1 ? '' : 's'}';
    } else if (active) {
      status = 'Actif';
    } else {
      status = 'Disponible';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        border: Border.all(color: active ? scheme.primary.withValues(alpha: 0.4) : Theme.of(context).crmBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(module.icon, color: scheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(module.title, style: Theme.of(context).textTheme.titleMedium),
                    Text(module.priceLabel, style: TextStyle(color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Chip(label: Text(status, style: const TextStyle(fontSize: 11))),
            ],
          ),
          const SizedBox(height: 8),
          Text(module.description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (!active)
                FilledButton(
                  onPressed: () => ModuleRegistry.instance.startTrial(module.id),
                  child: const Text('Essayer 7 jours'),
                ),
              if (!active)
                OutlinedButton(
                  onPressed: () => ModuleRegistry.instance.activateFromEInvoicing(),
                  child: const Text('J\'ai e-Invoice'),
                ),
              if (active)
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Utiliser dans le CRM'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

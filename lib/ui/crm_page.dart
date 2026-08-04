import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';

/// En-tête de page unifié — titre à gauche, actions à droite (Linear-style).
class CrmPage extends StatelessWidget {
  const CrmPage({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.toolbar,
    this.showBackButton = true,
    required this.child,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget? toolbar;
  /// À désactiver quand l'écran fournit déjà son propre retour (ex.
  /// [CrmOverlayPage], qui a sa bannière avec flèche retour).
  final bool showBackButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Écran poussé via Navigator.push (pas la nav principale du workspace) :
    // on ajoute nous-mêmes une flèche retour, CrmPage ne passant pas par un
    // AppBar (qui l'aurait fournie automatiquement).
    final canPop = showBackButton && Navigator.canPop(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            CrmTokens.pagePadding,
            20,
            CrmTokens.pagePadding,
            0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (canPop) ...[
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(Icons.arrow_back),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: CrmTokens.bodySize,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              ...actions,
            ],
          ),
        ),
        if (toolbar != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              CrmTokens.pagePadding,
              16,
              CrmTokens.pagePadding,
              0,
            ),
            child: toolbar,
          ),
        Expanded(child: child),
      ],
    );
  }
}

/// Bouton d'action principal — remplace les FAB sur desktop.
class CrmPrimaryButton extends StatelessWidget {
  const CrmPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.add, size: 16),
      label: Text(label),
    );
  }
}

/// Bouton secondaire discret (filtres, actions légères).
class CrmGhostButton extends StatelessWidget {
  const CrmGhostButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: theme.colorScheme.onSurfaceVariant,
        side: BorderSide(color: theme.crmBorder),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      icon: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontSize: CrmTokens.bodySize)),
    );
  }
}

/// Séparateur de section (AUJOURD'HUI, EN RETARD…).
class CrmSectionLabel extends StatelessWidget {
  const CrmSectionLabel({super.key, required this.label, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 2),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
      ),
    );
  }
}

/// Conteneur de liste plate — bordure fine, pas de Card Material.
class CrmListPanel extends StatelessWidget {
  const CrmListPanel({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        border: Border.all(color: border),
        color: Theme.of(context).colorScheme.surface,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}

/// Ligne interactive dans un [CrmListPanel].
class CrmListRow extends StatefulWidget {
  const CrmListRow({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.accentColor,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? accentColor;

  @override
  State<CrmListRow> createState() => _CrmListRowState();
}

class _CrmListRowState extends State<CrmListRow> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: _hover ? theme.crmHover : Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                if (widget.accentColor != null)
                  Container(
                    width: 3,
                    height: 32,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: widget.accentColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                if (widget.leading != null) ...[
                  widget.leading!,
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: CrmTokens.titleSize,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          style: TextStyle(
                            fontSize: CrmTokens.bodySize,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (widget.trailing != null) widget.trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

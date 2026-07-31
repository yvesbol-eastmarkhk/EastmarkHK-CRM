import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';

/// Chrome commun des panneaux liste (Attio / Linear) — titre, recherche, action.
class ListPanel extends StatelessWidget {
  const ListPanel({
    super.key,
    required this.title,
    this.subtitle,
    this.searchController,
    this.searchHint,
    this.onSearchChanged,
    this.primaryActionLabel,
    this.onPrimaryAction,
    required this.child,
    this.width = 320,
    this.expand = false,
  });

  final String title;
  final String? subtitle;
  final TextEditingController? searchController;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;
  final String? primaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final Widget child;
  final double? width;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    return Container(
      width: expand ? null : width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(right: BorderSide(color: border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: CrmTokens.captionSize,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                if (primaryActionLabel != null && onPrimaryAction != null)
                  FilledButton(
                    onPressed: onPrimaryAction,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: Text(primaryActionLabel!, style: const TextStyle(fontSize: 12)),
                  ),
              ],
            ),
          ),
          if (searchController != null) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.search, size: 16),
                  hintText: searchHint ?? 'Filtrer…',
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Expanded(child: child),
        ],
      ),
    );
  }
}

/// Ligne sélectionnable dans un panneau liste.
class SelectableListTile extends StatefulWidget {
  const SelectableListTile({
    super.key,
    required this.selected,
    required this.title,
    this.subtitle,
    this.trailing,
    this.accentColor,
    this.leading,
    required this.onTap,
    this.subtitleMaxLines = 1,
    this.isDone = false,
  });

  final bool selected;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Color? accentColor;
  final Widget? leading;
  final VoidCallback onTap;
  final int subtitleMaxLines;
  final bool isDone;

  @override
  State<SelectableListTile> createState() => _SelectableListTileState();
}

class _SelectableListTileState extends State<SelectableListTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = _background(theme);
    final leftColor = widget.selected
        ? theme.colorScheme.primary
        : widget.isDone
            ? CrmTokens.eastmarkGreen
            : widget.accentColor ?? Colors.transparent;
    final leftWidth = widget.selected
        ? 3.0
        : leftColor != Colors.transparent
            ? 2.0
            : 0.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: bg,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: leftColor, width: leftWidth),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
            child: Row(
              children: [
                if (widget.leading != null) ...[
                  widget.leading!,
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: CrmTokens.bodySize,
                          fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w500,
                          decoration: widget.isDone && !widget.selected ? TextDecoration.lineThrough : null,
                          color: widget.isDone && !widget.selected
                              ? theme.colorScheme.onSurfaceVariant
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      if (widget.subtitle != null)
                        Text(
                          widget.subtitle!,
                          maxLines: widget.subtitleMaxLines,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: CrmTokens.captionSize,
                            color: theme.colorScheme.onSurfaceVariant,
                            decoration: widget.isDone && !widget.selected ? TextDecoration.lineThrough : null,
                          ),
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

  Color _background(ThemeData theme) {
    if (widget.selected) return CrmTokens.taskSelectedBg;
    if (widget.isDone) {
      return _hover ? CrmTokens.taskDoneBgHover : CrmTokens.taskDoneBg;
    }
    return _hover ? CrmTokens.taskTodoBgHover : CrmTokens.taskTodoBg;
  }
}

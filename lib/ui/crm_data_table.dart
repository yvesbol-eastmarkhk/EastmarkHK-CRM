import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';

/// Badge compact — étapes pipeline, statuts, compteurs.
class CrmBadge extends StatelessWidget {
  const CrmBadge({
    super.key,
    required this.label,
    this.color,
    this.background,
  });

  final String label;
  final Color? color;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final fg = color ?? Theme.of(context).colorScheme.onSurfaceVariant;
    final bg = background ?? fg.withValues(alpha: 0.14);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(CrmTokens.radiusSm),
        border: Border.all(color: fg.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: CrmTokens.captionSize,
          fontWeight: FontWeight.w700,
          color: fg,
        ),
      ),
    );
  }
}

/// Table dense style Attio — colonnes triables, hover par ligne.
class CrmDataTable<T> extends StatelessWidget {
  const CrmDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.rowBuilder,
    this.onRowTap,
    this.empty,
  });

  final List<CrmColumn> columns;
  final List<T> rows;
  final List<Widget> Function(T item, int index) rowBuilder;
  final void Function(T item)? onRowTap;
  final Widget? empty;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty && empty != null) return empty!;

    final border = Theme.of(context).crmBorder;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        CrmTokens.pagePadding,
        16,
        CrmTokens.pagePadding,
        CrmTokens.pagePadding,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HeaderRow(columns: columns),
            for (var i = 0; i < rows.length; i++) ...[
              Divider(height: 1, color: border.withValues(alpha: 0.7)),
              _DataRowWrapper(
                onTap: onRowTap == null ? null : () => onRowTap!(rows[i]),
                child: Row(
                  children: rowBuilder(rows[i], i),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CrmColumn {
  const CrmColumn(this.label, {this.flex = 1, this.width});
  final String label;
  final int flex;
  final double? width;
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.columns});
  final List<CrmColumn> columns;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CrmTokens.rowHeight,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).brightness == Brightness.light
          ? CrmTokens.surfaceMutedLight
          : CrmTokens.surfaceMutedDark,
      child: Row(
        children: [
          for (final c in columns)
            c.width != null
                ? SizedBox(
                    width: c.width,
                    child: Text(c.label.toUpperCase(), style: _headerStyle(context)),
                  )
                : Expanded(
                    flex: c.flex,
                    child: Text(c.label.toUpperCase(), style: _headerStyle(context)),
                  ),
        ],
      ),
    );
  }

  TextStyle _headerStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall!;
}

class _DataRowWrapper extends StatefulWidget {
  const _DataRowWrapper({required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;

  @override
  State<_DataRowWrapper> createState() => _DataRowWrapperState();
}

class _DataRowWrapperState extends State<_DataRowWrapper> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: _hover ? Theme.of(context).crmHover : Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: SizedBox(
            height: CrmTokens.rowHeight + 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

/// Cellule de table — helper pour [CrmDataTable.rowBuilder].
class CrmCell extends StatelessWidget {
  const CrmCell({super.key, required this.child, this.flex = 1, this.width});

  final Widget child;
  final int flex;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return SizedBox(width: width, child: Align(alignment: Alignment.centerLeft, child: child));
    }
    return Expanded(
      flex: flex,
      child: Align(alignment: Alignment.centerLeft, child: child),
    );
  }
}

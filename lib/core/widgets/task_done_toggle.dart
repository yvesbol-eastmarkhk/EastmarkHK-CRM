import 'package:flutter/material.dart';

import '../../theme/crm_tokens.dart';

/// Bouton bascule « fait / à faire » pour une tâche — cercle avec coche,
/// plus parlant qu'une case à cocher carrée générique (`Checkbox` Material)
/// pour représenter une tâche dans les listes (overview client, écran
/// Tâches…).
class TaskDoneToggle extends StatelessWidget {
  const TaskDoneToggle({
    super.key,
    required this.done,
    required this.onChanged,
    this.size = 22,
  });

  final bool done;
  final ValueChanged<bool> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: Icon(
        done ? Icons.check_circle_rounded : Icons.circle_outlined,
        size: size,
        color: done ? CrmTokens.onTrack : outline,
      ),
      onPressed: () => onChanged(!done),
    );
  }
}

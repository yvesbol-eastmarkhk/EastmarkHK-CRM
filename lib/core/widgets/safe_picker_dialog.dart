import 'package:flutter/material.dart';

/// Dialogue de sélection à hauteur fixe — évite le crash
/// `Flexible` / `Expanded` dans `Column(mainAxisSize: min)`.
class SafePickerDialog extends StatelessWidget {
  const SafePickerDialog({
    super.key,
    required this.title,
    required this.icon,
    required this.searchHint,
    required this.onQueryChanged,
    required this.child,
    this.width = 520,
    this.height = 560,
  });

  final String title;
  final IconData icon;
  final String searchHint;
  final ValueChanged<String> onQueryChanged;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 12, 8),
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autofocus: true,
                onChanged: onQueryChanged,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: searchHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

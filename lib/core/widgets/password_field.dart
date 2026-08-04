import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';

/// Champ mot de passe — toujours masqué (•) par défaut, œil pour révéler.
class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.label,
    this.autofocus = false,
    this.enabled = true,
    this.onChanged,
  });

  final TextEditingController controller;
  /// `null` = libellé par défaut traduit (AppLocalizations.commonPasswordLabel).
  final String? label;
  final bool autofocus;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return TextField(
      controller: widget.controller,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      obscureText: !_visible,
      obscuringCharacter: '•',
      autocorrect: false,
      enableSuggestions: false,
      enableIMEPersonalizedLearning: false,
      smartDashesType: SmartDashesType.disabled,
      smartQuotesType: SmartQuotesType.disabled,
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label ?? l10n.commonPasswordLabel,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          tooltip: _visible ? l10n.passwordFieldHide : l10n.passwordFieldShow,
          icon: Icon(
            _visible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: widget.enabled
              ? () => setState(() => _visible = !_visible)
              : null,
        ),
      ),
    );
  }
}

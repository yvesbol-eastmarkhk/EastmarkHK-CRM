import 'package:flutter/material.dart';

import '../../app.dart';
import '../widgets/login_panel.dart';

/// Écran de connexion après déconnexion manuelle (Réglages).
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: LoginPanel(
            onSuccess: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeShell()),
            ),
          ),
        ),
      ),
    );
  }
}

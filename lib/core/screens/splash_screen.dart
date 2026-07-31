import 'package:flutter/material.dart';

import '../../app.dart';
import '../services/current_session.dart';
import '../widgets/bootstrap_panel.dart';
import '../widgets/login_panel.dart';

/// Écran de démarrage — branding plein écran, puis bootstrap / login.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashPhase _phase = _SplashPhase.branding;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await CurrentSession.instance.ensureLoaded();
      if (!mounted) return;
      if (CurrentSession.instance.needsBootstrap) {
        setState(() => _phase = _SplashPhase.bootstrap);
      } else if (CurrentSession.instance.needsLogin) {
        setState(() => _phase = _SplashPhase.login);
      } else {
        _goHome();
      }
    });
  }

  void _goHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showOverlay = _phase != _SplashPhase.branding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/branding/splash_screen.png'),
            fit: BoxFit.cover,
          ),
          AnimatedOpacity(
            opacity: showOverlay ? 1 : 0,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOut,
            child: IgnorePointer(
              ignoring: !showOverlay,
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.42),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Material(
                      elevation: 8,
                      shadowColor: Colors.black26,
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                        child: switch (_phase) {
                          _SplashPhase.bootstrap => BootstrapPanel(onSuccess: _goHome),
                          _SplashPhase.login => LoginPanel(showWordmark: false, onSuccess: _goHome),
                          _ => const SizedBox.shrink(),
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _SplashPhase { branding, bootstrap, login }

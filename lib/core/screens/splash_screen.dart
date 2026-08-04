import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app.dart';
import '../services/current_session.dart';
import '../utils/responsive_layout.dart';
import '../widgets/login_panel.dart';

/// Écran de démarrage — branding plein écran, puis login si un compte existe.
/// Le passkey est toujours affiché AU-DESSUS de la fenêtre (carte) de login.
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
      // Plus de création admin forcée — seuls les appareils qui ont déjà
      // un compte voient l'écran de login.
      if (CurrentSession.instance.needsLogin) {
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
    final phone = CrmLayout.isPhone(context);
    final topPad = MediaQuery.paddingOf(context).top;
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    // Splash mobile : blanc haut / teal bas pour coller aux bandes du visuel.
    const mobileBgTop = Color(0xFFF8F8FA);
    const mobileBgBottom = Color(0xFF024C4F);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: phone
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: mobileBgBottom,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: phone ? mobileBgTop : Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (phone)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      mobileBgTop,
                      mobileBgTop,
                      mobileBgBottom,
                      mobileBgBottom,
                    ],
                    stops: [0.0, 0.70, 0.70, 1.0],
                  ),
                ),
              ),
            // Visuel mobile portrait : contain = tout le contenu visible,
            // sans crop sur les ratios 16:9 / 19.5:9 / iPad mini.
            Padding(
              padding: phone
                  ? EdgeInsets.only(top: topPad * 0.25, bottom: bottomPad * 0.25)
                  : EdgeInsets.zero,
              child: Image(
                image: AssetImage(
                  phone
                      ? 'assets/branding/splash_crm_mobile_hd.png'
                      : 'assets/branding/splash_screen.png',
                ),
                fit: phone ? BoxFit.contain : BoxFit.cover,
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                filterQuality: FilterQuality.medium,
              ),
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
                      child: switch (_phase) {
                        _SplashPhase.login => _LoginWithPasskeyAbove(
                            onSuccess: _goHome,
                          ),
                        _ => const SizedBox.shrink(),
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Passkey au-dessus de la carte login — toujours visible si disponible.
class _LoginWithPasskeyAbove extends StatefulWidget {
  const _LoginWithPasskeyAbove({required this.onSuccess});

  final VoidCallback onSuccess;

  @override
  State<_LoginWithPasskeyAbove> createState() => _LoginWithPasskeyAboveState();
}

class _LoginWithPasskeyAboveState extends State<_LoginWithPasskeyAbove> {
  final _loginKey = GlobalKey<LoginPanelState>();
  bool _showPasskey = false;

  void _onPasskeyAvailability(bool available) {
    if (!mounted || _showPasskey == available) return;
    setState(() => _showPasskey = available);
  }

  @override
  Widget build(BuildContext context) {
    final loginState = _loginKey.currentState;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_showPasskey && loginState != null) ...[
          loginState.buildPasskeyButton(context),
          const SizedBox(height: 16),
        ],
        Material(
          elevation: 8,
          shadowColor: Colors.black26,
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
            child: LoginPanel(
              key: _loginKey,
              showWordmark: false,
              embedPasskey: false,
              onSuccess: widget.onSuccess,
              onPasskeyAvailabilityChanged: _onPasskeyAvailability,
            ),
          ),
        ),
      ],
    );
  }
}

enum _SplashPhase { branding, login }

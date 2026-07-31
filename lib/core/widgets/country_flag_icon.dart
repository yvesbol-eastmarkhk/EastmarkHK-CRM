import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

/// Drapeau à taille fixe — s'affiche correctement sur toutes les plateformes
/// (les emojis drapeaux ne rendent pas sur Windows). Portage d'EastmarkHK
/// e-Invoicing.
class CountryFlagIcon extends StatelessWidget {
  const CountryFlagIcon({
    super.key,
    required this.countryCode,
    this.width = 28,
    this.height = 20,
    this.borderRadius = 4,
  });

  final String? countryCode;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final code = countryCode?.trim().toUpperCase();
    if (code == null || code.length < 2) {
      return SizedBox(
        width: width,
        height: height,
        child: Icon(Icons.flag_outlined, size: height * 0.85, color: Colors.grey.shade500),
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: OverflowBox(
          maxWidth: width,
          maxHeight: height,
          alignment: Alignment.center,
          child: CountryFlag.fromCountryCode(
            code,
            theme: ImageTheme(
              width: width,
              height: height,
              shape: RoundedRectangle(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}

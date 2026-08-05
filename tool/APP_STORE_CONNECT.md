# App Store Connect — EastmarkHK CRM (gratuit, iOS + macOS, 1 fiche)

## Identité (alignée projet + ASC)

| Champ | Valeur |
|-------|--------|
| Name | EastmarkHK CRM |
| Subtitle | Free CRM for teams (max 30 car.) — à saisir |
| Primary Language | English (U.S.) |
| Bundle ID | `com.eastmarkhk.eastmarkhkcrm` |
| SKU | `com.eastmarkhk.eastmarkhkcrm` |
| Apple ID | `6797762815` |
| Primary Category | Productivity |
| Secondary | Business (optionnel) |
| Price | Free |
| License | Apple Standard |

Une seule app ASC couvre **iOS App** + **macOS App** (même Bundle ID).

## Checklist ASC avant 1.0

1. **App Information** — Name / Subtitle EN ; localisations FR si besoin plus tard.
2. **Pricing and Availability** — Free ; territoires = All.
3. **Age Ratings** — Questionnaire (aucun contenu adulte / gambling).
4. **Privacy** — Privacy Policy URL (site EastmarkHK) ; Data Collection si applicable (compte, sync).
5. **App Privacy** — déclarer réseau / fichiers / micro (dictée) si utilisés.
6. **Screenshots** — iPhone 6.9"/6.7", iPad 13", Mac 1280×800+ (données démo Nova Components).
7. **App Review** — contact, notes : « Free CRM ; no IAP on this app. Demo login… » si compte test requis.
8. **Content Rights** — Set Up si média tiers.

## Xcode Cloud (1 workflow iOS + 1 macOS)

Dans Xcode : **Product → Xcode Cloud → Create Workflow** (ou ASC → Xcode Cloud).

### Workflow iOS
- Product : `ios/Runner.xcodeproj` → scheme **Runner**
- Archive → **App Store Connect** (TestFlight / Submit)
- Start condition : push sur `main` (ou tag `ios-*`)
- Environment : macOS + latest Xcode ; **Clone Depth = Full**
- Script auto : `ios/ci_scripts/ci_post_clone.sh` (déjà dans le repo)

### Workflow macOS
- Product : `macos/Runner.xcodeproj` → scheme **Runner**
- Même cible App Store Connect (même app)
- Script : `macos/ci_scripts/ci_post_clone.sh`
- Signing : Developer ID / Mac App Store selon distribution ; pour ASC Mac = **Mac App Store** certificates via automatic signing in Cloud

### Permissions
- Lier le repo GitHub `yvesbol-eastmarkhk/EastmarkHK-CRM` dans Xcode Cloud.
- Accès App Store Connect pour l’équipe EastmarkHK.

## Builds locaux (sans Xcode Cloud)

```bash
# Version actuelle (ne pas bumper tant que 1.0 non publiée)
# pubspec: 1.0.2+23

bash tool/build_dmg.sh          # DMG notarisé → dist/dmg/
bash tool/install_devices.sh --build   # APK + iOS + macOS install
```

## Notes

- CRM = **gratuit** → pas d’IAP sur cette fiche ; e-Invoicing est une autre app / activation web.
- Ne pas changer Bundle ID (déjà `com.eastmarkhk.eastmarkhkcrm` partout).

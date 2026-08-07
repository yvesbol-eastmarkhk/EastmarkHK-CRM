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
7. **App Review Information** — paste the Review Notes below (no demo login required).
8. **Content Rights** — Set Up si média tiers.

## App Review Information (Guideline 2.1(a) + 4)

### Sign-in / demo account (App Store Connect fields)

Fill the **App Review Information** username/password with the optional Team Sync demo (not an in-app login):

| Field | Value |
|-------|--------|
| Username | `emhk@eastmarkhk.com` |
| Password | *(paste only in App Store Connect — do not put in git if the repo is public)* |
| Demo server | `https://emhk.eastmarkhk.com/crm` |

Local CRM still works with **no** sign-in. The credentials above are only to test **Settings → Shared Database (remote)**.

### Review Notes (paste into App Store Connect)

```
EastmarkHK CRM is free and works fully offline.

NO APP LOGIN on first launch. The app opens on an empty local CRM — you can use all local features without signing in.

OPTIONAL — Team Sync demo (Settings → Shared Database):
1. Turn ON “Shared Database (remote)”.
2. Server: https://emhk.eastmarkhk.com/crm
3. Account: emhk@eastmarkhk.com
4. Sync password: use the password in App Review Information (Sign-in).
5. Tap “Test connection”, then “Sync now”.

Other features: create clients/tasks/notes from the main tabs; mic for dictation; Settings → Users for Face ID / Touch ID. e-Invoicing can be skipped.

Permission usage strings are localized for every CRM UI language (multi-language; English is the Info.plist technical default; dialogs follow the device language).
```

### Reply template (if resolving an existing rejection thread)

```
Thank you for the review.

1) Demo access (Guideline 2.1(a)):
There is NO in-app login on first launch. The CRM opens on an empty local database with full offline features.

Optional Team Sync demo (Settings → Shared Database):
- Server: https://emhk.eastmarkhk.com/crm
- Account: emhk@eastmarkhk.com
- Password: (see Sign-in password field in App Review Information)
Then: Test connection → Sync now.

2) Permission language (Guideline 4):
System permission usage descriptions are localized for every CRM UI language via InfoPlist.strings (not only English/French). English remains the Info.plist technical default (App Store primary language). Dialogs follow the device language.
```


## Xcode Cloud (1 workflow iOS + 1 macOS)

Dans Xcode : **Product → Xcode Cloud → Create Workflow** (ou ASC → Xcode Cloud).

**Important :** ce projet n’a **pas** de `Podfile` — plugins via **Swift Package Manager**.
Les scripts `ci_post_clone` font `flutter build … --config-only` (pas `pod install`).

### Déclenchement
Préférer **Start Build manuel** (pas de start condition sur chaque push), pour pouvoir committer souvent.

### Workflow iOS
- Product : `ios/Runner.xcworkspace` → scheme **Runner**
- Archive → **App Store Connect** (TestFlight / Submit)
- Environment : macOS + latest Xcode ; **Clone Depth = Full**
- Script : `ios/ci_scripts/ci_post_clone.sh`

### Workflow macOS
- Product : `macos/Runner.xcworkspace` → scheme **Runner**
- Script : `macos/ci_scripts/ci_post_clone.sh`
- Même app ASC

### Permissions
- Repo GitHub **public** : `yvesbol-eastmarkhk/EastmarkHK-CRM`
- Lier le repo dans Xcode Cloud / GitHub App « Xcode Cloud »

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

# EastmarkHK CRM

CRM multi-plateforme modulaire — Flutter (canal **beta**), un seul codebase pour **macOS, iOS, Android et Windows**. Voir `SPECIFICATION.md` pour l'architecture complète.

- Cœur gratuit et complet : contacts, sociétés, pipeline, timeline, tâches, dashboard, dictée on-device.
- Modules payants : Facturation, Scanner, Stock, Salons & Leads, Assistant IA, Sync & Équipe.
- Données 100 % locales (SQLite) — mode base partagée via crm.eastmarkhk.com en option.

## Première installation

```bash
flutter channel beta && flutter upgrade
flutter create . --org com.eastmarkhk --project-name eastmarkhk_crm \
  --platforms=macos,ios,android,windows
flutter pub get
flutter run -d macos   # ou -d windows, ou un simulateur iOS/Android
```

### macOS — entitlements (obligatoire)

L'app fait des appels réseau, utilise le trousseau et le micro (dictée). Dans
`macos/Runner/DebugProfile.entitlements` **et** `macos/Runner/Release.entitlements` :

```xml
<key>com.apple.security.network.client</key>
<true/>
<key>keychain-access-groups</key>
<array/>
<key>com.apple.security.device.audio-input</key>
<true/>
```

Et dans `macos/Runner/Info.plist` + `ios/Runner/Info.plist` (English default in Info.plist; every CRM UI language has `*.lproj/InfoPlist.strings`) :


```xml
<key>NSMicrophoneUsageDescription</key>
<string>Voice dictation turns your speech into notes and tasks.</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>Transcription runs on your device; your audio stays private.</string>
```

### Android — permissions

Dans `android/app/src/main/AndroidManifest.xml` :

```xml
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
```

### Icône de l'app & écran de chargement

Générés à partir de `assets/branding/app_icon.png`. Après `flutter pub get` :

```bash
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

À relancer à chaque changement de l'image source.

## Structure

```
lib/
  main.dart / app.dart
  core/            # CRM gratuit : models, db, screens, widgets, services
  modules/         # un dossier par module payant (invoicing, scanner, ...)
  platform/        # licences, IAP, distribution
  theme/  utils/
```

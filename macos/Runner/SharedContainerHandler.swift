import FlutterMacOS
import Foundation
import IOKit

/// App Group partagé + lecture licence e-Invoicing (sandbox Release).
enum SharedContainerHandler {
  static let groupId = "group.com.eastmarkhk.shared"
  static let einvoicingBundleId = "com.eastmarkhk.einvoicing"
  static let einvoicingPrefsName = "com.eastmarkhk.einvoicing.plist"
  static let licenseMirrorFileName = "einvoicing_license.json"

  static func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(
      name: "eastmarkhk/shared_container", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "path":
        let url = FileManager.default.containerURL(
          forSecurityApplicationGroupIdentifier: groupId)
        result(url?.path)
      case "openEInvoicing":
        let url = (call.arguments as? [String: Any])?["url"] as? String
        openEInvoicing(result: result, urlString: url)
      case "isEInvoicingInstalled":
        result(NSWorkspace.shared.urlForApplication(
          withBundleIdentifier: einvoicingBundleId) != nil)
      case "hardwareUUID":
        result(platformUUID() ?? "")
      case "readEinvoicingPref":
        guard let key = call.arguments as? String, !key.isEmpty else {
          result(nil)
          return
        }
        result(readEinvoicingPref(key: key))
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  /// Lance / active e-Invoicing. Launch Services rate parfois le lookup
  /// par bundle ID juste après une install DMG → fallback chemins connus.
  /// Si `url` (eastmarkhk-einvoicing://…) est fourni, on l’ouvre pour
  /// livrer le deep-link même quand l’app tourne déjà.
  static func openEInvoicing(result: @escaping FlutterResult, urlString: String?) {
    if let urlString, let url = URL(string: urlString), !urlString.isEmpty {
      if NSWorkspace.shared.open(url) {
        result(true)
        return
      }
      // Scheme pas encore déclaré (ancienne build) → fall through activate.
    }

    // Déjà lancée : amener au premier plan (sinon « rien ne se passe »).
    let running = NSRunningApplication.runningApplications(
      withBundleIdentifier: einvoicingBundleId)
    if let app = running.first {
      if #available(macOS 14.0, *) {
        app.activate()
      } else {
        app.activate(options: [.activateAllWindows])
      }
      result(true)
      return
    }

    var appUrl = NSWorkspace.shared.urlForApplication(
      withBundleIdentifier: einvoicingBundleId)
    if appUrl == nil {
      let home = NSHomeDirectory()
      let candidates = [
        "/Applications/EastmarkHK e-Invoicing.app",
        "\(home)/Applications/EastmarkHK e-Invoicing.app",
      ]
      for path in candidates {
        if FileManager.default.fileExists(atPath: path) {
          appUrl = URL(fileURLWithPath: path)
          break
        }
      }
    }
    guard let appUrl else {
      result(false)
      return
    }

    let config = NSWorkspace.OpenConfiguration()
    config.activates = true
    NSWorkspace.shared.openApplication(at: appUrl, configuration: config) {
      _, error in
      DispatchQueue.main.async {
        if error != nil {
          // Dernier recours : `open -b` / chemin (LaunchServices parfois
          // désynchronisé après drag-and-drop du DMG).
          let task = Process()
          task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
          task.arguments = ["-b", einvoicingBundleId]
          do {
            try task.run()
            task.waitUntilExit()
            result(task.terminationStatus == 0)
          } catch {
            result(false)
          }
        } else {
          result(true)
        }
      }
    }
  }

  static func platformUUID() -> String? {
    let service = IOServiceGetMatchingService(
      kIOMainPortDefault,
      IOServiceMatching("IOPlatformExpertDevice"))
    guard service != 0 else { return nil }
    defer { IOObjectRelease(service) }
    guard let cf = IORegistryEntryCreateCFProperty(
      service,
      "IOPlatformUUID" as CFString,
      kCFAllocatorDefault,
      0)?.takeRetainedValue() else { return nil }
    return cf as? String
  }

  /// Ordre : App Group (miroir) → CFPreferences e-Invoicing → fichiers plist.
  static func readEinvoicingPref(key: String) -> String? {
    let bare = key.hasPrefix("flutter.") ? String(key.dropFirst(8)) : key
    let keys = Array(Set([key, bare, "flutter.\(bare)"]))

    if let v = readFromAppGroupMirror(bareKey: bare, keys: keys) {
      return v
    }
    if let v = readFromCFPreferences(keys: keys) {
      return v
    }
    for path in einvoicingPrefsPaths() {
      guard let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
        continue
      }
      if let v = stringValue(in: dict, keys: keys) {
        return v
      }
    }
    return nil
  }

  static func readFromAppGroupMirror(bareKey: String, keys: [String]) -> String? {
    guard let root = FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: groupId)
    else { return nil }

    // UserDefaults suite partagée (si e-Invoicing y a écrit).
    if let suite = UserDefaults(suiteName: groupId) {
      for k in keys {
        if let s = suite.string(forKey: k), !s.isEmpty { return s }
        if let s = suite.string(forKey: bareKey), !s.isEmpty { return s }
      }
      // Alias miroir.
      if bareKey.contains("license_token"),
         let s = suite.string(forKey: "einvoicing.license_token"), !s.isEmpty {
        return s
      }
    }

    // Fichier JSON miroir écrit par e-Invoicing.
    let file = root.appendingPathComponent(licenseMirrorFileName)
    guard let data = try? Data(contentsOf: file),
          let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else { return nil }

    if bareKey.contains("license_token"),
       let s = json["license_token"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("license_email"),
       let s = json["license_email"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("premium_active") {
      if let b = json["premium_active"] as? Bool { return b ? "true" : "false" }
      if let s = json["premium_active"] as? String { return s }
    }
    if bareKey.contains("premium_expiry"),
       let s = json["premium_expiry"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("data_storage_mode"),
       let s = json["data_storage_mode"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("remote_base_url") || bareKey == "remote_base_url",
       let s = json["remote_base_url"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("remote_ftp_user") || bareKey == "remote_ftp_user",
       let s = json["remote_ftp_user"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("remote_ftp_password") || bareKey == "remote_ftp_password",
       let s = json["remote_ftp_password"] as? String, !s.isEmpty {
      return s
    }
    if bareKey.contains("trial_start") {
      if let n = json["trial_start"] as? NSNumber { return n.stringValue }
      if let s = json["trial_start"] as? String { return s }
    }
    return stringValue(in: json, keys: keys)
  }

  static func readFromCFPreferences(keys: [String]) -> String? {
    let appId = einvoicingBundleId as CFString
    CFPreferencesAppSynchronize(appId)
    for k in keys {
      if let cf = CFPreferencesCopyAppValue(k as CFString, appId) {
        if let s = cf as? String, !s.isEmpty { return s }
        if let n = cf as? NSNumber { return n.stringValue }
        if let b = cf as? Bool { return b ? "true" : "false" }
      }
    }
    return nil
  }

  static func stringValue(in dict: [String: Any], keys: [String]) -> String? {
    for k in keys {
      if let s = dict[k] as? String, !s.isEmpty { return s }
      if let n = dict[k] as? NSNumber { return n.stringValue }
      if let b = dict[k] as? Bool { return b ? "true" : "false" }
    }
    return nil
  }

  static func einvoicingPrefsPaths() -> [String] {
    let home = NSHomeDirectory()
    let realHome: String = {
      if let range = home.range(of: "/Library/Containers/") {
        return String(home[..<range.lowerBound])
      }
      return home
    }()
    return [
      "\(realHome)/Library/Containers/\(einvoicingBundleId)/Data/Library/Preferences/\(einvoicingPrefsName)",
      "\(realHome)/Library/Preferences/\(einvoicingPrefsName)",
    ]
  }
}

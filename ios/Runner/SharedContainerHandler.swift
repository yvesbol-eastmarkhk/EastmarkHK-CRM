import Flutter
import Foundation

/// Pendant iOS/iPadOS du bridge macOS (`macos/Runner/SharedContainerHandler.swift`).
/// Expose uniquement le chemin de l'App Group partagé avec l'app sœur
/// **EastmarkHK e-Invoicing** — la détection de licence côté Dart
/// (`EinvoicingLicenseBridge`) lit ensuite directement le fichier miroir
/// JSON qu'elle y écrit (`einvoicing_license.json`). Pas de NSWorkspace ni
/// CFPreferences sur iOS (sandbox strict) : le miroir App Group est le seul
/// mécanisme disponible, et il suffit.
enum SharedContainerHandler {
  static let groupId = "group.com.eastmarkhk.shared"

  static func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(
      name: "eastmarkhk/shared_container", binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "path":
        let url = FileManager.default.containerURL(
          forSecurityApplicationGroupIdentifier: groupId)
        result(url?.path)
      default:
        // isEInvoicingInstalled / hardwareUUID / readEinvoicingPref / openEInvoicing :
        // macOS uniquement (NSWorkspace, IOKit, plists hors-sandbox). Le
        // Dart bascule proprement sur le miroir App Group via "path" ci-dessus.
        result(FlutterMethodNotImplemented)
      }
    }
  }
}

import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    AiAssistant.register(with: flutterViewController.engine.binaryMessenger)
    SharedContainerHandler.register(with: flutterViewController.engine.binaryMessenger)
    SpeechRecognitionHandler.register(with: flutterViewController.engine.binaryMessenger)

    super.awakeFromNib()
  }
}

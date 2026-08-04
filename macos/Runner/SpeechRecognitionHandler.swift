import AVFoundation
import FlutterMacOS
import Speech

/// Dictée macOS via Speech + AVAudioEngine (évite le crash de speech_to_text).
/// MethodChannel `eastmarkhk_crm/speech` + EventChannel `eastmarkhk_crm/speech_events`.
enum SpeechRecognitionHandler {
  private static let methodName = "eastmarkhk_crm/speech"
  private static let eventName = "eastmarkhk_crm/speech_events"

  private static var eventSink: FlutterEventSink?
  private static var audioEngine = AVAudioEngine()
  private static var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
  private static var recognitionTask: SFSpeechRecognitionTask?
  private static var recognizer: SFSpeechRecognizer?

  static func register(with messenger: FlutterBinaryMessenger) {
    let method = FlutterMethodChannel(name: methodName, binaryMessenger: messenger)
    method.setMethodCallHandler { call, result in
      switch call.method {
      case "isAvailable":
        result(SFSpeechRecognizer() != nil)
      case "requestPermission":
        requestPermission(result: result)
      case "start":
        let localeId = (call.arguments as? [String: Any])?["localeId"] as? String
        start(localeId: localeId, result: result)
      case "stop":
        stop()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    let events = FlutterEventChannel(name: eventName, binaryMessenger: messenger)
    events.setStreamHandler(SpeechEventStream())
  }

  fileprivate static func setEventSink(_ sink: FlutterEventSink?) {
    eventSink = sink
  }

  private static func emit(_ payload: [String: Any]) {
    DispatchQueue.main.async {
      eventSink?(payload)
    }
  }

  private static func requestPermission(result: @escaping FlutterResult) {
    SFSpeechRecognizer.requestAuthorization { status in
      AVCaptureDevice.requestAccess(for: .audio) { micOk in
        DispatchQueue.main.async {
          result(status == .authorized && micOk)
        }
      }
    }
  }

  private static func start(localeId: String?, result: @escaping FlutterResult) {
    stop()

    let auth = SFSpeechRecognizer.authorizationStatus()
    guard auth == .authorized else {
      requestPermission { ok in
        guard (ok as? Bool) == true else {
          result(FlutterError(
            code: "permission",
            message: "Micro ou reconnaissance vocale non autorisés",
            details: nil))
          return
        }
        start(localeId: localeId, result: result)
      }
      return
    }

    let locale: Locale
    if let id = localeId, !id.isEmpty {
      locale = Locale(identifier: id.replacingOccurrences(of: "_", with: "-"))
    } else {
      locale = Locale.current
    }

    guard let speech = SFSpeechRecognizer(locale: locale), speech.isAvailable else {
      result(FlutterError(
        code: "unavailable",
        message: "Reconnaissance vocale indisponible pour cette langue",
        details: nil))
      return
    }
    recognizer = speech

    let request = SFSpeechAudioBufferRecognitionRequest()
    request.shouldReportPartialResults = true
    if speech.supportsOnDeviceRecognition {
      request.requiresOnDeviceRecognition = true
    }
    recognitionRequest = request

    let input = audioEngine.inputNode
    let format = input.outputFormat(forBus: 0)
    guard format.sampleRate > 0, format.channelCount > 0 else {
      result(FlutterError(
        code: "audio",
        message: "Entrée micro indisponible",
        details: nil))
      return
    }

    input.removeTap(onBus: 0)
    input.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
      recognitionRequest?.append(buffer)
    }

    audioEngine.prepare()
    do {
      try audioEngine.start()
    } catch {
      stop()
      result(FlutterError(code: "audio", message: error.localizedDescription, details: nil))
      return
    }

    recognitionTask = speech.recognitionTask(with: request) { partial, error in
      if let partial {
        emit([
          "type": "result",
          "words": partial.bestTranscription.formattedString,
          "final": partial.isFinal,
        ])
        if partial.isFinal {
          stop()
          emit(["type": "status", "status": "done"])
        }
      }
      if let error {
        emit(["type": "error", "message": error.localizedDescription])
        stop()
        emit(["type": "status", "status": "done"])
      }
    }

    emit(["type": "status", "status": "listening"])
    result(true)
  }

  private static func stop() {
    if audioEngine.isRunning {
      audioEngine.stop()
    }
    audioEngine.inputNode.removeTap(onBus: 0)
    recognitionRequest?.endAudio()
    recognitionRequest = nil
    recognitionTask?.cancel()
    recognitionTask = nil
  }
}

private final class SpeechEventStream: NSObject, FlutterStreamHandler {
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    SpeechRecognitionHandler.setEventSink(events)
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    SpeechRecognitionHandler.setEventSink(nil)
    return nil
  }
}

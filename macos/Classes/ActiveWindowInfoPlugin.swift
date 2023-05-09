import Cocoa
import FlutterMacOS

public class ActiveWindowInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "active_window_info", binaryMessenger: registrar.messenger)
    let instance = ActiveWindowInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getActiveWindowInfo":
      result(self.getActiveWindow())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getActiveWindow() -> String? {
    if let frontApp = NSWorkspace.shared.frontmostApplication {
            let activeWindowName = frontApp.localizedName ?? ""
            return activeWindowName
        }
        return nil
  }

}

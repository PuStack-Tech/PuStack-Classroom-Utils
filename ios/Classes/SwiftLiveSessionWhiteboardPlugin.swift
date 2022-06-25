import Flutter
import UIKit

public class SwiftLiveSessionWhiteboardPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "live_session_whiteboard", binaryMessenger: registrar.messenger())
    // let instance = SwiftLiveSessionWhiteboardPlugin()
    // let factory = NativeViewFactory(messenger: registrar.messenger())
    // registrar.register(factory, withId: "whiteboard")
    // registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}

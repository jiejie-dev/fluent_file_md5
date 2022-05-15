import Flutter
import UIKit

public class SwiftFileMd5Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fluent_file_md5", binaryMessenger: registrar.messenger())
    let instance = SwiftFileMd5Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public func get(
        _ filePath: String,
        error: AutoreleasingUnsafeMutablePointer<FlutterError?>
    ) -> String? {
        let fileUrl = URL(fileURLWithPath: filePath)
        do {
            return try get(url: fileUrl)
        } catch (let exception) {
            error.pointee = FlutterError(
                code: "PLATFORM_EXCEPTION",
                message: exception.localizedDescription,
                details: nil
            )
            return ""
        }
    }
}

import UIKit
import Flutter
import CoreLocation

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "com.example/native", binaryMessenger: controller.binaryMessenger)

    batteryChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "getBatteryLevel" {
        let batteryLevel = self.getBatteryLevel()

        if batteryLevel == -1 {
          result(FlutterError(code: "UNAVAILABLE",
                              message: "Battery info unavailable",
                              details: nil))
        } else {
          result(batteryLevel)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getBatteryLevel() -> Int {
    UIDevice.current.isBatteryMonitoringEnabled = true
    if UIDevice.current.batteryState == UIDevice.BatteryState.unknown {
      return -1
    } else {
      return Int(UIDevice.current.batteryLevel * 100)
    }
  }
}

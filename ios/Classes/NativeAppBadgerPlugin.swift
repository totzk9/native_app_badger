import Flutter
import UIKit
import UserNotifications

public class NativeAppBadgerPlugin: NSObject, FlutterPlugin {

  private static var CHANNEL_NAME: String = "ph/native_app_badger"

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: registrar.messenger())
    let instance: NativeAppBadgerPlugin = NativeAppBadgerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    requestPermission()

    switch call.method {
      case "updateBadgeCount":
        guard let args = call.arguments as? [String : Any] else { return }
        let count = args["count"] as! Int
        updateBadgeCount(count)
        result(nil)
      case "removeBadge":
        removeBadge()
        result(nil)
      case "isAppBadgeSupported":
        result(true)
      default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func requestPermission() {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { (granted, error) in
        if granted {
          DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
          }
        }
      }
    } else {
      UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge], categories: nil))
      UIApplication.shared.registerForRemoteNotifications()
    }
  }

  private func updateBadgeCount(count: Int) {
    if #available(iOS 16.0, *) {
      UNUserNotificationCenter.current().setBadgeCount(count)
    } else {
      UIApplication.shared.applicationIconBadgeNumber = count;
    }
  }

  private func removeBadge() {
    if #available(iOS 16.0, *) {
      UNUserNotificationCenter.current().setBadgeCount(0)
    } else {
      UIApplication.shared.applicationIconBadgeNumber = 0;
    }
  }
}

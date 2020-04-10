import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        GMSServices.provideAPIKey("AIzaSyDmdyzFEPPoABQKV_w4pCDJozcky9GRPpY")
        GMSPlacesClient.provideAPIKey("AIzaSyDmdyzFEPPoABQKV_w4pCDJozcky9GRPpY")
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        GMSServices.provideAPIKey("AIzaSyBEbIhBzGarHxIT7AMEf9unrbICrW6FtD8")
        GMSPlacesClient.provideAPIKey("AIzaSyBEbIhBzGarHxIT7AMEf9unrbICrW6FtD8")
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

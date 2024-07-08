import Flutter
import UIKit
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey('AIzaSyADuP6tCcGnz5rCc_1YQnGPnJB-ZA9vALI')
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

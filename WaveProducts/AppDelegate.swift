import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
        let businessId = "89746d57-c25f-4cec-9c63-34d7780b044b"
        let baseURL = URL(string: "https://api.waveapps.com")!
        let waveAPI = WaveAPI(baseURL: baseURL, accessToken: accessToken)

        let navigationController = window!.rootViewController as! UINavigationController
        let productsController = navigationController.topViewController as! ProductsViewController
        productsController.waveAPI = waveAPI
        productsController.businessId = businessId

        return true
    }
}

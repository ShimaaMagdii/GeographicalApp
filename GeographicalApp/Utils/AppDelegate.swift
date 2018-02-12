//
//  AppDelegate.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let soundName = "Default"
    let locationManager = CLLocationManager()
    static var currentLanguage :String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.currentLang) != nil ?
                UserDefaults.standard.string(forKey: UserDefaultsKeys.currentLang)! : SupportedLanguages.English.rawValue
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
        UIApplication.shared.cancelAllLocalNotifications()
        return true
    }

func handleEvent(forRegion region: CLRegion!) {
    // Show an alert if application is active
    if UIApplication.shared.applicationState == .active {
        guard let message = getNotificationMsg(fromRegionIdentifier: region.identifier) else { return }
        window?.rootViewController?.showAlert(withTitle: nil, message: message)
    } else {
        // Otherwise present a local notification
        let notification = UILocalNotification()
        notification.alertBody = getNotificationMsg(fromRegionIdentifier: region.identifier)
        notification.soundName = soundName
        UIApplication.shared.presentLocalNotificationNow(notification)
    }
}

func getNotificationMsg(fromRegionIdentifier name: String) -> String? {
    let savedItems = UserDefaults.standard.array(forKey: UserDefaultsKeys.savedItems) as? [NSData]
    let geotifications = savedItems?.map { NSKeyedUnarchiver.unarchiveObject(with: $0 as Data) as? GALocationViewModel }
    let index = geotifications?.index { $0?.name == name }
    return index != nil ? geotifications?[index!]?.name : nil
}

}

extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLCircularRegion {
            handleEvent(forRegion: region)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLCircularRegion {
            handleEvent(forRegion: region)
        }
    }
}

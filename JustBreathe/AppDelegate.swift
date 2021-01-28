//
//  AppDelegate.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 27.1.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabVC = UITabBarController()
        tabVC.delegate = self

        let startScreenVC = StartScreenViewController()
        let presetsVC = PresetsViewController()
        let logVC = LogViewController()
        let settingsVC = SettingsViewController()
        
        startScreenVC.title = "Start Screen"
        presetsVC.title = "Presets"
        logVC.title = "Log"
        settingsVC.title = "Settings"
        
        tabVC.setViewControllers([startScreenVC, presetsVC, logVC, settingsVC], animated: false)
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
        return true
    }
}


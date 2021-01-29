//
//  TabBar.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarStyles()
        setupVCs()
    }
    
    func setTabBarStyles() {
        let transperentBlackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)

        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transperentBlackColor.setFill()
        UIRectFill(rect)

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
            tabBar.shadowImage = image
        }

        UIGraphicsEndImageContext()
    }
    
    func setupVCs() {
        let startScreenVC = StartScreenViewController()
        let presetsVC = PresetsViewController()
        let logVC = LogViewController()
        let settingsVC = SettingsViewController()
        
        startScreenVC.title = "Start Screen"
        presetsVC.title = "Presets"
        logVC.title = "Log"
        settingsVC.title = "Settings"
        
        let startScreenIconSelected = R.image.menuiconStartScreenSelected()?.withRenderingMode(.alwaysOriginal)
        let startScreenIconUnselected = R.image.menuiconStartScreenUnselected()?.withRenderingMode(.alwaysOriginal)

        let presetIconSelected = R.image.menuiconPresetsSelected()?.withRenderingMode(.alwaysOriginal)
        let presetIconUnselected = R.image.menuiconPresetsUnselected()?.withRenderingMode(.alwaysOriginal)
        
        let logIconSelected = R.image.menuiconLogSelected()?.withRenderingMode(.alwaysOriginal)
        let logIconUnselected = R.image.menuiconLogUnselected()?.withRenderingMode(.alwaysOriginal)
        
        let settingsIconSelected = R.image.menuiconSettingsSelected()?.withRenderingMode(.alwaysOriginal)
        let settingsIconUnselected = R.image.menuiconSettingsUnselected()?.withRenderingMode(.alwaysOriginal)
        
        startScreenVC.tabBarItem = UITabBarItem(title: nil, image: startScreenIconUnselected, selectedImage: startScreenIconSelected)
        presetsVC.tabBarItem = UITabBarItem(title: nil, image: presetIconUnselected, selectedImage: presetIconSelected)
        logVC.tabBarItem = UITabBarItem(title: nil, image: logIconUnselected, selectedImage: logIconSelected)
        settingsVC.tabBarItem = UITabBarItem(title: nil, image: settingsIconUnselected, selectedImage: settingsIconSelected)
        
        setViewControllers([startScreenVC, presetsVC, logVC, settingsVC], animated: false)
        selectedViewController = startScreenVC
    }
}

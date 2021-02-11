//
//  TabBar.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class RootViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarStyles()
        setupVCs()
    }
    
    func setTabBarStyles() {
        let transparentColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transparentColor.setFill()
        UIRectFill(rect)

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
            tabBar.shadowImage = image
        }

        UIGraphicsEndImageContext()
    }
    
    func setupVCs() {
        let startScreenVC = createTabVC(VC: StartScreenViewController(),
                                        selectedIcon: UIImage.menuiconStartScreenSelected,
                                        unSelectedIcon: UIImage.menuiconStartScreenUnSelected)

        let presetsVC = createTabVC(VC: PresetsViewController(),
                                    selectedIcon: UIImage.menuiconPresetsSelected,
                                    unSelectedIcon: UIImage.menuiconPresetsUnselected)

        let logVC = createTabVC(VC: LogViewController(),
                                selectedIcon: UIImage.menuiconLogSelected,
                                unSelectedIcon: UIImage.menuiconLogUnselected)
        
        let settingsVC = createTabVC(VC: SettingsViewController(),
                                     selectedIcon: UIImage.menuiconSettingsSelected,
                                     unSelectedIcon: UIImage.menuiconSettingsUnselected)
        
        setViewControllers([startScreenVC, presetsVC, logVC, settingsVC], animated: false)
    }
    
    func createTabVC(VC: UIViewController, selectedIcon: UIImage?, unSelectedIcon: UIImage?) -> UINavigationController {
        let tabVC = UINavigationController(rootViewController: VC)
        
        tabVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        tabVC.navigationBar.shadowImage = UIImage()
        tabVC.tabBarItem = UITabBarItem(title: nil, image: unSelectedIcon, selectedImage: selectedIcon)
        
        return tabVC
    }
}

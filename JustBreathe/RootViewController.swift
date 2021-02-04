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
        let transparentBlackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)

        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transparentBlackColor.setFill()
        UIRectFill(rect)

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
            tabBar.shadowImage = image
        }

        UIGraphicsEndImageContext()
    }
    
    func setupVCs() {
        let startScreenVC = createTabVC(VC: StartScreenViewController(),
                                        selectedIcon: R.image.menuiconStartScreenSelected()?.withRenderingMode(.alwaysOriginal),
                                        unSelectedIcon: R.image.menuiconStartScreenUnselected()?.withRenderingMode(.alwaysOriginal))

        let presetsVC = createTabVC(VC: PresetsViewController(),
                                    selectedIcon: R.image.menuiconPresetsSelected()?.withRenderingMode(.alwaysOriginal),
                                    unSelectedIcon: R.image.menuiconPresetsUnselected()?.withRenderingMode(.alwaysOriginal))

        let logVC = createTabVC(VC: LogViewController(),
                                selectedIcon: R.image.menuiconLogSelected()?.withRenderingMode(.alwaysOriginal),
                                unSelectedIcon: R.image.menuiconLogUnselected()?.withRenderingMode(.alwaysOriginal))
        
        let settingsVC = createTabVC(VC: SettingsViewController(),
                                     selectedIcon: R.image.menuiconSettingsSelected()?.withRenderingMode(.alwaysOriginal),
                                     unSelectedIcon: R.image.menuiconSettingsUnselected()?.withRenderingMode(.alwaysOriginal))
        
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

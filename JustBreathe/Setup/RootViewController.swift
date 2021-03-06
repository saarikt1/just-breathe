//
//  TabBar.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class RootViewController: UITabBarController {
    let presetService: PresetService
    let presetViewModel: PresetViewModel

    init() {
        self.presetService = PresetService()
        self.presetViewModel = PresetViewModel(presetService: presetService)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetService.loadPresets()
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
        let startScreenViewController = StartScreenViewController(presetViewModel)

        let startScreenVC = createTabVC(vc: startScreenViewController,
                                        selectedIcon: UIImage.menuiconStartScreenSelected,
                                        unSelectedIcon: UIImage.menuiconStartScreenUnSelected)
        
        let presetViewController = PresetsViewController(presetViewModel)

        let presetsVC = createTabVC(vc: presetViewController,
                                    selectedIcon: UIImage.menuiconPresetsSelected,
                                    unSelectedIcon: UIImage.menuiconPresetsUnselected)

        let settingsVC = createTabVC(vc: SettingsViewController(),
                                     selectedIcon: UIImage.menuiconSettingsSelected,
                                     unSelectedIcon: UIImage.menuiconSettingsUnselected)
        
        setViewControllers([startScreenVC, presetsVC, settingsVC], animated: false)
    }
    
    func createTabVC(vc: UIViewController, selectedIcon: UIImage?, unSelectedIcon: UIImage?) -> UINavigationController {
        vc.navigationItem.title = ""
        let tabVC = UINavigationController(rootViewController: vc)
        
        tabVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        tabVC.navigationBar.shadowImage = UIImage()
        tabVC.navigationBar.tintColor = R.color.white80()
        let navTitleStyles: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: R.color.white80() ?? .white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        tabVC.navigationBar.titleTextAttributes = navTitleStyles
        tabVC.tabBarItem = UITabBarItem(title: nil, image: unSelectedIcon, selectedImage: selectedIcon)
        
        return tabVC
    }
}

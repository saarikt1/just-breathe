//
//  SettingsViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let settingsView = SettingsView()
        view.addSubview(settingsView)
        
        settingsView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

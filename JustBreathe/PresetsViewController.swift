//
//  PresetsViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class PresetsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let presetsView = PresetsView()
        view.addSubview(presetsView)
        
        presetsView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}


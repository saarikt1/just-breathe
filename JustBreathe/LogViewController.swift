//
//  LogViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class LogViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let logView = LogView()
        view.addSubview(logView)
        
        logView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

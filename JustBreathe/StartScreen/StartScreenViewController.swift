//
//  ViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 27.1.2021.
//

import UIKit
import SnapKit

class StartScreenViewController: UIViewController {
    var presetController: PresetController!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        let startScreenView = StartScreenView(selectedPreset: presetController.selectedPreset)
        view.addSubview(startScreenView)
        
        startScreenView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        startScreenView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
    
    @objc func didTapStartButton() {
        let breathingViewController = BreathingViewController(selectedPreset: presetController.selectedPreset)
        show(breathingViewController, sender: self)
    }
}

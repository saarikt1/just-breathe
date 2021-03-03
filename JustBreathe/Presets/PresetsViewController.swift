//
//  PresetsViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class PresetsViewController: UIViewController {
    var presetController: PresetController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let presetsView = PresetsView(controller: self, presetController: self.presetController)
        presetsView.presetScrollView.delegate = self
        view.addSubview(presetsView)
        
        presetsView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - UIScrollViewDelegate

extension PresetsViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let selectedPageIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.presetController.selectedPresetIndex = selectedPageIndex
    }
}

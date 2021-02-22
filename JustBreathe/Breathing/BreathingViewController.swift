//
//  BreathingViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingViewController: UIViewController {
    let breathingView = BreathingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        view.addSubview(breathingView)
        breathingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        startAnimation(inhale: 4, firstHold: 2, exhale: 6, secondHold: 0)
    }
    
    func startAnimation(inhale: Int, firstHold: Int, exhale: Int, secondHold: Int) {
        UIView.animate(withDuration: TimeInterval(inhale), delay: 2, options: [.curveEaseInOut, .repeat, .autoreverse]) {
            self.breathingView.breatheLogo.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.breathingView.breatheLogo.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
}

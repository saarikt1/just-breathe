//
//  BreathingViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingViewController: UIViewController {
    let breathingView = BreathingView()
    var firstCycle = true
    var holdBetweenCycles = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        view.addSubview(breathingView)
        breathingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        startAnimation(inhale: 4, firstHold: 2, exhale: 6, secondHold: 1, cycles: 3)
    }
    
    func startAnimation(inhale: Int, firstHold: Int, exhale: Int, secondHold: Int, cycles: Int) {
        let rotate = CGAffineTransform(rotationAngle: 3.0)
        let rotateAndScaleUp = rotate.scaledBy(x: 1.5, y: 1.5)

        if cycles < 1 {
            return
        }

        holdBetweenCycles = firstCycle ? 0 : secondHold

        UIView.animate(withDuration: TimeInterval(inhale), delay: TimeInterval(holdBetweenCycles), options: .curveEaseInOut, animations: {
            self.breathingView.breatheLogo.transform = rotateAndScaleUp
        }) { _ in
            UIView.animate(withDuration: TimeInterval(exhale), delay: TimeInterval(firstHold), options: .curveEaseInOut, animations: {
                self.breathingView.breatheLogo.transform = .identity
            }) { _ in
                self.firstCycle = false
                self.startAnimation(inhale: inhale, firstHold: firstHold, exhale: exhale, secondHold: secondHold, cycles: cycles-1)
            }
        }
    }
}

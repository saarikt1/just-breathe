//
//  BreathingViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingViewController: UIViewController {
    let breathingView = BreathingView()
    var breathingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        breathingLabel.text = "Inhale"
        breathingLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        breathingLabel.textColor = R.color.white80()

        view.addSubview(breathingView)
        view.addSubview((breathingLabel))
        breathingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        breathingLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(breathingView.breatheLogo.snp.top).offset(-100)
        }
        
        startAnimation(inhale: 4, firstHold: 2, exhale: 6, secondHold: 0, cycles: 3)
    }
    
    func startAnimation(inhale: Int, firstHold: Int, exhale: Int, secondHold: Int, cycles: Int) {
        let rotate = CGAffineTransform(rotationAngle: 3.0)
        let rotateAndScaleUp = rotate.scaledBy(x: 1.5, y: 1.5)

        if cycles < 1 {
            self.breathingLabel.alpha = 1.00
            self.breathingLabel.text = "Well done!"
            return
        }

        UIView.animate(withDuration: TimeInterval(inhale), delay: 0, options: .curveEaseInOut, animations: {
            self.breathingLabel.text = "Inhale"
            self.breathingLabel.alpha = 0.0
            self.breathingView.breatheLogo.transform = rotateAndScaleUp
        }) { _ in

            UIView.animate(withDuration: TimeInterval(firstHold), delay: 0, options: .curveLinear, animations: {
                self.breathingLabel.text = ""
                self.breathingLabel.alpha = 1.00
            }) { _ in
                
                UIView.animate(withDuration: TimeInterval(exhale), delay: 0, options: .curveEaseInOut, animations: {
                    self.breathingLabel.text = "Exhale"
                    self.breathingLabel.alpha = 0.0
                    self.breathingView.breatheLogo.transform = .identity
                }) { _ in
                    
                    UIView.animate(withDuration: TimeInterval(secondHold), delay: 0, options: .curveLinear, animations: {
                        self.breathingLabel.text = ""
                        self.breathingLabel.alpha = 1.00
                    }) { _ in
                        
                        self.startAnimation(inhale: inhale, firstHold: firstHold, exhale: exhale, secondHold: secondHold, cycles: cycles-1)
                    }
                }
            }
        }
    }
}

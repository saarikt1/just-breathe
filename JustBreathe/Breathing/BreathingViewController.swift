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
    var selectedPreset: BreathingModel
    var breathCycles: Int
    
    init(selectedPreset: BreathingModel, breathCycles: Int) {
        self.selectedPreset = selectedPreset
        self.breathCycles = breathCycles
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        breathingLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        breathingLabel.textColor = R.color.white80()
        breathingLabel.alpha = 0.0

        view.addSubview(breathingView)
        view.addSubview((breathingLabel))
        breathingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        breathingLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(breathingView.breatheLogo.snp.top).offset(-100)
        }
        
        startAnimation(inhale: selectedPreset.inhale, firstHold: selectedPreset.firstHold, exhale: selectedPreset.exhale, secondHold: selectedPreset.secondHold, cycles: breathCycles)
    }
    
    func startAnimation(inhale: Int, firstHold: Int, exhale: Int, secondHold: Int, cycles: Int) {
        animateLabel(inhale, firstHold, exhale, secondHold, cycles)
        animateLogo(inhale, firstHold, exhale, secondHold, cycles)
    }
    
    func animateLabel(_ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int, _ cycles: Int) {
        if cycles < 1 {
            self.breathingLabel.alpha = 1.00
            self.breathingLabel.text = "Well done!"
            return
        }
        
        UIView.animate(withDuration: 0.25 * TimeInterval(inhale), delay: 0, options: .curveEaseInOut, animations: {
            self.breathingLabel.text = "Inhale"
            self.breathingLabel.alpha = 1.0
        }) { _ in
            
            UIView.animate(withDuration: 0.25 * TimeInterval(inhale), delay: 0.5 * TimeInterval(inhale), options: .curveEaseInOut, animations: {
                self.breathingLabel.alpha = 0.0
            }) { _ in
                
                UIView.animate(withDuration: 0.25 * TimeInterval(firstHold), delay: 0, options: .curveEaseInOut, animations: {
                    if firstHold > 2 {
                        self.breathingLabel.text = "Hold"
                    } else {
                        self.breathingLabel.text = ""
                    }
                    self.breathingLabel.alpha = 1.0
                }) { _ in
                    
                    UIView.animate(withDuration: 0.25 * TimeInterval(firstHold), delay: 0.5 * TimeInterval(firstHold), options: .curveEaseInOut, animations: {
                        self.breathingLabel.alpha = 0.0
                    }) { _ in
                        
                        UIView.animate(withDuration: 0.25 * TimeInterval(exhale), delay: 0, options: .curveEaseInOut, animations: {
                            self.breathingLabel.text = "Exhale"
                            self.breathingLabel.alpha = 1.0
                        }) { _ in
                            
                            UIView.animate(withDuration: 0.25 * TimeInterval(exhale), delay: 0.5 * TimeInterval(exhale), options: .curveEaseInOut, animations: {
                                self.breathingLabel.alpha = 0.0
                            }) { _ in
                                
                                UIView.animate(withDuration: 0.25 * TimeInterval(secondHold), delay: 0, options: .curveEaseInOut, animations: {
                                    if secondHold > 2 {
                                        self.breathingLabel.text = "Hold"
                                    } else {
                                        self.breathingLabel.text = ""
                                    }
                                    self.breathingLabel.alpha = 1.0
                                }) { _ in
                                    
                                    UIView.animate(withDuration: 0.25 * TimeInterval(secondHold), delay: 0.5 * TimeInterval(secondHold), options: .curveEaseInOut, animations: {
                                        self.breathingLabel.alpha = 0.0
                                    }) { _ in
                                        
                                        
                                        self.animateLabel(inhale, firstHold, exhale, secondHold, cycles-1)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func animateLogo(_ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int, _ cycles: Int) {
        let rotate = CGAffineTransform(rotationAngle: 3.0)
        let rotateAndScaleUp = rotate.scaledBy(x: 1.5, y: 1.5)

        if cycles < 1 {
            return
        }
        
        UIView.animate(withDuration: TimeInterval(inhale), delay: 0, options: .curveEaseInOut, animations: {
            self.breathingView.breatheLogo.transform = rotateAndScaleUp
        }) { _ in
            
            UIView.animate(withDuration: TimeInterval(exhale), delay: TimeInterval(firstHold), options: .curveEaseInOut, animations: {
                self.breathingView.breatheLogo.transform = .identity
            }) { _ in
                
                UIView.animate(withDuration: TimeInterval(secondHold), delay: 0, options: .curveEaseInOut, animations: {
                    self.breathingView.breatheLogo.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
                    self.breathingView.breatheLogo.transform = .identity
                    
                }) { _ in
                    
                    self.animateLogo(inhale, firstHold, exhale, secondHold, cycles-1)
                }
            }
        }
    }
}

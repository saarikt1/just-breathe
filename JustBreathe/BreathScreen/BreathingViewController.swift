//
//  BreathingViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingViewController: UIViewController {
    private let breathingView = BreathingView()
    private var breathCycles: Int
    private let viewModel: PresetViewModel
    
    init(_ viewModel: PresetViewModel, breathCycles: Int) {
        self.breathCycles = breathCycles
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        view.addSubview(breathingView)
        breathingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startAnimation(viewModel.presetInhaleCount, viewModel.presetFirstHoldCount, viewModel.presetExhaleCount, viewModel.presetSecondHoldCount, cycles: breathCycles)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func startAnimation(_ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int, cycles: Int) {
        animateLabel(inhale, firstHold, exhale, secondHold, cycles)
        animateLogo(inhale, firstHold, exhale, secondHold, cycles)
    }
    
    private func animateLabel(_ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int, _ cycles: Int) {
        if cycles < 1 {
            self.breathingView.breathingLabel.alpha = 1.00
            self.breathingView.breathingLabel.text = "Well done!"
            return
        }
        
        UIView.animate(withDuration: 0.25 * TimeInterval(inhale), delay: 0, options: .curveEaseInOut, animations: {
            self.breathingView.breathingLabel.text = "Inhale"
            self.breathingView.breathingLabel.alpha = 1.0
        }) { _ in
            
            UIView.animate(withDuration: 0.25 * TimeInterval(inhale), delay: 0.5 * TimeInterval(inhale), options: .curveEaseInOut, animations: {
                self.breathingView.breathingLabel.alpha = 0.0
            }) { _ in
                
                UIView.animate(withDuration: 0.25 * TimeInterval(firstHold), delay: 0, options: .curveEaseInOut, animations: {
                    if firstHold > 2 {
                        self.breathingView.breathingLabel.text = "Hold"
                    } else {
                        self.breathingView.breathingLabel.text = ""
                    }
                    self.breathingView.breathingLabel.alpha = 1.0
                }) { _ in
                    
                    UIView.animate(withDuration: 0.25 * TimeInterval(firstHold), delay: 0.5 * TimeInterval(firstHold), options: .curveEaseInOut, animations: {
                        self.breathingView.breathingLabel.alpha = 0.0
                    }) { _ in
                        
                        UIView.animate(withDuration: 0.25 * TimeInterval(exhale), delay: 0, options: .curveEaseInOut, animations: {
                            self.breathingView.breathingLabel.text = "Exhale"
                            self.breathingView.breathingLabel.alpha = 1.0
                        }) { _ in
                            
                            UIView.animate(withDuration: 0.25 * TimeInterval(exhale), delay: 0.5 * TimeInterval(exhale), options: .curveEaseInOut, animations: {
                                self.breathingView.breathingLabel.alpha = 0.0
                            }) { _ in
                                
                                UIView.animate(withDuration: 0.25 * TimeInterval(secondHold), delay: 0, options: .curveEaseInOut, animations: {
                                    if secondHold > 2 {
                                        self.breathingView.breathingLabel.text = "Hold"
                                    } else {
                                        self.breathingView.breathingLabel.text = ""
                                    }
                                    self.breathingView.breathingLabel.alpha = 1.0
                                }) { _ in
                                    
                                    UIView.animate(withDuration: 0.25 * TimeInterval(secondHold), delay: 0.5 * TimeInterval(secondHold), options: .curveEaseInOut, animations: {
                                        self.breathingView.breathingLabel.alpha = 0.0
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
    
    private func animateLogo(_ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int, _ cycles: Int) {
        let rotate = CGAffineTransform(rotationAngle: 3.0)
        let rotateAndScaleUp = rotate.scaledBy(x: 1.5, y: 1.5)

        if cycles < 1 {
            return
        }
        
        UIView.animate(withDuration: TimeInterval(inhale), delay: 0, options: .curveEaseInOut, animations: {
            self.self.breathingView.breatheLogo.transform = rotateAndScaleUp
        }) { _ in
            
            UIView.animate(withDuration: TimeInterval(exhale), delay: TimeInterval(firstHold), options: .curveEaseInOut, animations: {
                self.self.breathingView.breatheLogo.transform = .identity
            }) { _ in
                
                UIView.animate(withDuration: TimeInterval(secondHold), delay: 0, options: .curveEaseInOut, animations: {
                    self.self.breathingView.breatheLogo.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
                    self.self.breathingView.breatheLogo.transform = .identity
                    
                }) { _ in
                    
                    self.animateLogo(inhale, firstHold, exhale, secondHold, cycles-1)
                }
            }
        }
    }
}

//
//  ViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 27.1.2021.
//

import UIKit
import SnapKit

class StartScreenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var presetController: PresetController!
    var startScreenView: StartScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        startScreenView = StartScreenView(selectedPreset: presetController.selectedPreset)
        startScreenView.cyclesPicker.delegate = self
        startScreenView.cyclesPicker.dataSource = self
        startScreenView.cyclesTextField.delegate = self
        view.addSubview(startScreenView)
        
        startScreenView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        startScreenView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        
        startScreenView.pickerDoneButton.action = #selector(didTapDoneButton)
    }
    
    @objc func didTapStartButton() {
        let breathingViewController = BreathingViewController(selectedPreset: presetController.selectedPreset)
        show(breathingViewController, sender: self)
    }
    
    @objc func didTapDoneButton() {
        startScreenView.cyclesTextField.resignFirstResponder()
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        startScreenView.showPickerView(startScreenView.cyclesTextField)
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        startScreenView.cyclesTextField.text = "\(row)"
    }
}

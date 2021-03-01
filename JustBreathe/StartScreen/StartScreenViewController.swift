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
    var startScreenView: StartScreenView!
    var selectedPreset: BreathingModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        selectedPreset = presetController.selectedPreset
        startScreenView = StartScreenView(selectedPreset: selectedPreset)
        startScreenView.cyclesPicker.delegate = self
        startScreenView.cyclesPicker.dataSource = self
        startScreenView.breathCycleTextField.delegate = self
        view.addSubview(startScreenView)
        
        startScreenView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        startScreenView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        
        startScreenView.pickerDoneButton.action = #selector(didTapDoneButton)
    }
    
    @objc func didTapStartButton() {
        let selectedBreathCycleAmount = selectedPreset.breathingCycles[startScreenView.cyclesPicker.selectedRow(inComponent: 0)]
        let breathingViewController = BreathingViewController(selectedPreset: selectedPreset, breathCycles: selectedBreathCycleAmount)
        show(breathingViewController, sender: self)
    }
    
    @objc func didTapDoneButton() {
        startScreenView.breathCycleTextField.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDelegate

extension StartScreenViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(selectedPreset.breathingCycles[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        startScreenView.breathCycleTextField.text = "\(selectedPreset.breathingCycles[row])"
    }
}

// MARK: - UIPickerViewDataSource

extension StartScreenViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedPreset.breathingCycles.count
    }
}

// MARK: - UITextFieldDelegate

extension StartScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        startScreenView.showPickerView(startScreenView.breathCycleTextField)
        return true
    }
}

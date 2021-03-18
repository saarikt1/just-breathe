//
//  ViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 27.1.2021.
//

import UIKit
import SnapKit

class StartScreenViewController: UIViewController {
    private let viewModel: PresetViewModel
    private let startScreenView: StartScreenView
    private let breathingCycleOptions = [5, 10, 20, 30, 50]
    private var selectedBreathCycleIndex = 1
    
    init(_ startScreenViewModel: PresetViewModel) {
        self.viewModel = startScreenViewModel
        self.startScreenView = StartScreenView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
        layoutView()
    }
    
    func layoutView() {
        setBackground()
        view.addSubview(startScreenView)
        startScreenView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        startScreenView.presetName.text = viewModel.presetName
        startScreenView.presetIcon.image = R.image.iconCalm()
        startScreenView.inhaleCount.text = "\(viewModel.presetInhaleCount)"
        startScreenView.firstHoldCount.text = "\(viewModel.presetFirstHoldCount)"
        startScreenView.exhaleCount.text = "\(viewModel.presetExhaleCount)"
        startScreenView.secondHoldCount.text = "\(viewModel.presetSecondHoldCount)"

        startScreenView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        
        startScreenView.cyclesPicker.delegate = self
        startScreenView.cyclesPicker.dataSource = self
        startScreenView.breathCycleTextField.inputView = startScreenView.cyclesPicker
        startScreenView.breathCycleTextField.delegate = self
        startScreenView.pickerDoneButton.action = #selector(didTapDoneButton)
        
        startScreenView.breathCycleTextField.text = "\(breathingCycleOptions[selectedBreathCycleIndex])"
        updateTotalTimeLabel()
    }
    
    @objc func didTapStartButton() {
        let breathingViewController = BreathingViewController(viewModel, breathCycles: breathingCycleOptions[selectedBreathCycleIndex])
        show(breathingViewController, sender: self)
    }

    @objc func didTapDoneButton() {
        startScreenView.breathCycleTextField.resignFirstResponder()
    }

    func updateTotalTimeLabel() {
        let secondsInOneCycle = viewModel.presetInhaleCount + viewModel.presetFirstHoldCount + viewModel.presetExhaleCount + viewModel.presetSecondHoldCount
        let totalTimeInSeconds = secondsInOneCycle * breathingCycleOptions[selectedBreathCycleIndex]
        startScreenView.totalTimeLabel.text = secondsToMinutesAndSeconds(seconds: totalTimeInSeconds)
    }

    private func secondsToMinutesAndSeconds (seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        if m == 0 { return ("\(s)s") }
        if s == 0 { return ("\(m)m") }
        return ("\(m)m \(s)s")
    }
}

// MARK: - UIPickerViewDelegate

extension StartScreenViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(breathingCycleOptions[row])"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBreathCycleIndex = row
        startScreenView.breathCycleTextField.text = "\(breathingCycleOptions[selectedBreathCycleIndex])"
        updateTotalTimeLabel()
    }
}

// MARK: - UIPickerViewDataSource

extension StartScreenViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breathingCycleOptions.count
    }
}

// MARK: - UITextFieldDelegate

extension StartScreenViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        startScreenView.cyclesPicker.selectRow(selectedBreathCycleIndex, inComponent: 0, animated: false)
        return true
    }
}

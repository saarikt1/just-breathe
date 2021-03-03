//
//  StartScreenView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class StartScreenView: UIView {
    
    let startButton = UIButton(label: "Start")
    var selectedPreset: BreathingModel
    var pickerDoneButton: UIBarButtonItem
    let breathCycleTextField: PickerViewTextField
    var cyclesPicker: UIPickerView
    var totalTimeLabel: UILabel!

    init(selectedPreset: BreathingModel) {
        self.selectedPreset = selectedPreset
        self.cyclesPicker = UIPickerView()
        self.breathCycleTextField = PickerViewTextField()
        self.pickerDoneButton = UIBarButtonItem()

        super.init(frame: CGRect.zero)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        addSubview(stackView)
        stackView.snp.makeConstraints{ make in
            make.edges.equalTo(self.snp.edges)
        }
        
        let topView = createTopView()
        let middleView = createMiddleView()
        let bottomView = createBottomView()
        
        stackView.addArrangedSubview(topView)
        stackView.addArrangedSubview(middleView)
        stackView.addArrangedSubview(bottomView)
        
        middleView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(4.8)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2.7)
            make.bottom.equalTo(stackView.snp.bottom)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTopView() -> UIView {
        let topView = UIView()
        let img = R.image.iconCalm()
        let calmImg = UIImageView(image: img)
        calmImg.contentMode = .scaleAspectFit

        let title = UILabel()
        title.text = selectedPreset.name
        title.textColor = R.color.white80()
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        topView.addSubview(title)
        topView.addSubview(calmImg)

        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(topView.snp.bottom)
        }
        
        calmImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(title.snp.top).offset(-35)
        }
        
        return topView
    }
    
    func createMiddleView() -> UIView {
        let middleView = UIView()

        let tableContainer = UIStackView()
        tableContainer.axis = .vertical
        tableContainer.distribution = .equalSpacing
        middleView.addSubview(tableContainer)
        tableContainer.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(108)
            make.center.equalToSuperview()
        }
        
        let inhaleRow = createTextRow(labelText: "inhale", countLabelText: String(selectedPreset.inhale))
        tableContainer.addArrangedSubview(inhaleRow)
        inhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow = createTextRow(labelText: "hold", countLabelText: String(selectedPreset.firstHold))
        tableContainer.addArrangedSubview(holdRow)
        holdRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }

        let exhaleRow = createTextRow(labelText: "exhale", countLabelText: String(selectedPreset.exhale))
        tableContainer.addArrangedSubview(exhaleRow)
        exhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow2 = createTextRow(labelText: "hold", countLabelText: String(selectedPreset.secondHold))
        tableContainer.addArrangedSubview(holdRow2)
        holdRow2.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        return middleView
    }
    
    func createTextRow(labelText: String, countLabelText: String) -> UIStackView {
        let textRow = UIStackView()
        textRow.distribution = .equalSpacing
        
        let label = UILabel()
        label.text = labelText
        label.textColor = R.color.white60()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let countLabel = UILabel()
        countLabel.text = countLabelText
        countLabel.textAlignment = .right
        countLabel.textColor = R.color.white60()
        countLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        textRow.addArrangedSubview(label)
        textRow.addArrangedSubview(countLabel)
        
        return textRow
    }
    
    func createBottomView() -> UIView {
        let bottomView = UIView()

        let repetitionRowView = UIStackView()
        repetitionRowView.distribution = .equalSpacing
        repetitionRowView.alignment = .center
        bottomView.addSubview(repetitionRowView)
        repetitionRowView.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(35)
        }
        
        let img = R.image.iconRepeat()
        let repeatIcon = UIImageView(image: img)
        repeatIcon.contentMode = .center
        repetitionRowView.addArrangedSubview(repeatIcon)
        repeatIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(32)
        }
        
        breathCycleTextField.text = "\(selectedPreset.defaultBreathingCycle)"
        breathCycleTextField.textColor = .white
        breathCycleTextField.textAlignment = .center
        breathCycleTextField.backgroundColor = R.color.white30()
        breathCycleTextField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        breathCycleTextField.layer.cornerRadius = 8
        breathCycleTextField.layer.masksToBounds = true
        repetitionRowView.addArrangedSubview(breathCycleTextField)
        breathCycleTextField.snp.makeConstraints { (make) in
            make.width.equalTo(48)
            make.height.equalTo(35)
        }

        totalTimeLabel = UILabel()
        totalTimeLabel.text = ""
        totalTimeLabel.textColor = R.color.white60()
        totalTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        bottomView.addSubview(totalTimeLabel)
        totalTimeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(repetitionRowView.snp.bottom).offset(16)
        }
        
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        bottomView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bottomView.safeAreaLayoutGuide.snp.bottomMargin).inset(50)
        }

        return bottomView
    }
    

    func showPickerView(_ textField: UITextField) {
        cyclesPicker.backgroundColor = .white
        breathCycleTextField.inputView = cyclesPicker
        cyclesPicker.selectRow(selectedPreset.defaultBreathingCycleIndex, inComponent: 0, animated: false)

        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        pickerToolBar.tintColor = .black
        pickerToolBar.sizeToFit()
        
        pickerDoneButton.style = .done
        pickerDoneButton.title = "Done"

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        pickerToolBar.setItems([spaceButton, pickerDoneButton], animated: false)
        pickerToolBar.isUserInteractionEnabled = true
        breathCycleTextField.inputAccessoryView = pickerToolBar
    }
}

//
//  StartScreenView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class StartScreenView: UIView {
    
    var presetName: UILabel = {
        let label = UILabel()
        label.textColor = R.color.white80()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    var presetIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    var inhaleCount = BreathCountLabel()
    var firstHoldCount = BreathCountLabel()
    var exhaleCount = BreathCountLabel()
    var secondHoldCount = BreathCountLabel()
    var breathCycleTextField = PickerViewTextField()
    var totalTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.white60()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    let startButton = UIButton(label: "Start")
    var pickerDoneButton = UIBarButtonItem()
    var cyclesPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()

    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        let topView = createTopView()
        let middleView = createMiddleView()
        let bottomView = createBottomView()

        addSubview(stackView)
        stackView.addArrangedSubview(topView)
        stackView.addArrangedSubview(middleView)
        stackView.addArrangedSubview(bottomView)
        
        stackView.snp.makeConstraints{ make in
            make.edges.equalTo(self.snp.edges)
        }
        
        middleView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(4.8)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2.7)
            make.bottom.equalTo(stackView.snp.bottom)
        }
    }
    
    // MARK: - TopView
    
    private func createTopView() -> UIView {
        let topView = UIView()

        topView.addSubview(presetIcon)
        topView.addSubview(presetName)

        presetName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(topView.snp.bottom)
        }
        
        presetIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(presetName.snp.top).offset(-35)
        }
        
        return topView
    }
    
    // MARK: - MiddleView
    
    private func createMiddleView() -> UIView {
        let middleView = UIView()

        let breathCountStackView = UIStackView()
        breathCountStackView.axis = .vertical
        breathCountStackView.distribution = .equalSpacing
        
        let inhaleRow = createTextRow("inhale", inhaleCount)
        let firstHoldRow = createTextRow("hold", firstHoldCount)
        let exhaleRow = createTextRow("exhale", exhaleCount)
        let secondHoldRow = createTextRow("hold", secondHoldCount)
        
        middleView.addSubview(breathCountStackView)
        breathCountStackView.addArrangedSubview(inhaleRow)
        breathCountStackView.addArrangedSubview(firstHoldRow)
        breathCountStackView.addArrangedSubview(exhaleRow)
        breathCountStackView.addArrangedSubview(secondHoldRow)
        
        breathCountStackView.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(108)
            make.center.equalToSuperview()
        }
        
        inhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        firstHoldRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }

        exhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }

        secondHoldRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        return middleView
    }
    
    private func createTextRow(_ breathPhaseDescription: String, _ countLabel: UILabel) -> UIStackView {
        let textRow = UIStackView()
        textRow.distribution = .equalSpacing
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = breathPhaseDescription
        descriptionLabel.textColor = R.color.white60()
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)

        textRow.addArrangedSubview(descriptionLabel)
        textRow.addArrangedSubview(countLabel)
        
        return textRow
    }
    
    // MARK: - BottomView
    
    private func createBottomView() -> UIView {
        let bottomView = UIView()

        let breathCyclesRow = UIStackView()
        breathCyclesRow.distribution = .equalSpacing
        breathCyclesRow.alignment = .center
        
        let img = R.image.iconRepeat()
        let repeatIcon = UIImageView(image: img)
        repeatIcon.contentMode = .center
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        createPicker()
        
        bottomView.addSubview(breathCyclesRow)
        bottomView.addSubview(totalTimeLabel)
        bottomView.addSubview(startButton)
        breathCyclesRow.addArrangedSubview(repeatIcon)
        breathCyclesRow.addArrangedSubview(breathCycleTextField)
        
        breathCyclesRow.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(35)
        }
        
        repeatIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(32)
        }
        
        breathCycleTextField.snp.makeConstraints { (make) in
            make.width.equalTo(48)
            make.height.equalTo(35)
        }
        
        totalTimeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(breathCyclesRow.snp.bottom).offset(16)
        }
        
        startButton.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bottomView.safeAreaLayoutGuide.snp.bottomMargin).inset(50)
        }

        return bottomView
    }
    
    private func createPicker() {
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

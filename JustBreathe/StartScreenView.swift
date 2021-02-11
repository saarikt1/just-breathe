//
//  StartScreenView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class StartScreenView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    init() {
        super.init(frame: CGRect.zero)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        addSubview(stackView)
        stackView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
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
        title.text = "4-7-8"
        title.textColor = .white
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
        
        let inhaleRow = createTextRow(labelText: "inhale", countLabelText: "4")
        tableContainer.addArrangedSubview(inhaleRow)
        inhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow = createTextRow(labelText: "hold", countLabelText: "7")
        tableContainer.addArrangedSubview(holdRow)
        holdRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }

        let exhaleRow = createTextRow(labelText: "exhale", countLabelText: "8")
        tableContainer.addArrangedSubview(exhaleRow)
        exhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow2 = createTextRow(labelText: "hold", countLabelText: "8")
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
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let countLabel = UILabel()
        countLabel.text = countLabelText
        countLabel.textAlignment = .right
        countLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
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
        
        let roundCountLabel = UILabel()
        roundCountLabel.text = "10"
        roundCountLabel.textColor = .white
        roundCountLabel.textAlignment = .center
        roundCountLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        roundCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        roundCountLabel.layer.cornerRadius = 8
        roundCountLabel.layer.masksToBounds = true
        repetitionRowView.addArrangedSubview(roundCountLabel)
        roundCountLabel.snp.makeConstraints { (make) in
            make.width.equalTo(48)
            make.height.equalTo(35)
        }
        
        let roundPicker = UIPickerView()
        roundPicker.delegate = self
        roundPicker.dataSource = self
        roundPicker.backgroundColor = .white
        bottomView.addSubview(roundPicker)
        roundPicker.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(bottomView)
            make.bottom.equalTo(bottomView.snp.bottom)
        }
        roundPicker.isHidden = true

        let totalTimeLabel = UILabel()
        totalTimeLabel.text = "3m 10s"
        totalTimeLabel.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.6)
        totalTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        bottomView.addSubview(totalTimeLabel)
        totalTimeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(repetitionRowView.snp.bottom).offset(16)
        }
        
        let startButton = BasicButton(label: "Start")
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        bottomView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bottomView.safeAreaLayoutGuide.snp.bottomMargin).inset(50)
        }
        return bottomView
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "10"
    }
    
}

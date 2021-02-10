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
        
        topView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(2.4)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2.6)
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
        topView.addSubview(calmImg)
        calmImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
        }
        
        let title = UILabel()
        title.text = "4-7-8"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        topView.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(calmImg.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
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
        
        let inhaleRow = UIStackView()
        inhaleRow.distribution = .equalSpacing

        let inhaleLabel = UILabel()
        inhaleLabel.text = "inhale"
        inhaleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        inhaleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        inhaleRow.addArrangedSubview(inhaleLabel)
        
        let inhaleCountLabel = UILabel()
        inhaleCountLabel.text = "4"
        inhaleCountLabel.textAlignment = .right
        inhaleCountLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        inhaleCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        inhaleRow.addArrangedSubview(inhaleCountLabel)
        
        tableContainer.addArrangedSubview(inhaleRow)
        inhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow = UIStackView()
        holdRow.distribution = .equalSpacing

        let holdLabel = UILabel()
        holdLabel.text = "hold"
        holdLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        holdLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        holdRow.addArrangedSubview(holdLabel)
        
        let holdCountLabel = UILabel()
        holdCountLabel.text = "7"
        holdCountLabel.textAlignment = .right
        holdCountLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        holdCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        holdRow.addArrangedSubview(holdCountLabel)
        
        tableContainer.addArrangedSubview(holdRow)
        holdRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let exhaleRow = UIStackView()
        exhaleRow.distribution = .equalSpacing

        let exhaleLabel = UILabel()
        exhaleLabel.text = "exhale"
        exhaleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        exhaleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        exhaleRow.addArrangedSubview(exhaleLabel)
        
        let exhaleCountLabel = UILabel()
        exhaleCountLabel.text = "8"
        exhaleCountLabel.textAlignment = .right
        exhaleCountLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        exhaleCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        exhaleRow.addArrangedSubview(exhaleCountLabel)
        
        tableContainer.addArrangedSubview(exhaleRow)
        exhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let holdRow2 = UIStackView()
        holdRow2.distribution = .equalSpacing
        
        let holdLabel2 = UILabel()
        holdLabel2.text = "hold"
        holdLabel2.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        holdLabel2.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        holdRow2.addArrangedSubview(holdLabel2)
        
        let holdCountLabel2 = UILabel()
        holdCountLabel2.text = "8"
        holdCountLabel2.textAlignment = .right
        holdCountLabel2.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        holdCountLabel2.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        holdRow2.addArrangedSubview(holdCountLabel2)
        
        tableContainer.addArrangedSubview(holdRow2)
        holdRow2.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        return middleView
    }
    
    func createBottomView() -> UIView {
        let bottomView = UIView()

        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        bottomView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(35)
        }
        
        let img = R.image.iconRepeat()
        let repeatIcon = UIImageView(image: img)
        repeatIcon.contentMode = .center
        stackView.addArrangedSubview(repeatIcon)
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
        stackView.addArrangedSubview(roundCountLabel)
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
            make.top.equalTo(stackView.snp.bottom).offset(16)
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

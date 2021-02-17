//
//  PresetsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class PresetsView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        let presetScrollview = UIScrollView()
//        presetScrollview.backgroundColor = .systemPink
        presetScrollview.isPagingEnabled = true
        presetScrollview.clipsToBounds = false
        presetScrollview.showsHorizontalScrollIndicator = false
        presetScrollview.showsVerticalScrollIndicator = false
        addSubview(presetScrollview)
        presetScrollview.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.width.equalTo(285)
            make.center.equalToSuperview()
        }
        
        let presetStackView = UIStackView()
//        presetStackView.backgroundColor = .systemTeal
        presetStackView.axis = .horizontal
        presetStackView.distribution = .equalSpacing
        presetStackView.spacing = 32
        presetScrollview.addSubview(presetStackView)
        presetStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview()
        }
        
        let placeholderViewBeginning = UIView()
        placeholderViewBeginning.backgroundColor = .green
        
        let placeholderViewEnd = UIView()
        placeholderViewEnd.backgroundColor = .green
        
        let preset1 = UIView()
        preset1.backgroundColor = .green
        
        let preset2 = UIView()
        preset2.backgroundColor = .green
        
        let preset3 = UIView()
        preset3.backgroundColor = .green
        
        presetStackView.addArrangedSubview(placeholderViewBeginning)
        presetStackView.addArrangedSubview(preset1)
        presetStackView.addArrangedSubview(preset2)
        presetStackView.addArrangedSubview(preset3)
        presetStackView.addArrangedSubview(placeholderViewEnd)
        
        placeholderViewBeginning.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.height.equalTo(323)
        }
        
        placeholderViewEnd.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.height.equalTo(323)
        }
        
        preset1.snp.makeConstraints { (make) in
            make.width.equalTo(253)
            make.height.equalTo(323)
        }
        
        preset2.snp.makeConstraints { (make) in
            make.width.equalTo(253)
            make.height.equalTo(323)
        }
        
        preset3.snp.makeConstraints { (make) in
            make.width.equalTo(253)
            make.height.equalTo(323)
        }
        
        let title = UILabel()
        title.text = "Presets Page"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

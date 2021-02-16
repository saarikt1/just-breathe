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
        addSubview(presetScrollview)
        presetScrollview.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.width.equalTo(275)
            make.center.equalToSuperview()
        }
        
        let presetStackView = UIStackView()
//        presetStackView.backgroundColor = .systemTeal
        presetStackView.axis = .horizontal
        presetStackView.distribution = .equalSpacing
        presetStackView.spacing = 32
        presetScrollview.addSubview(presetStackView)
        presetStackView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        let preset1 = UIView()
        preset1.backgroundColor = .green
        
        let preset2 = UIView()
        preset2.backgroundColor = .green
        
        let preset3 = UIView()
        preset3.backgroundColor = .green
        
        presetStackView.addArrangedSubview(preset1)
        presetStackView.addArrangedSubview(preset2)
        presetStackView.addArrangedSubview(preset3)
        
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

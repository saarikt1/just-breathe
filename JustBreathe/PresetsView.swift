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
        
        let title = UILabel()
        title.text = "Presets Page"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        addSubview(title)
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

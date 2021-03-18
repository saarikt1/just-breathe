//
//  BreathingView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingView: UIView {
    
    var breathingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = R.color.white80()
        label.alpha = 0.0
        return label
    }()
    
    var breatheLogo: UIImageView = {
        let img = R.image.breatheLogo()
        let breatheLogo = UIImageView(image: img)
        return breatheLogo
    }()

    init() {
        super.init(frame: CGRect.zero)
        
        addSubview(breathingLabel)
        addSubview(breatheLogo)
        
        breathingLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(breatheLogo.snp.top).offset(-100)
        }
        
        breatheLogo.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

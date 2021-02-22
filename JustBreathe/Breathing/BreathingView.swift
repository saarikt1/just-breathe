//
//  BreathingView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 22.2.2021.
//

import UIKit

class BreathingView: UIView {
    
    var breatheLogo: UIImageView

    init() {
        let img = R.image.breatheLogo()
        self.breatheLogo = UIImageView(image: img)

        super.init(frame: CGRect.zero)
        
        addSubview(breatheLogo)
        breatheLogo.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

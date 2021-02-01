//
//  StartScreenView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class StartScreenview: UIView {
    init() {
        super.init(frame: CGRect.zero)
        
        let img = R.image.iconCalm()
        let calmImg = UIImageView(image: img)
        calmImg.contentMode = .scaleAspectFit
        addSubview(calmImg)
        calmImg.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let title = UILabel()
        title.text = "4-7-8"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(calmImg.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



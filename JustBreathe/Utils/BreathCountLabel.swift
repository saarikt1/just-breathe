//
//  BreathCountLabel.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 16.3.2021.
//

import UIKit

class BreathCountLabel: UILabel {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        textColor = R.color.white60()
        textAlignment = .right
        font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

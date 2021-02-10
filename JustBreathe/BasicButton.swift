//
//  BasicButton.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 9.2.2021.
//

import UIKit

class BasicButton: UIButton {
    init(label: String) {
        super.init(frame: .zero)
        setTitle(label, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

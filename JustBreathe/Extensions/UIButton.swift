//
//  BasicButton.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 9.2.2021.
//

import UIKit

extension UIButton {
    convenience init(label: String) {
        self.init(frame: .zero)
        setTitle(label, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.backgroundColor = R.color.white20()?.cgColor
    }
}

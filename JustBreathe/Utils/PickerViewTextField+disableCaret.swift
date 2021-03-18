//
//  UITextField.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 25.2.2021.
//

import UIKit

class PickerViewTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .white
        textAlignment = .center
        backgroundColor = R.color.white30()
        font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}

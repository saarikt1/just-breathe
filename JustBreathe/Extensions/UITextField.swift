//
//  UITextField.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 25.2.2021.
//

import UIKit

class PickerViewTextField: UITextField {
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}

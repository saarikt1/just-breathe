//
//  UIImage.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 11.2.2021.
//

import UIKit

extension UIImage {
    static let menuiconStartScreenSelected = R.image.menuiconStartScreenSelected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconStartScreenUnSelected = R.image.menuiconStartScreenUnselected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconPresetsSelected = R.image.menuiconPresetsSelected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconPresetsUnselected = R.image.menuiconPresetsUnselected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconLogSelected = R.image.menuiconLogSelected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconLogUnselected = R.image.menuiconLogUnselected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconSettingsSelected = R.image.menuiconSettingsSelected()?.withRenderingMode(.alwaysOriginal)
    static let menuiconSettingsUnselected = R.image.menuiconSettingsUnselected()?.withRenderingMode(.alwaysOriginal)
    static let plusSymbol = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
}

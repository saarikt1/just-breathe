//
//  PresetController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

class PresetController {
    
    var presetList = [
        BreathingModel(name: "Calm", 4, 0, 6, 0),
        BreathingModel(name: "Energize", 6, 0, 2, 0),
        BreathingModel(name: "Sleep", 4, 7, 8, 0)
    ]

    var selectedPresetIndex = 0
    var selectedPreset: BreathingModel {
        get {
            return presetList[selectedPresetIndex]
        }
    }
}

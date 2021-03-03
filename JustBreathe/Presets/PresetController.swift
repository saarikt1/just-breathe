//
//  PresetController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

class PresetController {
    var presetList = [
        BreathingModel(name: "Calm", id: 0, inhale: 4, exhale: 6),
        BreathingModel(name: "Energize", id: 1, inhale: 6, exhale: 2),
        BreathingModel(name: "Sleep", id: 2, inhale: 4, firstHold: 7, exhale: 8)
    ]

    var selectedPresetIndex = 0
    var selectedPreset: BreathingModel {
        get {
            return presetList[selectedPresetIndex]
        }
    }
}

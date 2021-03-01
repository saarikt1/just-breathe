//
//  PresetController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

struct PresetController {
    var presetList = [
        BreathingModel(name: "Calm", inhale: 4, exhale: 6),
        BreathingModel(name: "Energize", inhale: 6, exhale: 2),
        BreathingModel(name: "Sleep", inhale: 4, firstHold: 7, exhale: 8)
    ]

    var selectedPresetIndex = 0
    var selectedPreset: BreathingModel {
        get {
            presetList[selectedPresetIndex]
        }
    }
}

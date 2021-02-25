//
//  PresetController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

struct PresetController {
    var presetList = [
        BreathingModel(name: "Calm", inhale: 4, firstHold: 0, exhale: 6, secondHold: 0, selected: true),
        BreathingModel(name: "Energize", inhale: 6, firstHold: 0, exhale: 2, secondHold: 0, selected: false),
        BreathingModel(name: "Sleep", inhale: 4, firstHold: 7, exhale: 8, secondHold: 0, selected: false)
    ]

    var selectedPresetIndex = 0
    var selectedPreset: BreathingModel {
        get {
            presetList[selectedPresetIndex]
        }
    }
}

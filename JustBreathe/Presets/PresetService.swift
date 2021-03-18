//
//  PresetService.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

class PresetService {
    var presets: [Preset] = []
    var selectedPreset: Preset?

    func loadPresets() {
        seedPresets()
        selectedPreset = presets[0]
    }
}

extension PresetService {
    private func seedPresets() {
        self.presets = [
            Preset("Calm", BreathCounts(inhale: 4, firstHold: 0, exhale: 6, secondHold: 0)),
            Preset("Energize", BreathCounts(inhale: 6, firstHold: 0, exhale: 2, secondHold: 0)),
            Preset("Sleep", BreathCounts(inhale: 4, firstHold: 7, exhale: 8, secondHold: 0))
        ]
    }
}

//
//  StartScreenViewModel.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 12.3.2021.
//

import Foundation

class PresetViewModel {
    private let presetService: PresetService
    var selectedPreset: Preset?

    init(presetService: PresetService) {
        self.presetService = presetService
    }
    
    func viewDidAppear() {
        self.selectedPreset = presetService.selectedPreset
    }
    
    var presets: [Preset] {
        presetService.presets
    }
    
    var presetName: String {
        presetService.selectedPreset?.name ?? "Breathing Preset"
    }
    
    var presetInhaleCount: Int {
        presetService.selectedPreset?.breathCounts.inhale ?? 0
    }
    
    var presetFirstHoldCount: Int {
        presetService.selectedPreset?.breathCounts.firstHold ?? 0
    }
    
    var presetExhaleCount: Int {
        presetService.selectedPreset?.breathCounts.exhale ?? 0
    }
    
    var presetSecondHoldCount: Int {
        presetService.selectedPreset?.breathCounts.secondHold ?? 0
    }
    
    func updateSelectedPreset(to index: Int) {
        presetService.selectedPreset = presetService.presets[index]
    }
}

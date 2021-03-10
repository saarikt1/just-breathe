//
//  BreathingModel.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

class BreathingModel {
    let id: String
    let name: String
    var inhale, firstHold, exhale, secondHold, selectedBreathCycleAmount: Int
    let breathingCycles = [3, 5, 10, 20, 30, 50]
    let defaultBreathingCycleIndex = 2

    init(name: String, _ inhale: Int, _ firstHold: Int, _ exhale: Int, _ secondHold: Int) {
        self.name = name
        self.id = UUID().uuidString
        self.inhale = inhale
        self.firstHold = firstHold
        self.exhale = exhale
        self.secondHold = secondHold
        self.selectedBreathCycleAmount = breathingCycles[defaultBreathingCycleIndex]
    }

    var defaultBreathingCycle: Int {
        get {
            return breathingCycles[defaultBreathingCycleIndex]
        }
    }
    
    var selectedBreathCycleIndex: Int {
        get {
            for (index, element) in breathingCycles.enumerated() {
                if self.selectedBreathCycleAmount == element {
                    return index
                }
            }
            return 0
        }
    }
}

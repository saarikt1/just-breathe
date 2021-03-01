//
//  BreathingModel.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 24.2.2021.
//

import Foundation

struct BreathingModel {
    var name: String
    var id: Int
    var inhale: Int
    var firstHold = 0
    var exhale: Int
    var secondHold = 0
    var breathingCycles = [3, 5, 10, 20, 30, 50]
    var defaultBreathingCycleIndex = 2
    
    var defaultBreathingCycle: Int {
        get {
            return breathingCycles[defaultBreathingCycleIndex]
        }
    }
}

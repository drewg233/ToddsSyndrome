//
//  TSCalc.swift
//  ToddsSyndrome
//
//  Created by Andrew Garcia on 10/27/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation

class TSCalc {
    let age: Int
    let isMale: Bool
    let hasMigranes: Bool
    let hallucinogenicDrugs: Bool
    
    init(age: Int, isMale: Bool, migranes: Bool, hallucinogenicDrugs: Bool) {
        self.age = age
        self.isMale = isMale
        self.hasMigranes = migranes
        self.hallucinogenicDrugs = hallucinogenicDrugs
    }
    
    func chanceOfToddsSyndrome() -> Double {
        let totalPoints = 4.0
        var accumlatedPoints = 0.0
        
        if age >= 15 {
            accumlatedPoints += 1
        }
        
        if isMale {
            accumlatedPoints += 1
        }
        
        if hasMigranes {
            accumlatedPoints += 1
        }
        
        if hallucinogenicDrugs {
            accumlatedPoints += 1
        }
        
        let percentage = ((accumlatedPoints/totalPoints) * 100)
        
        return percentage
    }
    
    func getResultText() -> String? {
        switch chanceOfToddsSyndrome() {
        case 0..<24:
            return "I think you will be fine!"
        case 25..<49:
            return "Small chance that you have it, if you are experiencing symptoms visit a doctor."
        case 50.0:
            return "I literally do not know. Flip a coin! You may or may not have TS."
        case 51..<74:
            return "Pretty good chance you have TS. Im sorry :("
        case 75..<99:
            return "You most likely have it. Should probably check yourself out."
        case 100.0:
            return "Maybe lay low for a while and stop taking those hallucinogenic drugs."
        default:
            return nil
        }
    }
}

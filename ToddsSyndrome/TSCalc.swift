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
        
        if age <= 15 {
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
        case 0.0:
            return "You have no chance of having TS! 😃"
        case 1..<24:
            return "I think you will be fine!"
        case 25..<49:
            return "Small chance that you have it, if you are experiencing symptoms visit a doctor."
        case 50.0:
            return "I literally do not know. Flip a coin! You may or may not have TS. 🤔"
        case 51..<74:
            return "Pretty good chance you have TS. Im sorry 😞"
        case 75..<99:
            return "You most likely have it. Should probably check yourself out."
        case 100.0:
            return "Maybe lay low for a while and stop taking those hallucinogenic drugs. 😲"
        default:
            return nil
        }
    }
    
    func getShareResultText() -> String? {
        let chance = chanceOfToddsSyndrome()
        switch chance {
        case 0.0:
            return "Hey guess what! I have a \(chance) Todd's Syndrome... 😃"
        case 1..<49:
            return "So I have a \(chance) Todd's Syndrome. Pretty Low!"
        case 50.0:
            return "I have a 50/50 chance of having Todd's Syndrome. Do you know your odds?"
        case 51..<99:
            return "Pretty good chance that I have TS. 😞"
        case 100.0:
            return "Hey. I have TS. Todd's Syndrome. May need you to take me to the doctor!"
        default:
            return nil
        }
    }
}

//
//  TSCalc.swift
//  ToddsSyndrome
//
//  Created by Andrew Garcia on 10/27/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation

class TSCalc {
    func chanceOfToddsSyndrome(age: Int, isMale: Bool, migranes: Bool, hallucinogenicDrugs: Bool) -> Double {
        let totalPoints = 4.0
        var accumlatedPoints = 0.0
        
        if age >= 15 {
            accumlatedPoints += 1
        }
        
        if isMale {
            accumlatedPoints += 1
        }
        
        if migranes {
            accumlatedPoints += 1
        }
        
        if hallucinogenicDrugs {
            accumlatedPoints += 1
        }
        
        return ((accumlatedPoints/totalPoints) * 100)
    }
}

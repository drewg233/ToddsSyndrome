//
//  ToddsSyndromeTests.swift
//  ToddsSyndromeTests
//
//  Created by Andrew Garcia on 10/27/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import XCTest
@testable import ToddsSyndrome

class ToddsSyndromeTests: XCTestCase {
    
    let tSCalc = TSCalc()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testChanceOfToddsSyndrome1() {
        let age = 25
        let isMale = true
        let migranes = true
        let hallucinogenicDrugs = true
        
        let expected = 100.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person matches all criteria to have Todds's Syndrom and should return 100.")
    }
    
    func testChanceOfToddsSyndrome2() {
        let age = 13
        let isMale = true
        let migranes = true
        let hallucinogenicDrugs = true
        
        let expected = 75.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person is under 15 but matches the rest of the criteria and should return 75.")
    }
    
    func testChanceOfToddsSyndrome3() {
        let age = 17
        let isMale = false
        let migranes = true
        let hallucinogenicDrugs = true
        
        let expected = 75.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person is over 15, female, has migranes, and takes hallucinogenic drugs. Should return 75.")
    }
    
    func testChanceOfToddsSyndrome4() {
        let age = 17
        let isMale = false
        let migranes = false
        let hallucinogenicDrugs = true
        
        let expected = 50.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person is over 15, female, doesnt have migranes, and takes hallucinogenic drugs. Should return 50.")
    }
    
    func testChanceOfToddsSyndrome5() {
        let age = 17
        let isMale = false
        let migranes = false
        let hallucinogenicDrugs = false
        
        let expected = 25.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person is over 15, female, doesnt have migranes, and doesnt take hallucinogenic drugs. Should return 25.")
    }
    
    func testChanceOfToddsSyndrome6() {
        let age = 13
        let isMale = false
        let migranes = false
        let hallucinogenicDrugs = false
        
        let expected = 0.0
        let results = tSCalc.chanceOfToddsSyndrome(age: age, isMale: isMale, migranes: migranes, hallucinogenicDrugs: hallucinogenicDrugs)
        
        XCTAssertEqual(expected, results, "This person is under 15, female, doesnt have migranes, and doesnt take hallucinogenic drugs. Should return 0.")
    }
}

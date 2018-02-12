//
//  GALocationServiceTest.swift
//  GeographicalAppTests
//
//  Created by Shimaa Magdi on 2/12/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//


import XCTest

@testable import GeographicalApp

class GALocationServiceTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetLocationsData() {
        let expectations: XCTestExpectation = expectation(description: "Testing repository ServiceTests API")
        
        let service: GALocationService = GALocationService()
        service.getLocationsData(success: {
            (response) in
            if let list = response {
                XCTAssertNotNil(list)
                XCTAssertNotNil(list.first?.name)
                expectations.fulfill()
            }
        }) { (error) in
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 120) { error in
            if let error = error {
                XCTFail("waitForExpectationsTimeout error: \(error)")
            }
        }
        
    }
    
    func testPerformanceExample() {
        self.measure {[weak self] in
            self?.testGetLocationsData()
        }
    }
    
    
    
}


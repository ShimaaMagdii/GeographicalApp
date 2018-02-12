//
//  GAMappingManagerTest.swift
//  GeographicalAppTests
//
//  Created by Shimaa Magdi on 2/12/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import GeographicalApp

class GAMappingManagerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMapVehicleListToVehicleViewModel() {
        if let json = readJsonData(fileName: "DMLocations") {
            let locationsData: GALocationsDataListModel? = Mapper<GALocationsDataListModel>().map(JSON: json)
            XCTAssertNotNil(locationsData)
            XCTAssertEqual(locationsData?.locationsList?.count, 10)
            let locationsList: [GALocationViewModel]? = GAMappingManager.mapLocationsDataToLocationViewModel(locationsData: locationsData)
            
            let firstModel = locationsList?.first
            let lastModel = locationsList?.last
            
            XCTAssertNotNil(locationsList)
            XCTAssertEqual(locationsList?.count, 10)
            
            XCTAssertEqual(firstModel?.name, "Dubai Municipality Main buidling")
            XCTAssertEqual(lastModel!.name, "Al Manara Center Dubai Municipality")
            
        }
        
    }
    
    private func readJsonData(fileName: String) -> [String : Any]? {
        var jsonResult: [String : Any]?
        do {
            let bundle = Bundle(for: type(of: self))
            if let file = bundle.url(forResource:fileName , withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    jsonResult = object
                } else if let object = json as? [Any] {
                    jsonResult = ["list" : object]
                } else {
                    print("invalidJson".localized)
                }
            } else {
                print("noFile".localized)
            }
        } catch {
            print(error.localizedDescription)
        }
        return jsonResult
    }
}


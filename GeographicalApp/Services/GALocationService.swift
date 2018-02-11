//
//  GALocationService.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//


import Foundation
import ObjectMapper

typealias ErrorClosure      = (Any) -> Void
typealias ViewModelClosure  = ([GALocationViewModel]?) -> Void

class GALocationService  {
    let fileName = "DMLocations"
    /**
     Get getLocationsData data from API/ json file.
     - Parameter success: response success block with ViewModelClosure.
     - Parameter failure: response failure block with Error or string msg
     */
    
    func getLocationsData(success :@escaping ViewModelClosure, failure: @escaping ErrorClosure) {
        getDMLocationsDataFromFile(success: success, failure: failure)
    }
    
    private func getDMLocationsDataFromFile(success :@escaping ViewModelClosure, failure: @escaping ErrorClosure) {
        if let json = readJsonData(fileName: fileName) {
            
            let locationsData: GALocationsDataListModel? = Mapper<GALocationsDataListModel>().map(JSON: json)
            let locationsList: [GALocationViewModel]? = GAMappingManager.mapLocationsDataToLocationViewModel(locationsData: locationsData)
            success(locationsList)
        }else{
            failure("invalidJson".localized)
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


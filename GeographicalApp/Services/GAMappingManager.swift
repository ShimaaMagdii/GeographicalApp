//
//  GAMappingManager.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//


import Foundation
import CoreLocation

class GAMappingManager {
    /**
     Map Locations Data To Location ViewModel
     - Parameter [GALocationDataModel]: locationsData to be mapped.
     - Returns : mapped GALocationViewModel array.
     .
     */
    class func mapLocationsDataToLocationViewModel(locationsData: GALocationsDataListModel?) -> [GALocationViewModel] {
        
        var locationsList = [GALocationViewModel]()
        if let locations = locationsData?.locationsList {
            for locationObj in locations {
                var locationCoordinate: CLLocation?
                if let long = locationObj.longitude, let lat = locationObj.latitude {
                    locationCoordinate = CLLocation(latitude: Double(lat)!, longitude:Double(long)!)
                }
                let address = (locationObj.city ?? "") + ", " + (locationObj.country ?? "")
                let locationViewModel = GALocationViewModel(name: locationObj.name ?? "", phone: locationObj.phone, email: locationObj.email, type: locationObj.type, address: address, location: locationCoordinate, url: locationObj.url)
                locationsList.append(locationViewModel)
            }
        }
        
        return locationsList
        
    }
    
    
    
    
}

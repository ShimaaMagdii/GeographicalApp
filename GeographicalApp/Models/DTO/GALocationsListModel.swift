//
//  GALocationsListModel.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//
import Foundation
import ObjectMapper

// DTO Class to parse content of locations json into.
class GALocationDataModel :GABaseMappable {
    private(set) var city : String?
    private(set) var country : String?
    private(set) var email : String?
    private(set) var latitude : String?
    private(set) var locationID : String?
    private(set) var longitude : String?
    private(set) var name : String?
    private(set) var phone : String?
    private(set) var type : String?
    private(set) var url : String?
    
    override func mapping(map: Map) {
        city       <- map[MappingKey.city]
        country    <- map[MappingKey.country]
        email      <- map[MappingKey.email]
        latitude   <- map[MappingKey.latitude]
        locationID <- map[MappingKey.locationID]
        longitude  <- map[MappingKey.longitude]
        name       <- map[MappingKey.name]
        phone      <- map[MappingKey.phone]
        type       <- map[MappingKey.type]
        url        <- map[MappingKey.url]
    }
}


fileprivate struct MappingKey {
    static let city             : String = "city"
    static let country          : String = "country"
    static let email            : String = "email"
    static let latitude         : String = "latitude"
    static let locationID       : String = "locationID"
    static let longitude        : String = "longitude"
    static let name             : String = "name"
    static let phone            : String = "phone"
    static let type             : String = "type"
    static let url              : String = "url"
    
}


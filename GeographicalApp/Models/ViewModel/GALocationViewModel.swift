//
//  GALocationViewModel.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//


import MapKit
import CoreLocation



// View Model Class to be used on UI
class GALocationViewModel: GABaseViewModel, NSCoding, MKAnnotation {
    
    // MARK: - Properties
    var name       :String!
    var phone      :String?
    var email      :String?
    var type       :String?
    var address    :String?
    var url        :String?
    var coordinate :CLLocationCoordinate2D
    
    // MARK: - Init
    required public init(name: String!, phone: String?, email: String?, type: String?, address: String?, coordinate: CLLocationCoordinate2D, url: String?) {
        
        self.name         = name
        self.phone        = phone
        self.email        = email
        self.type         = type
        self.address      = address
        self.coordinate   = coordinate
        self.url          = url
    }
    
    // MARK: NSCoding
    required init?(coder decoder: NSCoder) {
        let latitude = decoder.decodeDouble(forKey: GeoKey.latitude)
        let longitude = decoder.decodeDouble(forKey: GeoKey.longitude)
        coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        name = decoder.decodeObject(forKey: GeoKey.name) as? String
        phone = decoder.decodeObject(forKey: GeoKey.phone) as? String
        email = decoder.decodeObject(forKey: GeoKey.email) as? String
        type = decoder.decodeObject(forKey: GeoKey.type) as? String
        address = decoder.decodeObject(forKey: GeoKey.address) as? String
        url = decoder.decodeObject(forKey: GeoKey.url) as? String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(coordinate.latitude, forKey: GeoKey.latitude)
        coder.encode(coordinate.longitude, forKey: GeoKey.longitude)
        coder.encode(name, forKey: GeoKey.name)
        coder.encode(phone, forKey: GeoKey.phone)
        coder.encode(email, forKey: GeoKey.email)
        coder.encode(type, forKey: GeoKey.type)
        coder.encode(address, forKey: GeoKey.address)
        coder.encode(url, forKey: GeoKey.url)
    }
    
    struct GeoKey {
        static let latitude  = "latitude"
        static let longitude = "longitude"
        static let name      = "name"
        static let phone     = "phone"
        static let email     = "email"
        static let address   = "address"
        static let type      = "type"
        static let url       = "url"
    }
}




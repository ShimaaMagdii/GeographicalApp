//
//  GALocationViewModel.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import CoreLocation

// View Model Class to be used on UI
class GALocationViewModel: GABaseViewModel {
    
    // MARK: - Properties
    var name       :String!
    var phone      :String?
    var email      :String?
    var type       :String?
    var city       :String?
    var country    :String?
    var location   :CLLocation?
    var url        :String?
   
    // MARK: - Init
    required public init(name: String!, phone: String?, email: String?, type: String?, city: String?, country: String?, location: CLLocation?, url: String?) {
        
        self.name       = name
        self.phone      = phone
        self.email      = email
        self.type       = type
        self.city       = city
        self.country    = country
        self.location   = location
        self.url        = url
    }
    
}




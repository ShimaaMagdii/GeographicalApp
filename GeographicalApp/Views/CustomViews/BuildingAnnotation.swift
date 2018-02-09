//
//  BuildingAnnotation.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import MapKit

class BuildingAnnotation: NSObject, MKAnnotation {
    private var modelObject: GALocationViewModel!

    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var address: String!
    var image: UIImage = #imageLiteral(resourceName: "buildingIcon")
    
    init(modelObject: GALocationViewModel) {
        coordinate = (modelObject.location?.coordinate)!
        name       = modelObject.name
        address    = modelObject.country
        phone      = modelObject.phone
    }
}

//
//  GALocationDetailsCell.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import MapKit
/**
 *  GALocationDetailsCell table view cell displays the locatioon details.
 */
class GALocationDetailsCell : UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var statusLineView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var headingTitleLabel: UILabel!
    @IBOutlet weak var headingValueLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    /**
     Customize Cell With Model displays details for each location data model.
     - Parameter locationDataModel: GALocationViewModel contains DMlocation details.
     */
    func customizeCellWithModel(_ locationDataModel: GALocationViewModel) {
        if let location = locationDataModel.location {
            addReginWithAnnotation(location:location)
        }
        
    }
    
    /**
     Adding annotation displays DM location on cell map.
     - Parameter location: CLLocation for the DM location.
     */
    func addReginWithAnnotation(location: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 100, 100)
        mapView.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location.coordinate
        self.mapView.addAnnotation(point)
    }
    
    
}



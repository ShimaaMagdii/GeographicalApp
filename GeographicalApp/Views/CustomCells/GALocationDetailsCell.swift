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
    private var modelObject: GALocationViewModel!
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func phonePressed(_ sender: UIButton) {
        Utils.makeAPhoneCall(phoneNumber: modelObject.phone)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.dropCardShadow()
    }
    
    /**
     Customize Cell With Model displays details for each location data model.
     - Parameter locationDataModel: GALocationViewModel contains DMlocation details.
     */
    func customizeCellWithModel(_ locationDataModel: GALocationViewModel) {
        modelObject = locationDataModel
        nameLabel.text = locationDataModel.name
        addressLabel.text = locationDataModel.address
        phoneLabel.text = locationDataModel.phone
        addReginWithAnnotation(location: locationDataModel.coordinate)
    }
    
    /**
     Adding annotation displays DM location on cell map.
     - Parameter location: CLLocation for the DM location.
     */
    func addReginWithAnnotation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(location, 100, 100)
        mapView.setRegion(region, animated: true)
        let point = MKPointAnnotation()
        point.coordinate = location
        self.mapView.addAnnotation(point)
    }
    
}



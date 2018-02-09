//
//  GAMapViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import MapKit

/**
 *  GA Locations List ViewControllercontroller contains locations details showen on list
 */
class GAMapViewController: GALocationsDataBaseViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    // MARK: - Init
    
    /**
     Initialize an instance of Map ViewController
     - returns: GAMapViewController Object
     */
    public static func create() -> GAMapViewController {
        
        return UIStoryboard(name: StoryboardIdentifier.mainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.mapVCIdentifier) as! GAMapViewController
    }
    
}
extension GAMapViewController: MKMapViewDelegate{
    // MARK: Confirm Mapkit delegate methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        /*
         
         MKAnnotationView *pinView = nil;
         if(annotation != mapView.userLocation)
         {
         pinView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:VEHICLE_PIN_IDEN];
         if (pinView == nil)
         pinView = [[MKAnnotationView alloc]
         initWithAnnotation:annotation reuseIdentifier:VEHICLE_PIN_IDEN];
         
         pinView.canShowCallout = YES;
         pinView.image = [UIImage imageNamed:CAR_ICON];
         
         }
         else {
         [mapView.userLocation setTitle:USER_LOCATION_TITLE];
         }
         return pinView;
         */
        return nil
    }
    
    // MARK: Setup map
    func addingAnnotation() {
        /*
         for (MTVehicleViewModel* model in self.vehicleList ){
         [self addAnnotationForModel: model];
         }
         */
    }
    
    func addAnnotationForModel(_ locationDataModel: GALocationViewModel){
        //        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        //        point.coordinate = model.location.coordinate;
        //        point.title = @"Taxi";
        //        point.subtitle = model.heading;
        //
        //        [self.mapView addAnnotation:point];
    }
}



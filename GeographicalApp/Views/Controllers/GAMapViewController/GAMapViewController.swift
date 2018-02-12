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
class GAMapViewController: GALocationsDataBaseViewController, MKMapViewDelegate {
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    let annotationNibName = "CustomCalloutView"
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.276987, longitude: 55.296249), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
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
    
    
    override func refreshData(){
        
        for loc in locationsList
        {
            self.mapView.addAnnotation(loc)
        }
    }
}

typealias MapViewDelegate = GAMapViewController
extension MapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: StoryboardIdentifier.mapPin)
        if annotationView == nil{
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: StoryboardIdentifier.mapPin)
            annotationView?.canShowCallout = false
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = #imageLiteral(resourceName: "buildingIcon")
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        let buildingAnnotation = view.annotation as! GALocationViewModel
        let views = Bundle.main.loadNibNamed(annotationNibName, owner: nil, options: nil)
        let calloutView = views?[0] as! CustomCalloutView
        calloutView.config(buildingAnnotation)
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
}

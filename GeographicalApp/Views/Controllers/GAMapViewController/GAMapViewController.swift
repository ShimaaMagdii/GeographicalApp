//
//  GAMapViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
/**
 *  GA Locations List ViewControllercontroller contains locations details showen on list
 */
class GAMapViewController: GALocationsDataBaseViewController {
    // MARK: - IBOutlets
    //@IBOutlet private weak var mapView: 
    
    
    
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




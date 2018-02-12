//
//  GALocationsListViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
/**
 *  GA Locations List ViewControllercontroller contains locations details showen on list
 */
class GALocationsListViewController: GALocationsDataBaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var locationsTableView: UITableView!
    let estimatedRowHeight = 200.0
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    // MARK: - Init
    
    /**
     Initialize an instance of GALocations List ViewController
     - returns: GALocationsListViewController Object
     */
    public static func create() -> GALocationsListViewController {
        return UIStoryboard(name: StoryboardIdentifier.mainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.locationsListVCIdentifier)as! GALocationsListViewController
    }
    
    override func refreshData() {
        locationsTableView.reloadData()
    }
    
}




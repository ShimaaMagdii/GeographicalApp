//
//  GALocationsDataBaseViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import CoreLocation

/**
 *  GA Locations Data Base ViewController which contains common function for all locations data list/map.
 */
protocol GALocationsViewProtocol: class {
    func startLoading()
    func endLoading()
    func setLocationsList(locationsList newLocationsList: [GALocationViewModel])
    func showErrorMgs(_ msg: String)
}

class GALocationsDataBaseViewController: GABaseController {
    
    // MARK: - Properties
    var locationsPresenter : GALocationsPresenter!
    var locationManager = CLLocationManager()
    var locationsList = [GALocationViewModel]() {
        didSet{
            refreshData()
        }
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationsPresenter.attachView(view: self)
        locationsPresenter.getLocationsData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationsPresenter.detachView()
    }
    
    func region(withGeotification geotification: GALocationViewModel) -> CLCircularRegion {
        let radius = 100
        let region = CLCircularRegion(center: geotification.coordinate, radius: CLLocationDistance(radius) , identifier: geotification.name)
        region.notifyOnEntry = true
        return region
    }
    
    func startMonitoring(geotification: GALocationViewModel) {
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            showAlert(withTitle:"Error".localized, message: "DoseNotSupportGeofencing".localized)
            return
        }
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            showAlert(withTitle:"Warning".localized, message: "WarningForLocationPermission".localized)
        }
        let region = self.region(withGeotification: geotification)
        locationManager.startMonitoring(for: region)
    }
    
    func stopMonitoring(geotification: GALocationViewModel) {
        for region in locationManager.monitoredRegions {
            guard let circularRegion = region as? CLCircularRegion, circularRegion.identifier == geotification.name else { continue }
            locationManager.stopMonitoring(for: circularRegion)
        }
    }
    
    func refreshData() {
        saveAllGeotifications()
    }
    
    // MARK: Loading and saving functions
    func saveAllGeotifications() {
        var items: [Data] = []
        for geotification in locationsList {
            let item = NSKeyedArchiver.archivedData(withRootObject: geotification)
            items.append(item)
            startMonitoring(geotification: geotification)
        }
        UserDefaults.standard.set(items, forKey: UserDefaultsKeys.savedItems)
    }
}

extension GALocationsDataBaseViewController :GALocationsViewProtocol {
    
    func showErrorMgs(_ msg: String) {
        showMessage(message: msg)
    }
    
    func startLoading() {
        showProgressBar()
    }
    
    func endLoading() {
        hideProgressBar()
    }
    
    func setLocationsList(locationsList newLocationsList: [GALocationViewModel]) {
        self.locationsList = newLocationsList
    }
    
}

// MARK: - Location Manager Delegate
extension GALocationsDataBaseViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Monitoring failed for region with identifier: \(region!.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager failed with the following error: \(error)")
    }
    
}


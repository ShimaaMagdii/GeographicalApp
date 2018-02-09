//
//  GALocationsDataBaseViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
/**
 *  GA Locations Data Base ViewController which contains common function for all locations data list/map.
 */
protocol GALocationsViewProtocol: class {
    func startLoading()
    func endLoading()
    func setLocationsList(locationsList newLocationsList: [GALocationViewModel])
    func showErrorMgs(_ msg: String)
}

class GALocationsDataBaseViewController: GABaseController, GALocationsViewProtocol {

    // MARK: - Properties
    var locationsPresenter : GALocationsPresenter!
    var locationsList = [GALocationViewModel]() {
        didSet{
            refreshData()
        }
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func refreshData() {
        
    }
    
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




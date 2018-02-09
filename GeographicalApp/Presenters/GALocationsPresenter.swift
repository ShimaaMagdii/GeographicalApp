//
//  GALocationsPresenter.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
/**
 *  GALocationsPresenter class which responsable for getting models data and display it to the view.
 */
class GALocationsPresenter {
    
    // MARK: - Properties
    private let dataService = GALocationService()
    weak private var delegate : GALocationsViewProtocol!
    
    /**
     Attach current displayed view controller which confirm GALocationsViewProtocol.
     */
    func attachView(view: GALocationsViewProtocol){
        delegate = view
        loadViewData()
    }
    
    func isViewAttached() -> Bool {
        return delegate != nil
    }
    
    func loadViewData() {
       getLocationsData ()
    }
    
    
    /**
     DetachView view controller when became disappeared.
     */
    func detachView() {
        delegate = nil
    }
    
    /**
     Get location data from the service and call VC delegte to update its views
     */
    func getLocationsData(){
        self.delegate.startLoading()
        self.dataService.getLocationsData(success: {
            [weak self]  modelList in
            guard let strongSelf = self  else { return }
            strongSelf.delegate.endLoading()
            strongSelf.delegate.setLocationsList(locationsList: modelList!)
        }) { [weak self]  errorMsg in
            guard let strongSelf = self  else { return }
            strongSelf.delegate.endLoading()
            strongSelf.delegate.showErrorMgs(errorMsg as! String)
        }
    }
    
}





//
//  GALocationsListViewController+UITableView.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

// MARK: Extension for GALocations List ViewController table view delegate and datasource
extension GALocationsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return locationsList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GALocationDetailsCell!  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.locDetailCellIdentifier) as! GALocationDetailsCell
        cell.customizeCellWithModel(locationsList[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewConstants.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC: GADetailsViewController = GADetailsViewController.create()
        detailsVC.modelObject = locationsList[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

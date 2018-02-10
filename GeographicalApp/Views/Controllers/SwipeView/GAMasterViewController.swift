//
//  GAMasterViewController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
/**
 *  GAMasterViewController contains the segmentedControl which responsable for the showing view list or map.
 */
final class GAMasterViewController: GABaseController {
    
    // MARK: - IBOutlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Properties
    private let locationsPresenter = GALocationsPresenter()
    private lazy var listViewController: GALocationsListViewController = GALocationsListViewController.create()
    private lazy var mapViewController: GAMapViewController = GAMapViewController.create()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - View Methods
    private func setupView() {
        listViewController.locationsPresenter = self.locationsPresenter
        mapViewController.locationsPresenter = self.locationsPresenter
        updateView()
    }
    
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: mapViewController)
            add(asChildViewController: listViewController)
        } else {
            remove(asChildViewController: listViewController)
            add(asChildViewController: mapViewController)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    // MARK: - Helper Methods
    private func add(asChildViewController viewController: UIViewController) {
        addChildViewController(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
        viewController.reloadViewFromNib()
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
}

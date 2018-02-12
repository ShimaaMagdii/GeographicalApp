//
//  GALocationsListViewControllerTest.swift
//  GeographicalAppTests
//
//  Created by Shimaa Magdi on 2/12/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import XCTest

@testable import GeographicalApp

class GALocationsListViewControllerTest: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var locationsListVCTests : GALocationsListViewController!
    
    override func setUp() {
        super.setUp()
        locationsListVCTests = GALocationsListViewController.create()
        
        //load view hierarchy
        if(locationsListVCTests != nil) {
            locationsListVCTests.viewDidLoad()
        }
    }
    
    override func tearDown() {
        locationsListVCTests = nil
        super.tearDown()
    }
    
    func testControllerConformsToTableViewDelegate() {
        XCTAssert(locationsListVCTests.conforms(to: UITableViewDelegate.self), "locationsListVCTests under test does not conform to UITableViewDelegate protocol")
        XCTAssert(locationsListVCTests.conforms(to: UITableViewDataSource.self), "locationsListVCTests under test does not conform to UITableViewDataSource protocol")
    }
    
    func testControllerImplementsTableViewDelegateMethods() {
        
        XCTAssert(locationsListVCTests.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))),"ViewController under test does not implement tableView:numberOfRowsInSection")
        
        XCTAssert(locationsListVCTests.responds(to: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))),"ViewController under test does not implement tableView:didSelectRowAt")
    }
    
}


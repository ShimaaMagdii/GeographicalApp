//
//  GABaseViewControllerTests.swift
//  GeographicalAppTests
//
//  Created by Shimaa Magdi on 2/12/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import XCTest
@testable import GeographicalApp

class GABaseViewControllerTests: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var viewControllerUnderTest : GABaseController!
    
    override func setUp() {
        super.setUp()
        
        viewControllerUnderTest = GABaseController()
        //load view hierarchy
        if(viewControllerUnderTest != nil) {
            
            viewControllerUnderTest.loadView()
            viewControllerUnderTest.viewDidLoad()
        }
    }
    
    func testViewControllerShowBB() {
        
        XCTAssertNotNil(viewControllerUnderTest.showProgressBar(), "ViewController under test is not composed of a showProgressBar")
    }
    func testViewControllerHideBB() {
        
        XCTAssertNotNil(viewControllerUnderTest.hideProgressBar(), "ViewController under test is not composed of a showProgressBar")
    }
    
}


//
//  GeographicalAppUITests.swift
//  GeographicalAppUITests
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import XCTest

import XCTest

class GeographicalAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }
    
    func testViewSwitch() {
        //given
        let listButton = app.segmentedControls.buttons["List".localized]
        let mapButton = app.segmentedControls.buttons["Map".localized]
        let tableView = app.tables.element
        
        // then
        if listButton.isSelected {
            XCTAssertTrue(tableView.exists)
            
            mapButton.tap()
            XCTAssertFalse(tableView.exists)
        } else if mapButton.isSelected {
            XCTAssertFalse(tableView.exists)
            
            listButton.tap()
            XCTAssertTrue(tableView.exists)
        }
    }
    
    func testTableViewShowedCorrectly() {
        let listButton = app.segmentedControls.buttons["List".localized]
        let mapButton = app.segmentedControls.buttons["Map".localized]
        let tableView = app.tables.element
        
        if listButton.isSelected {
            XCTAssertTrue(tableView.exists)
            
            mapButton.tap()
            XCTAssertFalse(tableView.exists)
            
            listButton.tap()
            XCTAssertTrue(tableView.exists)
            
        } else if mapButton.isSelected {
            XCTAssertFalse(tableView.exists)
            
            listButton.tap()
            XCTAssertTrue(tableView.exists)
        }
    }
    
    
    func testUITableView() {
        let table = app.tables.element(boundBy: 0)
        let lastCell = table.cells.element(boundBy: 9)
        table.scrollToElement(element: lastCell)
        XCTAssertFalse(table.cells.count == 0)
    }
    
    func testShowPopUpForTableCell() {
        //given
        let listButton = app.segmentedControls.buttons["List".localized]
        let mapButton = app.segmentedControls.buttons["Map".localized]
        let tableView = app.tables.element
        
        // then
        if listButton.isSelected {
            XCTAssertTrue(tableView.exists)
        } else if mapButton.isSelected {
            listButton.tap()
            XCTAssertTrue(tableView.exists)
        }
        
        let cell = tableView.cells.element(boundBy: 2)
        XCTAssertTrue(cell.exists)
        let indexedText = cell.staticTexts.element
        XCTAssertTrue(indexedText.exists)
        cell.tap()
    }
    
}

extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        for _ in 0..<10 {
            swipeUp()
        }
    }
}




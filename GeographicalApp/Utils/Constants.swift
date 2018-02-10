//
//  Constants.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import UIKit


struct UITableViewConstants {
    static let estimatedRowHeight           :CGFloat = 200.0
}

struct UITableViewCellIdentifier {
    static let locDetailCellIdentifier     :String  = "GALocationDetailsCell"
}

struct StoryboardIdentifier {
    static let mainStoryboardIdentifier     :String = "Main"
    static let locationsListVCIdentifier    :String = "GALocationsListViewController"
    static let mapVCIdentifier              :String = "GAMapViewController"
    static let detailsVCIdentifier          :String = "GADetailsViewController"
    
}
extension UIColor {
    static func selectedColor() -> UIColor {
        return UIColor(red: 101, green: 84, blue: 118, alpha: 1)
    }
    
}


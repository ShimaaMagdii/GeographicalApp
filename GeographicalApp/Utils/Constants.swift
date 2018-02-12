//
//  Constants.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import UIKit


struct StoryboardIdentifier {
    static let mainStoryboardIdentifier     :String = "Main"
    static let locationsListVCIdentifier    :String = "GALocationsListViewController"
    static let mapVCIdentifier              :String = "GAMapViewController"
    static let detailsVCIdentifier          :String = "GADetailsViewController"
    static let locDetailCellIdentifier      :String  = "GALocationDetailsCell"
    static let mapPin                       :String  = "Pin"
    
}

struct UserDefaultsKeys {
    static let currentLang = "currentLang"
    static let appleLanguages = "AppleLanguages"
    static let savedItems = "savedItems"
    
}

enum SupportedLanguages: String {
    case English = "en", Arabic = "ar"
}



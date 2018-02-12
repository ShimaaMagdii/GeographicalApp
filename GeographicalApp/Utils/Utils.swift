//
//  Utils.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

class Utils {
  
    static func makeAPhoneCall(phoneNumber: String?)  {
        guard let phoneNum = phoneNumber, let number = URL(string: "tel://" + phoneNum) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        }
    }
    
    
    
}

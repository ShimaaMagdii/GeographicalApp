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
        UIApplication.shared.open(number)
        //        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        //        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
//          guard let phone = phoneNumber, let number = URL(string: "telprompt://" + phoneNum) else { return }
//        if let url = URL(string: "telprompt://\(phone)"), UIApplication.shared.canOpenURL(url)
//        {
//            UIApplication.shared.openURL(url)
//        }
    }
    
    
    
}

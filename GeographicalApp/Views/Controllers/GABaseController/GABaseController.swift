//
//  GABaseController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import MBProgressHUD
/**
 *  Base View Controller which contains common function for all viewControllers on the app.
 */
class GABaseController: UIViewController {
    
    // MARK: - Util
    /**
     Util method just displays MBProgressHUD progress bar.
     */
    func showProgressBar (){
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    /**
     Util method just hide MBProgressHUD progress bar.
     */
    func hideProgressBar (){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    /**
     Util method just displays the error msg on alert popUp.
     - Parameter: NSError for error
     */
    func handleError(error: Error) {
        showMessage(message: error.localizedDescription)
    }
    
    
    /**
     Display alert with Message
     - Parameter: NSString for Message
     */
    func showMessage(message: String) {
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

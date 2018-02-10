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
    override func viewDidLoad() {
        super.viewDidLoad()
       // setRightNavButton()
    }
    
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
    
    func setRightNavButton () {
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 50, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            let secondFrame = CGRect(x: 100, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)

            
            let switchControl = UISwitch(frame: firstFrame)
            switchControl.isOn = true
            switchControl.onTintColor = UIColor.brown
            switchControl.setOn(true, animated: false)
            switchControl.addTarget(self, action: #selector(switchValueDidChange(sender:)), for: .valueChanged)
            
            let secondLabel = UILabel(frame: secondFrame)
            secondLabel.text = "Arabic"
            
            navigationBar.addSubview(switchControl)
            navigationBar.addSubview(secondLabel)
        
        
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: switchControl)
        
    }
    }
    
    @objc func switchValueDidChange(sender:UISwitch!)
    {
        if sender.isOn {
            print("on")
        } else{
            print("off")
        }
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

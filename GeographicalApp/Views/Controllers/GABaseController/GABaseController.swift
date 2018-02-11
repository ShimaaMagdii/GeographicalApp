//
//  GABaseController.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import MBProgressHUD
import CZPicker

/**
 *  Base View Controller which contains common function for all viewControllers on the app.
 */
class GABaseController: UIViewController {
    let pickerData = ["English", "العربية"]
    var currentLanguage :String = AppDelegate.currentLanguage
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSettingBtnItemOnView()
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
    /**
     Display alert with Message
     - Parameter: NSString for Message
     */
    func showMessage(message: String) {
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func addSettingBtnItemOnView ()
    {
        let settingBtn  = UIBarButtonItem(image: #imageLiteral(resourceName: "settingIcon"), style: .plain, target: self, action: #selector(showLangPicker))
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem  = settingBtn
    }
    
    
    @objc func showLangPicker (){
        
        if let picker = CZPickerView(headerTitle: "ChooseLanguage".localized, cancelButtonTitle: "Cancel".localized, confirmButtonTitle: "Confirm".localized){
            picker.delegate = self
            picker.dataSource = self
            picker.confirmButtonBackgroundColor = UIColor.black
            picker.headerBackgroundColor = UIColor.black
            picker.needFooterView = true
            var index = 0
            if(currentLanguage == SupportedLanguages.Arabic.rawValue){
                index = 1
            }
            picker.setSelectedRows([index])
            picker.show()
        }
        
    }
    
    func changeCurrentLang(newLanguage: SupportedLanguages.RawValue){
        if (currentLanguage != newLanguage){
            currentLanguage = newLanguage
            if currentLanguage == SupportedLanguages.English.rawValue {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            }else{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            }
            setCurrentLang()
        }
    }
    
    func setCurrentLang () {
        Bundle.setLanguage(language: currentLanguage)
        UserDefaults.standard.set([currentLanguage], forKey: UserDefaultsKeys.appleLanguages)
        UserDefaults.standard.set(currentLanguage, forKey: UserDefaultsKeys.currentLang)
        UserDefaults.standard.synchronize()
        reloadViewFromNib()
    }
    
    
}
extension GABaseController: CZPickerViewDelegate, CZPickerViewDataSource {
    func numberOfRows(in pickerView: CZPickerView!) -> Int {
        return pickerData.count
    }
    
    func czpickerView(_ pickerView: CZPickerView!, imageForRow row: Int) -> UIImage! {
        return nil
    }
    
    
    func czpickerView(_ pickerView: CZPickerView!, titleForRow row: Int) -> String! {
        return pickerData[row]
    }
    
    func czpickerView(_ pickerView: CZPickerView!, didConfirmWithItemAtRow row: Int){
        print(pickerData[row])
        
        if (row == 1){
            changeCurrentLang(newLanguage: SupportedLanguages.Arabic.rawValue)
        }else{
            changeCurrentLang(newLanguage: SupportedLanguages.English.rawValue)
        }
    }
    
    func czpickerViewDidClickCancelButton(_ pickerView: CZPickerView!) {
    }
    
    private func czpickerView(pickerView: CZPickerView!, didConfirmWithItemsAtRows rows: [AnyObject]!) {
    }
}

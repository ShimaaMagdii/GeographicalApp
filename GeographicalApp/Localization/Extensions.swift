//
//  LocalizationExtensions.swift
//  Licenses
//
//  Created by Shimaa Magdi on 2/5/18.
//  Copyright © 2018 platformCodes. All rights reserved.
//

/*
 TO add localization to your app:-
 1- Install "Localize_Swift" pod and add your supported language from project settings. "pod 'Localize-Swift', '~> 2.0'"
 
 2- Add this handling in your change language function:-
 A- UIView.appearance().semanticContentAttribute = .forceRightToLeft// forceLeftToRight
 B- Localize.setCurrentLanguage(currentLanguage)
 C- reloadViewFromNib() // if your view dosn't inherit from baseController
 
 3- Add this observer "LCLLanguageChangeNotification" on your view controller which you want to reload it. like (baseController) // Or reintit all the stack of your navigation list.
 
 NotificationCenter.default.addObserver(self, selector: #selector(reloadUI), name: NSNotification.Name(LCLLanguageChangeNotification), object: nil)
 
 @objc func reloadUI() -> Void
 {
 reloadViewFromNib()
 }
 */


import UIKit

extension UILabel {
    
    @IBInspectable var localizedTitle: String {
        set(newLocalizedTitle) {
            
            text = newLocalizedTitle.localized
        }
        get {
            return text ?? ""
        }
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UITextField {
    @IBInspectable var localizedHolder: String {
        set(newLocalizedHolder) {
            placeholder = newLocalizedHolder.localized
        }
        get {
            return placeholder ?? ""
        }
    }
}

public extension UIButton {
    
    @IBInspectable var localizedTitle: String {
        set (key) {
            setTitle(key.localized, for: .normal)
            setTitle(key.localized, for: .highlighted)
            
        }
        get {
            return title(for: .normal)!
        }
    }
}

extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
}
//extension UINavigationController {
//    func reloadList(){
//        for (let controller in self.viewControllers) {
//            controller.reloadViewFromNib()
//        }
//
//    }
//}


//
//  LocalizationExtensions.swift
//
//
//  Created by Shimaa Magdi on 2/5/18.
//  Copyright © 2018 platformCodes. All rights reserved.
//

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

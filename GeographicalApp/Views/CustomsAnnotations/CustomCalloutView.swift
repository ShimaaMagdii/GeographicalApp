//
//  CustomCalloutView.swift
//  GeographicalApp
//
//  Created by Shimaa Magdi on 2/9/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

class CustomCalloutView: UIView {
    private var modelObject: BuildingAnnotation! {
        didSet{
            nameLabel.text = modelObject.name
            addressLabel.text = modelObject.address
            phoneLabel.text = modelObject.phone
        }
    }
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    @IBAction func phonePressed(_ sender: UIButton) {
        Utils.makeAPhoneCall(phoneNumber: modelObject.phone)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.dropCardShadow()
    }
    
    
    func config(_ modelObject: BuildingAnnotation ){
        self.modelObject = modelObject
    }
    
}

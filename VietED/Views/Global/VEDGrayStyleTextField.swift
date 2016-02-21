//
//  VEDGrayStyleTextField.swift
//  VietED
//
//  Created by Phung Long on 1/6/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit

class VEDGrayStyleTextField: VEDGlobalTextField {
    override func awakeFromNib() {
        self.layer.cornerRadius = 3.0
        self.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        self.layer.borderColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1).CGColor
        self.layer.borderWidth = 1.0
    }
    

}

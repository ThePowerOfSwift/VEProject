//
//  VEDCourseTableViewCell.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit
import Alamofire

class VEDCourseCollectionCell : UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var backgrView: UIView!
    
    @IBOutlet weak var xcoinButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgrView.layer.borderWidth = 1.0
        backgrView.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    override func prepareForReuse() {

    }
    
}

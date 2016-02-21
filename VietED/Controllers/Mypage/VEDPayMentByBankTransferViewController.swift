//
//  VEDPayMentByBankTransferViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDPayMentByBankTransferViewController: VEDBaseViewController {
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userInfoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoView.layer.borderWidth = 1.0
        userInfoView.layer.borderColor = UIColor.lightGrayColor().CGColor
        userAvatarImageView.layer.cornerRadius = 23
        userAvatarImageView.clipsToBounds = true
    }

}

//
//  VEDMyPageViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDMyPageViewController: VEDBaseViewController {

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleCoinLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoView.layer.borderWidth = 1.0
        userInfoView.layer.borderColor = UIColor.lightGrayColor().CGColor
        userAvatarImageView.layer.cornerRadius = 23
        userAvatarImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func phoneCardPayment(sender: AnyObject) {
        self.performSegueWithIdentifier("showPhoneCardPayment", sender: sender)

    }
    @IBAction func bankTransferPayment(sender: AnyObject) {
        self.performSegueWithIdentifier("showBankTransferPayment", sender: sender)

    }
    @IBAction func applePayment(sender: AnyObject) {
        self.performSegueWithIdentifier("showApplePayment", sender: sender)
    }
}

//
//  VEDPayMentWithCardPhoneViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDPayMentWithCardPhoneViewController: VEDBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userInfoview: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var serialTextField: VEDGrayStyleTextField!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var cardValueLabel: UILabel!
    @IBOutlet weak var pinTextField: VEDGrayStyleTextField!
    var items = ["10.000vnd", "20.000vnd", "50.000vnd", "100.000vnd", "200.000vnd", "500.000vnd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoview.layer.borderWidth = 1.0
        userInfoview.layer.borderColor = UIColor.lightGrayColor().CGColor
        userInfoview.layer.borderWidth = 1.0
        userInfoview.layer.borderColor = UIColor.grayColor().CGColor
        userAvatarImageView.layer.cornerRadius = 23
        userAvatarImageView.clipsToBounds = true
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCardTableView(sender: AnyObject) {
        if tableView.hidden {
            tableView.hidden = false
        } else {
            tableView.hidden = true
        }
        
    }
    
    @IBAction func paymentButtonClicked(sender: AnyObject) {
        let alertView = VEDAlertView(image: UIImage(named: "error-icon")!, title: "ERROR", message: "Bạn nạp tiền không thành công.\n Tài khoản của bạn có 100xcoins")
        alertView.showAlert()
        
    }
    
    // MARK: tableview delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        cardValueLabel.text = self.items[indexPath.row]
        tableView.hidden = true
    }

    
}

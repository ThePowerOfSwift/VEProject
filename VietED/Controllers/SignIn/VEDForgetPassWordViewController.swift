//
//  VEDForgetPassWordViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit
import Alamofire

class VEDForgetPassWordViewController: VEDBaseViewController {
    
    @IBOutlet weak var emailTextField: VEDGrayStyleTextField!
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.setupLeftViewWithImage("mail-icon")
    }
    @IBAction func cancelButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func sendButtonClicked(sender: AnyObject) {
    
        Alamofire.request(VEDRouter.ForgetPassword("hoangtv@vieted.net")).validate().responseJSON() {
            response in
            let result  = (response.result.value as! NSDictionary)
            let success:Bool = (result["success"]?.boolValue)!
            print("result \(result)")
            if (success == true) {
                self.changeRootToMainMenu()
            } else {
                let messageFailed = result["message"]
                print("messageFailed \(messageFailed)")
                
                let alert = UIAlertView()
                alert.title = "Error"
                alert.message = messageFailed as? String
                alert.addButtonWithTitle("Ok")
                alert.show()
            }

        }
    }

}

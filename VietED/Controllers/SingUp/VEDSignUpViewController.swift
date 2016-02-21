//
//  VEDSignUpViewController.swift
//  VietED
//
//  Created by Phung Long on 12/25/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit
import Alamofire

class VEDSignUpViewController: VEDBaseViewController {
    @IBOutlet weak var userNameTextField: VEDGrayStyleTextField!

    @IBOutlet weak var emailTextField: VEDGrayStyleTextField!
    @IBOutlet weak var passWordTextField: VEDGrayStyleTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.setupLeftViewWithImage("user-register-icon")
        emailTextField.setupLeftViewWithImage("mail-icon")
        passWordTextField.setupLeftViewWithImage("lock-icon")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func signupButtonClicked(sender: AnyObject) {
        Alamofire.request(VEDRouter.SignUp(userNameTextField.text!, emailTextField.text!, passWordTextField.text!)).validate().responseJSON() {
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
                alert.title = "Signup Failed"
                alert.message = messageFailed as? String
                alert.addButtonWithTitle("Ok")
                alert.show()
            }

        }
        
    }
    
    @IBAction func signinButtonClicked(sender: AnyObject) {
       self.navigationController?.popViewControllerAnimated(true)
    }
}

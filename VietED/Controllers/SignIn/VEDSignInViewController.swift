//
//  VEDSignInViewController.swift
//  VietED
//
//  Created by Phung Long on 12/24/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire

class VEDSignInViewController: VEDBaseViewController, GIDSignInUIDelegate,GIDSignInDelegate{
    
    @IBOutlet weak var usernameTextfield:VEDGrayStyleTextField!
    
    @IBOutlet weak var passWordTextField: VEDGrayStyleTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.setupLeftViewWithImage("mail-icon")
        passWordTextField.setupLeftViewWithImage("lock-icon")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
    }
    
    // MARK: action
    @IBAction func signInButtonClicked(sender: AnyObject) {
        Alamofire.request(VEDRouter.Login(usernameTextfield.text!, passWordTextField.text!)).validate().responseJSON(){
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
                alert.title = "Login Failed"
                alert.message = messageFailed as? String
                alert.addButtonWithTitle("Ok")
                alert.show()
            }

        }
    }
    
    @IBAction func signupButtonclicked(sender: AnyObject) {
        self .performSegueWithIdentifier("showSingUp", sender: sender)
    }
    
    @IBAction func forgerPasswordButtonClicked(sender: AnyObject) {
        self .performSegueWithIdentifier("showForgerPassword", sender: sender)
        
    }
    
    // MARK: google
    @IBAction func signupByGoogleButtonClicked(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Perform any operations on signed in user here.
                let userId = user.userID                  // For client-side use only!
                let idToken = user.authentication.idToken // Safe to send to the server
                let name = user.profile.name
                let email = user.profile.email
                print("\(userId) : \(idToken) : \(name) : \(email)")

            
                let currentToken:String = user.authentication.accessToken
                Alamofire.request(VEDRouter.LoginWithGoogle(currentToken)).validate().responseJSON() {
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
                        alert.title = "Login Failed"
                        alert.message = messageFailed as? String
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    }
                    
                }

                
            } else {
                print("\(error.localizedDescription)")
            }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        withError error: NSError!) {
            // Perform any operations when the user disconnects from app here.
            // ...
    }
    
    // MARK: Facebook
    @IBAction func signupByFacebookButtonClicked(sender: AnyObject) {
        
        let fbLoginManager :FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logOut()
        let facebookReadPermissions = ["public_profile", "email", "user_friends"]
        if FBSDKAccessToken.currentAccessToken() != nil {
            return
        }
        fbLoginManager.logInWithReadPermissions(facebookReadPermissions, fromViewController: self, handler:{ (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
            if error != nil {
                //According to Facebook:
                //Errors will rarely occur in the typical login flow because the login dialog
                //presented by Facebook via single sign on will guide the users to resolve any errors.
                
                // Process error
                print("login facebook error ...")
                FBSDKLoginManager().logOut()
            } else if result.isCancelled {
                // Handle cancellations
                FBSDKLoginManager().logOut()
                print("Facebook cancelled...");

            } else {
                print("Facebook success...");
                
                self.fetchFacebookUserInfo()
                let currentToken:String = FBSDKAccessToken.currentAccessToken().tokenString
                Alamofire.request(VEDRouter.LoginWithFaceBook(currentToken)).validate().responseJSON() {
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
                        alert.title = "Login Failed"
                        alert.message = messageFailed as? String
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    }

                }
            }
        })
    }
    
    func fetchFacebookUserInfo ()-> Void
    {
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, link, first_name, last_name, picture.type(large), email, birthday, bio ,location ,friends ,hometown , friendlists"])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if ((error) != nil)
                {
                    // Process error
                    print("Error: \(error)")
                }
                else
                {
                    print("fetched user: \(result)")
                    let userName : NSString = result.valueForKey("name") as! NSString
                    print("User Name is: \(userName)")
                    let userID : NSString = result.valueForKey("id") as! NSString
                    print("User Email is: \(userID)")
                    
                }
            })
        }
    }
    
}

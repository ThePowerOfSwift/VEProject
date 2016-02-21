//
//  VEDMainMenuViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDMainMenuViewController: VEDBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMyPage(sender: AnyObject) {
        self .performSegueWithIdentifier("showMyPage", sender: sender);
    }

    @IBAction func showAllCourse(sender: AnyObject) {
        self .performSegueWithIdentifier("showAllCourse", sender: sender);
    }
    

    @IBAction func showMyCourse(sender: AnyObject) {
        self .performSegueWithIdentifier("showMyCourse", sender: sender);

    }

    @IBAction func showPrivateCourse(sender: AnyObject) {
        self .performSegueWithIdentifier("showPrivateCourse", sender: sender);

    }

    @IBAction func showFavoriteCourse(sender: AnyObject) {
        self .performSegueWithIdentifier("showFavoriteCourse", sender: sender);

    }

    @IBAction func showBalance(sender: AnyObject) {
        self .performSegueWithIdentifier("showBalance", sender: sender);

    }

    @IBAction func showSettings(sender: AnyObject) {
        self .performSegueWithIdentifier("showSettings", sender: sender);

    }

    @IBAction func logout(sender: AnyObject) {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("SigninNavigationController") as UIViewController
//        UIApplication.sharedApplication().keyWindow?.rootViewController = viewController;
        self .performSegueWithIdentifier("showLogin", sender: sender);
    }
}

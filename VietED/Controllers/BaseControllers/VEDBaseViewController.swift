//
//  VEDBaseViewController.swift
//  VietED
//
//  Created by Phung Long on 12/24/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import Foundation
import UIKit

class VEDBaseViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(colorLiteralRed: 217/255.0, green: 110/255.0, blue: 4/255.0, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changeRootToMainMenu() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainMenuNavigationController") as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = viewController;
        
    }
    func gotoMainMenu ()->Void {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
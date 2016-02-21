//
//  VEDCustomNaviViewController.swift
//  VietED
//
//  Created by Phung Long on 1/13/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit

class VEDCustomNaviViewController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().barTintColor = UIColor(red: 249/255.0, green: 142/255.0, blue: 45/255.0, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.delegate = self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

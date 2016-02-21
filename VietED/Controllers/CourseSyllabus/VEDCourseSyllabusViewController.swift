//
//  VEDCourseSyllabusViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDCourseSyllabusViewController: VEDBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showPlayVideo", sender: nil)
    }

}

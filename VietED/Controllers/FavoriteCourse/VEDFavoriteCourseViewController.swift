//
//  VEDFavoriteCourseViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDFavoriteCourseViewController: VEDBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemsTableView.registerNib(UINib(nibName: "VEDCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "VEDCourseTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VEDCourseTableViewCell", forIndexPath: indexPath) as! VEDCourseTableViewCell
        return cell;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showCourseOverView", sender: nil)
    }
    
}

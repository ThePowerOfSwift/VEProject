//
//  VEDAllCourseViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDAllCourseViewController: VEDBaseTableViewController {

    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.itemsTableView.registerClass(VEDCategoryCourse.self, forCellReuseIdentifier: "cell")
        
    }
    
    // MARK : tableview
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VEDCategoryCourse") as! VEDCategoryCourse
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        view.backgroundColor = UIColor.whiteColor()
        let myCustomView = UIImageView(frame: CGRect(x: 15, y: 5, width: self.view.frame.size.width - 30, height: 30))
        let myImage: UIImage = UIImage(named: "tableview-header-background")!
        myCustomView.image = myImage
        view.addSubview(myCustomView)
        
        let courseNameLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 250, height: 30))
        courseNameLabel.textColor = UIColor(red: 142/255.0, green: 193/255.0, blue: 39/255.0, alpha: 1)
        courseNameLabel.font = UIFont.systemFontOfSize(12)
        courseNameLabel.text = "Category 1"
        view.addSubview(courseNameLabel)
        
        let arrowImageView = UIImageView(frame: CGRect(x: self.view.frame.size.width - 35, y: 15, width: 8, height: 8))
        let arrowImage: UIImage = UIImage(named: "arrow-double-icon")!
        arrowImageView.image = arrowImage
        view.addSubview(arrowImageView)
        
        let button = UIButton(frame: view.frame)
        button.addTarget(self, action: "showCategoryDetail", forControlEvents: .TouchUpInside)
        
        view .addSubview(button)
        
        return view
    }
    
    // MARK: navigation
    func showCategoryDetail()->Void {
        self.performSegueWithIdentifier("showCategoryCourse", sender: nil)
    }
}

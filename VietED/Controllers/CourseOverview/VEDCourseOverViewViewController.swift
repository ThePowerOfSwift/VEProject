//
//  VEDCourseOverViewViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit

class VEDCourseOverViewViewController: VEDBaseViewController {

    @IBOutlet weak var courseSlider: UISlider!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var xcoinButton: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teacherImageView.layer.cornerRadius = 20
        teacherImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonClicked(sender: AnyObject) {
    }

}

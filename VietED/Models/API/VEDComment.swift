//
//  VEDComment.swift
//  VietED
//
//  Created by Phung Long on 1/11/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit

class VEDComment: NSObject {
    let userFullname: String
    let userPictureURL: String
    let commentBody: String
    
    init(JSON: AnyObject) {
        userFullname = JSON.valueForKeyPath("user.fullname") as! String
        userPictureURL = JSON.valueForKeyPath("user.userpic_url") as! String
        commentBody = JSON.valueForKeyPath("body") as! String
    }
}

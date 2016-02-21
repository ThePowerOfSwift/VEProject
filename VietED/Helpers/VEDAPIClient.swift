//
//  VEDAPIClient.swift
//  VietED
//
//  Created by Phung Long on 12/24/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import Foundation
import Alamofire

public class VEDAPIClient {
    static let domainWithScheme = "http://vieted.net/user"
    public class var sharedInstance: VEDAPIClient {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: VEDAPIClient? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = VEDAPIClient()
        }
        return Static.instance!
    }

    public func login(phone: String, password: String,
        successCallback: () -> Void,
        failedCallback: (Dictionary<String, AnyObject>?) -> Void)
    {
        Alamofire.request(.POST, "http://vieted.net/user/login?submit=1&lname=test@test.com&pass=123456&_sand_platform=1&_sand_uiid&_sand_app_id=boca_juniors&_sand_app_name=vieted&_sand_token&_sand_device_id=000000000000000").responseJSON() { response in
            debugPrint(response.result.value);

        }
    }

}
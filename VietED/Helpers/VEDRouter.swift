//
//  VEDRouter.swift
//  VietED
//
//  Created by Phung Long on 1/11/16.
//  Copyright © 2016 Phung Long. All rights reserved.
//

import UIKit
import Alamofire

extension Alamofire.Request {
    public static func imageResponseSerializer() -> ResponseSerializer<UIImage,NSError> {
        return ResponseSerializer { request, response, data , error in
            if data == nil {
                return Result.Failure(error!)
            }
            
            let image = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
            
            return Result.Success(image!)
        }
    }
    
    public func responseImage(completionHandler: Response<UIImage, NSError> -> Void) -> Self {
        return response(responseSerializer: Request.imageResponseSerializer(), completionHandler: completionHandler)
    }
}

enum VEDRouter: URLRequestConvertible {
    
    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "noHo3N18acx91QtYlGeURi9UAkGWkgpDVStMgojw"
    case LoginWithFaceBook(String)
    case LoginWithGoogle(String)
    case ForgetPassword(String)
    case SignUp(String, String, String)
    case Login(String, String)
    
    var URLRequest: NSMutableURLRequest {
        let result: (path: String, parameters: [String: AnyObject],method: String) = {
            switch self {
            case .LoginWithFaceBook(let token):
                let params = ["login": "facebook", "oauth_token": token, "_sand_platform": "\(2)", "_sand_app_id": "boca_juniors", "_sand_app_name": "vieted", "_sand_device_id": "dummy","_sand_ts": "1452589154"]
                return ("/user/oauth-success/", params, "POST")
            case .LoginWithGoogle(let token):
                let params = ["login": "google", "oauth_token": token, "_sand_platform": "\(2)", "_sand_app_id": "boca_juniors", "_sand_app_name": "vieted", "_sand_device_id": "dummy","_sand_ts": "1452589154"]
                return ("/user/oauth-success/", params, "POST")
            case .ForgetPassword(let emailAddress):
                let params = ["submit": "\(1)", "mail": emailAddress, "_sand_platform": "\(2)", "_sand_app_id": "boca_juniors", "_sand_app_name": "vieted", "_sand_device_id": "dummy","_sand_ts": "1452589154"]
                return ("/user/forgot-password/", params, "POST")
                
            case .SignUp(let userName,let emailAddress,let passWord):
                let params = ["submit": "\(1)", "name": userName, "pass": passWord, "mail": emailAddress, "_sand_app_id": "boca_juniors", "_sand_app_name": "vieted","_sand_platform": "\(2)","_sand_ts": "000000000","_sand_device_id": "dummy","_sand_token": ""]
                return ("/user/register/", params, "POST")
                
            case .Login(let userName, let passWord):
                let params = ["submit": "\(1)", "lname": userName, "pass": passWord, "_sand_platform": "\(2)", "_sand_app_id": "boca_juniors", "_sand_app_name": "vieted", "_sand_device_id": "000000000000000","_sand_token":""]
                return ("/user/login/", params, "POST")
            }
        }()
        let URL = NSURL(string: "http://vieted.net")
        let URLRequest = NSURLRequest(URL: URL!.URLByAppendingPathComponent(result.path))
        let encoding = Alamofire.ParameterEncoding.URL
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
    
    enum ImageSize: Int {
        case Tiny = 1
        case Small = 2
        case Medium = 3
        case Large = 4
        case XLarge = 5
    }
    
}

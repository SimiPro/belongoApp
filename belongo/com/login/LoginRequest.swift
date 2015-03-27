//
//  LoginRequest.swift
//  itrip
//
//  Created by Simon Huber on 27/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation
import Alamofire

enum LoginRequest: URLRequestConvertible {
    static let baseUrlString = "http://localhost:8005/userservice/oauth"
    case Login(username: String, password:String)
    
    var method: Alamofire.Method {
        switch self {
            case .Login:
                return .POST
        }
    }
    
    var URLRequest: NSURLRequest {

        
        let (path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .Login(let username, let password):
                return ("/token", ["username": username, "password":password, "client_id": "ios", "grant_type":"password"])
            }
            }()
        
        let URL = NSURL(string: LoginRequest.baseUrlString)!
        let request = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        request.HTTPMethod = method.rawValue
        
        // set header fields
        let header = ("ios:simiproo" as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        let base64 = header!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        request.setValue("Basic " + base64, forHTTPHeaderField: "Authorization")
        return Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters).0
    }
}
        
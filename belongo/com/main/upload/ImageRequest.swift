//
//  UploadRequest.swift
//  belongo
//
//  Created by Simon Huber on 27/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation
import Alamofire

enum ImageRequest: URLRequestConvertible {
    static let baseUrlString = "http://localhost:9005/ios/image"
    
    
    case Upload(fileName:String)
    case Test()
    
    var method: Alamofire.Method {
        switch self {
        case .Upload:
            return .POST
        case .Test:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .Upload:
            return "/upload"
        case .Test:
            return "/test"
        }
    }
    
    var parameters: [String:AnyObject]? {
        switch self {
        case .Upload(let fileName):
                return ["file": fileName]
        default:
            return nil
        }
    }
    
    
    
    var URLRequest: NSURLRequest {
        let URL = NSURL(string: ImageRequest.baseUrlString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if (Token.isAuthenticated()) {
             mutableURLRequest.setValue("Bearer \(Token.getToken())", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .Upload(let fileName):
            let boundryConstat = "randomBoundry"
            let contentType = "multipart/form-data"
            mutableURLRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
            
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}
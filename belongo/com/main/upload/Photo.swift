//
//  Photo.swift
//  belongo
//
//  Created by Simon Huber on 27/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation
import Alamofire

class Photo {
    typealias CompletionHandler = (obj:AnyObject?, success: Bool) -> Void
    
    func UploadWithAlamofire(filePath: NSData, _ aHandler: CompletionHandler?, fileName:String) -> Void {
        // Set Content-Type in HTTP header
        let boundaryConstant = "Boundary-7MA4YWxkTLLu0UIW";
        let contentType = "multipart/form-data; boundary=" + boundaryConstant
        let accessTokenHeader = ""
        
        var fileData:NSData = filePath
      /*  if let fileContents = NSFileManager.defaultManager().contentsAtPath(filePath.path!) {
            fileData = fileContents
        }
*/
        
        //let fileName = filePath.path!.lastPathComponent
        let mimeType = "image/jpg"
        let fieldName = "uploadFile"
        
        debugPrintln(Alamofire.request(Router.Upload(fieldName: fieldName, fileName: fileName, mimeType: mimeType, fileContents: fileData, boundaryConstant: boundaryConstant))
            .responseJSON {(request, response, JSON, error) in
                if let apiError = error {
                    aHandler?(obj: error, success: false)
                } else {
                    println(JSON)
                    println(error)
                    println(response)
                    /*
                    if let status = JSON?.valueForKey("Status") as? NSString {
                        if (status == "OK") {
                            aHandler?(obj: JSON, success: true)
                        } else {
                            aHandler?(obj: JSON, success: false)
                        }
                    }
*/
                }
        })
}


    
enum Router:URLRequestConvertible {
        static let baseUrlString:String = "http://localhost:9005/ios/image"
        case Upload(fieldName: String, fileName: String, mimeType: String, fileContents: NSData, boundaryConstant:String);
        
        var method: Alamofire.Method {
            switch self {
            case Upload:
                return .POST
            default:
                return .GET
            }
        }
        
        var path: String {
            switch self {
            case Upload:
                return "/upload"
            default:
                return "/test"
            }
        }
        
        var URLRequest: NSURLRequest {
            var URL: NSURL = NSURL(string: Router.baseUrlString)!
            var mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))

            if (Token.isAuthenticated()) {
                mutableURLRequest.setValue("Bearer \(Token.getToken())", forHTTPHeaderField: "Authorization")
            }
            
            mutableURLRequest.HTTPMethod = method.rawValue
            
            switch self {
            case .Upload(let fieldName, let fileName, let mimeType, let fileContents, let boundaryConstant):
                let contentType = "multipart/form-data; boundary=" + boundaryConstant
                var error: NSError?
                let boundaryStart = "--\(boundaryConstant)\r\n"
                let boundaryEnd = "--\(boundaryConstant)--\r\n"
                let contentDispositionString = "Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n"
                let contentTypeString = "Content-Type: \(mimeType)\r\n\r\n"
                
                // Prepare the HTTPBody for the request.
                let requestBodyData : NSMutableData = NSMutableData()
                requestBodyData.appendData(boundaryStart.dataUsingEncoding(NSUTF8StringEncoding)!)
                requestBodyData.appendData(contentDispositionString.dataUsingEncoding(NSUTF8StringEncoding)!)
                requestBodyData.appendData(contentTypeString.dataUsingEncoding(NSUTF8StringEncoding)!)
                requestBodyData.appendData(fileContents)
                requestBodyData.appendData("\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
                requestBodyData.appendData(boundaryEnd.dataUsingEncoding(NSUTF8StringEncoding)!)
                
                mutableURLRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
                mutableURLRequest.HTTPBody = requestBodyData
                return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: nil).0
                
            default:
                return mutableURLRequest
            }
        }
    }
}
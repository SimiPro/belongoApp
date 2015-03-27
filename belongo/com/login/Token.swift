//
//  Token.swift
//  itrip
//
//  Created by Simon Huber on 27/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation


struct Token {
    static var token:String = "";
    static var refresh_token:String = ""
    
    static func setToken(token:String) {
        self.token = token;
    }
    
    static func setRefreshToken(refresh:String) {
        self.refresh_token = refresh;
    }
    
    static func getToken() -> String {
        return self.token
    }
    
    static func getRefreshToken() -> String {
        return self.refresh_token;
    }
    
    static func isAuthenticated() -> Bool {
        return !self.token.isEmpty
    }
    
}


final class TokenSerializer: ResponseObjectSerializable {
    let token:String?
    let refresh_token:String?
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        println(representation)
        //                    self.username = response.URL!.lastPathComponent
        self.token = representation.valueForKeyPath("access_token") as String?
        self.refresh_token = representation.valueForKeyPath("refresh_token") as String?
    }
    
}
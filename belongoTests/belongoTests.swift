//
//  belongoTests.swift
//  belongoTests
//
//  Created by Simon Huber on 05/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import UIKit
import XCTest
import Alamofire

class belongoTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        var data = NSData()
        Alamofire.upload(.POST, "http://localhost:8000/image/upload?name=simi.jpg", data)
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

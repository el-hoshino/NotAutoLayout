//
//  DictionaryTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class DictionaryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMethods() {
		
		let dictionary: [String: Int] = ["1": 1]
		
		XCTAssertTrue(dictionary.containsKey("1"))
		XCTAssertFalse(dictionary.containsKey("2"))
		
    }
    
    func testPerformance() {
        // This is an example of a performance test case.
        self.measure {
			_ = [1: 2].containsKey(3)
        }
    }
    
}

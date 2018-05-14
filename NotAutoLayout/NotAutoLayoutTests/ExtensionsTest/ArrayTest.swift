//
//  ArrayTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class ArrayTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMethods() {
		
		let array = [1, 2, 3]
		
		XCTAssertEqual(array.sum(ofFirst: 0), 0)
		XCTAssertEqual(array.sum(ofFirst: 2), 3)
		XCTAssertEqual(array.sum(ofFirst: 3), 6)
		XCTAssertEqual(array.sum(ofFirst: 100), 6)
		
    }
    
    func testPerformance() {
		
		let array = [Int](0 ..< 1000000)
		
        self.measure {
			_ = array.sum(ofFirst: 1000000000)
        }
		
    }
    
}

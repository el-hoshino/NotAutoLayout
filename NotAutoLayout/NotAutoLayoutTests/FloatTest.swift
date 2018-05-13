//
//  FloatTest.swift
//  NotAutoLayoutTests
//
//  Created by 史翔新 on 2018/05/13.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class FloatTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOperations() {
		
		let a: NotAutoLayout.Float = 1.23
		let b: NotAutoLayout.Float = 4.56
		
		let aPlusB = a + b
		let aMinusB = a - b
		let aTimesB = a * b
		let aDevidedByB = a / b
		
		XCTAssert(aPlusB == 1.23 + 4.56)
		XCTAssert(aMinusB == 1.23 - 4.56)
		XCTAssert(aTimesB == 1.23 * 4.56)
		XCTAssert(aDevidedByB == 1.23 / 4.56)
		
    }
	
	func testProperties() {
		
		let a: NotAutoLayout.Float = 7.89
		
		XCTAssert(a.half == 7.89 / 2)
		XCTAssert(a.double == 7.89 * 2)
		XCTAssert(a.isNonZero == true)
		
	}
    
}

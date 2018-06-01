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
	
	func testBitrise() {
		let a: NotAutoLayout.Float = 1
		XCTAssertEqual(a.bitriseValue, 1)
	}
	
	func testProperties() {
		
		let a: NotAutoLayout.Float = 7.89
		
		XCTAssert(a.half == 3.945)
		XCTAssert(a.double == 15.78)
		XCTAssert(a.isNonZero == true)
		
		let b: NotAutoLayout.Float = 0
		XCTAssert(b.half == 0)
		XCTAssert(b.double == 0)
		XCTAssert(b.isNonZero == false)
		
	}
	
}

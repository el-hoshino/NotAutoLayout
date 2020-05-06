//
//  SizeTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class SizeTest: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testAspectMethods() {
		
		let size = Size(width: 300, height: 300)
		
		let ratio1: NotAutoLayout.Float = 4 / 3
		let aspectFill1 = Size.aspectFillSize(in: size, with: ratio1)
		let aspectFit1 = Size.aspectFitSize(in: size, with: ratio1)
		XCTAssert(aspectFill1 == Size(width: 400, height: 300))
		XCTAssert(aspectFit1 == Size(width: 300, height: 225))
		
		let ratio2: NotAutoLayout.Float = 3 / 4
		let aspectFill2 = Size.aspectFillSize(in: size, with: ratio2)
		let aspectFit2 = Size.aspectFitSize(in: size, with: ratio2)
		XCTAssert(aspectFill2 == Size(width: 300, height: 400))
		XCTAssert(aspectFit2 == Size(width: 225, height: 300))
		
	}
	
}

//
//  SpanTest.swift
//  NotAutoLayoutTests
//
//  Created by 史翔新 on 2018/05/13.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class LineTest: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testProperties() {
		
		let span50to250 = Span(start: 50, length: 200)
		
		XCTAssert(span50to250.start == 50)
		XCTAssert(span50to250.length == 200)
		XCTAssert(span50to250.half == 150)
		XCTAssert(span50to250.end == 250)
		XCTAssert(span50to250.geometry(at: 0) == 50)
		XCTAssert(span50to250.geometry(at: 0.3) == 110)
		XCTAssert(span50to250.geometry(at: 1) == 250)
		XCTAssert(span50to250.geometry(at: 2) == 450)
		XCTAssert(span50to250.geometry(at: -2) == -350)
		
		let span0 = Span.zero
		XCTAssert(span0.start == 0)
		XCTAssert(span0.length == 0)
		XCTAssert(span0.half == 0)
		XCTAssert(span0.end == 0)
		XCTAssert(span0.geometry(at: 0) == 0)
		XCTAssert(span0.geometry(at: 0.3) == 0)
		XCTAssert(span0.geometry(at: 1) == 0)
		XCTAssert(span0.geometry(at: 2) == 0)
		XCTAssert(span0.geometry(at: -2) == 0)
		
		let span0to1 = Span.identity
		XCTAssert(span0to1.start == 0)
		XCTAssert(span0to1.length == 1)
		XCTAssert(span0to1.half == 0.5)
		XCTAssert(span0to1.end == 1)
		XCTAssert(span0to1.geometry(at: 0) == 0)
		XCTAssert(span0to1.geometry(at: 0.3) == 0.3)
		XCTAssert(span0to1.geometry(at: 1) == 1)
		XCTAssert(span0to1.geometry(at: 2) == 2)
		XCTAssert(span0to1.geometry(at: -2) == -2)
		
	}
	
}

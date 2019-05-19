//
//  RectTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class RectTest: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testProperties() {
		
		let rect = Rect(x: 100, y: 200, width: 300, height: 400)
		
		XCTAssertEqual(rect.left, 100)
		XCTAssertEqual(rect.center, 250)
		XCTAssertEqual(rect.right, 400)
		XCTAssertEqual(rect.top, 200)
		XCTAssertEqual(rect.middle, 400)
		XCTAssertEqual(rect.bottom, 600)
		XCTAssertEqual(rect.width, 300)
		XCTAssertEqual(rect.height, 400)
		
		XCTAssertEqual(rect.topLeft, .init(x: rect.left, y: rect.top))
		XCTAssertEqual(rect.topCenter, .init(x: rect.center, y: rect.top))
		XCTAssertEqual(rect.topRight, .init(x: rect.right, y: rect.top))
		XCTAssertEqual(rect.middleLeft, .init(x: rect.left, y: rect.middle))
		XCTAssertEqual(rect.middleCenter, .init(x: rect.center, y: rect.middle))
		XCTAssertEqual(rect.middleRight, .init(x: rect.right, y: rect.middle))
		XCTAssertEqual(rect.bottomLeft, .init(x: rect.left, y: rect.bottom))
		XCTAssertEqual(rect.bottomCenter, .init(x: rect.center, y: rect.bottom))
		XCTAssertEqual(rect.bottomRight, .init(x: rect.right, y: rect.bottom))
		
		XCTAssertEqual(rect.horizontalSpan, .init(start: rect.x, length: rect.width))
		XCTAssertEqual(rect.verticalSpan, .init(start: rect.y, length: rect.height))
		
		XCTAssertEqual(rect.horizontalGeometry(at: 0.5), rect.center)
		XCTAssertEqual(rect.horizontalGeometry(at: 0.3), 100 + (300 * 0.3))
		
		XCTAssertEqual(rect.verticalGeometry(at: 0.5), rect.middle)
		XCTAssertEqual(rect.verticalGeometry(at: 0.7), 200 + (400 * 0.7))
		
		XCTAssertEqual(rect.pointGeometryAt(x: 0.5, y: 0.5), rect.middleCenter)
		XCTAssertEqual(rect.pointGeometry(at: .init(x: 0.4, y: 0.8)), Point(x: 100 + (300 * 0.4),
																			y: 200 + (400 * 0.8)))
		
	}
	
	func testMutatingMethods() {
		
		let rect = Rect(x: 100, y: 200, width: 300, height: 400)
		var modified: Rect = .zero
		
		modified = rect
		modified.moveLeft(to: 0)
		XCTAssertEqual(modified, .init(x: 0, y: 200, width: 300, height: 400))
		
		modified = rect
		modified.moveCenter(to: 0)
		XCTAssertEqual(modified, .init(x: -150, y: 200, width: 300, height: 400))
		
		modified = rect
		modified.moveRight(to: 0)
		XCTAssertEqual(modified, .init(x: -300, y: 200, width: 300, height: 400))
		
		modified = rect
		modified.moveTop(to: 0)
		XCTAssertEqual(modified, .init(x: 100, y: 0, width: 300, height: 400))
		
		modified = rect
		modified.moveMiddle(to: 0)
		XCTAssertEqual(modified, .init(x: 100, y: -200, width: 300, height: 400))
		
		modified = rect
		modified.moveBottom(to: 0)
		XCTAssertEqual(modified, .init(x: 100, y: -400, width: 300, height: 400))
		
		modified = rect
		modified.moveX(by: 100)
		XCTAssertEqual(modified, .init(x: 200, y: 200, width: 300, height: 400))
		
		modified = rect
		modified.moveY(by: 100)
		XCTAssertEqual(modified, .init(x: 100, y: 300, width: 300, height: 400))
		
		modified = rect
		modified.pinchLeft(to: 0)
		XCTAssertEqual(modified, .init(x: 0, y: 200, width: 400, height: 400))
		
		modified = rect
		modified.pinchLeft(by: 100)
		XCTAssertEqual(modified, .init(x: 200, y: 200, width: 200, height: 400))
		
		modified = rect
		modified.pinchRight(to: 1000)
		XCTAssertEqual(modified, .init(x: 100, y: 200, width: 900, height: 400))
		
		modified = rect
		modified.pinchRight(by: 1000)
		XCTAssertEqual(modified, .init(x: 100, y: 200, width: 1300, height: 400))
		
		modified = rect
		modified.pinchTop(to: 0)
		XCTAssertEqual(modified, .init(x: 100, y: 0, width: 300, height: 600))
		
		modified = rect
		modified.pinchTop(by: 100)
		XCTAssertEqual(modified, .init(x: 100, y: 300, width: 300, height: 300))
		
		modified = rect
		modified.pinchBottom(to: 1000)
		XCTAssertEqual(modified, .init(x: 100, y: 200, width: 300, height: 800))
		
		modified = rect
		modified.pinchBottom(by: 1000)
		XCTAssertEqual(modified, .init(x: 100, y: 200, width: 300, height: 1400))
		
		modified = rect
		modified.expandWidth(by: 100, from: .coordinateCenter)
		XCTAssertEqual(modified, Rect(x: 100 + (-100 * 0.5),
									  y: 200,
									  width: 300 + 100,
									  height: 400))
		
		modified = rect
		modified.expandWidth(to: 500, from: 0.3)
		XCTAssertEqual(modified, Rect(x: 100 + ((300 - 500) * 0.3),
									  y: 200,
									  width: 500,
									  height: 400))
		
		modified = rect
		modified.expandHeight(by: 100, from: .coordinateMiddle)
		XCTAssertEqual(modified, Rect(x: 100,
									  y: 200 + (-100 * 0.5),
									  width: 300,
									  height: 400 + 100))
		
		modified = rect
		modified.expandHeight(to: 800, from: 0.6)
		XCTAssertEqual(modified, Rect(x: 100,
									  y: 200 + ((400 - 800) * 0.6),
									  width: 300,
									  height: 800))
		
	}
	
}

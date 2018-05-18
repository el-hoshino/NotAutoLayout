//
//  NotAutoLayoutContainerTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class NotAutoLayoutContainerTest: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testMethods() {
		
		let targetFrame = CGRect(x: 100, y: 200, width: 300, height: 400)
		
		let parentView = UIView(frame: .init(x: 0, y: 0, width: 800, height: 800))
		let childView = UIView(frame: targetFrame)
		parentView.addSubview(childView)
		
		XCTAssertEqual(childView.frame, targetFrame)
		XCTAssertEqual(childView.nal.identityFrame, targetFrame)
		
		childView.transform = CGAffineTransform(a: 2, b: 1, c: -1, d: -2, tx: 100, ty: 200)
		let currentFrame = childView.frame
		
		XCTAssertNotEqual(targetFrame, currentFrame)
		XCTAssertEqual(childView.nal.identityFrame, targetFrame)
		XCTAssertEqual(childView.nal.frame(thatIgnoresTransform: false), currentFrame)
		
	}
	
	func testPerformance() {
		
		let targetFrame = CGRect(x: 100, y: 200, width: 300, height: 400)
		let parentView = UIView(frame: .init(x: 0, y: 0, width: 800, height: 800))
		let childView = UIView(frame: targetFrame)
		parentView.addSubview(childView)
		childView.transform = CGAffineTransform(a: 2, b: 1, c: -1, d: -2, tx: 100, ty: 200)
		
		self.measure {
			_ = childView.nal.identityFrame
		}
	}
	
}

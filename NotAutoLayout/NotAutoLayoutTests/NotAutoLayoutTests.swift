//
//  NotAutoLayoutTests.swift
//  NotAutoLayoutTests
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class NotAutoLayoutTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testAbsoluteFrame() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let parent = UIView()
		let child = UIView()
		
		parent.nal.layout(child) { $0
			.setLeft(to: 10)
			.setTop(to: 10)
			.setWidth(to: 100)
			.setHeight(to: 100)
		}
		
		let result = child.frame
		let expected = CGRect(x: 10, y: 10, width: 100, height: 100)
		XCTAssertEqual(result, expected)
		
	}
	
	func testRelativeFrame() {
		
		let parent = UIView()
		let child = UIView()
		
		parent.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		
		parent.nal.layout(child) { $0
			.setFrame(by: { $0.frame })
		}
		
		let result = child.frame
		let expected = CGRect(x: 0, y: 0, width: 100, height: 100)
		XCTAssertEqual(result, expected)
		
	}
	
	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
			let parent = LayoutInfoStoredView()
			let child = UIView()
			
			let layout = parent.nal.makeLayout { $0
				.pinLeft(to: parent) { $0.left + 10 }
				.setTop(to: 10)
				.setWidth(to: 100)
				.setHeight(to: 100)
			}
			
			parent.nal.setupSubview(child) { (wizard) in wizard
				.addToParent()
				.setDefaultLayout(to: layout)
			}
			
		}
	}
	
}

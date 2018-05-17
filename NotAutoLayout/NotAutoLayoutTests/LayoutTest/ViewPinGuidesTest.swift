//
//  ViewPinGuidesTest.swift
//  NotAutoLayoutTests
//
//  Created by 史 翔新 on 2018/05/17.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class ViewPinGuidesTest: XCTestCase {
	
	private let vc = TestViewController()
	private var horizontalPinGuides: ViewPinGuides.Horizontal {
		return .init(parentView: self.vc.view, referenceView: self.vc.guideView)
	}
	private var verticalPinGuides: ViewPinGuides.Vertical {
		return .init(parentView: self.vc.view, referenceView: self.vc.guideView)
	}
	private var pointPinGuides: ViewPinGuides.Point {
		return .init(parentView: self.vc.view, referenceView: self.vc.guideView)
	}
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultGuide() {
		
		let horizontal = self.horizontalPinGuides
		let vertical = self.verticalPinGuides
		let point = self.pointPinGuides
		
		XCTAssertEqual(horizontal.left, 360)
		XCTAssertEqual(horizontal.center, 460)
		XCTAssertEqual(horizontal.right, 560)
		XCTAssertEqual(horizontal.horizontal(at: 0.6), 360 + (200 * 0.6))
		
		XCTAssertEqual(vertical.top, 220)
		XCTAssertEqual(vertical.middle, 420)
		XCTAssertEqual(vertical.bottom, 620)
		XCTAssertEqual(vertical.vertical(at: 0.7), 220 + (400 * 0.7))
		
		XCTAssertEqual(point.topLeft, .init(x: horizontal.left, y: vertical.top))
		XCTAssertEqual(point.topCenter, .init(x: horizontal.center, y: vertical.top))
		XCTAssertEqual(point.topRight, .init(x: horizontal.right, y: vertical.top))
		XCTAssertEqual(point.middleLeft, .init(x: horizontal.left, y: vertical.middle))
		XCTAssertEqual(point.middleCenter, .init(x: horizontal.center, y: vertical.middle))
		XCTAssertEqual(point.middleRight, .init(x: horizontal.right, y: vertical.middle))
		XCTAssertEqual(point.bottomLeft, .init(x: horizontal.left, y: vertical.bottom))
		XCTAssertEqual(point.bottomCenter, .init(x: horizontal.center, y: vertical.bottom))
		XCTAssertEqual(point.bottomRight, .init(x: horizontal.right, y: vertical.bottom))
		XCTAssertEqual(point.pointAt(x: 0.2, y: 0.1), .init(x: horizontal.horizontal(at: 0.2), y: vertical.vertical(at: 0.1)))
		
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

private final class TestViewController: UIViewController {
	
	private(set) lazy var guideView: UIView = {
		let view = UIView(frame: .init(x: 10, y: 20, width: 100, height: 200))
		view.layoutMargins = .init(top: 60, left: 50, bottom: 40, right: 30)
		view.transform = CGAffineTransform.identity.translatedBy(x: 400, y: 300).scaledBy(x: 2, y: 2) // == (2, 0, 0, 2, 400, 300)
		return view
	}()
	
	override func loadView() {
		let view = UIView(frame: .init(x: 0, y: 0, width: 800, height: 600))
		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.addSubview(self.guideView)
	}
	
}

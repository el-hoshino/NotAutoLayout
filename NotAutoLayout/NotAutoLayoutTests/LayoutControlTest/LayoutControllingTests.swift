//
//  LayoutControllingTests.swift
//  NotAutoLayoutTests
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import XCTest
@testable import NotAutoLayout

class NotAutoLayoutTests: XCTestCase {
	
	private let vc = TestViewController()
	private var view: UIView {
		return self.vc.view
	}
	private var guide: UIView {
		return self.vc.guideView
	}
	private var target: UIView {
		return self.vc.targetView
	}
	
	override func setUp() {
		super.setUp()
		self.target.frame = .zero
	}
	
	override func tearDown() {
		self.target.frame = .zero
		super.tearDown()
	}
	
	func testCase1() {
		
		/*======================================================
			0┇      200┇      400┇      600┇      800┇
			┅┌────┲━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┱────┐
			 │view┃target                       ┃    │
			2│    ┃                             ┃    │
			0│    ┃                             ┃    │
			0│    ┃                             ┃    │
			┅│    ┃                             ┃    │
			 │    ┃                             ┃    │
			4│    ┃                             ┃    │
			0│    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛    │
			0│                                       │
			┅│                                       │
			 │                                       │
			6│                                       │
			0│                                       │
			0│                                       │
			┅└───────────────────────────────────────┘
		
		======================================================*/
		
		self.view.nal.layout(self.target) { $0
			.setTopCenter(by: { $0.topCenter })
			.setWidth(by: { $0.width * 0.8 })
			.setHeight(to: 320)
		}
		
		XCTAssertEqual(self.target.frame, .init(x: 80, y: 0, width: 640, height: 320))
		
	}
	
	func testCase2() {
		
		/*======================================================
			0┇      200┇      400┇      600┇      800┇
			┅┌───────────────────────────────────────┐
			 │view                                   │
			2│                                       │
			0│                                       │
			0│                                       │
			┅│                                       │
			 │                 ╔═════════╗           │
			4│                 ║guide    ║           │
			0│                 ║         ║           │
			0│                 ║         ║           │
			┅│                 ║         ║           │
			 │                 ║    ┏━━━━╫━━━━━━━━━━━┪
			6│                 ║    ┃targ║et         ┃
			0│                 ║    ┃    ║           ┃
			0│                 ║    ┃    ║           ┃
			┅└─────────────────╫────┺━━━━╫━━━━━━━━━━━┛
			                   ╚═════════╝
		======================================================*/
		
		self.view.nal.layout(self.target) { $0
			.pinTopLeft(to: self.guide, with: { $0.middleCenter })
			.setBottomRight(by: { $0.bottomRight })
		}
		
		XCTAssertEqual(self.target.frame, .init(x: 460, y: 420, width: 340, height: 180))
		
	}
	
	func testCase3() {
		
		/*======================================================
			0┇      200┇      400┇      600┇      800┇
			┅┌───────────────────────────────────────┐
			 │╔════╦───────────────────────────────┐ │
			2│║    ║                               │ │
			0│┣━╦╦━╬━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┪ │
			0│┃ ║║ ║                               ┃ │
			┅│┣━╩╩━╬━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩ │
			 │╠════╝                               │ │
			4││                                    │ │
			0││                                    │ │
			0││                                    │ │
			┅││                                    │ │
			 ││                                    │ │
			6││                                    │ │
			0││                                    │ │
			0│└────────────────────────────────────┘ │
			┅└───────────────────────────────────────┘
		
		======================================================*/
		
		self.view.nal.layout(self.target) { $0
			.setLeft(by: { $0.layoutMarginsGuide.left })
			.setRight(by: { $0.layoutMarginsGuide.right })
			.pinTop(to: self.guide, with: { $0.layoutMarginsGuide.top })
			.pinBottom(to: self.guide, with: { $0.layoutMarginsGuide.bottom })
		}
		
		XCTAssertEqual(self.target.frame, .init(x: 20, y: 80, width: 740, height: 100))
		
	}
	
	func testPerformance() {
		
		self.measure {
			// Put the code you want to measure the time of here.
			self.view.nal.layout(self.target, by: { $0
				.setMiddleCenter(by: { $0.middleCenter })
				.aspectFill()
			})
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
	
	private(set) lazy var targetView: UIView = {
		let view = UIView()
		return view
	}()
	
	override func loadView() {
		let view = UIView(frame: .init(x: 0, y: 0, width: 800, height: 600))
		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.layoutMargins = .init(top: 10, left: 20, bottom: 30, right: 40)
		self.view.addSubview(self.guideView)
		self.view.addSubview(self.targetView)
	}
	
}

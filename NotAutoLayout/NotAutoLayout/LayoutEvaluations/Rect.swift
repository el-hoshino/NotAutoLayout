//
//  Rect.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Rect {
	
	var origin: CGPoint
	
	var size: CGSize
	
}

extension Rect {
	
	init(from cgRect: CGRect) {
		
		self.origin = cgRect.origin
		
		self.size = cgRect.size
		
	}
	
}

extension Rect {
	
	static let zero: Rect  = .init(origin: .zero, size: .zero)
	
}

extension Rect {
	
	func horizontalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.origin.x + (self.size.width * coordinate)
	}
	
	func verticalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.origin.y + (self.size.height * coordinate)
	}
	
	func pointGeometry(x: CGFloat, y: CGFloat) -> CGPoint {
		let x = self.horizontalGeometry(at: x)
		let y = self.verticalGeometry(at: x)
		return .init(x: x, y: y)
	}
	
	func pointGeometry(at coordinate: CGPoint) -> CGPoint {
		return self.pointGeometry(x: coordinate.x, y: coordinate.y)
	}
	
}

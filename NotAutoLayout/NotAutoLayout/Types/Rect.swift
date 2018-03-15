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
    
    var left: CGFloat {
        return self.origin.x
    }
    
    var center: CGFloat {
        return self.horizontalGeometry(at: 0.5)
    }
    
    var right: CGFloat {
        return self.left + self.width
    }
    
    var width: CGFloat {
        return self.size.width
    }
    
}

extension Rect {
    
    var top: CGFloat {
        return self.origin.y
    }
    
    var middle: CGFloat {
        return self.verticalGeometry(at: 0.5)
    }
    
    var bottom: CGFloat {
        return self.top + self.height
    }
    
    var height: CGFloat {
        return self.size.height
    }
    
}

extension Rect {
    
    var topLeft: CGPoint {
        return .init(x: self.left, y: self.top)
    }
    
    var topCenter: CGPoint {
        return .init(x: self.center, y: self.top)
    }
    
    var topRight: CGPoint {
        return .init(x: self.right, y: self.top)
    }
    
    var middleLeft: CGPoint {
        return .init(x: self.left, y: self.middle)
    }
    
    var middleCenter: CGPoint {
        return .init(x: self.center, y: self.middle)
    }
    
    var middleRight: CGPoint {
        return .init(x: self.right, y: self.middle)
    }
    
    var bottomLeft: CGPoint {
        return .init(x: self.left, y: self.bottom)
    }
    
    var bottomCenter: CGPoint {
        return .init(x: self.center, y: self.bottom)
    }
    
    var bottomRight: CGPoint {
        return .init(x: self.right, y: self.bottom)
    }
    
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
		let y = self.verticalGeometry(at: y)
		return .init(x: x, y: y)
	}
	
	func pointGeometry(at coordinate: CGPoint) -> CGPoint {
		return self.pointGeometry(x: coordinate.x, y: coordinate.y)
	}
	
}

extension Rect {
    
    var frame: CGRect {
        return .init(origin: self.origin, size: self.size)
    }
    
    func frame(inside insets: UIEdgeInsets) -> CGRect {
        return self.frame.frame(inside: insets)
    }
    
}

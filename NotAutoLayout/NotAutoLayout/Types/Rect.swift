//
//  Rect.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Rect {
	
    public var origin: Point
    public var size: Size
    
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    public init(x: Float, y: Float, width: Float, height: Float) {
        self.origin = Point(x: x, y: y)
        self.size = Size(width: width, height: height)
    }
	
}

extension Rect {
	
    public static let zero: Rect  = .init(origin: .zero, size: .zero)
    
    public static let identity: Rect = .init(origin: .zero, size: .identity)
	
}

extension Rect: CGTypeConvertible {
    
    public var cgValue: CGRect {
        return .init(origin: self.origin.cgValue, size: self.size.cgValue)
    }
    
    public init(_ rect: CGRect) {
        
        self.origin = Point(rect.origin)
        self.size = Size(rect.size)
        
    }
    
}

extension Rect {
    
    var left: Float {
        return self.origin.x
    }
    
    var center: Float {
        return self.horizontalGeometry(at: 0.5)
    }
    
    var right: Float {
        return self.left + self.width
    }
    
    var width: Float {
        return self.size.width
    }
    
}

extension Rect {
    
    var top: Float {
        return self.origin.y
    }
    
    var middle: Float {
        return self.verticalGeometry(at: 0.5)
    }
    
    var bottom: Float {
        return self.top + self.height
    }
    
    var height: Float {
        return self.size.height
    }
    
}

extension Rect {
    
    var topLeft: Point {
        return .init(x: self.left, y: self.top)
    }
    
    var topCenter: Point {
        return .init(x: self.center, y: self.top)
    }
    
    var topRight: Point {
        return .init(x: self.right, y: self.top)
    }
    
    var middleLeft: Point {
        return .init(x: self.left, y: self.middle)
    }
    
    var middleCenter: Point {
        return .init(x: self.center, y: self.middle)
    }
    
    var middleRight: Point {
        return .init(x: self.right, y: self.middle)
    }
    
    var bottomLeft: Point {
        return .init(x: self.left, y: self.bottom)
    }
    
    var bottomCenter: Point {
        return .init(x: self.center, y: self.bottom)
    }
    
    var bottomRight: Point {
        return .init(x: self.right, y: self.bottom)
    }
    
}

extension Rect {
	
	func horizontalGeometry(at coordinate: Float) -> Float {
		return self.origin.x + (self.size.width * coordinate)
	}
	
	func verticalGeometry(at coordinate: Float) -> Float {
		return self.origin.y + (self.size.height * coordinate)
	}
	
	func pointGeometry(x: Float, y: Float) -> Point {
		let x = self.horizontalGeometry(at: x)
		let y = self.verticalGeometry(at: y)
		return .init(x: x, y: y)
	}
	
	func pointGeometry(at coordinate: Point) -> Point {
		return self.pointGeometry(x: coordinate.x, y: coordinate.y)
	}
	
}

extension Rect {
    
    var frame: CGRect {
        return self.cgValue
    }
    
    func frame(inside insets: UIEdgeInsets) -> CGRect {
        return self.frame.frame(inside: insets)
    }
    
}

extension Rect {
	
	var horizontalSpan: Span {
		return Span(horizontalFrom: self)
	}
	
	var verticalSpan: Span {
		return Span(verticalFrom: self)
	}
	
}

extension Rect: CustomStringConvertible {
    
    public var description: String {
        return "(origin: \(self.origin), size: \(self.size))"
    }
    
}

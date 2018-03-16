//
//  PinGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol HorizontalPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.Horizontal.Guide { get }
	
	var left: Float { get }
	
	var center: Float { get }
	
	var right: Float { get }
	
	func horizontal(at relativePosition: Float) -> Float
	
	var leading: Float { get }
	
	var trailing: Float { get }
	
}

public protocol VerticalPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.Vertical.Guide { get }
	
	var top: Float { get }
	
	var middle: Float { get }
	
	var bottom: Float { get }
	
	func vertical(at relativePosition: Float) -> Float
	
}

public protocol PointPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.Point.Guide { get }
	
	var topLeft: Point { get }
	
	var topCenter: Point { get }
	
	var topRight: Point { get }
	
	var middleLeft: Point { get }
	
	var middleCenter: Point { get }
	
	var middleRight: Point { get }
	
	var bottomLeft: Point { get }
	
	var bottomCenter: Point { get }
	
	var bottomRight: Point { get }
	
	func point(at relativePosition: Point) -> Point
	
	func pointAt(x: Float, y: Float) -> Point
	
	var topLeading: Point { get }
	
	var topTrailing: Point { get }
	
	var midddleLeading: Point { get }
	
	var middleTrailing: Point { get }
	
	var bottomLeading: Point { get }
	
	var bottomTrailing: Point { get }
	
}

extension HorizontalPinGuideRepresentable {
	
	public var left: Float {
		return self.pinGuide.left
	}
	
	public var center: Float {
		return self.pinGuide.center
	}
	
	public var right: Float {
		return self.pinGuide.right
	}
	
	public func horizontal(at relativePosition: Float) -> Float {
		return self.pinGuide.horizontal(at: relativePosition)
	}
	
	public var leading: Float {
		return self.pinGuide.leading
	}
	
	public var trailing: Float {
		return self.pinGuide.trailing
	}
	
}

extension VerticalPinGuideRepresentable {
	
	public var top: Float {
		return self.pinGuide.top
	}
	
	public var middle: Float {
		return self.pinGuide.middle
	}
	
	public var bottom: Float {
		return self.pinGuide.bottom
	}
	
	public func vertical(at relativePosition: Float) -> Float {
		return self.pinGuide.vertical(at: relativePosition)
	}
	
}

extension PointPinGuideRepresentable {
	
	public var topLeft: Point {
		return self.pinGuide.topLeft
	}
	
	public var topCenter: Point {
		return self.pinGuide.topCenter
	}
	
	public var topRight: Point {
		return self.pinGuide.topRight
	}
	
	public var middleLeft: Point {
		return self.pinGuide.middleLeft
	}
	
	public var middleCenter: Point {
		return self.pinGuide.middleCenter
	}
	
	public var middleRight: Point {
		return self.pinGuide.middleRight
	}
	
	public var bottomLeft: Point {
		return self.pinGuide.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self.pinGuide.bottomCenter
	}
	
	public var bottomRight: Point {
		return self.pinGuide.bottomRight
	}
	
	public func point(at relativePosition: Point) -> Point {
		return self.pinGuide.point(at: relativePosition)
	}
	
	public func pointAt(x: Float, y: Float) -> Point {
		return self.pinGuide.pointAt(x: x, y: y)
	}
	
	public var topLeading: Point {
		return self.pinGuide.topLeading
	}
	
	public var topTrailing: Point {
		return self.pinGuide.topTrailing
	}
	
	public var midddleLeading: Point {
		return self.pinGuide.midddleLeading
	}
	
	public var middleTrailing: Point {
		return self.pinGuide.middleTrailing
	}
	
	public var bottomLeading: Point {
		return self.pinGuide.bottomLeading
	}
	
	public var bottomTrailing: Point {
		return self.pinGuide.bottomTrailing
	}
	
}

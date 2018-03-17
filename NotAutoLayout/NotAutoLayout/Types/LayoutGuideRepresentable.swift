//
//  LayoutGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutGuideRepresentable {
	
	var layoutGuide: ViewLayoutGuides.Guide { get }
	
	var left: Float { get }
	
	var center: Float { get }
	
	var right: Float { get }
	
	var width: Float { get }
	
	func horizontal(at relativePosition: Float) -> Float
	
	var top: Float { get }
	
	var middle: Float { get }
	
	var bottom: Float { get }
	
	var height: Float { get }
	
	func vertical(at relativePosition: Float) -> Float
	
	var topLeft: Point { get }
	
	var topCenter: Point { get }
	
	var topRight: Point { get }
	
	var middleLeft: Point { get }
	
	var middleCenter: Point { get }
	
	var middleRight: Point { get }
	
	var bottomLeft: Point { get }
	
	var bottomCenter: Point { get }
	
	var bottomRight: Point { get }
	
	var size: Size { get }
	
	func point(at relativePoint: Point) -> Point
	
	var frame: Rect { get }
	
	func frame(inside insets: Insets) -> Rect
	
	var leading: Float { get }
	
	var trailing: Float { get }

}

extension LayoutGuideRepresentable {
	
	public var left: Float {
		return self.layoutGuide.left
	}
	
	public var center: Float {
		return self.layoutGuide.center
	}
	
	public var right: Float {
		return self.layoutGuide.right
	}
	
	public var width: Float {
		return self.layoutGuide.width
	}
	
	public func horizontal(at relativePosition: Float) -> Float {
		return self.layoutGuide.horizontal(at: relativePosition)
	}
	
	public var top: Float {
		return self.layoutGuide.top
	}
	
	public var middle: Float {
		return self.layoutGuide.middle
	}
	
	public var bottom: Float {
		return self.layoutGuide.bottom
	}
	
	public var height: Float {
		return self.layoutGuide.height
	}
	
	public func vertical(at relativePosition: Float) -> Float {
		return self.layoutGuide.vertical(at: relativePosition)
	}
	
	public var topLeft: Point {
		return self.layoutGuide.topLeft
	}
	
	public var topCenter: Point {
		return self.layoutGuide.topCenter
	}
	
	public var topRight: Point {
		return self.layoutGuide.topRight
	}
	
	public var middleLeft: Point {
		return self.layoutGuide.middleLeft
	}
	
	public var middleCenter: Point {
		return self.layoutGuide.middleCenter
	}
	
	public var middleRight: Point {
		return self.layoutGuide.middleRight
	}
	
	public var bottomLeft: Point {
		return self.layoutGuide.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self.layoutGuide.bottomCenter
	}
	
	public var bottomRight: Point {
		return self.layoutGuide.bottomRight
	}
	
	public var size: Size {
		return self.layoutGuide.size
	}
	
	public func point(at relativePoint: Point) -> Point {
		return self.layoutGuide.point(at: relativePoint)
	}
	
	public var frame: Rect {
		return self.layoutGuide.frame
	}
	
	public func frame(inside insets: Insets) -> Rect {
		return self.layoutGuide.frame(inside: insets)
	}
	
	public var leading: Float {
		return self.layoutGuide.leading
	}
	
	public var trailing: Float {
		return self.layoutGuide.trailing
	}
	
}

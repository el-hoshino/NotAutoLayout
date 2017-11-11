//
//  CGRect.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGRect {
	
	@available(*, introduced: 2.0, deprecated: 2.2, renamed: "HorizontalBaseLine")
	public typealias HorizontalBasePoint = HorizontalBaseLine
	
	public struct HorizontalBaseLine {
		
		var value: CGFloat
		
	}
	
	@available(*, introduced: 2.0, deprecated: 2.2, renamed: "VerticalBaseLine")
	public typealias VerticalBasePoint = VerticalBaseLine
	
	public struct VerticalBaseLine {
		
		var value: CGFloat
		
	}
	
	public struct PlaneBasePoint {
		
		var value: CGPoint
		
	}
	
}

extension CGRect.HorizontalBaseLine {
	
	public static let left		= CGRect.HorizontalBaseLine(value: 0)
	public static let center	= CGRect.HorizontalBaseLine(value: 0.5)
	public static let right		= CGRect.HorizontalBaseLine(value: 1)
	
}

extension CGRect.HorizontalBaseLine {
	
	func value(in frame: CGRect) -> CGFloat {
		return frame.width * self.value + frame.x
	}
	
}

extension CGRect.HorizontalBaseLine: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = CGFloat(value)
	}
	
}

extension CGRect.VerticalBaseLine {
	
	public static let top		= CGRect.VerticalBaseLine(value: 0)
	public static let middle	= CGRect.VerticalBaseLine(value: 0.5)
	public static let bottom	= CGRect.VerticalBaseLine(value: 1)
	
}

extension CGRect.VerticalBaseLine {
	
	func value(in frame: CGRect) -> CGFloat {
		return frame.height * self.value + frame.y
	}
	
}

extension CGRect.VerticalBaseLine: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = CGFloat(value)
	}
	
}

extension CGRect.PlaneBasePoint {
	
	public init(point: CGPoint) {
		self.value = point
	}
	
	public init(x: CGFloat, y: CGFloat) {
		let point = CGPoint(x: x, y: y)
		self.value = point
	}
	
}

extension CGRect.PlaneBasePoint {
	
	public static let topLeft		= CGRect.PlaneBasePoint(x: 0.0, y: 0.0)
	public static let topCenter		= CGRect.PlaneBasePoint(x: 0.5, y: 0.0)
	public static let topRight		= CGRect.PlaneBasePoint(x: 1.0, y: 0.0)
	public static let middleLeft	= CGRect.PlaneBasePoint(x: 0.0, y: 0.5)
	public static let middleCenter	= CGRect.PlaneBasePoint(x: 0.5, y: 0.5)
	public static let middleRight	= CGRect.PlaneBasePoint(x: 1.0, y: 0.5)
	public static let bottomLeft	= CGRect.PlaneBasePoint(x: 0.0, y: 1.0)
	public static let bottomCenter	= CGRect.PlaneBasePoint(x: 0.5, y: 1.0)
	public static let bottomRight	= CGRect.PlaneBasePoint(x: 1.0, y: 1.0)
	
}

extension CGRect.PlaneBasePoint {
	
	func value(in frame: CGRect) -> CGPoint {
		let x = frame.width * self.value.x + frame.x
		let y = frame.height * self.value.y + frame.y
		return CGPoint(x: x, y: y)
	}
	
}

extension CGRect.HorizontalBaseLine {
	
	func originOffset(from widthDiff: CGFloat) -> CGFloat {
		
		return 0 - (widthDiff * self.value)
		
	}
	
}

extension CGRect.VerticalBaseLine {
	
	func originOffset(from heightDiff: CGFloat) -> CGFloat {
		
		return 0 - (heightDiff * self.value)
		
	}
	
}

extension CGRect.PlaneBasePoint {
	
	func originOffset(from sizeDiff: CGSize) -> CGPoint {
		
		let x = 0 - (sizeDiff.width * self.value.x)
		let y = 0 - (sizeDiff.height * self.value.y)
		return CGPoint(x: x, y: y)
		
	}
	
}

extension CGRect {
	
	func inside(_ insets: UIEdgeInsets) -> CGRect {
		
		let x = self.origin.x + insets.left
		let y = self.origin.y + insets.top
		let width = self.width - insets.width
		let height = self.height - insets.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension CGRect {
	
	var x: CGFloat{
		return self.origin.x
	}
	
	var y: CGFloat {
		return self.origin.y
	}
	
	var left: CGFloat {
		return self.minX
	}
	
	var center: CGFloat {
		return self.midX
	}
	
	var right: CGFloat {
		return maxX
	}
	
	var top: CGFloat {
		return self.minY
	}
	
	var middle: CGFloat {
		return self.midY
	}
	
	var bottom: CGFloat {
		return maxY
	}
	
	var halfWidth: CGFloat {
		return self.width / 2
	}
	
	var halfHeight: CGFloat {
		return self.height / 2
	}
	
	var topLeft: CGPoint {
		return CGPoint(x: self.left, y: self.top)
	}
	
	var topCenter: CGPoint {
		return CGPoint(x: self.center, y: self.top)
	}
	
	var topRight: CGPoint {
		return CGPoint(x: self.right, y: self.top)
	}
	
	var middleLeft: CGPoint {
		return CGPoint(x: self.left, y: self.middle)
	}
	
	var middleCenter: CGPoint {
		return CGPoint(x: self.center, y: self.middle)
	}
	var middleRight: CGPoint {
		return CGPoint(x: self.right, y: self.middle)
	}
	
	var bottomLeft: CGPoint {
		return CGPoint(x: self.left, y: self.bottom)
	}
	
	var bottomCenter: CGPoint {
		return CGPoint(x: self.center, y: self.bottom)
	}
	
	var bottomRight: CGPoint {
		return CGPoint(x: self.right, y: self.bottom)
	}
	
}

extension CGRect {
	
	mutating func moveLeft(to xGoal: CGFloat) {
		self.origin.x = xGoal
	}
	
	mutating func moveCenter(to xGoal: CGFloat) {
		self.origin.x = xGoal - self.halfWidth
	}
	
	mutating func moveRight(to xGoal: CGFloat) {
		self.origin.x = xGoal - self.width
	}
	
	mutating func moveTop(to yGoal: CGFloat) {
		self.origin.y = yGoal
	}
	
	mutating func moveMiddle(to yGoal: CGFloat) {
		self.origin.y = yGoal - self.halfHeight
	}
	
	mutating func moveBottom(to yGoal: CGFloat) {
		self.origin.y = yGoal - self.height
	}
	
	mutating func moveX(by xOffset: CGFloat) {
		self.origin.x += xOffset
	}
	
	mutating func moveY(by yOffset: CGFloat) {
		self.origin.y += yOffset
	}
	
	mutating func moveOrigin(by offset: CGPoint) {
		self.origin.x += offset.x
		self.origin.y += offset.y
	}
	
	mutating func pinchLeft(to xGoal: CGFloat) {
		let widthDiff = self.left - xGoal
		self.origin.x = xGoal
		self.size.width += widthDiff
	}
	
	mutating func pinchLeft(by xOffset: CGFloat) {
		let widthDiff = -xOffset
		self.origin.x += xOffset
		self.size.width += widthDiff
	}
	
	mutating func pinchRight(to xGoal: CGFloat) {
		let widthDiff = xGoal - self.right
		self.size.width += widthDiff
	}
	
	mutating func pinchRight(by xOffset: CGFloat) {
		let widthDiff = xOffset
		self.size.width += widthDiff
	}
	
	mutating func pinchTop(to yGoal: CGFloat) {
		let heightDiff = self.top - yGoal
		self.origin.y = yGoal
		self.size.height += heightDiff
	}
	
	mutating func pinchTop(by yOffset: CGFloat) {
		let heightDiff = -yOffset
		self.origin.y += yOffset
		self.size.height += heightDiff
	}
	
	mutating func pinchBottom(to yGoal: CGFloat) {
		let heightDiff = yGoal - self.bottom
		self.size.height += heightDiff
	}
	
	mutating func pinchBottom(by yOffset: CGFloat) {
		let heightDiff = yOffset
		self.size.height += heightDiff
	}
	
	mutating func expandWidth(to widthGoal: CGFloat, from baseline: CGRect.HorizontalBaseLine) {
		
		let widthDiff = widthGoal - self.width
		self.size.width = widthGoal
		self.origin.x += baseline.originOffset(from: widthDiff)
		
	}
	
	mutating func expandWidth(by widthDiff: CGFloat, from baseline: CGRect.HorizontalBaseLine) {
		
		self.size.width += widthDiff
		self.origin.x += baseline.originOffset(from: widthDiff)
		
	}
	
	mutating func expandHeight(to heightGoal: CGFloat, from baseline: CGRect.VerticalBaseLine) {
		
		let heightDiff = heightGoal - self.height
		self.size.height = heightGoal
		self.origin.y += baseline.originOffset(from: heightDiff)
		
	}
	
	mutating func expandHeight(by heightDiff: CGFloat, from baseline: CGRect.VerticalBaseLine) {
		
		self.size.height += heightDiff
		self.origin.y += baseline.originOffset(from: heightDiff)
		
	}
	
	mutating func expandSize(to sizeGoal: CGSize, from basepoint: CGRect.PlaneBasePoint) {
		
		let sizeDiff = sizeGoal - self.size
		self.size = sizeGoal
		self.origin = basepoint.originOffset(from: sizeDiff)
		
	}
	
	mutating func expandSize(by sizeDiff: CGSize, from basepoint: CGRect.PlaneBasePoint) {
		
		self.size += sizeDiff
		self.origin += basepoint.originOffset(from: sizeDiff)
		
	}
	
}

extension CGRect {
	
	func movingLeft(to xGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveLeft(to: xGoal)
		return frame
	}
	
	func movingCenter(to xGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveCenter(to: xGoal)
		return frame
	}
	
	func movingRight(to xGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveRight(to: xGoal)
		return frame
	}
	
	func movingTop(to yGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveTop(to: yGoal)
		return frame
	}
	
	func movingMiddle(to yGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveMiddle(to: yGoal)
		return frame
	}
	
	func movingBottom(to yGoal: CGFloat) -> CGRect {
		var frame = self
		frame.moveBottom(to: yGoal)
		return frame
	}
	
	func movingX(by xOffset: CGFloat) -> CGRect {
		var frame = self
		frame.moveX(by: xOffset)
		return frame
	}
	
	func movingY(by yOffset: CGFloat) -> CGRect {
		var frame = self
		frame.moveY(by: yOffset)
		return frame
	}
	
	func movingOrigin(by offset: CGPoint) -> CGRect {
		var frame = self
		frame.moveOrigin(by: offset)
		return frame
	}
	
	func pinchingLeft(to xGoal: CGFloat) -> CGRect {
		var frame = self
		frame.pinchLeft(to: xGoal)
		return frame
	}
	
	func pinchingLeft(by xOffset: CGFloat) -> CGRect {
		var frame = self
		frame.pinchLeft(by: xOffset)
		return frame
	}
	
	func pinchingRight(to xGoal: CGFloat) -> CGRect {
		var frame = self
		frame.pinchRight(to: xGoal)
		return frame
	}
	
	func pinchingRight(by xOffset: CGFloat) -> CGRect {
		var frame = self
		frame.pinchRight(by: xOffset)
		return frame
	}
	
	func pinchingTop(to yGoal: CGFloat) -> CGRect {
		var frame = self
		frame.pinchTop(to: yGoal)
		return frame
	}
	
	func pinchingTop(by yOffset: CGFloat) -> CGRect {
		var frame = self
		frame.pinchTop(by: yOffset)
		return frame
	}
	
	func pinchingBottom(to yGoal: CGFloat) -> CGRect {
		var frame = self
		frame.pinchBottom(to: yGoal)
		return frame
	}
	
	func pinchingBottom(by yOffset: CGFloat) -> CGRect {
		var frame = self
		frame.pinchBottom(by: yOffset)
		return frame
	}
	
	func expandingWidth(to widthGoal: CGFloat, from baseline: CGRect.HorizontalBaseLine) -> CGRect {
		var frame = self
		frame.expandWidth(to: widthGoal, from: baseline)
		return frame
	}
	
	func expandingWidth(by widthDiff: CGFloat, from baseline: CGRect.HorizontalBaseLine) -> CGRect {
		var frame = self
		frame.expandWidth(by: widthDiff, from: baseline)
		return frame
	}
	
	func expandingHeight(to heightGoal: CGFloat, from baseline: CGRect.VerticalBaseLine) -> CGRect {
		var frame = self
		frame.expandHeight(to: heightGoal, from: baseline)
		return frame
	}
	
	func expandingHeight(by heightDiff: CGFloat, from baseline: CGRect.VerticalBaseLine) -> CGRect {
		var frame = self
		frame.expandHeight(by: heightDiff, from: baseline)
		return frame
	}
	
	func expandingSize(to sizeGoal: CGSize, from basepoint: CGRect.PlaneBasePoint) -> CGRect {
		var frame = self
		frame.expandSize(to: sizeGoal, from: basepoint)
		return frame
	}
	
	func expandingSize(by sizeDiff: CGSize, from basepoint: CGRect.PlaneBasePoint) -> CGRect {
		var frame = self
		frame.expandSize(by: sizeDiff, from: basepoint)
		return frame
	}

}

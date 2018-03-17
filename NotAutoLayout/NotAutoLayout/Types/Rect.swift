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
	
	public var left: Float {
		return self.origin.x
	}
	
	public var center: Float {
		return self.horizontalGeometry(at: 0.5)
	}
	
	public var right: Float {
		return self.left + self.width
	}
	
	public var width: Float {
		return self.size.width
	}
	
}

extension Rect {
	
	public var top: Float {
		return self.origin.y
	}
	
	public var middle: Float {
		return self.verticalGeometry(at: 0.5)
	}
	
	public var bottom: Float {
		return self.top + self.height
	}
	
	public var height: Float {
		return self.size.height
	}
	
}

extension Rect {
	
	public var topLeft: Point {
		return .init(x: self.left, y: self.top)
	}
	
	public var topCenter: Point {
		return .init(x: self.center, y: self.top)
	}
	
	public var topRight: Point {
		return .init(x: self.right, y: self.top)
	}
	
	public var middleLeft: Point {
		return .init(x: self.left, y: self.middle)
	}
	
	public var middleCenter: Point {
		return .init(x: self.center, y: self.middle)
	}
	
	public var middleRight: Point {
		return .init(x: self.right, y: self.middle)
	}
	
	public var bottomLeft: Point {
		return .init(x: self.left, y: self.bottom)
	}
	
	public var bottomCenter: Point {
		return .init(x: self.center, y: self.bottom)
	}
	
	public var bottomRight: Point {
		return .init(x: self.right, y: self.bottom)
	}
	
}

extension Rect {
	
	public var horizontalSpan: Span {
		return Span(horizontalFrom: self)
	}
	
	public var verticalSpan: Span {
		return Span(verticalFrom: self)
	}
	
}

extension Rect {
	
	public func horizontalGeometry(at coordinate: Float) -> Float {
		return self.origin.x + (self.size.width * coordinate)
	}
	
	public func verticalGeometry(at coordinate: Float) -> Float {
		return self.origin.y + (self.size.height * coordinate)
	}
	
	public func pointGeometry(x: Float, y: Float) -> Point {
		let x = self.horizontalGeometry(at: x)
		let y = self.verticalGeometry(at: y)
		return .init(x: x, y: y)
	}
	
	public func pointGeometry(at coordinate: Point) -> Point {
		return self.pointGeometry(x: coordinate.x, y: coordinate.y)
	}
	
}

extension Rect {
	
	func convertedBy(targetView: UIView?, superView: UIView?) -> Rect {
		
		guard let targetView = targetView,
			let superView = superView
		else {
			return .zero
		}
		
		if targetView === superView {
			return self
			
		} else {
			let frame = superView.convert(self.cgValue, to: targetView)
			return Rect(frame)
		}
		
	}
	
}

extension Rect {
	
	public func rect(inside insets: Insets) -> Rect {
		let frame = UIEdgeInsetsInsetRect(self.cgValue, insets.cgValue)
		return Rect(frame)
	}
	
}

extension Rect {
	
	mutating func moveLeft(to xGoal: Float) {
		self.origin.x = xGoal
	}
	
	mutating func moveCenter(to xGoal: Float) {
		self.origin.x = xGoal - self.width.half
	}
	
	mutating func moveRight(to xGoal: Float) {
		self.origin.x = xGoal - self.width
	}
	
	mutating func moveTop(to yGoal: Float) {
		self.origin.y = yGoal
	}
	
	mutating func moveMiddle(to yGoal: Float) {
		self.origin.y = yGoal - self.height.half
	}
	
	mutating func moveBottom(to yGoal: Float) {
		self.origin.y = yGoal - self.height
	}
	
	mutating func moveX(by xOffset: Float) {
		self.origin.x += xOffset
	}
	
	mutating func moveY(by yOffset: Float) {
		self.origin.y += yOffset
	}
	
	mutating func moveOrigin(by offset: Point) {
		self.origin.x += offset.x
		self.origin.y += offset.y
	}
	
	mutating func pinchLeft(to xGoal: Float) {
		let widthDiff = self.left - xGoal
		self.origin.x = xGoal
		self.size.width += widthDiff
	}
	
	mutating func pinchLeft(by xOffset: Float) {
		let widthDiff = -xOffset
		self.origin.x += xOffset
		self.size.width += widthDiff
	}
	
	mutating func pinchRight(to xGoal: Float) {
		let widthDiff = xGoal - self.right
		self.size.width += widthDiff
	}
	
	mutating func pinchRight(by xOffset: Float) {
		let widthDiff = xOffset
		self.size.width += widthDiff
	}
	
	mutating func pinchTop(to yGoal: Float) {
		let heightDiff = self.top - yGoal
		self.origin.y = yGoal
		self.size.height += heightDiff
	}
	
	mutating func pinchTop(by yOffset: Float) {
		let heightDiff = -yOffset
		self.origin.y += yOffset
		self.size.height += heightDiff
	}
	
	mutating func pinchBottom(to yGoal: Float) {
		let heightDiff = yGoal - self.bottom
		self.size.height += heightDiff
	}
	
	mutating func pinchBottom(by yOffset: Float) {
		let heightDiff = yOffset
		self.size.height += heightDiff
	}
	
	mutating func expandWidth(to widthGoal: Float, from coordinateBaseline: Line.Horizontal) {
		
		let widthDiff = widthGoal - self.width
		self.size.width = widthGoal
		self.origin.x += self.geometryOriginXDiff(fromCoordinateBaseline: coordinateBaseline, withWidthDiff: widthDiff)
		
	}
	
	mutating func expandWidth(by widthDiff: Float, from baseline: Line.Horizontal) {
		
		self.size.width += widthDiff
		self.origin.x += self.geometryOriginXDiff(fromCoordinateBaseline: baseline, withWidthDiff: widthDiff)
		
	}
	
	mutating func expandHeight(to heightGoal: Float, from baseline: Line.Vertical) {
		
		let heightDiff = heightGoal - self.height
		self.size.height = heightGoal
		self.origin.y += self.geometryOriginYDiff(fromCoordinateBaseline: baseline, withHeightDiff: heightDiff)
		
	}
	
	mutating func expandHeight(by heightDiff: Float, from baseline: Line.Vertical) {
		
		self.size.height += heightDiff
		self.origin.y += self.geometryOriginYDiff(fromCoordinateBaseline: baseline, withHeightDiff: heightDiff)
		
	}
	
	mutating func expandSize(to sizeGoal: Size, from basepoint: Point) {
		
		let sizeDiff = sizeGoal - self.size
		self.size = sizeGoal
		self.origin = self.geometryOriginDiff(fromCoordinateBasePoint: basepoint, withSizeDiff: sizeDiff)
		
	}
	
	mutating func expandSize(by sizeDiff: Size, from basepoint: Point) {
		
		self.size += sizeDiff
		self.origin += self.geometryOriginDiff(fromCoordinateBasePoint: basepoint, withSizeDiff: sizeDiff)
		
	}
	
}

extension Rect {
	
	private func geometryOriginXDiff(fromCoordinateBaseline line: Line.Horizontal, withWidthDiff diff: Float) -> Float {
		return 0 - (diff * line.value)
	}
	
	private func geometryOriginYDiff(fromCoordinateBaseline line: Line.Vertical, withHeightDiff diff: Float) -> Float {
		return 0 - (diff * line.value)
	}
	
	private func geometryOriginDiff(fromCoordinateBasePoint point: Point, withSizeDiff diff: Size) -> Point {
		let x = 0 - (diff.width * point.x)
		let y = 0 - (diff.height * point.y)
		return .init(x: x, y: y)
	}
	
}

extension Rect: CustomStringConvertible {
	
	public var description: String {
		return "(origin: \(self.origin), size: \(self.size))"
	}
	
}

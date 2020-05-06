//
//  Rect.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows a rect with origin point and size.
///
/// Basically it behaves like a `CGRect` type that has the same properties `origin` and `size`, but since it's declared as another type just in NotAutoLayout, you can add any extensions you want and that won't affect the system's `CGRect` type. For example, I have defined properties like `topLeft` and `bottomRight`, as well as methods like `rect(inside: insets)`. You can safely use them with `Rect` type values, and they will not cause any confliction if you have defined the same functions for `CGRect`.
///
/// Conforms to: `CGTypeConvertible`.
public struct Rect {
	
	/// The origin point of the rect.
	public var origin: Point
	
	/// The size of the rect.
	public var size: Size
	
	/// Initializes a `Rect` with origin (as `origin`) and size (as `size`).
	public init(origin: Point, size: Size) {
		self.origin = origin
		self.size = size
	}
	
	/// Initializes a `Rect` with origin's x position (as `x`), origin's y position (as `y`), size's width (as `width`) and size's height (as `height`).
	public init(x: Float, y: Float, width: Float, height: Float) {
		self.origin = Point(x: x, y: y)
		self.size = Size(width: width, height: height)
	}
	
}

extension Rect {
	
	/// A rect that both `origin` and `size` are `.zero`
	public static let zero: Rect  = .init(origin: .zero, size: .zero)
	
	/// A rect that `origin` is `.zero` and `size` is `.identity`.
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
	
	/// The left position in the rect, which is produced by `self.origin.x`
	public var left: Float {
		return self.origin.x
	}
	
	/// The center position in the rect, which is produced by `self.origin.x + (self.size.width * 0.5)`
	public var center: Float {
		return self.horizontalGeometry(at: 0.5)
	}
	
	/// The right position in the rect, which is produced by `self.origin.x + self.size.width`
	public var right: Float {
		return self.left + self.width
	}
	
	/// The origin's x position of the rect, which is produced by `self.origin.x`
	public var x: Float {
		return self.origin.x
	}
	
	/// The width of the rect, which is produced by `self.size.width`
	public var width: Float {
		return self.size.width
	}
	
}

extension Rect {
	
	/// The top position in the rect, which is produced by `self.origin.y`
	public var top: Float {
		return self.origin.y
	}
	
	/// The middle position in the rect, which is produced by `self.origin.y + (self.size.height * 0.5)`
	public var middle: Float {
		return self.verticalGeometry(at: 0.5)
	}
	
	/// The bottom position in the rect, which is produced by `self.origin.y + self.size.height`
	public var bottom: Float {
		return self.top + self.height
	}
	
	/// The origin's y position of the rect, which is produced by `self.origin.y`
	public var y: Float {
		return self.origin.y
	}
	
	/// The height of the rect, which is produced by `self.size.height`
	public var height: Float {
		return self.size.height
	}
	
}

extension Rect {
	
	/// The top left point in the rect, which is produced by `Point(x: self.left, y: self.top)`
	public var topLeft: Point {
		return .init(x: self.left, y: self.top)
	}
	
	/// The top center point in the rect, which is produced by `Point(x: self.center, y: self.top)`
	public var topCenter: Point {
		return .init(x: self.center, y: self.top)
	}
	
	/// The top right point in the rect, which is produced by `Point(x: self.right, y: self.top)`
	public var topRight: Point {
		return .init(x: self.right, y: self.top)
	}
	
	/// The middle left point in the rect, which is produced by `Point(x: self.left, y: self.middle)`
	public var middleLeft: Point {
		return .init(x: self.left, y: self.middle)
	}
	
	/// The middle center point in the rect, which is produced by `Point(x: self.center, y: self.middle)`
	public var middleCenter: Point {
		return .init(x: self.center, y: self.middle)
	}
	
	/// The middle right point in the rect, which is produced by `Point(x: self.right, y: self.middle)`
	public var middleRight: Point {
		return .init(x: self.right, y: self.middle)
	}
	
	/// The bottom left point in the rect, which is produced by `Point(x: self.left, y: self.bottom)`
	public var bottomLeft: Point {
		return .init(x: self.left, y: self.bottom)
	}
	
	/// The bottom center point in the rect, which is produced by `Point(x: self.center, y: self.bottom)`
	public var bottomCenter: Point {
		return .init(x: self.center, y: self.bottom)
	}
	
	/// The bottom right point in the rect, which is produced by `Point(x: self.right, y: self.bottom)`
	public var bottomRight: Point {
		return .init(x: self.right, y: self.bottom)
	}
	
}

extension Rect {
	
	/// The horizontal span in the rect, which is produced by `Span(start: self.origin.x, length: self.size.width)`
	public var horizontalSpan: Span {
		return Span(horizontalFrom: self)
	}
	
	/// The vertical span in the rect, which is produced by `Span(start: self.origin.y, length: self.size.height)`
	public var verticalSpan: Span {
		return Span(verticalFrom: self)
	}
	
}

extension Rect {
	
	/// The horizontal geometry position at the given coordinate position.
	///
	/// e.g.:
	/// - Pass `0` to `coordinate` will get the left position of the rect.
	/// - Pass `1` to `coordinate` will get the right position of the rect.
	/// - Pass `0.75` to `coordinate` will get the horizontal position at 75% of the rect.
	///
	/// - Parameters:
	///   - coordinate: The horizontal coordinate position in the rect.
	///
	/// - Returns: The horizontal geometry position at the given horizontal coordinate position in the rect.
	public func horizontalGeometry(at coordinate: Float) -> Float {
		return self.origin.x + (self.size.width * coordinate)
	}
	
	/// The vertical geometry position at the given coordinate position.
	///
	/// e.g.:
	/// - Pass `0` to `coordinate` will get the top position of the rect.
	/// - Pass `1` to `coordinate` will get the bottom position of the rect.
	/// - Pass `0.75` to `coordinate` will get the vertical position at 75% of the rect.
	///
	/// - Parameters:
	///   - coordinate: The vertical coordinate position in the rect.
	///
	/// - Returns: The vertical geometry position at the given vertical coordinate position in the rect.
	public func verticalGeometry(at coordinate: Float) -> Float {
		return self.origin.y + (self.size.height * coordinate)
	}
	
	/// The geometry point at the given coordinate position (produced from coordinateX and coordinateY).
	///
	/// e.g.:
	/// - Pass `0` to `x` and `0` to `y` will get the top left point of the rect.
	/// - Pass `0` to `x` and `1` to `y` will get the bottom left point of the rect.
	/// - Pass `0.75` to `x` and `0.6` to `y` will get the point which horizontally at 75% and vertically at 60% of the rect.
	///
	/// - Parameters:
	///   - coordinateX: The horizontal coordinate position in the rect.
	///   - coordinateY: The vertical coordinate position in the rect.
	///
	/// - Returns: The geometry point at the given coordinate point in the rect.
	public func pointGeometryAt(x coordinateX: Float, y coordinateY: Float) -> Point {
		let x = self.horizontalGeometry(at: coordinateX)
		let y = self.verticalGeometry(at: coordinateY)
		return .init(x: x, y: y)
	}
	
	/// The geometry point at the given coordinate position.
	///
	/// e.g.:
	/// - Pass `(x: 0, y: 0)` to `coordinate` will get the top left point of the rect.
	/// - Pass `(x: 0, y: 1)` to `coordinate` will get the bottom left point of the rect.
	/// - Pass `(x: 0.75, y: 0.6)` to `coordinate` will get the point which horizontally at 75% and vertically at 60% of the rect.
	///
	/// - Parameters:
	///   - coordinate: The coordinate point in the rect.
	///
	/// - Returns: The geometry point at the given coordinate point in the rect.
	public func pointGeometry(at coordinate: Point) -> Point {
		return self.pointGeometryAt(x: coordinate.x, y: coordinate.y)
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
	
	/// Produces a new rect which is inside the current rect with given insets.
	///
	/// - Parameters:
	///   - insets: The insets inside the current rect.
	///
	/// - Returns: A new rect inside the current rect with given insets.
	public func rect(inside insets: Insets) -> Rect {
		let frame = self.cgValue.inset(by: insets.cgValue)
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

extension Rect: Equatable {
	
	public static func == (lhs: Rect, rhs: Rect) -> Bool {
		return lhs.origin == rhs.origin && lhs.size == rhs.size
	}
	
}

extension Rect: CustomStringConvertible {
	
	public var description: String {
		return "(origin: \(self.origin), size: \(self.size))"
	}
	
}

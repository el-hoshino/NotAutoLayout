//
//  CGRect.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGRect {
	
	public struct HorizontalBasePoint {
		
		var value: CGFloat
		
	}
	
	public struct VerticalBasePoint {
		
		var value: CGFloat
		
	}
	
	public struct PlaneBasePoint {
		
		var value: CGPoint
		
	}
	
}

extension CGRect.HorizontalBasePoint {
	
	public static let left		= CGRect.HorizontalBasePoint(value: 0)
	public static let center	= CGRect.HorizontalBasePoint(value: 0.5)
	public static let right		= CGRect.HorizontalBasePoint(value: 1)
	
}

extension CGRect.HorizontalBasePoint {
	
	func value(in frame: CGRect) -> CGFloat {
		return frame.width * self.value + frame.x
	}
	
}

extension CGRect.HorizontalBasePoint: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = CGFloat(value)
	}
	
}

extension CGRect.VerticalBasePoint {
	
	public static let top		= CGRect.VerticalBasePoint(value: 0)
	public static let middle	= CGRect.VerticalBasePoint(value: 0.5)
	public static let bottom	= CGRect.VerticalBasePoint(value: 1)
	
}

extension CGRect.VerticalBasePoint {
	
	func value(in frame: CGRect) -> CGFloat {
		return frame.height * self.value + frame.y
	}
	
}

extension CGRect.VerticalBasePoint: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = CGFloat(value)
	}
	
}

extension CGRect.PlaneBasePoint {
	
	public static let topLeft		= CGRect.PlaneBasePoint(value: CGPoint(x: 0.0, y: 0.0))
	public static let topCenter		= CGRect.PlaneBasePoint(value: CGPoint(x: 0.5, y: 0.0))
	public static let topRight		= CGRect.PlaneBasePoint(value: CGPoint(x: 1.0, y: 0.0))
	public static let middleLeft	= CGRect.PlaneBasePoint(value: CGPoint(x: 0.0, y: 0.5))
	public static let middleCenter	= CGRect.PlaneBasePoint(value: CGPoint(x: 0.5, y: 0.5))
	public static let middleRight	= CGRect.PlaneBasePoint(value: CGPoint(x: 1.0, y: 0.5))
	public static let bottomLeft	= CGRect.PlaneBasePoint(value: CGPoint(x: 0.0, y: 1.0))
	public static let bottomCenter	= CGRect.PlaneBasePoint(value: CGPoint(x: 0.5, y: 1.0))
	public static let bottomRight	= CGRect.PlaneBasePoint(value: CGPoint(x: 1.0, y: 1.0))
	
}

extension CGRect.PlaneBasePoint {
	
	func value(in frame: CGRect) -> CGPoint {
		let x = frame.width * self.value.x + frame.x
		let y = frame.height * self.value.y + frame.y
		return CGPoint(x: x, y: y)
	}
	
}

extension CGRect.HorizontalBasePoint {
	
	func originOffset(from widthDiff: CGFloat) -> CGFloat {
		
		return 0 - (widthDiff * self.value)
		
	}
	
}

extension CGRect.VerticalBasePoint {
	
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
	
	enum Float {
		case constant(CGFloat)
		case closure((CGSize) -> CGFloat)
	}
	
	enum Point {
		case constant(CGPoint)
		case closure((CGSize) -> CGPoint)
	}
	
	enum Size {
		case constant(CGSize)
		case closure((CGSize) -> CGSize)
	}
	
	enum Rect {
		case constant(CGRect)
		case closure((CGSize) -> CGRect)
	}
	
}

extension CGRect.Float {
	
	var constantValue: CGFloat? {
		
		if case .constant(let value) = self {
			return value
		}
		else {
			return nil
		}
		
	}
	
	var closureValue: (CGSize) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return { _ in value }
			
		case .closure(let closure):
			return closure
		}
		
	}
	
}

extension CGRect.Point {
	
	var constantValue: CGPoint? {
		
		if case .constant(let value) = self {
			return value
		}
		else {
			return nil
		}
		
	}
	
	var closureValue: (CGSize) -> CGPoint {
		
		switch self {
		case .constant(let value):
			return { _ in value }
			
		case .closure(let closure):
			return closure
		}
		
	}
	
}

extension CGRect.Size {
	
	var constantValue: CGSize? {
		
		if case .constant(let value) = self {
			return value
		}
		else {
			return nil
		}
		
	}
	
	var closureValue: (CGSize) -> CGSize {
		
		switch self {
		case .constant(let value):
			return { _ in value }
			
		case .closure(let closure):
			return closure
		}
		
	}
	
}

extension CGRect.Rect {
	
	var constantValue: CGRect? {
		
		if case .constant(let value) = self {
			return value
		}
		else {
			return nil
		}
		
	}
	
	var closureValue: (CGSize) -> CGRect {
		
		switch self {
		case .constant(let value):
			return { _ in value }
			
		case .closure(let closure):
			return closure
		}
		
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
	
	mutating func expandWidth(to widthGoal: CGFloat, from baseline: CGRect.HorizontalBasePoint) {
		
		let widthDiff = widthGoal - self.width
		self.size.width = widthGoal
		self.origin.x += baseline.originOffset(from: widthDiff)
		
	}
	
	mutating func expandWidth(by widthDiff: CGFloat, from baseline: CGRect.HorizontalBasePoint) {
		
		self.size.width += widthDiff
		self.origin.x += baseline.originOffset(from: widthDiff)
		
	}
	
	mutating func expandHeight(to heightGoal: CGFloat, from baseline: CGRect.VerticalBasePoint) {
		
		let heightDiff = heightGoal - self.height
		self.size.height = heightGoal
		self.origin.y += baseline.originOffset(from: heightDiff)
		
	}
	
	mutating func expandHeight(by heightDiff: CGFloat, from baseline: CGRect.VerticalBasePoint) {
		
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

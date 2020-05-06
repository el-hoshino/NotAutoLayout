//
//  Point.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows a specific point in a rect.
///
/// Basically it behaves like a `CGPoint` type that has the same properties `x` and `y`, but since it's declared as another type just in NotAutoLayout, you can add any extensions you want and that won't affect the system's `CGPoint` type. For example, I have defined the addition and subtraction functions for 2 `Point` types. You can safely use them with 2 `Point`s, and they will not cause any confliction if you have defined the same functions for `CGPoint`.
///
/// Conforms to: `CGTypeConvertible`.
public struct Point {
	
	/// The x position of the point.
	public var x: Float
	
	/// The y position of the point.
	public var y: Float
	
	/// Initializes a `Point` with x position (as `x`) and y position (as `y`).
	public init(x: Float, y: Float) {
		self.x = x
		self.y = y
	}
	
}

extension Point {
	
	/// A point that both `x` and `y` are `0`.
	public static let zero: Point = .init(x: 0, y: 0)
	
}

extension Point: CGTypeConvertible {
	
	public var cgValue: CGPoint {
		return .init(x: self.x.cgValue, y: self.y.cgValue)
	}
	
	public init(_ point: CGPoint) {
		self.x = Float(point.x)
		self.y = Float(point.y)
	}
	
}

extension Point {
	
	/// A point that `x` is `0.0` and `y` is `0.0`.
	public static let coordinateTopLeft: Point  = .init(x: 0.0, y: 0.0)
	
	/// A point that `x` is `0.5` and `y` is `0.0`
	public static let coordinateTopCenter: Point	= .init(x: 0.5, y: 0.0)
	
	/// A point that `x` is `1.0` and `y` is `0.0`
	public static let coordinateTopRight: Point  = .init(x: 1.0, y: 0.0)
	
	/// A point that `x` is `0.0` and `y` is `0.5`
	public static let coordinateMiddleLeft: Point   = .init(x: 0.0, y: 0.5)
	
	/// A point that `x` is `0.5` and `y` is `0.5`
	public static let coordinateMiddleCenter: Point = .init(x: 0.5, y: 0.5)
	
	/// A point that `x` is `1.0` and `y` is `0.5`
	public static let coordinateMiddleRight: Point  = .init(x: 1.0, y: 0.5)
	
	/// A point that `x` is `0.0` and `y` is `1.0`
	public static let coordinateBottomLeft: Point   = .init(x: 0.0, y: 1.0)
	
	/// A point that `x` is `0.5` and `y` is `1.0`
	public static let coordinateBottomCenter: Point = .init(x: 0.5, y: 1.0)
	
	/// A point that `x` is `1.0` and `y` is `1.0`
	public static let coordinateBottomRight: Point  = .init(x: 1.0, y: 1.0)
	
}

extension Point {
	
	/// Adds 2 `Point` type values. The reult's `x` will be the sum of 2 `Point`'s `x`, and `y` will be the sum of 2 `Point`'s `y`.
	public static func + (lhs: Point, rhs: Point) -> Point {
		return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	}
	
	/// Adds 2 `Point` type values and assign the result to the 1st one. The reult's `x` will be the sum of 2 `Point`'s `x`, and `y` will be the sum of 2 `Point`'s `y`.
	public static func += (lhs: inout Point, rhs: Point) {
		// swiftlint:disable:next shorthand_operator
		lhs = lhs + rhs
	}
	
	/// Subtracts the 2nd `Point` type value from the 1st `Point` type value. The result's `x` will be the 1st `Point`'s `x` minus the 2nd `Point`'s `x`, and `y` will be the 1st `Point`'s `y` minus the 2nd `Point`'s `y`.
	public static func - (lhs: Point, rhs: Point) -> Point {
		return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	}
	
	/// Subtracts the 2nd `Point` type value from the 1st `Point` type value and assign the result to the 1st one. The result's `x` will be the 1st `Point`'s `x` minus the 2nd `Point`'s `x`, and `y` will be the 1st `Point`'s `y` minus the 2nd `Point`'s `y`.
	public static func -= (lhs: inout Point, rhs: Point) {
		// swiftlint:disable:next shorthand_operator
		lhs = lhs - rhs
	}
	
}

extension Point: Equatable {
	
	public static func == (lhs: Point, rhs: Point) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
	
}

extension Point: CustomStringConvertible {
	
	public var description: String {
		return "(x:\(self.x), y: \(self.y))"
	}
	
}

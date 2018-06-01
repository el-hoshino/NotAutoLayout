//
//  Float.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A `FloatingPoint` type used in NotAutoLayout.
///
/// Basically it's just a `CGFloat` type that every behaviour is just the same as `CGFloat`, but since it's declared as another type just in NotAutoLayout, you can add any extensions you want and that won't affect the system's `CGFloat` type. For example, I have defined `half`, `double` and `isNonZero` property in `Float`. You can safely use them in `Float`, and they will not cause any confliction if you have defined properties with the same names in `CGFloat`.
///
/// Confroms to: `CGTypeConvertible`.
public struct Float {
	
	private var value: CGFloat
	
}

extension Float: CGTypeConvertible {
	
	public var cgValue: CGFloat {
		return self.value
	}
	
	public init(_ float: CGFloat) {
		self.value = float
	}
	
}

extension Float: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = CGFloat(value)
	}
	
}

extension Float: Equatable {
	
	public static func ==(lhs: Float, rhs: Float) -> Bool {
		return lhs.value == rhs.value
	}
	
}

extension Float: Hashable {
	
	public var hashValue: Int {
		return self.value.hashValue
	}
	
}

extension Float: Numeric {
	
	public typealias Magnitude = Float
	
	public typealias IntegerLiteralType = CGFloat.IntegerLiteralType
	
	public init?<T>(exactly source: T) where T : BinaryInteger {
		if let value = CGFloat(exactly: source) {
			self.value = value
		} else {
			return nil
		}
	}
	
	public init(integerLiteral value: CGFloat.IntegerLiteralType) {
		self.value = CGFloat(integerLiteral: value)
	}
	
	public static func +(lhs: Float, rhs: Float) -> Float {
		return Float(lhs.value + rhs.value)
	}
	
	public static func +=(lhs: inout Float, rhs: Float) {
		lhs = lhs + rhs
	}
	public static func -(lhs: Float, rhs: Float) -> Float {
		return Float(lhs.value - rhs.value)
	}
	
	public static func -=(lhs: inout Float, rhs: Float) {
		lhs = lhs - rhs
	}
	
	public static func *(lhs: Float, rhs: Float) -> Float {
		return Float(lhs.value * rhs.value)
	}
	
	public static func *=(lhs: inout Float, rhs: Float) {
		lhs = lhs * rhs
	}
	
	public var magnitude: Float {
		return Float(self.value.magnitude)
	}
	
}

extension Float: SignedNumeric {
	
}

extension Float: Comparable {
	
}

extension Float: Strideable {
	
	public typealias Stride = Float
	
	public func distance(to other: Float) -> Float.Stride {
		return Float(self.value.distance(to: other.value))
	}
	
	public func advanced(by n: Float.Stride) -> Float {
		return Float(self.value.advanced(by: n.value))
	}
	
}

extension Float: FloatingPoint {
	
	public typealias Exponent = CGFloat.Exponent
	
	public init(sign: FloatingPointSign, exponent: CGFloat.Exponent, significand: Float) {
		self.value = CGFloat(sign: sign, exponent: exponent, significand: significand.value)
	}
	
	public init(signOf: Float, magnitudeOf: Float) {
		self.value = CGFloat(signOf: signOf.value, magnitudeOf: magnitudeOf.value)
	}
	
	public init(_ value: UInt8) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: Int8) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: UInt16) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: Int16) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: UInt32) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: Int32) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: UInt64) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: Int64) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: UInt) {
		self.value = CGFloat(value)
	}
	
	public init(_ value: Int) {
		self.value = CGFloat(value)
	}
	
	public static var radix: Int {
		return CGFloat.radix
	}
	
	public static var nan: Float {
		return Float(CGFloat.nan)
	}
	
	public static var signalingNaN: Float {
		return Float(CGFloat.signalingNaN)
	}
	
	public static var infinity: Float {
		return Float(CGFloat.infinity)
	}
	
	public static var greatestFiniteMagnitude: Float {
		return Float(CGFloat.greatestFiniteMagnitude)
	}
	
	public static var pi: Float {
		return Float(CGFloat.pi)
	}
	
	public static var leastNormalMagnitude: Float {
		return Float(CGFloat.leastNormalMagnitude)
	}
	
	public static var leastNonzeroMagnitude: Float {
		return Float(CGFloat.leastNonzeroMagnitude)
	}
	
	public static func /(lhs: Float, rhs: Float) -> Float {
		return Float(lhs.value / rhs.value)
	}
	
	public static func /=(lhs: inout Float, rhs: Float) {
		lhs = lhs / rhs
	}
	
	public var sign: FloatingPointSign {
		return self.value.sign
	}
	
	public var exponent: CGFloat.Exponent {
		return self.value.exponent
	}
	
	public var significand: Float {
		return Float(self.value.significand)
	}
	
	public var ulp: Float {
		return Float(self.value.ulp)
	}
	
	public var nextUp: Float {
		return Float(self.value.nextUp)
	}
	
	public var isNormal: Bool {
		return self.value.isNormal
	}
	
	public var isFinite: Bool {
		return self.value.isFinite
	}
	
	public var isZero: Bool {
		return self.value.isZero
	}
	
	public var isSubnormal: Bool {
		return self.value.isSubnormal
	}
	
	public var isInfinite: Bool {
		return self.value.isInfinite
	}
	
	public var isNaN: Bool {
		return self.value.isNaN
	}
	
	public var isSignalingNaN: Bool {
		return self.value.isSignalingNaN
	}
	
	public var isCanonical: Bool {
		return self.value.isCanonical
	}
	public func isEqual(to other: Float) -> Bool {
		return self.value.isEqual(to: other.value)
	}
	
	public func isLess(than other: Float) -> Bool {
		return self.value.isLess(than: other.value)
	}
	
	public func isLessThanOrEqualTo(_ other: Float) -> Bool {
		return self.value.isLessThanOrEqualTo(other.value)
	}
	
	public func isTotallyOrdered(belowOrEqualTo other: Float) -> Bool {
		return self.value.isTotallyOrdered(belowOrEqualTo: other.value)
	}
	
	public mutating func formRemainder(dividingBy other: Float) {
		self.value.formRemainder(dividingBy: other.value)
	}
	
	public mutating func formTruncatingRemainder(dividingBy other: Float) {
		self.value.formTruncatingRemainder(dividingBy: other.value)
	}
	
	public mutating func formSquareRoot() {
		self.value.formSquareRoot()
	}
	
	public mutating func addProduct(_ lhs: Float, _ rhs: Float) {
		self.value.addProduct(lhs.value, rhs.value)
	}
	
	public mutating func round(_ rule: FloatingPointRoundingRule) {
		self.value.round(rule)
	}
	
}

extension Float {
	
	var bitriseValue: Int {
		return 0
	}
	
}

extension Float {
	
	/// Returns `self / 2`.
	public var half: Float {
		return self / 2
	}
	
	/// Returns `self * 2`.
	public var double: Float {
		return self * 2
	}
	
	/// Shows if the current `Float` value is a valid value and it's not `0`.
	///
	/// - If the value is `0`, or `isNan` is `true`, then it returns `true`.
	/// - Otherwise, `false`.
	public var isNonZero: Bool {
		return self.isNaN == false && self.isZero == false
	}
	
}

extension Float: CustomStringConvertible {
	
	public var description: String {
		return "\(self.value)"
	}
	
}

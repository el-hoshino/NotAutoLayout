//
//  Span.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows a span with a start position and a length in a line.
public struct Span {
	
	/// The start position of the span.
	public var start: Float
	
	/// The length of the span.
	public var length: Float
	
	/// Initializes a `Span` with the start position (as `start`) and length (as `length`).
	public init(start: Float, length: Float) {
		self.start = start
		self.length = length
	}
	
	/// Initializes a `Span` with the start position (as `start`) and end position (as `end`)
	public init(start: Float, end: Float) {
		let length = end - start
		self.start = start
		self.length = length
	}
	
	/// Initializes a `Span` with the start position (as `start`) and half position (as `half`)
	public init(start: Float, half: Float) {
		let length = (half - start).double
		self.start = start
		self.length = length
	}
	
	/// Initializes a `Span` with the half position (as `half`) and length (as `length`)
	public init(half: Float, length: Float) {
		let start = half - length.half
		self.start = start
		self.length = length
	}
	
	/// Initializes a `Span` with the half position (as `half`) and end position (as `end`)
	public init(half: Float, end: Float) {
		let length = (end - half).double
		let start = end - length
		self.start = start
		self.length = length
	}
	
	/// Initializes a `Span` with the end position (as `end`) and length (as `length`)
	public init(end: Float, length: Float) {
		let start = end - length
		self.start = start
		self.length = length
	}
	
}

extension Span {
	
	init(left: Float, width: Float) {
		self.start = left
		self.length = width
	}
	
	init(left: Float, right: Float) {
		let width = right - left
		self.start = left
		self.length = width
	}
	
	init(left: Float, center: Float) {
		let width = (center - left).double
		self.start = left
		self.length = width
	}
	
	init(center: Float, width: Float) {
		let left = center - width.half
		self.start = left
		self.length = width
	}
	
	init(center: Float, right: Float) {
		let width = (right - center).double
		let left = right - width
		self.start = left
		self.length = width
	}
	
	init(right: Float, width: Float) {
		let left = right - width
		self.start = left
		self.length = width
	}
	
}

extension Span {
	
	init(top: Float, height: Float) {
		self.start = top
		self.length = height
	}
	
	init(top: Float, bottom: Float) {
		let height = bottom - top
		self.start = top
		self.length = height
	}
	
	init(top: Float, middle: Float) {
		let height = (middle - top).double
		self.start = top
		self.length = height
	}
	
	init(middle: Float, height: Float) {
		let top = middle - height.half
		self.start = top
		self.length = height
	}
	
	init(middle: Float, bottom: Float) {
		let height = (bottom - middle).double
		let top = bottom - height
		self.start = top
		self.length = height
	}
	
	init(bottom: Float, height: Float) {
		let top = bottom - height
		self.start = top
		self.length = height
	}
	
}

extension Span {
	
	init(horizontalFrom rect: Rect) {
		
		self.start = rect.left
		
		self.length = rect.width
		
	}
	
	init(verticalFrom rect: Rect) {
		
		self.start = rect.top
		
		self.length = rect.height
		
	}
	
}

extension Span {
	
	/// A span that starts from `0` with the length of `0`.
	public static let zero: Span = .init(start: 0, length: 0)
	
	/// A span that starts from `0` with the length of `1`.
	public static let identity: Span = .init(start: 0, length: 1)
	
}

extension Span {
	
	/// The half position of the span.
	public var half: Float {
		return self.geometry(at: 0.5)
	}
	
	/// The end position of the span.
	public var end: Float {
		return self.geometry(at: 1)
	}
	
	/// The geometry position of the span at the given coordinate value.
	///
	/// e.g.:
	/// - Pass `0` to `coordinate` will get the start position of the span.
	/// - Pass `1` to `coordinate` will get the end position of the span.
	/// - Pass `0.75` to `coordinate` will get the position at 75% of the span.
	///
	/// - Parameters:
	///   - coordinate: The coordinate position in the span.
	///
	/// - Returns: The geometry position at the given coordinate position in the span.
	public func geometry(at coordinate: Float) -> Float {
		return self.start + (self.length * coordinate)
	}
	
}

extension Span {
	
	/// A span from self's start to self's half
	public var startToHalf: Span {
		return .init(start: self.start, end: self.half)
	}
	
	/// A span from self's half to self's end
	public var halfToStart: Span {
		return .init(start: self.half, end: self.start)
	}
	
	/// A span from self's half to self's end
	var halfToEnd: Span {
		return .init(start: self.half, end: self.end)
	}
	
	/// A span from self's end to self's half
	var endToHalf: Span {
		return .init(start: self.end, end: self.half)
	}
	
	/// A span from self's end to self's start
	var endToStart: Span {
		return .init(start: self.end, end: self.start)
	}
	
	func geometry(from coordinateStart: Float, to coordinateEnd: Float) -> Span {
		return .init(start: self.geometry(at: coordinateStart), end: self.geometry(at: coordinateEnd))
	}
	
}

extension Span: CustomStringConvertible {
	
	public var description: String {
		return "(start: \(self.start), length: \(self.length))"
	}
	
}

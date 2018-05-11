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

extension Span: CustomStringConvertible {
	
	public var description: String {
		return "(start: \(self.start), length: \(self.length))"
	}
	
}

// This section is for meta programming, which I'm planning in the future.
extension Span {
	
	internal enum Horizontal {
		case left(Float)
		case center(Float)
		case right(Float)
		case width(Float)
	}
	
	internal enum Vertical {
		case top(Float)
		case middle(Float)
		case bottom(Float)
		case height(Float)
	}
	
	init(_ a: Horizontal, _ b: Horizontal) {
		switch (a, b) {
		case (.left(let left), .center(let center)):
			self.init(start: left, half: center)
			
		case (.left(let left), .right(let right)):
			self.init(start: left, end: right)
			
		case (.left(let left), .width(let width)):
			self.init(start: left, length: width)
			
		case (.center(let center), .left(let left)):
			self.init(start: left, half: center)
			
		case (.center(let center), .right(let right)):
			self.init(half: center, end: right)
			
		case (.center(let center), .width(let width)):
			self.init(half: center, length: width)
			
		case (.right(let right), .left(let left)):
			self.init(start: left, end: right)
			
		case (.right(let right), .center(let center)):
			self.init(half: center, end: right)
			
		case (.right(let right), .width(let width)):
			self.init(end: right, length: width)
			
		case (.width(let width), .left(let left)):
			self.init(start: left, length: width)
			
		case (.width(let width), .center(let center)):
			self.init(half: center, length: width)
			
		case (.width(let width), .right(let right)):
			self.init(end: right, length: width)
			
		case (.left, .left), (.center, .center), (.right, .right), (.width, .width):
			assertionFailure("Failed to create a span from 2 horizontal elements. These 2 should be different from each other")
			self = .zero
		}
	}
	
	init(_ a: Vertical, _ b: Vertical) {
		switch (a, b) {
		case (.top(let top), .middle(let middle)):
			self.init(start: top, half: middle)
			
		case (.top(let top), .bottom(let bottom)):
			self.init(start: top, end: bottom)
			
		case (.top(let top), .height(let height)):
			self.init(start: top, length: height)
			
		case (.middle(let middle), .top(let top)):
			self.init(start: top, half: middle)
			
		case (.middle(let middle), .bottom(let bottom)):
			self.init(half: middle, end: bottom)
			
		case (.middle(let middle), .height(let height)):
			self.init(half: middle, length: height)
			
		case (.bottom(let bottom), .top(let top)):
			self.init(start: top, end: bottom)
			
		case (.bottom(let bottom), .middle(let middle)):
			self.init(half: middle, end: bottom)
			
		case (.bottom(let bottom), .height(let height)):
			self.init(end: bottom, length: height)
			
		case (.height(let height), .top(let top)):
			self.init(start: top, length: height)
			
		case (.height(let height), .middle(let middle)):
			self.init(half: middle, length: height)
			
		case (.height(let height), .bottom(let bottom)):
			self.init(end: bottom, length: height)
			
		case (.top, .top), (.middle, .middle), (.bottom, .bottom), (.height, .height):
			assertionFailure("Failed to create a span from 2 vertical elements. These 2 should be different from each other")
			self = .zero
		}
	}
	
}

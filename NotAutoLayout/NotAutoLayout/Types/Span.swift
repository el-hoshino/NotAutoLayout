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

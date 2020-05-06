//
//  Line.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows either a horizontal or a vertical edge position in a view.
///
/// Basically this is only used as a namespace, you need to specify either `.Horizontal` or `.Vertical` line in a view.
public struct Line {
	
}

// MARK: - Horizontal
extension Line {
	
	/// Referes to a horizontal position in a view.
	public struct Horizontal {
		
		var value: Float
		
	}
	
}

extension Line.Horizontal: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = Float(floatLiteral: value)
	}
	
}

extension Line.Horizontal: ExpressibleByIntegerLiteral {
	
	public init(integerLiteral value: Int) {
		// This is local type NotAutoLayout.Float, not Swift.Float
		// swiftlint:disable:next compiler_protocol_init
		self.value = Float(integerLiteral: value)
	}
	
}

extension Line.Horizontal {
	
	public static let coordinateLeft: Line.Horizontal	= 0.0
	public static let coordinateCenter: Line.Horizontal	= 0.5
	public static let coordinateRight: Line.Horizontal	= 1.0
	
}

// MARK: - Vertical
extension Line {
	
	/// Referes to a vertical position in a view.
	public struct Vertical {
		
		var value: Float
		
	}
	
}

extension Line.Vertical: ExpressibleByFloatLiteral {
	
	public init(floatLiteral value: Double) {
		self.value = Float(floatLiteral: value)
	}
	
}

extension Line.Vertical: ExpressibleByIntegerLiteral {
	
	public init(integerLiteral value: Int) {
		// This is local type NotAutoLayout.Float, not Swift.Float
		// swiftlint:disable:next compiler_protocol_init
		self.value = Float(integerLiteral: value)
	}
	
}

extension Line.Vertical {
	
	public static let coordinateTop: Line.Vertical		= 0.0
	public static let coordinateMiddle: Line.Vertical	= 0.5
	public static let coordinateBottom: Line.Vertical	= 1.0
	
}

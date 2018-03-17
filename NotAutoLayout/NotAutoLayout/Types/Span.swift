//
//  Span.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Span {
	
	public var start: Float
	public var length: Float
	
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
	
	public static let zero: Span = .init(start: 0, length: 0)
	
	public static let identity: Span = .init(start: 0, length: 1)
	
}

extension Span {
	
	var half: Float {
		return self.geometry(at: 0.5)
	}
	
	var end: Float {
		return self.geometry(at: 1)
	}
	
	func geometry(at coordinate: Float) -> Float {
		return self.start + (self.length * coordinate)
	}
	
}

extension Span: CustomStringConvertible {
	
	public var description: String {
		return "(start: \(self.start), length: \(self.length))"
	}
	
}

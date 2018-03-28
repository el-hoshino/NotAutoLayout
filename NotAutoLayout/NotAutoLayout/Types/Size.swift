//
//  Size.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows a specific size in a rect.
///
/// Basically it behaves like a `CGSize` type that has the same properties `width` and `height`, but since it's declared as another type just in NotAutoLayout, you can add any extensions you want and that won't affect the system's `CGSize` type. For example, I have defined a `ratio` property and the addition and subtraction functions for 2 `Size` types. You can safely use them with `Size` type values, and they will not cause any confliction if you have defined the same functions for `CGSize`.
///
/// Conforms to: `CGTypeConvertible`.
public struct Size {
	
	/// The width of the size.
	public var width: Float
	
	/// The height of the size.
	public var height: Float
	
	/// Initializes a `Size` with width (as `width`) and height (as `height`).
	public init(width: Float, height: Float) {
		self.width = width
		self.height = height
	}
	
}

extension Size {
	
	/// A size that both `width` and `height` are `0`.
	public static let zero: Size = .init(width: 0, height: 0)
	
	/// A size that both `width` and `height` are `1`.
	public static let identity: Size = .init(width: 1, height: 1)
	
}

extension Size: CGTypeConvertible {
	
	public var cgValue: CGSize {
		return .init(width: self.width.cgValue, height: self.height.cgValue)
	}
	
	public init(_ size: CGSize) {
		self.width = Float(size.width)
		self.height = Float(size.height)
	}
	
}

extension Size {
	
	/// The aspect ratio of a size, which is produced by `self.width / self.height`.
	public var ratio: Float {
		return self.width / self.height
	}
	
}

extension Size {
	
	/// Adds 2 `Size` type values. The reult's `width` will be the sum of 2 `Size`'s `width`, and `height` will be the sum of 2 `Size`'s `height`.
	public static func + (lhs: Size, rhs: Size) -> Size {
		return Size(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
	}
	
	/// Adds 2 `Size` type values and assign the result to the 1st one. The reult's `width` will be the sum of 2 `Size`'s `width`, and `height` will be the sum of 2 `Size`'s `height`.
	public static func += (lhs: inout Size, rhs: Size) {
		lhs = lhs + rhs
	}
	
	/// Subtracts the 2nd `Size` type value from the 1st `Size` type value. The reult's `width` will be the 1st `Size`'s `width` minus the 2nd `Size`'s `width`, and `height` will be the 1st `Size`'s `height` minus the 2nd `Size`'s `height`.
	public static func - (lhs: Size, rhs: Size) -> Size {
		return Size(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
	}
	
	/// Subtracts the 2nd `Size` type value from the 1st `Size` type value and assign the result to the 1st one. The reult's `width` will be the 1st `Size`'s `width` minus the 2nd `Size`'s `width`, and `height` will be the 1st `Size`'s `height` minus the 2nd `Size`'s `height`.
	public static func -= (lhs: inout Size, rhs: Size) {
		lhs = lhs - rhs
	}
	
}

extension Size {
	
	static func makeSize(usingWidthIn canvasSize: Size, with ratio: Float) -> Size {
		
		guard ratio.isNonZero else {
			return Size(width: canvasSize.width, height: .greatestFiniteMagnitude)
		}
		
		let width = canvasSize.width
		let height = width / ratio
		let size = Size(width: width, height: height)
		
		return size
		
	}
	
	static func makeSize(usingHeightIn canvasSize: Size, with ratio: Float) -> Size {
		
		guard ratio.isFinite else {
			return Size(width: .greatestFiniteMagnitude, height: canvasSize.height)
		}
		
		let height = canvasSize.height
		let width = height * ratio
		let size = Size(width: width, height: height)
		
		return size
		
	}
	
	static func aspectFitSize(in canvasSize: Size, with ratio: Float) -> Size {
		
		switch ratio > canvasSize.ratio {
		case true:
			return makeSize(usingWidthIn: canvasSize, with: ratio)
			
		case false:
			return makeSize(usingHeightIn: canvasSize, with: ratio)
		}
		
	}
	
	static func aspectFillSize(in canvasSize: Size, with ratio: Float) -> Size {
		
		switch ratio < canvasSize.ratio {
		case true:
			return makeSize(usingWidthIn: canvasSize, with: ratio)
			
		case false:
			return makeSize(usingHeightIn: canvasSize, with: ratio)
		}
		
	}
	
}

extension Size: CustomStringConvertible {
	
	public var description: String {
		return "(width: \(self.width), height: \(self.height))"
	}
	
}

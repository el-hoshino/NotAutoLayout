//
//  Insets.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A struct that shows insets as margins from left, right, top and bottom.
///
/// Basically it behaves like a `UIEdgeInsets` type that has the same properties `top`, `left`, `bottom` and `right`, but since it's declared as another type just in NotAutoLayout, you can add any extensions you want and that won't affect the system's `UIEdgeInsets` type.
///
/// Conforms to: `CGTypeConvertible`.
public struct Insets {
	
	/// The top inset.
	public var top: Float
	
	/// The left inset.
	public var left: Float
	
	/// The bottom inset.
	public var bottom: Float
	
	/// The right inset.
	public var right: Float
	
	/// Initializes a `Insets` with top inset (as `top`), left inset (as `left`), bottom inset (as `bottom`) and right inset (as `right`).
	public init(top: Float, left: Float, bottom: Float, right: Float) {
		self.top = top
		self.left = left
		self.bottom = bottom
		self.right = right
	}
	
}

extension Insets {
	
	/// Insets that all `top`, `left`, `bottom` and `right` insets are `0`
	public static let zero: Insets = .init(top: 0, left: 0, bottom: 0, right: 0)
	
}

extension Insets: CGTypeConvertible {
	
	public var cgValue: UIEdgeInsets {
		return UIEdgeInsets(top: self.top.cgValue, left: self.left.cgValue, bottom: self.bottom.cgValue, right: self.right.cgValue)
	}
	
	public init(_ insets: UIEdgeInsets) {
		self.top = Float(insets.top)
		self.left = Float(insets.left)
		self.bottom = Float(insets.bottom)
		self.right = Float(insets.right)
	}
	
}

extension Insets: CustomStringConvertible {
	
	public var description: String {
		return "(top: \(self.top), left: \(self.left), bottom: \(self.bottom), right: \(self.right))"
	}
	
}

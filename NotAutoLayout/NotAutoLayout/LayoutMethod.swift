//
//  LayoutMethod.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/02.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// A struct used to store the tuple of `Condition` and `Layout`.
public struct LayoutMethod {
	
	/// `Condition`
	public let condition: Condition
	
	/// `Layout`
	public let layout: Layout
	
	/// Initialize a LayoutMethod
	///
	/// - Parameters:
	///   - condition: `Condition`
	///   - layout: `Layout`
	public init(condition: @escaping Condition, layout: Layout) {
		self.condition = condition
		self.layout = layout
	}
	
}

extension LayoutMethod {
	
	/// Initialize a LayoutMethod use only `Layout` which the `Condition` will always return true
	///
	/// - Parameter constantLayout: `Layout`
	public init(constantLayout: Layout) {
		self.condition = { _ in true }
		self.layout = constantLayout
	}
	
}

extension LayoutMethod {
	
	/// Make a LayoutMethod with `Condition?` and `Layout`
	///
	/// - Parameters:
	///   - layout: `Layout`
	///   - condition: `Condition?` which default is `nil`. If `nil`, the initializer will use an always true closure.
	/// - Returns: `LayoutMethod`
	public static func use(_ layout: Layout, if condition: Condition? = nil) -> LayoutMethod {
		
		if let condition = condition {
			return LayoutMethod(condition: condition, layout: layout)
			
		} else {
			return LayoutMethod(constantLayout: layout)
			
		}
		
	}
	
}

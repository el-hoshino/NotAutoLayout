//
//  LayoutMethod.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/02.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutMethod {
	
	public let condition: Condition
	public let bounds: Layout
	
	public init(condition: @escaping Condition, bounds: Layout) {
		self.condition = condition
		self.bounds = bounds
	}
	
}

extension LayoutMethod {
	
	public init(constantPosition: Layout) {
		self.condition = { _ in true }
		self.bounds = constantPosition
	}
	
}

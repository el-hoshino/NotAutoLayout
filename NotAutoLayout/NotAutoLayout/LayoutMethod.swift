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
	public let layout: Layout
	
	public init(condition: @escaping Condition, layout: Layout) {
		self.condition = condition
		self.layout = layout
	}
	
}

extension LayoutMethod {
	
	public init(constantLayout: Layout) {
		self.condition = { _ in true }
		self.layout = constantLayout
	}
	
}

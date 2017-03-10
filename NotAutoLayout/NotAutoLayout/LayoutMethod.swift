//
//  LayoutMethod.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/02.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutMethod {
	
	public let condition: LayoutCondition
	public let position: LayoutPosition
	
	init(condition: @escaping LayoutCondition, position: LayoutPosition) {
		self.condition = condition
		self.position = position
	}
	
}

extension LayoutMethod {
	
	public init(constantPosition: LayoutPosition) {
		self.condition = { _ in true }
		self.position = constantPosition
	}
	
}

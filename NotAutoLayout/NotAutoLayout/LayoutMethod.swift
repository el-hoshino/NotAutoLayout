//
//  LayoutMethod.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/02.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutMethod {
	
	let condition: LayoutCondition
	let position: LayoutPosition
	
}

extension LayoutMethod {
	
	public init(constantPosition: LayoutPosition) {
		self.condition = { _ in true }
		self.position = constantPosition
	}
	
}

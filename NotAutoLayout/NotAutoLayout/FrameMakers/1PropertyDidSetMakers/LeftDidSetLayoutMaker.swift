//
//  LeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftDidSetLayoutMaker {
		
	let left: CGRect.Float
	
}

extension LeftDidSetLayoutMaker {
	
	public func setTop(to baseline: CGFloat) -> LeftTopDidSetLayoutMaker {
		
		let maker = LeftTopDidSetLayoutMaker(left: self.left,
		                                     top: .constant(baseline))
		return maker
		
	}
	
}

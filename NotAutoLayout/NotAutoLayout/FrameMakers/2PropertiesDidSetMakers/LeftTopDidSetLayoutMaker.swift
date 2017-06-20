//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
}

extension LeftTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let maker = LeftTopWidthDidSetLayoutMaker(left: self.left,
		                                          top: self.top,
		                                          width: .constant(width))
		return maker
		
	}
	
}

//
//  LeftPointDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftPointDidSetLayoutMaker {
		
	let left: CGFloat
	
}

extension LeftPointDidSetLayoutMaker: LeftPointPropertyDidSet { }

extension LeftPointDidSetLayoutMaker {
	
	public func setTop(to baseline: CGFloat) -> LeftPointTopPointDidSetLayoutMaker {
		
		let maker = LeftPointTopPointDidSetLayoutMaker(left: self.left,
		                                               top: baseline)
		return maker
		
	}
	
}

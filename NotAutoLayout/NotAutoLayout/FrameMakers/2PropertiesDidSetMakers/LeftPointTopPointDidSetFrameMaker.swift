//
//  LeftPointTopPointDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftPointTopPointDidSetLayoutMaker {
	
	let left: CGFloat
	
	let top: CGFloat
	
}

extension LeftPointTopPointDidSetLayoutMaker: LeftPointPropertyDidSet { }
extension LeftPointTopPointDidSetLayoutMaker: TopPointPropertyDidSet { }

extension LeftPointTopPointDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftPointTopPointWidthDidSetLayoutMaker {
		
		let maker = LeftPointTopPointWidthDidSetLayoutMaker(left: self.left,
		                                                    top: self.top,
		                                                    width: width)
		return maker
		
	}
	
}

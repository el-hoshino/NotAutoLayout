//
//  LeftPointTopPointWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopWidthDidSetLayoutMaker {
		
	let left: CGRect.Float
	
	let top: CGRect.Float
	
	let width: CGRect.Float
	
}

extension LeftTopWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let left = self.left.constantValue, let top = self.top.constantValue, let width = self.width.constantValue {
			let frame = CGRect(x: left,
			                   y: top,
			                   width: width,
			                   height: height)
			let layout = Layout.Individual.makeAbsolute(from: frame)
			
			return layout
		}
		else {
			let layout = Layout.Individual.makeCustom(x: self.left.closureValue,
			                                          y: self.top.closureValue,
			                                          width: self.width.closureValue,
			                                          height: {_ in height})
			return layout
		}
		
	}
	
}

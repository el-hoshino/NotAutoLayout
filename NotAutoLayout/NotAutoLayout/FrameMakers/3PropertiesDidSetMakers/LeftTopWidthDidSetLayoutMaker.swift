//
//  LeftPointTopPointWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopWidthDidSetLayoutMaker {
		
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
	let width: CGRect.Float
	
}

extension LeftTopWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout {
		
		if let left = self.left.constantValue, let top = self.top.constantValue, let width = self.width.constantValue {
			let frame = CGRect(x: left,
			                   y: top,
			                   width: width,
			                   height: height)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let width = self.width.closureValue(boundSize)
				let x = self.left.closureValue(boundSize)
				let y = self.top.closureValue(boundSize)
				let frame = CGRect(x: x, y: y, width: width, height: height)
				return frame
			}
			
			return layout
			
		}
		
	}
	
}

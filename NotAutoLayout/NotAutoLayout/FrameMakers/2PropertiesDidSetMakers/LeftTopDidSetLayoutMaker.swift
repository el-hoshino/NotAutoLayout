//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
}

extension LeftTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: .constant(width))
		return maker
		
	}
	
	public func setWidth(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calculation)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		
		return maker
		
	}
	
}

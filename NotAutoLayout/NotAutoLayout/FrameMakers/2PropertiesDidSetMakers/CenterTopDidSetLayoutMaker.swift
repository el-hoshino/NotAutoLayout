//
//  CenterTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopDidSetLayoutMaker {
	
	let parentView: UIView
	
	let center: CGRect.Float
	
	let top: CGRect.Float
	
}

extension CenterTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		
		return maker
		
	}
	
	public func calculateWidth(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calculation)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		
		return maker
		
	}
	
}

//
//  CenterMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterMiddleDidSetLayoutMaker {
	
	unowned let parentView: UIView
	
	let center: CGRect.Float
	
	let middle: CGRect.Float
	
}

extension CenterMiddleDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = CenterMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                middle: self.middle,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                middle: self.middle,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	public func calculateBottom(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(calculation)
		
		let maker = CenterMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             middle: self.middle,
		                                             bottom: bottom)
		
		return maker
		
	}
	
}

extension CenterMiddleDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> CenterMiddleWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = CenterMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               middle: self.middle,
		                                               width: width)
		
		return maker
		
	}
	
	public func calculateWidth(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterMiddleWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calculation)
		
		let maker = CenterMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               middle: self.middle,
		                                               width: width)
		
		return maker
		
	}
	
}


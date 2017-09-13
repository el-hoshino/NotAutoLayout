//
//  CenterTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: CGRect.Float
	
	let top: CGRect.Float
	
}

extension CenterTopDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopBottomDidSetLayoutMaker {
		
        let referenceView = { [weak referenceView] in referenceView }
        
        return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
        
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
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
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		
		return maker
		
	}
	
}

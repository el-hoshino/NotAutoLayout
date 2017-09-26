//
//  CenterMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterMiddleDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
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
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
		let maker = CenterMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                middle: self.middle,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterMiddleBottomDidSetLayoutMaker {
		
    	let referenceView = { [weak referenceView] in referenceView }
    	
    	return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
    	
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                middle: self.middle,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterMiddleBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
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
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterMiddleWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = CenterMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               middle: self.middle,
		                                               width: width)
		
		return maker
		
	}
	
}


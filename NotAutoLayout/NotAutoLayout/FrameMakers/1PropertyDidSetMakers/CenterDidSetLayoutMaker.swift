//
//  CenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: CGRect.Float
	
}

extension CenterDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> CenterTopDidSetLayoutMaker {
		
		let top = CGRect.Float.constant(top)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		
		return maker
		
	}
	
	public func setTop(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterTopDidSetLayoutMaker {
		
		let top = CGRect.Float.closure(calculation)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		
		return maker
		
	}
	
}

extension CenterDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> CenterMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.constant(middle)
		
		let maker = CenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          middle: middle)
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          middle: middle)
		
		return maker
		
	}
	
	public func setMiddle(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.closure(calculation)
		
		let maker = CenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          middle: middle)
		
		return maker
		
	}
	
}

extension CenterDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> CenterBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = CenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          bottom: bottom)
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(calculation)
		
		let maker = CenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                          center: self.center,
		                                          bottom: bottom)
		
		return maker
		
	}
	
}

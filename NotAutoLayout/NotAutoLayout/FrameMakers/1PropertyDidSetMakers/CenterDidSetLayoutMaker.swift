//
//  CenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterDidSetLayoutMaker {
	
	let parentView: UIView
	
	let center: CGRect.Float
	
}

extension CenterDidSetLayoutMaker {
	
	public func setTop(to baseline: CGFloat) -> CenterTopDidSetLayoutMaker {
		
		let top = CGRect.Float.constant(baseline)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = true) -> CenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		
		return maker
		
	}
	
	public func calculateTop(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterTopDidSetLayoutMaker {
		
		let top = CGRect.Float.closure(calculation)
		
		let maker = CenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                       center: self.center,
		                                       top: top)
		
		return maker
		
	}
	
}

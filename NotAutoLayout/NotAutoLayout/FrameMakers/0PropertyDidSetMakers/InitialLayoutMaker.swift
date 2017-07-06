//
//  InitialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutMaker {
	
	let parentView: UIView
	
}

extension InitialLayoutMaker {
	
	public func setLeft(to left: CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.constant(left)
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = true) -> LeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func calculateLeft(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.closure(calculation)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setCenter(to baseline: CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.constant(baseline)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = true) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func calculateCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.closure(calculation)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func pinTopCenter(to referenceView: UIView, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = true) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	public func calculateTopCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = CGRect.Point.closure(calculation)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func stickOnParent() -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			return CGRect(origin: .zero, size: boundSize)
		}
		
		return layout
		
	}
	
}

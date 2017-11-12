//
//  LayoutMakerCanSetTopRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetTopRightType: LayoutMakerType {
	
	associatedtype WillSetTopRightMaker
	
	func setTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightMaker
	
}

extension LayoutMakerCanSetTopRightType {
	
	public func setTopRight(to topRight: CGPoint) -> WillSetTopRightMaker {
		
		let topRight = LayoutElement.Point.constant(topRight)
		
		let maker = self.setTopRight(topRight)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetTopRightMaker {
		
		let topRight = LayoutElement.Point.closure(topRight)
		
		let maker = self.setTopRight(topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.setTopRight(topRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.setTopRight(topRight)
		
		return maker
		
	}
	
}

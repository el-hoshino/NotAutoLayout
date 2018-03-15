//
//  LayoutPropertyCanStoreMiddleType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleProperty: LayoutMakerPropertyType
	
	func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetMiddleProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleType {
	
	public func setMiddle(to middle: CGFloat) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.constant(middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ property: ViewLayoutGuides) -> CGFloat) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.byParent(middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, with middle: @escaping (ViewPinGuides.Vertical) -> CGFloat) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		return self.pinMiddle(by: { [weak referenceView] in referenceView }, with: middle)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, with middle: @escaping (ViewPinGuides.Vertical) -> CGFloat) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.byReference(referenceGetter: referenceView, middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleToEvaluateFrameType: LayoutPropertyCanStoreMiddleType {
	
	func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middle: middle, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

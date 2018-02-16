//
//  LayoutPropertyCanStoreLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetLeftProperty: LayoutMakerPropertyType
	
	func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreLeftType {
	
	public func setLeft(to left: CGFloat) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.constant(left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byParent(left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		return self.pinLeft(by: { [weak referenceView] in referenceView }, with: left)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreLeftToEvaluateFrameType: LayoutPropertyCanStoreLeftType {
	
	func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(left: left, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

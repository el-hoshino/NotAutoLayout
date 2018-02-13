//
//  LayoutPropertyCanStoreCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetCenterProperty
	
	func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreCenterType {
	
	public func setCenter(to center: CGFloat) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.constant(center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.byParent(center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		return self.pinCenter(by: { [weak referenceView] in referenceView }, with: center)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreCenterToEvaluateFrameType: LayoutPropertyCanStoreCenterType {
	
	func evaluateFrame(center: LayoutElement.Horizontal, parameters: CalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<Layout> {
		
		let layout = Layout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(center: center, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

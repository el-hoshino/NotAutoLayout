//
//  LayoutPropertyCanStoreCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetCenterProperty: LayoutMakerPropertyType
	
	func storeCenter(_ center: LayoutElement.Horizontal) -> WillSetCenterProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreCenterType {
	
	func storeCenter(_ center: LayoutElement.Horizontal) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let newProperty = self.didSetProperty.storeCenter(center)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreCenterType {
	
	public func setCenter(to center: Float) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.constant(center)
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.byParent(center)
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, with center: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		return self.pinCenter(by: { [weak referenceView] in referenceView }, with: center)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, with center: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, center)
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreCenterToEvaluateFrameType: LayoutPropertyCanStoreCenterType {
	
	func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualLayout {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(center: center, parameters: parameters)
		})
		
		return layout
		
	}
	
}

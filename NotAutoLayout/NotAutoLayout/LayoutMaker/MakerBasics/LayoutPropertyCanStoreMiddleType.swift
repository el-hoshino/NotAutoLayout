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
	
	func storeMiddle(_ middle: LayoutElement.Vertical) -> WillSetMiddleProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleType {
	
	func storeMiddle(_ middle: LayoutElement.Vertical) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let newProperty = self.didSetProperty.storeMiddle(middle)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleType {
	
	public func setMiddle(to middle: Float) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.constant(middle)
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.byParent(middle)
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, with middle: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		return self.pinMiddle(by: { [weak referenceView] in referenceView }, with: middle)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, with middle: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical.byReference(referenceGetter: referenceView, middle)
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleToEvaluateFrameType: LayoutPropertyCanStoreMiddleType {
	
	func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualLayout {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(middle: middle, parameters: parameters)
		})
		
		return layout
		
	}
	
}

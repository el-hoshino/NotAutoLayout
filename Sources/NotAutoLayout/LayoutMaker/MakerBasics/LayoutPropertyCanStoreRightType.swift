//
//  LayoutPropertyCanStoreRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetRightProperty: LayoutMakerPropertyType
	
	func storeRight(_ right: LayoutElement.Horizontal) -> WillSetRightProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreRightType {
	
	func storeRight(_ right: LayoutElement.Horizontal) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let newProperty = self.didSetProperty.storeRight(right)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreRightType {
	
	public func setRight(to right: Float) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.constant(right)
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.byParent(right)
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, with right: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetRightProperty> {
		
		return self.pinRight(by: { [weak referenceView] in referenceView }, with: right)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, with right: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, right)
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreRightToEvaluateFrameType: LayoutPropertyCanStoreRightType {
	
	func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(right: right, parameters: parameters)
		})
		
		return layout
		
	}
	
}

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
	
	func storeLeft(_ left: LayoutElement.Horizontal) -> WillSetLeftProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreLeftType {
	
	func storeLeft(_ left: LayoutElement.Horizontal) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let newProperty = self.didSetProperty.storeLeft(left)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreLeftType {
	
	public func setLeft(to left: Float) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.constant(left)
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byParent(left)
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, with left: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		return self.pinLeft(by: { [weak referenceView] in referenceView }, with: left)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, with left: @escaping (ViewPinGuides.Horizontal) -> Float) -> LayoutMaker<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, left)
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreLeftToEvaluateFrameType: LayoutPropertyCanStoreLeftType {
	
	func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(left: left, parameters: parameters)
		})
		
		return layout
		
	}
	
}

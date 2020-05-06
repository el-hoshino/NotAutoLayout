//
//  LayoutPropertyCanStoreMiddleCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreMiddleCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleCenterProperty: LayoutMakerPropertyType
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> WillSetMiddleCenterProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleCenterType {
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let newProperty = self.didSetProperty.storeMiddleCenter(middleCenter)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleCenterType {
	
	public func setMiddleCenter(to middleCenter: Point) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byParent(middleCenter)
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, middleCenter)
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType: LayoutPropertyCanStoreMiddleCenterType {
	
	func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(middleCenter: middleCenter, parameters: parameters)
		})
		
		return layout
		
	}
	
}

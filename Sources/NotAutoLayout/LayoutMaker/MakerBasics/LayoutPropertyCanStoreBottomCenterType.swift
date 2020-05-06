//
//  LayoutPropertyCanStoreBottomCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreBottomCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomCenterProperty: LayoutMakerPropertyType
	
	func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> WillSetBottomCenterProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreBottomCenterType {
	
	func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> LayoutMaker<Property.WillSetBottomCenterProperty> {
		
		let newProperty = self.didSetProperty.storeBottomCenter(bottomCenter)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomCenterType {
	
	public func setBottomCenter(to bottomCenter: Point) -> LayoutMaker<Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point.constant(bottomCenter)
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point.byParent(bottomCenter)
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, with bottomCenter: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomCenterProperty> {
		
		return self.pinBottomCenter(by: { [weak referenceView] in referenceView }, with: bottomCenter)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, with bottomCenter: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomCenter)
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomCenterToEvaluateFrameType: LayoutPropertyCanStoreBottomCenterType {
	
	func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(bottomCenter: bottomCenter, parameters: parameters)
		})
		
		return layout
		
	}
	
}

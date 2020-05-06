//
//  LayoutPropertyCanStoreBottomLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreBottomLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomLeftProperty: LayoutMakerPropertyType
	
	func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> WillSetBottomLeftProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreBottomLeftType {
	
	func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let newProperty = self.didSetProperty.storeBottomLeft(bottomLeft)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomLeftType {
	
	public func setBottomLeft(to bottomLeft: Point) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.constant(bottomLeft)
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.byParent(bottomLeft)
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, with bottomLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		return self.pinBottomLeft(by: { [weak referenceView] in referenceView }, with: bottomLeft)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, with bottomLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomLeft)
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomLeftToEvaluateFrameType: LayoutPropertyCanStoreBottomLeftType {
	
	func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(bottomLeft: bottomLeft, parameters: parameters)
		})
		
		return layout
		
	}
	
}

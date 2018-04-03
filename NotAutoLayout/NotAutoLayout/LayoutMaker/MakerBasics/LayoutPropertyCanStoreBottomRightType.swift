//
//  LayoutPropertyCanStoreBottomRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomRightProperty: LayoutMakerPropertyType
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point) -> WillSetBottomRightProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreBottomRightType {
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let newProperty = self.didSetProperty.storeBottomRight(bottomRight)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomRightType {
	
	public func setBottomRight(to bottomRight: Point) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.constant(bottomRight)
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.byParent(bottomRight)
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, with bottomRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		return self.pinBottomRight(by: { [weak referenceView] in referenceView }, with: bottomRight)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, with bottomRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomRight)
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomRightToEvaluateFrameType: LayoutPropertyCanStoreBottomRightType {
	
	func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(bottomRight: bottomRight, parameters: parameters)
		})
		
		return layout
		
	}
	
}

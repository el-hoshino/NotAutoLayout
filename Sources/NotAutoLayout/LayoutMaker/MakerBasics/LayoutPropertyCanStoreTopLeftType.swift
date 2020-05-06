//
//  LayoutPropertyCanStoreTopLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreTopLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopLeftProperty: LayoutMakerPropertyType
	
	func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreTopLeftType {
	
	func storeTopLeft(_ topLeft: LayoutElement.Point) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let newProperty = self.didSetProperty.storeTopLeft(topLeft)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopLeftType {
	
	public func setTopLeft(to topLeft: Point) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.constant(topLeft)
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.byParent(topLeft)
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, with topLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		return self.pinTopLeft(by: { [weak referenceView] in referenceView }, with: topLeft)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, with topLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, topLeft)
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopLeftToEvaluateFrameType: LayoutPropertyCanStoreTopLeftType {
	
	func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(topLeft: topLeft, parameters: parameters)
		})
		
		return layout
		
	}
	
}

//
//  LayoutPropertyCanStoreMiddleLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleLeftProperty: LayoutMakerPropertyType
	
	func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> WillSetMiddleLeftProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleLeftType {
	
	func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> LayoutMaker<Property.WillSetMiddleLeftProperty> {
		
		let newProperty = self.didSetProperty.storeMiddleLeft(middleLeft)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleLeftType {
	
	public func setMiddleLeft(to middleLeft: Point) -> LayoutMaker<Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point.constant(middleLeft)
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point.byParent(middleLeft)
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, with middleLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleLeftProperty> {
		
		return self.pinMiddleLeft(by: { [weak referenceView] in referenceView }, with: middleLeft)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, with middleLeft: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, middleLeft)
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType: LayoutPropertyCanStoreMiddleLeftType {
	
	func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(middleLeft: middleLeft, parameters: parameters)
		})
		
		return layout
		
	}
	
}

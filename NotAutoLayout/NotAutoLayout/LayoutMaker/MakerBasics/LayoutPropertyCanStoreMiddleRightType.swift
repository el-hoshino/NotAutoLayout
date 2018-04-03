//
//  LayoutPropertyCanStoreMiddleRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleRightProperty: LayoutMakerPropertyType
	
	func storeMiddleRight(_ middleRight: LayoutElement.Point) -> WillSetMiddleRightProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleRightType {
	
	func storeMiddleRight(_ middleRight: LayoutElement.Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let newProperty = self.didSetProperty.storeMiddleRight(middleRight)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleRightType {
	
	public func setMiddleRight(to middleRight: Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.constant(middleRight)
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.byParent(middleRight)
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, with middleRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		return self.pinMiddleRight(by: { [weak referenceView] in referenceView }, with: middleRight)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, with middleRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.byReference(referenceGetter: referenceView, middleRight)
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleRightToEvaluateFrameType: LayoutPropertyCanStoreMiddleRightType {
	
	func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> IndividualLayout {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(middleRight: middleRight, parameters: parameters)
		})
		
		return layout
		
	}
	
}

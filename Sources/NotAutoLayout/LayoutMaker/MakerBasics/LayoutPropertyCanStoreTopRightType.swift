//
//  LayoutPropertyCanStoreTopRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreTopRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopRightProperty: LayoutMakerPropertyType
	
	func storeTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreTopRightType {
	
	func storeTopRight(_ topRight: LayoutElement.Point) -> LayoutMaker<Property.WillSetTopRightProperty> {
		
		let newProperty = self.didSetProperty.storeTopRight(topRight)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopRightType {
	
	public func setTopRight(to topRight: Point) -> LayoutMaker<Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point.constant(topRight)
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point.byParent(topRight)
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, with topRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetTopRightProperty> {
		
		return self.pinTopRight(by: { [weak referenceView] in referenceView }, with: topRight)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, with topRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point.byReference(referenceGetter: referenceView, topRight)
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopRightToEvaluateFrameType: LayoutPropertyCanStoreTopRightType {
	
	func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(topRight: topRight, parameters: parameters)
		})
		
		return layout
		
	}
	
}

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
	
	func storeMiddleRight(_ middleRight: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetMiddleRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleRightType {
	
	public func setMiddleRight(to middleRight: Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.constant(middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ property: ViewLayoutGuides) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.byParent(middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, with middleRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		return self.pinMiddleRight(by: { [weak referenceView] in referenceView }, with: middleRight)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, with middleRight: @escaping (ViewPinGuides.Point) -> Point) -> LayoutMaker<Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point.byReference(referenceGetter: referenceView, middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleRightToEvaluateFrameType: LayoutPropertyCanStoreMiddleRightType {
	
	func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(middleRight: middleRight, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

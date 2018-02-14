//
//  LayoutPropertyCanStoreMiddleCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleCenterProperty
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetMiddleCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleCenterType {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byParent(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType: LayoutPropertyCanStoreMiddleCenterType {
	
	func evaluateFrame(middleCenter: LayoutElement.Point, parameters: CalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middleCenter: middleCenter, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

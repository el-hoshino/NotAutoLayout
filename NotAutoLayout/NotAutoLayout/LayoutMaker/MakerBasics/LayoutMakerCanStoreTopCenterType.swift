//
//  LayoutPropertyCanStoreTopCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopCenterProperty
	
	func storeTopCenter(_ topCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetTopCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopCenterType {
	
	public func setTopCenter(to topCenter: CGPoint) -> LayoutMaker<Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point.constant(topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
	public func setTopCenter(by topCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> LayoutMaker<Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point.byParent(topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetTopCenterProperty> {
		
		return self.pinTopCenter(by: { [weak referenceView] in referenceView }, with: topCenter)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopCenterToEvaluateFrameType: LayoutPropertyCanStoreTopCenterType {
	
	func evaluateFrame(topCenter: LayoutElement.Point, parameters: CalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(topCenter: topCenter, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

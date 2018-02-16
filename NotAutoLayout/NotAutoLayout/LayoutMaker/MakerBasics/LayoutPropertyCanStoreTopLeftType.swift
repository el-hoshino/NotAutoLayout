//
//  LayoutPropertyCanStoreTopLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopLeftProperty: LayoutMakerPropertyType
	
	func storeTopLeft(_ topLeft: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetTopLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopLeftType {
	
	public func setTopLeft(to topLeft: CGPoint) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.constant(topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.byParent(topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		return self.pinTopLeft(by: { [weak referenceView] in referenceView }, with: topLeft)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopLeftToEvaluateFrameType: LayoutPropertyCanStoreTopLeftType {
	
	func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(topLeft: topLeft, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

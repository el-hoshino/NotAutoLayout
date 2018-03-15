//
//  LayoutPropertyCanStoreBottomLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomLeftProperty: LayoutMakerPropertyType
	
	func storeBottomLeft(_ bottomLeft: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetBottomLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomLeftType {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.constant(bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ property: ViewLayoutGuides) -> CGPoint) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.byParent(bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		return self.pinBottomLeft(by: { [weak referenceView] in referenceView }, with: bottomLeft)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomLeftToEvaluateFrameType: LayoutPropertyCanStoreBottomLeftType {
	
	func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottomLeft: bottomLeft, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

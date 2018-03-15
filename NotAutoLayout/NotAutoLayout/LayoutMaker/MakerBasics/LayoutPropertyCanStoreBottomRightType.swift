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
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetBottomRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomRightType {
	
	public func setBottomRight(to bottomRight: CGPoint) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.constant(bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ property: ViewLayoutGuides) -> CGPoint) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.byParent(bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, with bottomRight: @escaping (ViewPinGuides.Point) -> CGPoint) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		return self.pinBottomRight(by: { [weak referenceView] in referenceView }, with: bottomRight)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, with bottomRight: @escaping (ViewPinGuides.Point) -> CGPoint) -> LayoutMaker<Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomRightToEvaluateFrameType: LayoutPropertyCanStoreBottomRightType {
	
	func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottomRight: bottomRight, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

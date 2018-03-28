//
//  LayoutPropertyCanStoreBottomType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomProperty: LayoutMakerPropertyType
	
	func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetBottomProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomType {
	
	public func setBottom(to bottom: Float) -> LayoutMaker<Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical.constant(bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical.byParent(bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, with bottom: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetBottomProperty> {
		
		return self.pinBottom(by: { [weak referenceView] in referenceView }, with: bottom)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, with bottom: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical.byReference(referenceGetter: referenceView, bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomToEvaluateFrameType: LayoutPropertyCanStoreBottomType {
	
	func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(bottom: bottom, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

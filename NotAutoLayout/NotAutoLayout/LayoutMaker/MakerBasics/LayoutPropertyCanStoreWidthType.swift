//
//  LayoutPropertyCanStoreWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreWidthType: LayoutMakerPropertyType {
	
	associatedtype WillSetWidthProperty
	
	func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetWidthProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreWidthType {
	
	public func setWidth(to width: CGFloat) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.constant(width)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.byParent(width)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
	public func fitWidth(by fittingWidth: CGFloat = 0) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.fits(fittingWidth)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreWidthToEvaluateFrameType: LayoutPropertyCanStoreWidthType {
	
	func evaluateFrame(width: LayoutElement.Length, parameters: CalculationParameters) -> CGRect
	
}

extension LayoutPropertyCanStoreWidthToEvaluateFrameType {

	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(width: width, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}

}

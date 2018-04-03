//
//  LayoutPropertyCanStoreWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreWidthType: LayoutMakerPropertyType {
	
	associatedtype WillSetWidthProperty: LayoutMakerPropertyType
	
	func storeWidth(_ width: LayoutElement.Length) -> WillSetWidthProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreWidthType {
	
	func storeWidth(_ width: LayoutElement.Length) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let newProperty = self.didSetProperty.storeWidth(width)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreWidthType {
	
	public func setWidth(to width: Float) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.constant(width)
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.byParent(width)
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
	public func fitWidth(by fittingWidth: Float = 0) -> LayoutMaker<Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length.fits(fittingWidth)
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreWidthToEvaluateFrameType: LayoutPropertyCanStoreWidthType {
	
	func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreWidthToEvaluateFrameType {

	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(width: width, parameters: parameters)
		})
		
		return layout
		
	}

}

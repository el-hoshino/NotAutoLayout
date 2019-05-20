//
//  LayoutPropertyCanStoreHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHeightType: LayoutMakerPropertyType {
	
	associatedtype WillSetHeightProperty: LayoutMakerPropertyType
	
	func storeHeight(_ height: LayoutElement.Length) -> WillSetHeightProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreHeightType {
	
	func storeHeight(_ height: LayoutElement.Length) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let newProperty = self.didSetProperty.storeHeight(height)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHeightType {
	
	public func setHeight(to height: Float) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.constant(height)
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.byParent(height)
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: Float = 0) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.fits(fittingHeight)
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHeightToEvaluateFrameType: LayoutPropertyCanStoreHeightType {
	
	func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(height: height, parameters: parameters)
		})
		
		return layout
		
	}
	
}

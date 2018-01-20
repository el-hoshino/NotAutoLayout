//
//  LayoutPropertyCanStoreHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHeightType: LayoutMakerPropertyType {
	
	associatedtype WillSetHeightProperty
	
	func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetHeightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHeightType {
	
	public func setHeight(to height: CGFloat) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.constant(height)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.byParent(height)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutMaker<Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length.fits(fittingHeight)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHeightToEvaluateFrameType: LayoutPropertyCanStoreHeightType {
	
	func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<Self>) -> LayoutMaker<DidStoreAllRequiredLayoutProperty> {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(height: height, property: property)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

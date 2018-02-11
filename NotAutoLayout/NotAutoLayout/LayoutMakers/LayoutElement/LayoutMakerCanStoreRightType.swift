//
//  LayoutPropertyCanStoreRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetRightProperty
	
	func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreRightType {
	
	public func setRight(to right: CGFloat) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.constant(right)
		let maker = self.didSetProperty.storeRight(right, to: self)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.byParent(right)
		let maker = self.didSetProperty.storeRight(right, to: self)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, with right: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetRightProperty> {
		
		return self.pinRight(by: { [weak referenceView] in referenceView }, with: right)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, with right: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<Property.WillSetRightProperty> {
		
		let right = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, right)
		let maker = self.didSetProperty.storeRight(right, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreRightToEvaluateFrameType: LayoutPropertyCanStoreRightType {
	
	func evaluateFrame(right: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<Self>) -> LayoutMaker<Layout> {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(right: right, property: property)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

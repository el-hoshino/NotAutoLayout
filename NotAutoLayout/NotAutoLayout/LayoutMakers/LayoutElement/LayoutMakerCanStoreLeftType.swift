//
//  LayoutPropertyCanStoreLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetLeftProperty
	
	func storeLeft(_ left: LayoutElement.Horizontal) -> WillSetLeftProperty
	
}

extension LayoutProperty where Property: LayoutPropertyCanStoreLeftType {
	
	public func setLeft(to left: CGFloat) -> LayoutProperty<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.constant(left)
		let property = self.didSetProperty.storeLeft(left)
		let maker = LayoutProperty<Property.WillSetLeftProperty>(parentView: self.parentView, didSetProperty: property)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> LayoutProperty<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byParent(left)
		let property = self.didSetProperty.storeLeft(left)
		let maker = LayoutProperty<Property.WillSetLeftProperty>(parentView: self.parentView, didSetProperty: property)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutProperty<Property.WillSetLeftProperty> {
		
		return self.pinLeft(by: { [weak referenceView] in referenceView }, with: left)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutProperty<Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, left)
		let property = self.didSetProperty.storeLeft(left)
		let maker = LayoutProperty<Property.WillSetLeftProperty>(parentView: self.parentView, didSetProperty: property)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreLeftToEvaluateFrameType: LayoutPropertyCanStoreLeftType where WillSetLeftProperty == Layout {
	
	func evaluateFrame(left: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> Layout {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(left: left, property: property)
		})
		
		return layout
		
	}
	
}

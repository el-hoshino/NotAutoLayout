//
//  LayoutPropertyCanStoreCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreCenterType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetCenterProperty: LayoutMakerPropertyType
	
	func storeCenter(_ center: LayoutElement.Horizontal<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreCenterType, Property._ParentView == ParentView {
	
	public func setCenter(to center: CGFloat) -> LayoutMaker<ParentView, Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal<ParentView>.constant(center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal.byParent(center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetCenterProperty> {
		
		return self.pinCenter(by: { [weak referenceView] in referenceView }, with: center)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetCenterProperty> {
		
		let center = LayoutElement.Horizontal<ParentView>.byReference(referenceGetter: referenceView, center)
		let maker = self.didSetProperty.storeCenter(center, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreCenterToEvaluateFrameType: LayoutPropertyCanStoreCenterType {
	
	func evaluateFrame(center: LayoutElement.Horizontal<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(center: center, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

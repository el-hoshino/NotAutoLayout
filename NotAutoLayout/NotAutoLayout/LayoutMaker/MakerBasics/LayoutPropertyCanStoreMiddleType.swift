//
//  LayoutPropertyCanStoreMiddleType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetMiddleProperty: LayoutMakerPropertyType
	
	func storeMiddle(_ middle: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetMiddleProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleType, Property._ParentView == ParentView {
	
	public func setMiddle(to middle: CGFloat) -> LayoutMaker<ParentView, Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical<ParentView>.constant(middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical<ParentView>.byParent(middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, with middle: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetMiddleProperty> {
		
		return self.pinMiddle(by: { [weak referenceView] in referenceView }, with: middle)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, with middle: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetMiddleProperty> {
		
		let middle = LayoutElement.Vertical<ParentView>.byReference(referenceGetter: referenceView, middle)
		let maker = self.didSetProperty.storeMiddle(middle, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleToEvaluateFrameType: LayoutPropertyCanStoreMiddleType {
	
	func evaluateFrame(middle: LayoutElement.Vertical<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middle: middle, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

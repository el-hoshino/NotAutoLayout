//
//  LayoutPropertyCanStoreMiddleCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleCenterType: LayoutMakerPropertyType {
		
	associatedtype WillSetMiddleCenterProperty: LayoutMakerPropertyType
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetMiddleCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleCenterType, Property._ParentView == ParentView {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point<ParentView>.constant(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point<ParentView>.byParent(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleCenterProperty> {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType: LayoutPropertyCanStoreMiddleCenterType {
	
	func evaluateFrame(middleCenter: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middleCenter: middleCenter, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

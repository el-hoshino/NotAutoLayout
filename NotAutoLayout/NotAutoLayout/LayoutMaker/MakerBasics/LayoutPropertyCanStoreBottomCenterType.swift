//
//  LayoutPropertyCanStoreBottomCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomCenterType: LayoutMakerPropertyType {
		
	associatedtype WillSetBottomCenterProperty: LayoutMakerPropertyType
	
	func storeBottomCenter(_ bottomCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetBottomCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomCenterType, Property._ParentView == ParentView {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point<ParentView>.constant(bottomCenter)
		let maker = self.didSetProperty.storeBottomCenter(bottomCenter, to: self)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point<ParentView>.byParent(bottomCenter)
		let maker = self.didSetProperty.storeBottomCenter(bottomCenter, to: self)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, with bottomCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomCenterProperty> {
		
		return self.pinBottomCenter(by: { [weak referenceView] in referenceView }, with: bottomCenter)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, with bottomCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomCenterProperty> {
		
		let bottomCenter = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, bottomCenter)
		let maker = self.didSetProperty.storeBottomCenter(bottomCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomCenterToEvaluateFrameType: LayoutPropertyCanStoreBottomCenterType {
	
	func evaluateFrame(bottomCenter: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottomCenter: bottomCenter, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

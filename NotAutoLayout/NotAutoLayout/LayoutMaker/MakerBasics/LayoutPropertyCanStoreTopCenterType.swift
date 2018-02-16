//
//  LayoutPropertyCanStoreTopCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopCenterType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetTopCenterProperty: LayoutMakerPropertyType
	
	func storeTopCenter(_ topCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetTopCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopCenterType, Property._ParentView == ParentView {
	
	public func setTopCenter(to topCenter: CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point<ParentView>.constant(topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
	public func setTopCenter(by topCenter: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point<ParentView>.byParent(topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopCenterProperty> {
		
		return self.pinTopCenter(by: { [weak referenceView] in referenceView }, with: topCenter)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopCenterProperty> {
		
		let topCenter = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, topCenter)
		let maker = self.didSetProperty.storeTopCenter(topCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopCenterToEvaluateFrameType: LayoutPropertyCanStoreTopCenterType {
	
	func evaluateFrame(topCenter: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(topCenter: topCenter, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

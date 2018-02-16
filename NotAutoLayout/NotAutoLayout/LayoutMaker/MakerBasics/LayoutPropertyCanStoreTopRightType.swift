//
//  LayoutPropertyCanStoreTopRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopRightType: LayoutMakerPropertyType {
		
	associatedtype WillSetTopRightProperty: LayoutMakerPropertyType
	
	func storeTopRight(_ topRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetTopRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopRightType, Property._ParentView == ParentView {
	
	public func setTopRight(to topRight: CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point<ParentView>.constant(topRight)
		let maker = self.didSetProperty.storeTopRight(topRight, to: self)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point<ParentView>.byParent(topRight)
		let maker = self.didSetProperty.storeTopRight(topRight, to: self)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, with topRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopRightProperty> {
		
		return self.pinTopRight(by: { [weak referenceView] in referenceView }, with: topRight)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, with topRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopRightProperty> {
		
		let topRight = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, topRight)
		let maker = self.didSetProperty.storeTopRight(topRight, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopRightToEvaluateFrameType: LayoutPropertyCanStoreTopRightType {
	
	func evaluateFrame(topRight: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func storeTopRight(_ topRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(topRight: topRight, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

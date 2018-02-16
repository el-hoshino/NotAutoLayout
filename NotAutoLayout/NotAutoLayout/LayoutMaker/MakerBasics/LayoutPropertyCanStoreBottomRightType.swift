//
//  LayoutPropertyCanStoreBottomRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomRightType: LayoutMakerPropertyType {
		
	associatedtype WillSetBottomRightProperty: LayoutMakerPropertyType
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetBottomRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomRightType, Property._ParentView == ParentView {
	
	public func setBottomRight(to bottomRight: CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point<ParentView>.constant(bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point.byParent(bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, with bottomRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomRightProperty> {
		
		return self.pinBottomRight(by: { [weak referenceView] in referenceView }, with: bottomRight)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, with bottomRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomRightProperty> {
		
		let bottomRight = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, bottomRight)
		let maker = self.didSetProperty.storeBottomRight(bottomRight, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomRightToEvaluateFrameType: LayoutPropertyCanStoreBottomRightType {
	
	func evaluateFrame(bottomRight: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottomRight: bottomRight, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

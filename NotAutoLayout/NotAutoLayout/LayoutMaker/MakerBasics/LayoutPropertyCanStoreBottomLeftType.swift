//
//  LayoutPropertyCanStoreBottomLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomLeftType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetBottomLeftProperty: LayoutMakerPropertyType
	
	func storeBottomLeft(_ bottomLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetBottomLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomLeftType, Property._ParentView == ParentView {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point<ParentView>.constant(bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point<ParentView>.byParent(bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomLeftProperty> {
		
		return self.pinBottomLeft(by: { [weak referenceView] in referenceView }, with: bottomLeft)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetBottomLeftProperty> {
		
		let bottomLeft = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, bottomLeft)
		let maker = self.didSetProperty.storeBottomLeft(bottomLeft, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomLeftToEvaluateFrameType: LayoutPropertyCanStoreBottomLeftType {
	
	func evaluateFrame(bottomLeft: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottomLeft: bottomLeft, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

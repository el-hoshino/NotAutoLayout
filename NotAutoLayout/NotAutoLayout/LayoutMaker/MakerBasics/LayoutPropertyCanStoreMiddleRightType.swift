//
//  LayoutPropertyCanStoreMiddleRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleRightType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetMiddleRightProperty: LayoutMakerPropertyType
	
	func storeMiddleRight(_ middleRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetMiddleRightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleRightType, Property._ParentView == ParentView {
	
	public func setMiddleRight(to middleRight: CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point<ParentView>.constant(middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point<ParentView>.byParent(middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, with middleRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleRightProperty> {
		
		return self.pinMiddleRight(by: { [weak referenceView] in referenceView }, with: middleRight)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, with middleRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleRightProperty> {
		
		let middleRight = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, middleRight)
		let maker = self.didSetProperty.storeMiddleRight(middleRight, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleRightToEvaluateFrameType: LayoutPropertyCanStoreMiddleRightType {
	
	func evaluateFrame(middleRight: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middleRight: middleRight, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

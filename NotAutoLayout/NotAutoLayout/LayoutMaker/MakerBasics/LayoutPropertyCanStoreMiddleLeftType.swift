//
//  LayoutPropertyCanStoreMiddleLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleLeftType: LayoutMakerPropertyType {
		
	associatedtype WillSetMiddleLeftProperty: LayoutMakerPropertyType
	
	func storeMiddleLeft(_ middleLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetMiddleLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleLeftType, Property._ParentView == ParentView {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point<ParentView>.constant(middleLeft)
		let maker = self.didSetProperty.storeMiddleLeft(middleLeft, to: self)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point<ParentView>.byParent(middleLeft)
		let maker = self.didSetProperty.storeMiddleLeft(middleLeft, to: self)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, with middleLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleLeftProperty> {
		
		return self.pinMiddleLeft(by: { [weak referenceView] in referenceView }, with: middleLeft)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, with middleLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetMiddleLeftProperty> {
		
		let middleLeft = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, middleLeft)
		let maker = self.didSetProperty.storeMiddleLeft(middleLeft, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType: LayoutPropertyCanStoreMiddleLeftType {
	
	func evaluateFrame(middleLeft: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(middleLeft: middleLeft, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

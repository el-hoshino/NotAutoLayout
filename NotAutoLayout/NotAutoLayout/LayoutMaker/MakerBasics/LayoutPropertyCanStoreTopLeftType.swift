//
//  LayoutPropertyCanStoreTopLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopLeftType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetTopLeftProperty: LayoutMakerPropertyType
	
	func storeTopLeft(_ topLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetTopLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopLeftType, Property._ParentView == ParentView {
	
	public func setTopLeft(to topLeft: CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point<ParentView>.constant(topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point<ParentView>.byParent(topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopLeftProperty> {
		
		return self.pinTopLeft(by: { [weak referenceView] in referenceView }, with: topLeft)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<ParentView, Property.WillSetTopLeftProperty> {
		
		let topLeft = LayoutElement.Point<ParentView>.byReference(referenceGetter: referenceView, topLeft)
		let maker = self.didSetProperty.storeTopLeft(topLeft, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopLeftToEvaluateFrameType: LayoutPropertyCanStoreTopLeftType {
	
	func evaluateFrame(topLeft: LayoutElement.Point<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(topLeft: topLeft, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

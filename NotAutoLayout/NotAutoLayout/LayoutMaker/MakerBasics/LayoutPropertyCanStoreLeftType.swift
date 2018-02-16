//
//  LayoutPropertyCanStoreLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreLeftType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetLeftProperty: LayoutMakerPropertyType
	
	func storeLeft(_ left: LayoutElement.Horizontal<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetLeftProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreLeftType, Property._ParentView == ParentView {
	
	public func setLeft(to left: CGFloat) -> LayoutMaker<ParentView, Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal<ParentView>.constant(left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal<ParentView>.byParent(left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetLeftProperty> {
		
		return self.pinLeft(by: { [weak referenceView] in referenceView }, with: left)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetLeftProperty> {
		
		let left = LayoutElement.Horizontal<ParentView>.byReference(referenceGetter: referenceView, left)
		let maker = self.didSetProperty.storeLeft(left, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreLeftToEvaluateFrameType: LayoutPropertyCanStoreLeftType {
	
	func evaluateFrame(left: LayoutElement.Horizontal<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	func storeLeft(_ left: LayoutElement.Horizontal<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(left: left, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

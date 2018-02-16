//
//  LayoutPropertyCanStoreBottomType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomType: LayoutMakerPropertyType {
		
	associatedtype WillSetBottomProperty: LayoutMakerPropertyType
	
	func storeBottom(_ bottom: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetBottomProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreBottomType, Property._ParentView == ParentView {
	
	public func setBottom(to bottom: CGFloat) -> LayoutMaker<ParentView, Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical<ParentView>.constant(bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical<ParentView>.byParent(bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, with bottom: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetBottomProperty> {
		
		return self.pinBottom(by: { [weak referenceView] in referenceView }, with: bottom)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, with bottom: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetBottomProperty> {
		
		let bottom = LayoutElement.Vertical<ParentView>.byReference(referenceGetter: referenceView, bottom)
		let maker = self.didSetProperty.storeBottom(bottom, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomToEvaluateFrameType: LayoutPropertyCanStoreBottomType {
	
	func evaluateFrame(bottom: LayoutElement.Vertical<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(bottom: bottom, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

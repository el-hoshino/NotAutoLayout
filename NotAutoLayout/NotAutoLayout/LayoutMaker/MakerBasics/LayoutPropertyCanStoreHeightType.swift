//
//  LayoutPropertyCanStoreHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHeightType: LayoutMakerPropertyType {
		
	associatedtype WillSetHeightProperty: LayoutMakerPropertyType
	
	func storeHeight(_ height: LayoutElement.Length<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetHeightProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHeightType, Property._ParentView == ParentView {
	
	public func setHeight(to height: CGFloat) -> LayoutMaker<ParentView, Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length<ParentView>.constant(height)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length<ParentView>.byParent(height)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutMaker<ParentView, Property.WillSetHeightProperty> {
		
		let height = LayoutElement.Length<ParentView>.fits(fittingHeight)
		let maker = self.didSetProperty.storeHeight(height, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHeightToEvaluateFrameType: LayoutPropertyCanStoreHeightType {
	
	func evaluateFrame(height: LayoutElement.Length<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func storeHeight(_ height: LayoutElement.Length<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(height: height, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

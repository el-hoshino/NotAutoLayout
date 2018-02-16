//
//  LayoutPropertyCanStoreWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreWidthType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetWidthProperty: LayoutMakerPropertyType
	
	func storeWidth(_ width: LayoutElement.Length<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetWidthProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreWidthType, Property._ParentView == ParentView {
	
	public func setWidth(to width: CGFloat) -> LayoutMaker<ParentView, Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length<ParentView>.constant(width)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length<ParentView>.byParent(width)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
	public func fitWidth(by fittingWidth: CGFloat = 0) -> LayoutMaker<ParentView, Property.WillSetWidthProperty> {
		
		let width = LayoutElement.Length<ParentView>.fits(fittingWidth)
		let maker = self.didSetProperty.storeWidth(width, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreWidthToEvaluateFrameType: LayoutPropertyCanStoreWidthType {
	
	func evaluateFrame(width: LayoutElement.Length<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreWidthToEvaluateFrameType {

	public func storeWidth(_ width: LayoutElement.Length<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(width: width, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}

}

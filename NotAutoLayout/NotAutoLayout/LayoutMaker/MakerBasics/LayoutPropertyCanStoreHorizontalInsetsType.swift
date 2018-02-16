//
//  LayoutPropertyCanStoreHorizontalInsetsType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHorizontalInsetsType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetHorizontalInsetsType: LayoutMakerPropertyType
	
	func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetHorizontalInsetsType>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHorizontalInsetsType, Property._ParentView == ParentView {
	
	public func setHorizontalInsetsEqualingToMargin() -> LayoutMaker<ParentView, Property.WillSetHorizontalInsetsType> {
		
		let insets = LayoutElement.Insets<ParentView>.equalsToMargin
		let maker = self.didSetProperty.storeHorizontalInsets(insets, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType: LayoutPropertyCanStoreHorizontalInsetsType {
	
	func evaluateFrames(horizontalInsets: LayoutElement.Insets<_ParentView>, parameters: SequentialFrameCalculationParameters<_ParentView>) -> [CGRect]
	
}

extension LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, SequentialLayout<_ParentView>> {
		
		let layout = SequentialLayout<_ParentView>(frame: { (parameters) -> [CGRect] in
			return self.evaluateFrames(horizontalInsets: horizontalInsets, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

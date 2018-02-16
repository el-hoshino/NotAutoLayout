//
//  LayoutPropertyCanStoreHorizontalInsetsType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHorizontalInsetsType: LayoutMakerPropertyType {
	
	associatedtype WillSetHorizontalInsetsType: LayoutMakerPropertyType
	
	func storeHorizontalInsets <ParentView> (_ horizontalInsets: LayoutElement.Insets<ParentView>, to maker: LayoutMaker<ParentView, Self>) -> LayoutMaker<ParentView, WillSetHorizontalInsetsType>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHorizontalInsetsType {
	
	public func setHorizontalInsetsEqualingToMargin() -> LayoutMaker<ParentView, Property.WillSetHorizontalInsetsType> {
		
		let insets = LayoutElement.Insets<ParentView>.equalsToMargin
		let maker = self.didSetProperty.storeHorizontalInsets(insets, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType: LayoutPropertyCanStoreHorizontalInsetsType {
	
	func evaluateFrames <ParentView> (horizontalInsets: LayoutElement.Insets<ParentView>, parameters: SequentialFrameCalculationParameters<ParentView>) -> [CGRect]
	
}

extension LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func storeHorizontalInsets <ParentView> (_ horizontalInsets: LayoutElement.Insets<ParentView>, to maker: LayoutMaker<ParentView, Self>) -> LayoutMaker<ParentView, SequentialLayout<ParentView>> {
		
		let layout = SequentialLayout<ParentView>(frame: { (parameters) -> [CGRect] in
			return self.evaluateFrames(horizontalInsets: horizontalInsets, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

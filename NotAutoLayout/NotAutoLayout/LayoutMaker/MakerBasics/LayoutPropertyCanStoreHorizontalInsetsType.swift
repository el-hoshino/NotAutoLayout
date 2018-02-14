//
//  LayoutPropertyCanStoreHorizontalInsetsType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHorizontalInsetsType: LayoutMakerPropertyType {
	
	associatedtype WillSetHorizontalInsetsType
	
	func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetHorizontalInsetsType>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHorizontalInsetsType {
	
	public func setHorizontalInsetsEqualingToMargin() -> LayoutMaker<Property.WillSetHorizontalInsetsType> {
		
		let insets = LayoutElement.Insets.equalsToMargin
		let maker = self.didSetProperty.storeHorizontalInsets(insets, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType: LayoutPropertyCanStoreHorizontalInsetsType {
	
	func evaluateFrames(horizontalInsets: LayoutElement.Insets, parameters: SequentialFrameCalculationParameters) -> [CGRect]
	
}

extension LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets, to maker: LayoutMaker<Self>) -> LayoutMaker<SequentialLayout> {
		
		let layout = SequentialLayout(frame: { (parameters) -> [CGRect] in
			return self.evaluateFrames(horizontalInsets: horizontalInsets, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

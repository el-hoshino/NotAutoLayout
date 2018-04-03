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
	
	func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets) -> WillSetHorizontalInsetsType
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreHorizontalInsetsType {
	
	func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets) -> LayoutMaker<Property.WillSetHorizontalInsetsType> {
		
		let newProperty = self.didSetProperty.storeHorizontalInsets(horizontalInsets)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreHorizontalInsetsType {
	
	public func setHorizontalInsetsEqualingToMargin() -> LayoutMaker<Property.WillSetHorizontalInsetsType> {
		
		let insets = LayoutElement.Insets.equalsToMargin
		let maker = self.storeHorizontalInsets(insets)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType: LayoutPropertyCanStoreHorizontalInsetsType {
	
	func evaluateFrames(horizontalInsets: LayoutElement.Insets, parameters: SequentialFrameCalculationParameters) -> [Rect]
	
}

extension LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func storeHorizontalInsets(_ horizontalInsets: LayoutElement.Insets) -> SequentialProperty.Layout {
		
		let layout = SequentialProperty.Layout(frame: { (parameters) -> [Rect] in
			return self.evaluateFrames(horizontalInsets: horizontalInsets, parameters: parameters)
		})
		
		return layout
		
	}
	
}

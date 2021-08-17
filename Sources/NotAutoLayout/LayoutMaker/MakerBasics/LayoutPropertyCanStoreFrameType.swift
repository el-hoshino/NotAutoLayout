//
//  LayoutPropertyCanStoreFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutPropertyCanStoreFrameType: LayoutMakerPropertyType {
	
	associatedtype WillSetFrameProperty: LayoutMakerPropertyType
	
	func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	func storeFrame(_ frame: LayoutElement.Rect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let newProperty = self.didSetProperty.storeFrame(frame)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	public func setFrame(to frame: Rect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.constant(frame)
		let maker = self.storeFrame(frame)
		
		return maker
		
	}
	
	public func setFrame(by frame: @escaping (_ property: ViewLayoutGuides) -> Rect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent(frame)
		let maker = self.storeFrame(frame)
		
		return maker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	public func stickOnParent(withInsets insets: Insets = .zero) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent({ $0.boundsGuide.frame(inside: insets) })
		let maker = self.storeFrame(frame)
		
		return maker
		
	}
	
	public func stickOnParentSafeArea(withInsets insets: Insets = .zero) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent({ $0.safeAreaGuide.frame(inside: insets) })
		let maker = self.storeFrame(frame)
		
		return maker

	}
	
}

public protocol LayoutPropertyCanStoreFrameToEvaluateFrameType: LayoutPropertyCanStoreFrameType {
	
	func evaluateFrame(frame: LayoutElement.Rect, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreFrameToEvaluateFrameType {
	
	public func storeFrame(_ frame: LayoutElement.Rect) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(frame: frame, parameters: parameters)
		})
		
		return layout
		
	}
	
}

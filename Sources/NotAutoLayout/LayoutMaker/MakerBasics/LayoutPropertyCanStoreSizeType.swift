//
//  LayoutPropertyCanStoreSizeType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreSizeType: LayoutMakerPropertyType {
	
	associatedtype WillSetSizeProperty: LayoutMakerPropertyType
	
	func storeSize(_ size: LayoutElement.Size) -> WillSetSizeProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanStoreSizeType {
	
	func storeSize(_ size: LayoutElement.Size) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let newProperty = self.didSetProperty.storeSize(size)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreSizeType {
	
	public func setSize(to size: Size) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.constant(size)
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func setSize(by size: @escaping (_ property: ViewLayoutGuides) -> Size) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.byParent(size)
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: Size = .zero) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.fits(fittingSize)
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFit(ratio: Float? = nil, in layoutGuideGetter: @escaping ((ViewLayoutGuides) -> LayoutGuideRepresentable) = { $0 }) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.fit(ratio, layoutGuideGetter: layoutGuideGetter))
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFill(ratio: Float? = nil, in layoutGuideGetter: @escaping ((ViewLayoutGuides) -> LayoutGuideRepresentable) = { $0 }) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.fill(ratio, layoutGuideGetter: layoutGuideGetter))
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFit(ratio: Float? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.safeAreaFit(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFill(ratio: Float? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.safeAreaFill(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreSizeToEvaluateFrameType: LayoutPropertyCanStoreSizeType {
	
	func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func storeSize(_ size: LayoutElement.Size) -> IndividualProperty.Layout {
		
		let layout = IndividualProperty.Layout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(size: size, parameters: parameters)
		})
		
		return layout
		
	}
	
}

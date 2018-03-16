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
	
	func storeSize(_ size: LayoutElement.Size, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetSizeProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreSizeType {
	
	public func setSize(to size: Size) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.constant(size)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func setSize(by size: @escaping (_ property: ViewLayoutGuides) -> Size) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.byParent(size)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: Size = .zero) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.fits(fittingSize)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func aspectFit(ratio: Float? = nil) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.fit(ratio))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func aspectFill(ratio: Float? = nil) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.fill(ratio))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFit(ratio: Float? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.safeAreaFit(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFill(ratio: Float? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size.aspect(.safeAreaFill(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreSizeToEvaluateFrameType: LayoutPropertyCanStoreSizeType {
	
	func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func storeSize(_ size: LayoutElement.Size, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(size: size, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}

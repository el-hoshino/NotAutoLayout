//
//  DidStoreCenterBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterBottomLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreCenterBottomLayoutProperty {
	
	private func makeFrame(center: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.halved
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreCenterBottomLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: CalculationParameters) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterBottomLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreCenterBottomWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreCenterBottomLayoutProperty>) -> LayoutMaker<DidStoreCenterBottomWidthLayoutProperty> {
		
		let centerBottomWidth = DidStoreCenterBottomWidthLayoutProperty(center: self.center,
																		bottom: self.bottom,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreCenterBottomLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreCenterBottomHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreCenterBottomLayoutProperty>) -> LayoutMaker<DidStoreCenterBottomHeightLayoutProperty> {
		
		let centerBottomHeight = DidStoreCenterBottomHeightLayoutProperty(center: self.center,
																		  bottom: self.bottom,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomHeight)
		
		return maker
		
	}
	
}

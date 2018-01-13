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
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterBottomLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreCenterBottomWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreCenterBottomWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreCenterBottomLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreCenterBottomHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreCenterBottomHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}

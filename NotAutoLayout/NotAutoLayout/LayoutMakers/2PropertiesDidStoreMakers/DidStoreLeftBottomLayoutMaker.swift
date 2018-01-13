//
//  DidStoreLeftBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftBottomLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftBottomLayoutProperty {
	
	private func makeFrame(left: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreLeftBottomLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftBottomLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreLeftBottomWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreLeftBottomWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreLeftBottomLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreLeftBottomHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreLeftBottomHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}

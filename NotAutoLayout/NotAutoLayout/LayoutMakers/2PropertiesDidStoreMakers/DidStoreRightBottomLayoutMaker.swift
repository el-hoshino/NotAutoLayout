//
//  DidStoreRightBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightBottomLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreRightBottomLayoutProperty {
	
	private func makeFrame(right: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightBottomLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightBottomLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightBottomWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightBottomWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightBottomLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightBottomHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightBottomHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}

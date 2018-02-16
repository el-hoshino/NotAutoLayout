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
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightBottomLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightBottomWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreRightBottomLayoutProperty>) -> LayoutMaker<DidStoreRightBottomWidthLayoutProperty> {
		
		let rightBottomWidth = DidStoreRightBottomWidthLayoutProperty(right: self.right,
																	  bottom: self.bottom,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreRightBottomLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightBottomHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreRightBottomLayoutProperty>) -> LayoutMaker<DidStoreRightBottomHeightLayoutProperty> {
		
		let rightBottomHeight = DidStoreRightBottomHeightLayoutProperty(right: self.right,
																		bottom: self.bottom,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottomHeight)
		
		return maker
		
	}
	
}

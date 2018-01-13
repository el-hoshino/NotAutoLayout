//
//  DidStoreRightTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightTopLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreRightTopLayoutProperty {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreRightTopMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreRightTopMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightTopBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightTopBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightTopWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightTopWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightTopLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightTopHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightTopHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 height: height)
		
	}
	
}

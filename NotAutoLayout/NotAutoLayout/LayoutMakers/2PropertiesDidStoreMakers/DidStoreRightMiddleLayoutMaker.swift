//
//  DidStoreRightMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightMiddleLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreRightMiddleLayoutProperty {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightMiddleLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreRightMiddleLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightMiddleBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightMiddleBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightMiddleLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightMiddleWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightMiddleWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightMiddleLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightMiddleHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightMiddleHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 height: height)
		
	}
	
}

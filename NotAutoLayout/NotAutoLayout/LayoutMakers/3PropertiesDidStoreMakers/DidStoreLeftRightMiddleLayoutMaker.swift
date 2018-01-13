//
//  DidStoreLeftRightMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightMiddleLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftRightMiddleLayoutProperty {
	
	private func makeFrame(left: CGFloat, right: CGFloat, middle: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middle).doubled
		
		return self.makeFrame(left: left, right: right, middle: middle, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, middle: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middle - height.halved
		let width = right - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreLeftRightMiddleLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomProperty = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(left: left, right: right, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftRightMiddleLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let width = right - left
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, right: right, middle: middle, height: height)
		
	}
	
}

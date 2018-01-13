//
//  DidStoreCenterRightMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterRightMiddleLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreCenterRightMiddleLayoutProperty {
	
	private func makeFrame(center: CGFloat, right: CGFloat, middle: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middle).doubled
		
		return self.makeFrame(center: center, right: right, middle: middle, height: height)
		
	}
	
	private func makeFrame(center: CGFloat, right: CGFloat, middle: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - center).doubled
		let x = right - width
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreCenterRightMiddleLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomProperty = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(center: center, right: right, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreCenterRightMiddleLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let width = (right - center).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, middle: middle, height: height)
		
	}
	
}

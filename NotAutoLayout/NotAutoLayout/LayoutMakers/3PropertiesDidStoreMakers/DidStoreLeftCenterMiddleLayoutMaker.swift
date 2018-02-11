//
//  DidStoreLeftCenterMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftCenterMiddleLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let center: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftCenterMiddleLayoutProperty {
	
	private func makeFrame(left: CGFloat, center: CGFloat, middle: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middle).doubled
		
		return self.makeFrame(left: left, center: center, middle: middle, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, center: CGFloat, middle: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middle - height.halved
		let width = (center - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreLeftCenterMiddleLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(left: left, center: center, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftCenterMiddleLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let width = (center - left).doubled
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, middle: middle, height: height)
		
	}
	
}

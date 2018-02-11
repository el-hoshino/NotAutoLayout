//
//  DidStoreLeftCenterTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftCenterTopLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let center: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftCenterTopLayoutProperty {
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - top).doubled
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - top
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = (center - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreLeftCenterTopLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(left: left, center: center, top: top, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftCenterTopLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(left: left, center: center, top: top, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftCenterTopLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let width = (center - left).doubled
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
}

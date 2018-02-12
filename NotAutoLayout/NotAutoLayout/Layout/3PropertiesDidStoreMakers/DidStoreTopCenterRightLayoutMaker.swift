//
//  DidStoreTopCenterRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterRightLayoutProperty {
	
	let topCenter: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreTopCenterRightLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topCenter.y).doubled
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - topCenter.x).doubled
		let x = right - width
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let width = (right - topCenter.x).doubled
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
}

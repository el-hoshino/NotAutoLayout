//
//  DidStoreBottomRightCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightCenterLayoutProperty {
	
	let bottomRight: LayoutElement.Point
	
	let center: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreBottomRightCenterLayoutProperty {
	
	private func makeFrame(bottomRight: CGPoint, center: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (bottomRight.y - top).doubled
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, center: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomRight.y - middle).doubled
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (bottomRight.x - center).doubled
		let x = center - width.halved
		let y = bottomRight.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomRightCenterLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, center: center, top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomRightCenterLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, center: center, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomRightCenterLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let width = (bottomRight.x - center).doubled
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
}

//
//  DidStoreBottomRightLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightLeftLayoutProperty {
	
	let bottomRight: LayoutElement.Point
	
	let left: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreBottomRightLeftLayoutProperty {
	
	private func makeFrame(bottomRight: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (bottomRight.y - top).doubled
		
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomRight.y - middle).doubled
		
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = bottomRight.y - height
		let width = bottomRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomRightLeftLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopProperty = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, left: left, top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomRightLeftLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleProperty = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		return self.makeFrame(bottomRight: bottomRight, left: left, middle: middle)
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomRightLeftLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let width = bottomRight.x - left
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
}

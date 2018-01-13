//
//  DidStoreBottomCenterLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterLeftLayoutProperty {
	
	let bottomCenter: LayoutElement.Point
	
	let left: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterLeftLayoutProperty {
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomCenter.y - top
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = bottomCenter.y - height
		let width = (bottomCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomCenterLeftLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopProperty = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomCenterLeftLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleProperty = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomCenterLeftLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let width = (bottomCenter.x - left).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
}

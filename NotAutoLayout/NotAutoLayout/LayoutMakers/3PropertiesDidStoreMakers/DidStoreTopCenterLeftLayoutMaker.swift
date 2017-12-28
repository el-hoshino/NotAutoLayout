//
//  DidStoreTopCenterLeftLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterLeftLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let left: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreTopCenterLeftLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topCenter.y).doubled
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topCenter.y
		let width = (topCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreTopCenterLeftLayoutMaker: LayoutMakerCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, left: left, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterLeftLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopCenterLeftLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let width = (topCenter.x - left).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
}

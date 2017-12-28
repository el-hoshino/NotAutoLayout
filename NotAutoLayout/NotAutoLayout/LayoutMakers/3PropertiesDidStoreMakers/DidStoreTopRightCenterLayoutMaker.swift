//
//  DidStoreTopRightCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopRightCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: LayoutElement.Point
	
	let center: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreTopRightCenterLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topRight.y).doubled
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topRight.y
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (topRight.x - center).doubled
		let x = topRight.x - width
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreTopRightCenterLayoutMaker: LayoutMakerCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(topRight: topRight, center: center, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopRightCenterLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(topRight: topRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopRightCenterLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let width = (topRight.x - center).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
}

//
//  DidStoreTopCenterRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let right: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreTopCenterRightLayoutMaker {
	
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
extension DidStoreTopCenterRightLayoutMaker: LayoutMakerCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterRightLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopCenterRightLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let width = (right - topCenter.x).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
}

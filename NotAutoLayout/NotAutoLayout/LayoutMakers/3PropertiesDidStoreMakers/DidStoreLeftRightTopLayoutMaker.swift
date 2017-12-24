//
//  DidStoreLeftRightTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let right: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreLeftRightTopLayoutMaker {
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, middle: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - left
		let height = (middle - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreLeftRightTopLayoutMaker: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		let left = self.left.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		return self.makeFrame(left: left, right: right, top: top, middle: middle)
	}
	
}

// MARK: Bottom
extension DidStoreLeftRightTopLayoutMaker: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		let left = self.left.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		return self.makeFrame(left: left, right: right, top: top, bottom: bottom)
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftRightTopLayoutMaker: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let width = right - left
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(left: left, right: right, top: top, height: height)
		
	}
	
}

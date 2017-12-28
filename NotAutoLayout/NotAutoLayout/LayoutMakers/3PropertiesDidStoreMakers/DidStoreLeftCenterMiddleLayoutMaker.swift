//
//  DidStoreLeftCenterMiddleLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftCenterMiddleLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let center: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreLeftCenterMiddleLayoutMaker {
	
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
//MARK: Bottom
extension DidStoreLeftCenterMiddleLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(left: left, center: center, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftCenterMiddleLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let width = (center - left).doubled
		let bottom = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, middle: middle, bottom: bottom)
		
	}
	
}

//
//  DidStoreCenterTopMiddleLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopMiddleLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreCenterTopMiddleLayoutMaker {
	
	private func makeFrame(center: CGFloat, top: CGFloat, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = top
		let height = (middle - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterTopMiddleLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = (middle - top).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, middle: middle, width: width)
		
	}
	
}

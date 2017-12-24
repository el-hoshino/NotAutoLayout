//
//  DidStoreLeftPointTopPointWidthLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftTopWidthLayoutMaker {
		
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreLeftTopWidthLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreLeftTopWidthLayoutMaker: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let width = self.width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
}


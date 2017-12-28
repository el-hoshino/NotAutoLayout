//
//  DidStoreMiddleLeftTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftTopLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = top
		let height = (middleLeft.y - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleLeftTopLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = (middleLeft.y - top).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, top: top, width: width)
		
	}
	
}

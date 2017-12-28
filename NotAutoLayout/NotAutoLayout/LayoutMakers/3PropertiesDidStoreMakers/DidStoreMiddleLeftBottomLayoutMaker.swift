//
//  DidStoreMiddleLeftBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftBottomLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottom - middleLeft.y).doubled
		let x = middleLeft.x
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleLeftBottomLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = (bottom - middleLeft.y).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, width: width)
		
	}
	
}

//
//  DidStoreRightMiddleWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightMiddleWidthLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreRightMiddleWidthLayoutProperty {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = right - width
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreRightMiddleWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, middle: middle, width: width, height: height)
		
	}
	
}

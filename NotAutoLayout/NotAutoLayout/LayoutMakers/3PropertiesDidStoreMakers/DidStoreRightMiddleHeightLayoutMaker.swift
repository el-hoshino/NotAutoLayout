//
//  DidStoreRightMiddleHeightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightMiddleHeightLayoutProperty {
		
	let right: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreRightMiddleHeightLayoutProperty {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = right - width
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightMiddleHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = self.height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, middle: middle, height: height, width: width)
		
	}
	
}

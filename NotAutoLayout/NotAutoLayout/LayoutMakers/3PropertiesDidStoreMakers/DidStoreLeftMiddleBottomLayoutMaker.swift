//
//  DidStoreLeftMiddleBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftMiddleBottomLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftMiddleBottomLayoutProperty {
	
	private func makeFrame(left: CGFloat, middle: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = left
		let height = (bottom - middle).doubled
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftMiddleBottomLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = (bottom - middle).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, middle: middle, bottom: bottom, width: width)
		
	}
	
}

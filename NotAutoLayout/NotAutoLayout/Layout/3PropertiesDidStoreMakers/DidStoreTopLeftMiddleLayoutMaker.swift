//
//  DidStoreTopLeftMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftMiddleLayoutProperty {
	
	let topLeft: LayoutElement.Point
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreTopLeftMiddleLayoutProperty {
	
	private func makeFrame(topLeft: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let height = (middle - y).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopLeftMiddleLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - topLeft.y).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, middle: middle, width: width)
		
	}
	
}

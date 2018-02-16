//
//  LeftTopMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftTopMiddle {
		
		let left: LayoutElement.Horizontal
		
		let top: LayoutElement.Vertical
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftTopMiddle {
	
	private func makeFrame(left: CGFloat, top: CGFloat, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let height = (middle - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftTopMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - top).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, top: top, middle: middle, width: width)
		
	}
	
}

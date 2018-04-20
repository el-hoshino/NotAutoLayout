//
//  TopCenterMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterMiddle {
		
		let topCenter: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterMiddle {
	
	private func makeFrame(topCenter: Point, middle: Float, left: Float) -> Rect {
		
		let width = (topCenter.x - left).double
		
		return self.makeFrame(topCenter: topCenter, middle: middle, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, middle: Float, right: Float) -> Rect {
		
		let width = (right - topCenter.x).double
		
		return self.makeFrame(topCenter: topCenter, middle: middle, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, middle: Float, width: Float) -> Rect {
		
		let x = topCenter.x - width.half
		let y = topCenter.y
		let height = (middle - y).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenterMiddle: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middle: middle, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenterMiddle: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middle: middle, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenterMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - topCenter.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, middle: middle, width: width)
		
	}
	
}

//
//  TopCenterLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterLeft {
		
		let topCenter: LayoutElement.Point
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterLeft {
	
	private func makeFrame(topCenter: Point, left: Float, middle: Float) -> Rect {
		
		let height = (middle - topCenter.y).double
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, left: Float, bottom: Float) -> Rect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, left: Float, height: Float) -> Rect {
		
		let x = left
		let y = topCenter.y
		let width = (topCenter.x - left).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, left: left, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = (topCenter.x - left).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
}

//
//  TopCenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterRight {
		
		let topCenter: LayoutElement.Point
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterRight {
	
	private func makeFrame(topCenter: Point, right: Float, middle: Float) -> Rect {
		
		let height = (middle - topCenter.y).double
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, right: Float, bottom: Float) -> Rect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, right: Float, height: Float) -> Rect {
		
		let width = (right - topCenter.x).double
		let x = right - width
		let y = topCenter.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopCenterRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenterRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopCenterRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - topCenter.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
}

//
//  TopLeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.TopLeftRight {
	
	private func makeFrame(topLeft: Point, right: Float, middle: Float) -> Rect {
		
		let height = (middle - topLeft.y).double
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, right: Float, bottom: Float) -> Rect {
		
		let height = bottom - topLeft.y
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, right: Float, height: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let width = right - x
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopLeftRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopLeftRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopLeftRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - topLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
}

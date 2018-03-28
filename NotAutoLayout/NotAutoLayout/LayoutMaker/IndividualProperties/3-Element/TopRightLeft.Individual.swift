//
//  TopRightLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightLeft {
		
		let topRight: LayoutElement.Point
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightLeft {
	
	private func makeFrame(topRight: Point, left: Float, middle: Float) -> Rect {
		
		let height = (middle - topRight.y).double
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
	private func makeFrame(topRight: Point, left: Float, bottom: Float) -> Rect {
		
		let height = bottom - topRight.y
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
	private func makeFrame(topRight: Point, left: Float, height: Float) -> Rect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, left: left, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = topRight.x - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
}

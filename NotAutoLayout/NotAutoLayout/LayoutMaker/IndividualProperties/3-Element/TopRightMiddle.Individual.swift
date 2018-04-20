//
//  TopRightMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightMiddle {
		
		let topRight: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightMiddle {
	
	private func makeFrame(topRight: Point, middle: Float, left: Float) -> Rect {
		
		let width = topRight.x - left
		
		return self.makeFrame(topRight: topRight, middle: middle, width: width)
		
	}
	
	private func makeFrame(topRight: Point, middle: Float, center: Float) -> Rect {
		
		let width = (topRight.x - center).double
		
		return self.makeFrame(topRight: topRight, middle: middle, width: width)
		
	}
	
	private func makeFrame(topRight: Point, middle: Float, width: Float) -> Rect {
		
		let x = topRight.x - width
		let y = topRight.y
		let height = (middle - y).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopRightMiddle: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middle: middle, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopRightMiddle: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middle: middle, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRightMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - topRight.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topRight: topRight, middle: middle, width: width)
		
	}
	
}

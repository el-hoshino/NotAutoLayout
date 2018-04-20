//
//  TopLeftMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftMiddle {
		
		let topLeft: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftMiddle {
	
	private func makeFrame(topLeft: Point, middle: Float, center: Float) -> Rect {
		
		let width = (center - topLeft.x).double
		
		return self.makeFrame(topLeft: topLeft, middle: middle, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, middle: Float, right: Float) -> Rect {
		
		let width = right - topLeft.x
		
		return self.makeFrame(topLeft: topLeft, middle: middle, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, middle: Float, width: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let height = (middle - y).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.TopLeftMiddle: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middle: middle, center: center)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopLeftMiddle: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middle: middle, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopLeftMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - topLeft.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, middle: middle, width: width)
		
	}
	
}

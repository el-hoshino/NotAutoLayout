//
//  MiddleRightHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightHeight {
		
		let middleRight: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightHeight {
	
	private func makeFrame(middleRight: Point, height: Float, left: Float) -> Rect {
		
		let width = middleRight.x - left
		
		return self.makeFrame(middleRight: middleRight, height: height, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, height: Float, center: Float) -> Rect {
		
		let width = (middleRight.x - center).double
		
		return self.makeFrame(middleRight: middleRight, height: height, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, height: Float, width: Float) -> Rect {
		
		let x = middleRight.x - width
		let y = middleRight.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleRightHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		let width = middleRight.x - left
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, height: height, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleRightHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		let width = (middleRight.x - center).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, height: height, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRightHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, height: height, width: width)
		
	}
	
}

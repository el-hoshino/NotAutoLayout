//
//  MiddleCenterHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterHeight {
		
		let middleCenter: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterHeight {
	
	private func makeFrame(middleCenter: Point, height: Float, left: Float) -> Rect {
		
		let width = (middleCenter.x - left).double
		
		return self.makeFrame(middleCenter: middleCenter, height: height, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, height: Float, right: Float) -> Rect {
		
		let width = (right - middleCenter.x).double
		
		return self.makeFrame(middleCenter: middleCenter, height: height, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, height: Float, width: Float) -> Rect {
		
		let x = middleCenter.x - width.half
		let y = middleCenter.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleCenterHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		let width = (middleCenter.x - left).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, height: height, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleCenterHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		let width = (right - middleCenter.x).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, height: height, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleCenterHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, height: height, width: width)
		
	}
	
}

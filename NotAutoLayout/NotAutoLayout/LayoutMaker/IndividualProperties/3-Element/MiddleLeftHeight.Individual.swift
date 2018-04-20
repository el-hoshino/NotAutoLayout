//
//  MiddleLeftHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeftHeight {
		
		let middleLeft: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftHeight {
	
	private func makeFrame(middleLeft: Point, height: Float, center: Float) -> Rect {
		
		let width = (center - middleLeft.x).double
		
		return self.makeFrame(middleLeft: middleLeft, height: height, width: width)
		
	}
	
	private func makeFrame(middleLeft: Point, height: Float, right: Float) -> Rect {
		
		let width = right - middleLeft.x
		
		return self.makeFrame(middleLeft: middleLeft, height: height, width: width)
		
	}
	
	private func makeFrame(middleLeft: Point, height: Float, width: Float) -> Rect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.MiddleLeftHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		let width = (center - middleLeft.x).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, height: height, center: center)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleLeftHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		let width = right - middleLeft.x
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, height: height, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleLeftHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, height: height, width: width)
		
	}
	
}

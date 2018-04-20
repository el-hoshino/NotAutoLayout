//
//  TopCenterHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterHeight {
		
		let topCenter: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterHeight {
	
	private func makeFrame(topCenter: Point, height: Float, left: Float) -> Rect {
		
		let width = (topCenter.x - left).double
		
		return self.makeFrame(topCenter: topCenter, height: height, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, height: Float, right: Float) -> Rect {
		
		let width = (right - topCenter.x).double
		
		return self.makeFrame(topCenter: topCenter, height: height, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, height: Float, width: Float) -> Rect {
		
		let x = topCenter.x - width.half
		let y = topCenter.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenterHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		let width = (topCenter.x - left).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, height: height, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenterHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		let width = (right - topCenter.x).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, height: height, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenterHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, height: height, width: width)
		
	}
	
}

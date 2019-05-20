//
//  MiddleCenterLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterLeft {
		
		let middleCenter: LayoutElement.Point
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterLeft {
	
	private func makeFrame(middleCenter: Point, left: Float, top: Float) -> Rect {
		
		let height = (middleCenter.y - top).double
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, left: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleCenter.y).double
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, left: Float, height: Float) -> Rect {
		
		let x = left
		let y = middleCenter.y - height.half
		let width = (middleCenter.x - left).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = (middleCenter.x - left).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
}

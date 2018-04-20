//
//  MiddleCenterBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterBottom {
		
		let middleCenter: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterBottom {
	
	private func makeFrame(middleCenter: Point, bottom: Float, left: Float) -> Rect {
		
		let width = (middleCenter.x - left).double
		
		return self.makeFrame(middleCenter: middleCenter, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, bottom: Float, right: Float) -> Rect {
		
		let width = (right - middleCenter.x).double
		
		return self.makeFrame(middleCenter: middleCenter, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, bottom: Float, width: Float) -> Rect {
		
		let height = (bottom - middleCenter.y).double
		let x = middleCenter.x - width.half
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleCenterBottom: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottom: bottom, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleCenterBottom: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottom: bottom, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleCenterBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middleCenter.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, bottom: bottom, width: width)
		
	}
	
}

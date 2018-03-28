//
//  MiddleCenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterRight {
		
		let middleCenter: LayoutElement.Point
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterRight {
	
	private func makeFrame(middleCenter: Point, right: Float, top: Float) -> Rect {
		
		let height = (middleCenter.y - top).double
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, right: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleCenter.y).double
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, right: Float, height: Float) -> Rect {
		
		let width = (right - middleCenter.x).double
		let x = right - width
		let y = middleCenter.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - middleCenter.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
}

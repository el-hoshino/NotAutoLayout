//
//  MiddleCenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterTop {
		
		let middleCenter: LayoutElement.Point
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterTop {
	
	private func makeFrame(middleCenter: Point, top: Float, left: Float) -> Rect {
		
		let width = (middleCenter.x - left).double
		
		return self.makeFrame(middleCenter: middleCenter, top: top, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, top: Float, right: Float) -> Rect {
		
		let width = (right - middleCenter.x).double
		
		return self.makeFrame(middleCenter: middleCenter, top: top, width: width)
		
	}
	
	private func makeFrame(middleCenter: Point, top: Float, width: Float) -> Rect {
		
		let x = middleCenter.x - width.half
		let y = top
		let height = (middleCenter.y - top).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleCenterTop: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, top: top, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleCenterTop: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, top: top, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleCenterTop: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = (middleCenter.y - top).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, top: top, width: width)
		
	}
	
}

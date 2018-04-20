//
//  MiddleCenterWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterWidth {
		
		let middleCenter: LayoutElement.Point
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterWidth {
	
	private func makeFrame(middleCenter: Point, width: Float, top: Float) -> Rect {
		
		let height = (middleCenter.y - top).double
		
		return self.makeFrame(middleCenter: middleCenter, width: width, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, width: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleCenter.y).double
		
		return self.makeFrame(middleCenter: middleCenter, width: width, height: height)
		
	}
	
	private func makeFrame(middleCenter: Point, width: Float, height: Float) -> Rect {
		
		let x = middleCenter.x - width.half
		let y = middleCenter.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleCenterWidth: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let height = (middleCenter.y - top).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, width: width, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenterWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = (bottom - middleCenter.y).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, width: width, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, width: width, height: height)
		
	}
	
}

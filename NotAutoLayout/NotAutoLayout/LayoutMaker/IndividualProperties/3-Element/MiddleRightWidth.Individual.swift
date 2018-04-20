//
//  MiddleRightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightWidth {
		
		let middleRight: LayoutElement.Point
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightWidth {
	
	private func makeFrame(middleRight: Point, width: Float, top: Float) -> Rect {
		
		let height = (middleRight.y - top).double
		
		return self.makeFrame(middleRight: middleRight, width: width, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, width: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleRight.y).double
		
		return self.makeFrame(middleRight: middleRight, width: width, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, width: Float, height: Float) -> Rect {
		
		let x = middleRight.x - width
		let y = middleRight.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleRightWidth: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let height = (middleRight.y - top).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, width: width, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRightWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = (bottom - middleRight.y).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, width: width, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleRightWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, width: width, height: height)
		
	}
	
}

//
//  MiddleLeftWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeftWidth {
		
		let middleLeft: LayoutElement.Point
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftWidth {
	
	private func makeFrame(middleLeft: Point, width: Float, top: Float) -> Rect {
		
		let height = (middleLeft.y - top).double
		
		return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, width: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleLeft.y).double
		
		return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, width: Float, height: Float) -> Rect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleLeftWidth: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let height = (middleLeft.y - top).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, width: width, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleLeftWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = (bottom - middleLeft.y).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, width: width, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleLeftWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
		
	}
	
}

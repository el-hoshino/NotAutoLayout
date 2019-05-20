//
//  MiddleLeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftRight {
	
	private func makeFrame(middleLeft: Point, right: Float, top: Float) -> Rect {
		
		let height = (middleLeft.y - top).double
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, right: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleLeft.y).double
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, right: Float, height: Float) -> Rect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let width = right - middleLeft.x
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleLeftRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleLeftRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleLeftRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - middleLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
}

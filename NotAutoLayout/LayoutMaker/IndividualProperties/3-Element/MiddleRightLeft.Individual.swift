//
//  MiddleRightLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.MiddleRightLeft {
	
	private func makeFrame(middleRight: Point, left: Float, top: Float) -> Rect {
		
		let height = (middleRight.y - top).double
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, left: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleRight.y).double
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, left: Float, height: Float) -> Rect {
		
		let x = left
		let y = middleRight.y - height.half
		let width = middleRight.x - left
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.MiddleRightLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRightLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleRightLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = middleRight.x - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
}

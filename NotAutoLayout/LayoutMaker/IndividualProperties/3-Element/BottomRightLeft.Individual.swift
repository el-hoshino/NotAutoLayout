//
//  BottomRightLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.BottomRightLeft {
	
	private func makeFrame(bottomRight: Point, left: Float, top: Float) -> Rect {
		
		let height = (bottomRight.y - top).double
		
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
	private func makeFrame(bottomRight: Point, left: Float, middle: Float) -> Rect {
		
		let height = (bottomRight.y - middle).double
		
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
	private func makeFrame(bottomRight: Point, left: Float, height: Float) -> Rect {
		
		let x = left
		let y = bottomRight.y - height
		let width = bottomRight.x - left
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomRightLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, left: left, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomRightLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, left: left, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomRightLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = bottomRight.x - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomRight: bottomRight, left: left, height: height)
		
	}
	
}

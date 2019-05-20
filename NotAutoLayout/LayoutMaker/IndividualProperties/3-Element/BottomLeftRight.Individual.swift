//
//  BottomLeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.BottomLeftRight {
	
	private func makeFrame(bottomLeft: Point, right: Float, top: Float) -> Rect {
		
		let height = bottomLeft.y - top
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: Point, right: Float, middle: Float) -> Rect {
		
		let height = (bottomLeft.y - middle).double
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: Point, right: Float, height: Float) -> Rect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let width = right - bottomLeft.x
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomLeftRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - bottomLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
}


//
//  BottomRightCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.BottomRightCenter {
	
	private func makeFrame(bottomRight: Point, center: Float, top: Float) -> Rect {
		
		let height = (bottomRight.y - top).double
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
	private func makeFrame(bottomRight: Point, center: Float, middle: Float) -> Rect {
		
		let height = (bottomRight.y - middle).double
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
	private func makeFrame(bottomRight: Point, center: Float, height: Float) -> Rect {
		
		let width = (bottomRight.x - center).double
		let x = center - width.half
		let y = bottomRight.y - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomRightCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, center: center, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomRightCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, center: center, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomRightCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (bottomRight.x - center).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomRight: bottomRight, center: center, height: height)
		
	}
	
}

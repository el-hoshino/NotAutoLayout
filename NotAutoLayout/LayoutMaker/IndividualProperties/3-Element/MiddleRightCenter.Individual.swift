//
//  MiddleRightCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.MiddleRightCenter {
	
	private func makeFrame(middleRight: Point, center: Float, top: Float) -> Rect {
		
		let height = (middleRight.y - top).double
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, center: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleRight.y).double
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: Point, center: Float, height: Float) -> Rect {
		
		let width = (middleRight.x - center).double
		let x = middleRight.x - width
		let y = middleRight.y - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, center: center, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (middleRight.x - center).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
}

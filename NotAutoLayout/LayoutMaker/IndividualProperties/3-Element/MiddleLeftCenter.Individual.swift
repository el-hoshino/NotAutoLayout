//
//  MiddleLeftCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftCenter {
	
	private func makeFrame(middleLeft: Point, center: Float, top: Float) -> Rect {
		
		let height = (middleLeft.y - top).double
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, center: Float, bottom: Float) -> Rect {
		
		let height = (bottom - middleLeft.y).double
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
	private func makeFrame(middleLeft: Point, center: Float, height: Float) -> Rect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let width = (center - middleLeft.x).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleLeftCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, center: center, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleLeftCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleLeftCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - middleLeft.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
}

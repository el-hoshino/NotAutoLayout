//
//  LeftCenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.LeftCenterTop {
	
	private func makeFrame(left: Float, center: Float, top: Float, middle: Float) -> Rect {
		
		let height = (middle - top).double
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: Float, center: Float, top: Float, bottom: Float) -> Rect {
		
		let height = bottom - top
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: Float, center: Float, top: Float, height: Float) -> Rect {
		
		let x = left
		let y = top
		let width = (center - left).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(left: left, center: center, top: top, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(left: left, center: center, top: top, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let width = (center - left).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
}

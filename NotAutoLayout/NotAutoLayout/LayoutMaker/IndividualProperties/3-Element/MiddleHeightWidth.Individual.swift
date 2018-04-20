//
//  MiddleHeightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/20.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleHeightWidth {
		
		let middle: LayoutElement.Vertical
		
		let height: LayoutElement.Length
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleHeightWidth {
	
	private func makeFrame(left: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let x = left
		let y = middle
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, middle: middle, height: height, width: width)
		
	}
	
	private func makeFrame(right: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, middle: middle, height: height, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleHeightWidth: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, middle: middle, height: height, width: width)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleHeightWidth: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, middle: middle, height: height, width: width)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleHeightWidth: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, middle: middle, height: height, width: width)
		
	}
	
}

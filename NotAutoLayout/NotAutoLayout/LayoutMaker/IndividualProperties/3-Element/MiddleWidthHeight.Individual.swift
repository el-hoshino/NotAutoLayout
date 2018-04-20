//
//  MiddleWidthHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleWidthHeight {
		
		let middle: LayoutElement.Vertical
		
		let width: LayoutElement.Length
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleWidthHeight {
	
	private func makeFrame(left: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let x = left
		let y = middle - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, middle: middle, width: width, height: height)
		
	}
	
	private func makeFrame(right: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, middle: middle, width: width, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleWidthHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, middle: middle, width: width, height: height)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleWidthHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, middle: middle, width: width, height: height)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleWidthHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, middle: middle, width: width, height: height)
		
	}
	
}

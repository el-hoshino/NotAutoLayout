//
//  RightWidthHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightWidthHeight {
		
		let right: LayoutElement.Horizontal
		
		let width: LayoutElement.Length
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightWidthHeight {
	
	private func makeFrame(right: Float, top: Float, width: Float, height: Float) -> Rect {
		
		let x = right - width
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(right: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(right: right, top: top, width: width, height: height)
		
	}
	
	private func makeFrame(right: Float, bottom: Float, width: Float, height: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(right: right, top: top, width: width, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.RightWidthHeight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, top: top, width: width, height: height)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.RightWidthHeight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, middle: middle, width: width, height: height)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.RightWidthHeight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, bottom: bottom, width: width, height: height)
		
	}
	
}

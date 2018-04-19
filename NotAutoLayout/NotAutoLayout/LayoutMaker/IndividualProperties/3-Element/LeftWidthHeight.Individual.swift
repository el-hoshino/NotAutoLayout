//
//  LeftWidthHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftWidthHeight {
		
		let left: LayoutElement.Horizontal
		
		let width: LayoutElement.Length
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftWidthHeight {
	
	private func makeFrame(left: Float, top: Float, width: Float, height: Float) -> Rect {
		
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
	private func makeFrame(left: Float, bottom: Float, width: Float, height: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftWidthHeight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftWidthHeight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, middle: middle, width: width, height: height)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftWidthHeight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, bottom: bottom, width: width, height: height)
		
	}
	
}

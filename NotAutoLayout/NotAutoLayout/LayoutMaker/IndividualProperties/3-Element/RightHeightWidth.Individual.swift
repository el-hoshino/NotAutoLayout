//
//  RightHeightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightHeightWidth {
		
		let right: LayoutElement.Horizontal
		
		let height: LayoutElement.Length
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightHeightWidth {
	
	private func makeFrame(right: Float, top: Float, height: Float, width: Float) -> Rect {
		
		let x = right - width
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(right: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(right: right, top: top, height: height, width: width)
		
	}
	
	private func makeFrame(right: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(right: right, top: top, height: height, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.RightHeightWidth: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, top: top, height: height, width: width)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.RightHeightWidth: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, middle: middle, height: height, width: width)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.RightHeightWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, bottom: bottom, height: height, width: width)
		
	}
	
}

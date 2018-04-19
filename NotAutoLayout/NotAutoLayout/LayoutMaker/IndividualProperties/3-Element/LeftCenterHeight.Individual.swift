//
//  LeftCenterHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftCenterHeight {
		
		let left: LayoutElement.Horizontal
		
		let center: LayoutElement.Horizontal
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftCenterHeight {
	
	private func makeFrame(left: Float, center: Float, top: Float, height: Float) -> Rect {
		
		let width = (center - left).double
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: Float, center: Float, middle: Float, height: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: Float, center: Float, bottom: Float, height: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftCenterHeight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - left).double
		let top = top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftCenterHeight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - left).double
		let middle = middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, middle: middle, height: height)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftCenterHeight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - left).double
		let bottom = bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, bottom: bottom, height: height)
		
	}
	
}

//
//  TopWidthHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopWidthHeight {
		
		let top: LayoutElement.Vertical
		
		let width: LayoutElement.Length
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopWidthHeight {
	
	private func makeFrame(left: Float, top: Float, width: Float, height: Float) -> Rect {
		
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, top: Float, width: Float, height: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
	private func makeFrame(right: Float, top: Float, width: Float, height: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopWidthHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, top: top, width: width, height: height)
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopWidthHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, top: top, width: width, height: height)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopWidthHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, top: top, width: width, height: height)
		
	}
	
}

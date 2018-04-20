//
//  TopHeightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/20.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopHeightWidth {
		
		let top: LayoutElement.Vertical
		
		let height: LayoutElement.Length
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopHeightWidth {
	
	private func makeFrame(left: Float, top: Float, height: Float, width: Float) -> Rect {
		
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, top: Float, height: Float, width: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, top: top, height: height, width: width)
		
	}
	
	private func makeFrame(right: Float, top: Float, height: Float, width: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, top: top, height: height, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopHeightWidth: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, top: top, height: height, width: width)
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopHeightWidth: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, height: height, width: width)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopHeightWidth: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, top: top, height: height, width: width)
		
	}
	
}

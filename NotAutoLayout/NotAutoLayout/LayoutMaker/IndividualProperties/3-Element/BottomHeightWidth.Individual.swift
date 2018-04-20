//
//  BottomHeightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/20.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomHeightWidth {
		
		let bottom: LayoutElement.Vertical
		
		let height: LayoutElement.Length
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomHeightWidth {
	
	private func makeFrame(left: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let x = left
		let y = bottom
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, bottom: bottom, height: height, width: width)
		
	}
	
	private func makeFrame(right: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, bottom: bottom, height: height, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.BottomHeightWidth: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, bottom: bottom, height: height, width: width)
		
	}
	
}

// MARK: Center
extension IndividualProperty.BottomHeightWidth: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, bottom: bottom, height: height, width: width)
		
	}
	
}

// MARK: Right
extension IndividualProperty.BottomHeightWidth: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, bottom: bottom, height: height, width: width)
		
	}
	
}

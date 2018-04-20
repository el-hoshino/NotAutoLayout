//
//  MiddleBottomWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleBottomWidth {
		
		let middle: LayoutElement.Vertical
		
		let bottom: LayoutElement.Vertical
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleBottomWidth {
	
	private func makeFrame(left: Float, middle: Float, bottom: Float, width: Float) -> Rect {
		
		let height = (bottom - middle).double
		let x = left
		let y = middle - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, bottom: Float, width: Float) -> Rect {
		
		let left = center - width.half
		
		return self.makeFrame(left: left, middle: middle, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(right: Float, middle: Float, bottom: Float, width: Float) -> Rect {
		
		let left = right - width
		
		return self.makeFrame(left: left, middle: middle, bottom: bottom, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleBottomWidth: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middle).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, middle: middle, bottom: bottom, width: width)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleBottomWidth: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middle).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, middle: middle, bottom: bottom, width: width)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleBottomWidth: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middle).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, middle: middle, bottom: bottom, width: width)
		
	}
	
}

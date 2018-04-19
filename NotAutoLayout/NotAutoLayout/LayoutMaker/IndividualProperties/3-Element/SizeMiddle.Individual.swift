//
//  SizeMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeMiddle {
		
		let size: LayoutElement.Size
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeMiddle {
	
	private func makeFrame(left: Float, middle: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = left
		let y = middle - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
	private func makeFrame(right: Float, middle: Float, size: Size) -> Rect {
		
		let left = right - size.width
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.SizeMiddle: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: Center
extension IndividualProperty.SizeMiddle: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: Right
extension IndividualProperty.SizeMiddle: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

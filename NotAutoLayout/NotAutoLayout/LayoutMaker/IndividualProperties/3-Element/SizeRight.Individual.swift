//
//  SizeRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeRight {
		
		let size: LayoutElement.Size
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeRight {
	
	private func makeFrame(right: Float, top: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = right - width
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(right: Float, middle: Float, size: Size) -> Rect {
		
		let top = middle - size.height.half
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
	private func makeFrame(right: Float, bottom: Float, size: Size) -> Rect {
		
		let top = bottom - size.height
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.SizeRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.SizeRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.SizeRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

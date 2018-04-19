//
//  SizeLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeLeft {
		
		let size: LayoutElement.Size
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeLeft {
	
	private func makeFrame(left: Float, top: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: Float, middle: Float, size: Size) -> Rect {
		
		let top = middle - size.height.half
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
	private func makeFrame(left: Float, bottom: Float, size: Size) -> Rect {
		
		let top = bottom - size.height
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.SizeLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.SizeLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.SizeLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

//
//  SizeTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeTop {
		
		let size: LayoutElement.Size
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeTop {
	
	private func makeFrame(left: Float, top: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = left
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, top: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
	private func makeFrame(right: Float, top: Float, size: Size) -> Rect {
		
		let left = right - size.width
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.SizeTop: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: Center
extension IndividualProperty.SizeTop: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: Right
extension IndividualProperty.SizeTop: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

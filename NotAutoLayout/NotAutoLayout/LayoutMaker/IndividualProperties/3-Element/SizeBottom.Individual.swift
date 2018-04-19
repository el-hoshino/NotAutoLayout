//
//  SizeBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeBottom {
		
		let size: LayoutElement.Size
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeBottom {
	
	private func makeFrame(left: Float, bottom: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = left
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, bottom: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
	private func makeFrame(right: Float, bottom: Float, size: Size) -> Rect {
		
		let left = right - size.width
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.SizeBottom: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = left.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: Center
extension IndividualProperty.SizeBottom: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: Right
extension IndividualProperty.SizeBottom: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}


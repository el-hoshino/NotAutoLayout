//
//  SizeCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct SizeCenter {
		
		let size: LayoutElement.Size
		
		let center: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.SizeCenter {
	
	private func makeFrame(center: Float, top: Float, size: Size) -> Rect {
		
		let width = size.width
		let height = size.height
		let x = center - width.half
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, size: Size) -> Rect {
		
		let top = middle - size.height.half
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
	private func makeFrame(center: Float, bottom: Float, size: Size) -> Rect {
		
		let top = bottom - size.height
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.SizeCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.SizeCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.SizeCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let size = self.size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

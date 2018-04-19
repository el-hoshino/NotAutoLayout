//
//  CenterHeightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterHeightWidth {
		
		let center: LayoutElement.Horizontal
		
		let height: LayoutElement.Length
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterHeightWidth {
	
	private func makeFrame(center: Float, top: Float, height: Float, width: Float) -> Rect {
		
		let x = center - width.half
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, middle: Float, height: Float, width: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(center: center, top: top, height: height, width: width)
		
	}
	
	private func makeFrame(center: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(center: center, top: top, height: height, width: width)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.CenterHeightWidth: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, height: height, width: width)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.CenterHeightWidth: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, middle: middle, height: height, width: width)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterHeightWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, bottom: bottom, height: height, width: width)
		
	}
	
}

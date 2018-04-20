//
//  TopCenterWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterWidth {
		
		let topCenter: LayoutElement.Point
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterWidth {
	
	private func makeFrame(topCenter: Point, width: Float, middle: Float) -> Rect {
		
		let height = (middle - topCenter.y).double
		
		return self.makeFrame(topCenter: topCenter, width: width, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, width: Float, bottom: Float) -> Rect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, width: width, height: height)
		
	}
	
	private func makeFrame(topCenter: Point, width: Float, height: Float) -> Rect {
		
		let x = topCenter.x - width.half
		let y = topCenter.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopCenterWidth: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let height = (middle - topCenter.y).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, width: width, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenterWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = bottom - topCenter.y
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, width: width, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopCenterWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, width: width, height: height)
		
	}
	
}

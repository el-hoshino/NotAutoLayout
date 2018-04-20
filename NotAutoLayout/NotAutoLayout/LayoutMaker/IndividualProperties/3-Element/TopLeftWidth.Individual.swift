//
//  TopLeftWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copywidth © 2017年 史翔新. All widths reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftWidth {
		
		let topLeft: LayoutElement.Point
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftWidth {
	
	private func makeFrame(topLeft: Point, width: Float, middle: Float) -> Rect {
		
		let height = (middle - topLeft.y).double
		
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, width: Float, bottom: Float) -> Rect {
		
		let height = bottom - topLeft.y
		
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, width: Float, height: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopLeftWidth: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		let height = (middle - topLeft.y).double
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, width: width, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopLeftWidth: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		let height = bottom - topLeft.y
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, width: width, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopLeftWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
}

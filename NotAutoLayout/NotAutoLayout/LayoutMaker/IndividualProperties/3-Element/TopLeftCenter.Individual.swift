//
//  TopLeftCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftCenter {
		
		let topLeft: LayoutElement.Point
		
		let center: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftCenter {
	
	private func makeFrame(topLeft: Point, center: Float, middle: Float) -> Rect {
		
		let height = (middle - topLeft.y).double
		
		return self.makeFrame(topLeft: topLeft, center: center, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, center: Float, bottom: Float) -> Rect {
		
		let height = bottom - topLeft.y
		
		return self.makeFrame(topLeft: topLeft, center: center, height: height)
		
	}
	
	private func makeFrame(topLeft: Point, center: Float, height: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let width = (center - topLeft.x).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopLeftCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, center: center, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopLeftCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopLeftCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - topLeft.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, center: center, height: height)
		
	}
	
}

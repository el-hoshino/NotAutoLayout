//
//  TopRightCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightCenter {
		
		let topRight: LayoutElement.Point
		
		let center: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightCenter {
	
	private func makeFrame(topRight: Point, center: Float, middle: Float) -> Rect {
		
		let height = (middle - topRight.y).double
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: Point, center: Float, bottom: Float) -> Rect {
		
		let height = bottom - topRight.y
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: Point, center: Float, height: Float) -> Rect {
		
		let width = (topRight.x - center).double
		let x = topRight.x - width
		let y = topRight.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, center: center, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (topRight.x - center).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
}

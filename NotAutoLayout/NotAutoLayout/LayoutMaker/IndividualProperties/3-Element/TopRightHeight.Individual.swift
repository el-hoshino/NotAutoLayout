//
//  TopRightHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightHeight {
		
		let topRight: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightHeight {
	
	private func makeFrame(topRight: Point, height: Float, left: Float) -> Rect {
		
		let width = topRight.x - left
		
		return self.makeFrame(topRight: topRight, height: height, width: width)
		
	}
	
	private func makeFrame(topRight: Point, height: Float, center: Float) -> Rect {
		
		let width = (topRight.x - center).double
		
		return self.makeFrame(topRight: topRight, height: height, width: width)
		
	}
	
	private func makeFrame(topRight: Point, height: Float, width: Float) -> Rect {
		
		let x = topRight.x - width
		let y = topRight.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopRightHeight: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		let width = topRight.x - left
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, height: height, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopRightHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		let width = (topRight.x - center).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, height: height, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRightHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topRight: topRight, height: height, width: width)
		
	}
	
}

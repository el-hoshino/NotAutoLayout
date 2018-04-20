//
//  TopLeftHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftHeight {
		
		let topLeft: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftHeight {
	
	private func makeFrame(topLeft: Point, height: Float, center: Float) -> Rect {
		
		let width = (center - topLeft.x).double
		
		return self.makeFrame(topLeft: topLeft, height: height, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, height: Float, right: Float) -> Rect {
		
		let width = right - topLeft.x
		
		return self.makeFrame(topLeft: topLeft, height: height, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, height: Float, width: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.TopLeftHeight: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		let width = (center - topLeft.x).double
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, height: height, center: center)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopLeftHeight: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		let width = right - topLeft.x
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, height: height, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopLeftHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, height: height, width: width)
		
	}
	
}

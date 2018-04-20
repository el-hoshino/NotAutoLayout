//
//  TopRightBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightBottom {
		
		let topRight: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightBottom {
	
	private func makeFrame(topRight: Point, bottom: Float, left: Float) -> Rect {
		
		let width = topRight.x - left
		
		return self.makeFrame(topRight: topRight, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topRight: Point, bottom: Float, center: Float) -> Rect {
		
		let width = (topRight.x - center).double
		
		return self.makeFrame(topRight: topRight, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topRight: Point, bottom: Float, width: Float) -> Rect {
		
		let x = topRight.x - width
		let y = topRight.y
		let height = bottom - y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopRightBottom: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottom: bottom, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopRightBottom: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottom: bottom, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRightBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - topRight.y
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topRight: topRight, bottom: bottom, width: width)
		
	}
	
}

//
//  MiddleRightBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightBottom {
		
		let middleRight: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightBottom {
	
	private func makeFrame(middleRight: Point, bottom: Float, left: Float) -> Rect {
		
		let width = middleRight.x - left
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, bottom: Float, center: Float) -> Rect {
		
		let width = (middleRight.x - center).double
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, bottom: Float, width: Float) -> Rect {
		
		let height = (bottom - middleRight.y).double
		let x = middleRight.x - width
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleRightBottom: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleRightBottom: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRightBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middleRight.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, width: width)
		
	}
	
}

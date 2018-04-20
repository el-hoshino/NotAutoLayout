//
//  MiddleLeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeftBottom {
		
		let middleLeft: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftBottom {
	
	private func makeFrame(middleLeft: Point, bottom: Float, center: Float) -> Rect {
		
		let width = (center - middleLeft.x).double
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleLeft: Point, bottom: Float, right: Float) -> Rect {
		
		let width = right - middleLeft.x
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(middleLeft: Point, bottom: Float, width: Float) -> Rect {
		
		let height = (bottom - middleLeft.y).double
		let x = middleLeft.x
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.MiddleLeftBottom: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, center: center)
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleLeftBottom: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleLeftBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middleLeft.y).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, bottom: bottom, width: width)
		
	}
	
}

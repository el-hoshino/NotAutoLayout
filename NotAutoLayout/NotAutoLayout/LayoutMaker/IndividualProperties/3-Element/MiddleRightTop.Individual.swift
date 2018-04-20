//
//  MiddleRightTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightTop {
		
		let middleRight: LayoutElement.Point
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightTop {
	
	private func makeFrame(middleRight: Point, top: Float, left: Float) -> Rect {
		
		let width = middleRight.x - left
		
		return self.makeFrame(middleRight: middleRight, top: top, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, top: Float, center: Float) -> Rect {
		
		let width = (middleRight.x - center).double
		
		return self.makeFrame(middleRight: middleRight, top: top, width: width)
		
	}
	
	private func makeFrame(middleRight: Point, top: Float, width: Float) -> Rect {
		
		let x = middleRight.x - width
		let y = top
		let height = (middleRight.y - top).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleRightTop: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, top: top, left: left)
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleRightTop: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, top: top, center: center)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRightTop: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = (middleRight.y - top).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, top: top, width: width)
		
	}
	
}

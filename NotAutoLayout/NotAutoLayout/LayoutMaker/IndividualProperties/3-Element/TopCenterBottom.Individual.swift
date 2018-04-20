//
//  TopCenterBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterBottom {
		
		let topCenter: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterBottom {
	
	private func makeFrame(topCenter: Point, bottom: Float, left: Float) -> Rect {
		
		let width = (topCenter.x - left).double
		
		return self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, bottom: Float, right: Float) -> Rect {
		
		let width = (right - topCenter.x).double
		
		return self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topCenter: Point, bottom: Float, width: Float) -> Rect {
		
		let x = topCenter.x - width.half
		let y = topCenter.y
		let height = bottom - topCenter.y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenterBottom: LayoutPropertyCanStoreLeftToEvaluateFrameType {
	
	public func evaluateFrame(left: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let left = left.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottom: bottom, left: left)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenterBottom: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottom: bottom, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenterBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - topCenter.y
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
		
	}
	
}

//
//  TopLeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeftBottom {
		
		let topLeft: LayoutElement.Point
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeftBottom {
	
	private func makeFrame(topLeft: Point, bottom: Float, center: Float) -> Rect {
		
		let width = (center - topLeft.x).double
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, bottom: Float, right: Float) -> Rect {
		
		let width = right - topLeft.x
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, width: width)
		
	}
	
	private func makeFrame(topLeft: Point, bottom: Float, width: Float) -> Rect {
		
		let x = topLeft.x
		let y = topLeft.y
		let height = bottom - y
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.TopLeftBottom: LayoutPropertyCanStoreCenterToEvaluateFrameType {
	
	public func evaluateFrame(center: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let center = center.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, center: center)
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopLeftBottom: LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func evaluateFrame(right: LayoutElement.Horizontal, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let right = right.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, right: right)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopLeftBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - topLeft.y
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topLeft: topLeft, bottom: bottom, width: width)
		
	}
	
}

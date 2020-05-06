//
//  BottomCenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterRight {
		
		let bottomCenter: LayoutElement.Point
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterRight {
	
	private func makeFrame(bottomCenter: Point, right: Float, top: Float) -> Rect {
		
		let height = bottomCenter.y - top
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: Point, right: Float, middle: Float) -> Rect {
		
		let height = (bottomCenter.y - middle).double
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: Point, right: Float, height: Float) -> Rect {
		
		let width = (right - bottomCenter.x).double
		let x = right - width
		let y = bottomCenter.y - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - bottomCenter.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
}

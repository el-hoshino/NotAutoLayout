//
//  BottomLeftCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.BottomLeftCenter {
	
	private func makeFrame(bottomLeft: Point, center: Float, top: Float) -> Rect {
		
		let height = bottomLeft.y - top
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
	private func makeFrame(bottomLeft: Point, center: Float, middle: Float) -> Rect {
		
		let height = (bottomLeft.y - middle).double
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
	private func makeFrame(bottomLeft: Point, center: Float, height: Float) -> Rect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let width = (center - bottomLeft.x).double
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomLeftCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomLeftCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomLeftCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (center - bottomLeft.x).double
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
}

//
//  BottomCenterLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterLeft {
		
		let bottomCenter: LayoutElement.Point
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterLeft {
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomCenter.y - top
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = bottomCenter.y - height
		let width = (bottomCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomCenterLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomCenterLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomCenterLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = (bottomCenter.x - left).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, left: left, height: height)
		
	}
	
}

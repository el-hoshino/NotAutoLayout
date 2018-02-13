//
//  DidStoreMiddleLeftRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftRightLayoutProperty {
	
	let middleLeft: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftRightLayoutProperty {
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleLeft.y - top).doubled
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleLeft.y).doubled
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.halved
		let width = right - middleLeft.x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: CalculationParameters) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: CalculationParameters) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = right - middleLeft.x
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
}

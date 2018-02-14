//
//  DidStoreMiddleRightLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightLeftLayoutProperty {
	
	let middleRight: LayoutElement.Point
	
	let left: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightLeftLayoutProperty {
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleRight.y - top).doubled
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleRight.y).doubled
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middleRight.y - height.halved
		let width = middleRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreMiddleRightLeftLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightLeftLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleRightLeftLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = middleRight.x - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
}

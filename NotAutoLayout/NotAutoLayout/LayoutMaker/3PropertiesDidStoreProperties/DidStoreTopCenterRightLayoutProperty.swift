//
//  DidStoreTopCenterRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterRightLayoutProperty {
	
	let topCenter: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreTopCenterRightLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topCenter.y).doubled
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - topCenter.x).doubled
		let x = right - width
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, right: right, middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopCenterRightLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - topCenter.x).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, right: right, height: height)
		
	}
	
}

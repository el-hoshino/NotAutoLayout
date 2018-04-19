//
//  CenterRightHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/04/19.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterRightHeight {
		
		let center: LayoutElement.Horizontal
		
		let right: LayoutElement.Horizontal
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterRightHeight {
	
	private func makeFrame(center: Float, right: Float, top: Float, height: Float) -> Rect {
		
		let width = (right - center)
		let x = center - width.half
		let y = top
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(center: Float, right: Float, middle: Float, height: Float) -> Rect {
		
		let top = middle - height.half
		
		return self.makeFrame(center: center, right: right, top: top, height: height)
		
	}
	
	private func makeFrame(center: Float, right: Float, bottom: Float, height: Float) -> Rect {
		
		let top = bottom - height
		
		return self.makeFrame(center: center, right: right, top: top, height: height)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.CenterRightHeight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - center).double
		let top = top.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, top: top, height: height)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.CenterRightHeight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - center).double
		let middle = middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, middle: middle, height: height)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterRightHeight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - center).double
		let bottom = bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, bottom: bottom, height: height)
		
	}
	
}

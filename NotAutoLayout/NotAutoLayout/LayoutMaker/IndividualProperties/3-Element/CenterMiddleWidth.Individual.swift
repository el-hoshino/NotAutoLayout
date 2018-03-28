//
//  CenterMiddleWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterMiddleWidth {
		
		let center: LayoutElement.Horizontal
		
		let middle: LayoutElement.Vertical
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterMiddleWidth {
	
	private func makeFrame(center: Float, middle: Float, width: Float, height: Float) -> Rect {
		
		let x = center - width.half
		let y = middle - height.half
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.CenterMiddleWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		let x = self.center.evaluated(from: parameters) - width.half
		let y = self.middle.evaluated(from: parameters) - height.half
		return Rect(x: x, y: y, width: width, height: height)
		
	}
	
}

//
//  CenterBottomHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterBottomHeight {
		
		let center: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterBottomHeight {
	
	private func makeFrame(center: Float, bottom: Float, height: Float, width: Float) -> Rect {
		
		let x = center - width.half
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterBottomHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, bottom: bottom, height: height, width: width)
		
	}
	
}

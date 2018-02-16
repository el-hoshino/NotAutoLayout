//
//  LeftCenterBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftCenterBottom {
		
		let left: LayoutElement.Horizontal
		
		let center: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftCenterBottom {
	
	private func makeFrame(left: CGFloat, center: CGFloat, bottom: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = bottom - height
		let width = (center - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.LeftCenterBottom: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let width = (center - left).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, bottom: bottom, height: height)
		
	}
	
}

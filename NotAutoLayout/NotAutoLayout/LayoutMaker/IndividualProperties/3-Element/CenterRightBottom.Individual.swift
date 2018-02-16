//
//  CenterRightBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterRightBottom {
		
		let center: LayoutElement.Horizontal
		
		let right: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterRightBottom {
	
	private func makeFrame(center: CGFloat, right: CGFloat, bottom: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - center).doubled
		let x = right - width
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.CenterRightBottom: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let width = (right - center).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, right: right, bottom: bottom, height: height)
		
	}
	
}

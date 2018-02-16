//
//  TopCenterMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterMiddle {
		
		let topCenter: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterMiddle {
	
	private func makeFrame(topCenter: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topCenter.x - width.halved
		let y = topCenter.y
		let height = (middle - y).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenterMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - topCenter.y).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, middle: middle, width: width)
		
	}
	
}

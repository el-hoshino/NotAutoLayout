//
//  BottomCenterMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterMiddle {
		
		let bottomCenter: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterMiddle {
	
	private func makeFrame(bottomCenter: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		let x = bottomCenter.x - width.halved
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomCenterMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (bottomCenter.y - middle).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomCenter: bottomCenter, middle: middle, width: width)
		
	}
	
}

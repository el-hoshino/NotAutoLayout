//
//  BottomRightMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomRightMiddle {
		
		let bottomRight: LayoutElement.Point
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomRightMiddle {
	
	private func makeFrame(bottomRight: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottomRight.y - middle).doubled
		let x = bottomRight.x - width
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomRightMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (bottomRight.y - middle).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, middle: middle, width: width)
		
	}
	
}

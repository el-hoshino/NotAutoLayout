//
//  BottomLeftMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.BottomLeftMiddle {
	
	private func makeFrame(bottomLeft: Point, middle: Float, width: Float) -> Rect {
		
		let height = (bottomLeft.y - middle).double
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomLeftMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (bottomLeft.y - middle).double
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, middle: middle, width: width)
		
	}
	
}

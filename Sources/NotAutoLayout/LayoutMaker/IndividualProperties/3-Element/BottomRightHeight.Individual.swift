//
//  BottomRightHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomRightHeight {
		
		let bottomRight: LayoutElement.Point
		
		let height: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomRightHeight {
	
	private func makeFrame(bottomRight: Point, height: Float, width: Float) -> Rect {
		
		let x = bottomRight.x - width
		let y = bottomRight.y - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomRightHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, height: height, width: width)
		
	}
	
}

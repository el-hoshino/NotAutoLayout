//
//  MiddleRightTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightTop {
		
		let middleRight: LayoutElement.Point
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightTop {
	
	private func makeFrame(middleRight: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleRight.x - width
		let y = top
		let height = (middleRight.y - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRightTop: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = (middleRight.y - top).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, top: top, width: width)
		
	}
	
}

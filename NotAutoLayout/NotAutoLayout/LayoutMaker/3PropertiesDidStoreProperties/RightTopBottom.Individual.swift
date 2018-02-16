//
//  RightTopBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightTopBottom {
		
		let right: LayoutElement.Horizontal
		
		let top: LayoutElement.Vertical
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightTopBottom {
	
	private func makeFrame(right: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = right - width
		let y = top
		let height = bottom - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightTopBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		let right = self.right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, top: top, bottom: bottom, width: width)
		
	}
	
}

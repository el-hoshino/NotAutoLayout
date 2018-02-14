//
//  DidStoreBottomLeftTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftTopLayoutProperty {
	
	let bottomLeft: LayoutElement.Point
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftTopLayoutProperty {
	
	private func makeFrame(bottomLeft: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = top
		let height = bottomLeft.y - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftTopLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = bottomLeft.y - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, top: top, width: width)
		
	}
	
}

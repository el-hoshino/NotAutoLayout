//
//  DidStoreBottomRightTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightTopLayoutProperty {
	
	let bottomRight: LayoutElement.Point
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreBottomRightTopLayoutProperty {
	
	private func makeFrame(bottomRight: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomRight.x - width
		let y = top
		let height = bottomRight.y - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightTopLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: CalculationParameters) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = bottomRight.y - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, top: top, width: width)
		
	}
	
}

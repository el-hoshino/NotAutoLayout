//
//  DidStoreMiddleRightTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightTopLayoutProperty {
	
	let middleRight: LayoutElement.Point
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightTopLayoutProperty {
	
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
extension DidStoreMiddleRightTopLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = (middleRight.y - top).doubled
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, top: top, width: width)
		
	}
	
}

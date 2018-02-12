//
//  DidStoreMiddleCenterTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterTopLayoutProperty {
	
	let middleCenter: LayoutElement.Point
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterTopLayoutProperty {
	
	private func makeFrame(middleCenter: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.halved
		let y = top
		let height = (middleCenter.y - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterTopLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = (middleCenter.y - top).doubled
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, top: top, width: width)
		
	}
	
}

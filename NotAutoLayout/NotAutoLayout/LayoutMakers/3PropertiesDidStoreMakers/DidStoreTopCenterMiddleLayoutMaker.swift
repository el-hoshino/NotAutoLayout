//
//  DidStoreTopCenterMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterMiddleLayoutProperty {
	
	let topCenter: LayoutElement.Point
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreTopCenterMiddleLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topCenter.x - width.halved
		let y = topCenter.y
		let height = (middle - y).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopCenterMiddleLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = (middle - topCenter.y).doubled
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(topCenter: topCenter, middle: middle, width: width)
		
	}
	
}

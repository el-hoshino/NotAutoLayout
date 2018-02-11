//
//  DidStoreCenterTopMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopMiddleLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreCenterTopMiddleLayoutProperty {
	
	private func makeFrame(center: CGFloat, top: CGFloat, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = top
		let height = (middle - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterTopMiddleLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = (middle - top).doubled
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, middle: middle, width: width)
		
	}
	
}

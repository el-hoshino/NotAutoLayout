//
//  LeftBottomHeightDidSetLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftBottomHeightLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreLeftBottomHeightLayoutProperty {
	
	private func makeFrame(left: CGFloat, bottom: CGFloat, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = left
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftBottomHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = self.height.evaluated(from: property, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, bottom: bottom, height: height, width: width)
		
	}
	
}

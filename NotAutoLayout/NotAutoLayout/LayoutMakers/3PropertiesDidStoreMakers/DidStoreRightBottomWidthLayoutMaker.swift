//
//  DidStoreRightBottomWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightBottomWidthLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let bottom: LayoutElement.Vertical
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreRightBottomWidthLayoutProperty {
	
	private func makeFrame(right: CGFloat, bottom: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = right - width
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreRightBottomWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let width = self.width.evaluated(from: property, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, bottom: bottom, width: width, height: height)
		
	}
	
}

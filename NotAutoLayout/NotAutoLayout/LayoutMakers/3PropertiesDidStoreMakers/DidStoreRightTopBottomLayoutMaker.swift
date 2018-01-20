//
//  DidStoreRightTopBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightTopBottomLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreRightTopBottomLayoutProperty {
	
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
extension DidStoreRightTopBottomLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = bottom - top
		let width = width.evaluated(from: property, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, top: top, bottom: bottom, width: width)
		
	}
	
}

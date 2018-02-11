//
//  DidStoreTopRightWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopRightWidthLayoutProperty {
	
	let topRight: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreTopRightWidthLayoutProperty {
	
	private func makeFrame(topRight: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topRight.x - width
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopRightWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let width = self.width.evaluated(from: property, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, width: width, height: height)
		
	}
	
}

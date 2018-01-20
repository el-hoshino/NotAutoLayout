//
//  DidStoreBottomCenterHeightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterHeightLayoutProperty {
	
	let bottomCenter: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterHeightLayoutProperty {
	
	private func makeFrame(bottomCenter: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomCenter.x - width.halved
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomCenterHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let height = self.height.evaluated(from: property, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: property, withTheOtherAxis: .height(0))
		
		return self.makeFrame(bottomCenter: bottomCenter, height: height, width: width)
		
	}
	
}

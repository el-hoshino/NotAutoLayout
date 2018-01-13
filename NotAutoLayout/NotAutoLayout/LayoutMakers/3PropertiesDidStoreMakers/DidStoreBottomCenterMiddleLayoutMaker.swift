//
//  DidStoreBottomCenterMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterMiddleLayoutProperty {
	
	let bottomCenter: LayoutElement.Point
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterMiddleLayoutProperty {
	
	private func makeFrame(bottomCenter: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		let x = bottomCenter.x - width.halved
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomCenterMiddleLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = (bottomCenter.y - middle).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomCenter: bottomCenter, middle: middle, width: width)
		
	}
	
}

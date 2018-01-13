//
//  DidStoreBottomLeftMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftMiddleLayoutProperty {
	
	let bottomLeft: LayoutElement.Point
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftMiddleLayoutProperty {
	
	private func makeFrame(bottomLeft: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottomLeft.y - middle).doubled
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftMiddleLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let height = (bottomLeft.y - middle).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, middle: middle, width: width)
		
	}
	
}

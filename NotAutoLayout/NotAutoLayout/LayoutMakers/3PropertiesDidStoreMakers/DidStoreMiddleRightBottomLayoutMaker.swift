//
//  DidStoreMiddleRightBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightBottomLayoutProperty {
	
	let middleRight: LayoutElement.Point
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightBottomLayoutProperty {
	
	private func makeFrame(middleRight: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottom - middleRight.y).doubled
		let x = middleRight.x - width
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleRightBottomLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = (bottom - middleRight.y).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleRight: middleRight, bottom: bottom, width: width)
		
	}
	
}

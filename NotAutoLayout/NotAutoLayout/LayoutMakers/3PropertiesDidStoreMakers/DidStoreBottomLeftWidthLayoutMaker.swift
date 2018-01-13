//
//  DidStoreBottomLeftWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftWidthLayoutProperty {
	
	let bottomLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftWidthLayoutProperty {
	
	private func makeFrame(bottomLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomLeftWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let width = self.width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, width: width, height: height)
		
	}
	
}

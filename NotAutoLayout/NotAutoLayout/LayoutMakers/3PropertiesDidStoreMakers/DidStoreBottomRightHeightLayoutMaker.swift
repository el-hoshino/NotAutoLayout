//
//  DidStoreBottomRightHeightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightHeightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomRightHeightLayoutMaker {
	
	private func makeFrame(bottomRight: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomRight.x - width
		let y = bottomRight.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightHeightLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let height = self.height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, height: height, width: width)
		
	}
	
}

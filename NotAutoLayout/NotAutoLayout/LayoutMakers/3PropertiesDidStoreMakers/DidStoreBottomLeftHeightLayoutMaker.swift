//
//  DidStoreBottomLeftHeightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftHeightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftHeightLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftHeightLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let height = self.height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, height: height, width: width)
		
	}
	
}

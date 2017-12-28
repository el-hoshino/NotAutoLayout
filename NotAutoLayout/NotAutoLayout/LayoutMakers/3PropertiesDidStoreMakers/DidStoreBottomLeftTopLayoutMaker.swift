//
//  DidStoreBottomLeftTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftTopLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = top
		let height = bottomLeft.y - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftTopLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = bottomLeft.y - top
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, top: top, width: width)
		
	}
	
}

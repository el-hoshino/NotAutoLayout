//
//  DidStoreBottomRightTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: LayoutElement.Point
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreBottomRightTopLayoutMaker {
	
	private func makeFrame(bottomRight: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomRight.x - width
		let y = top
		let height = bottomRight.y - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightTopLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = bottomRight.y - top
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomRight: bottomRight, top: top, width: width)
		
	}
	
}

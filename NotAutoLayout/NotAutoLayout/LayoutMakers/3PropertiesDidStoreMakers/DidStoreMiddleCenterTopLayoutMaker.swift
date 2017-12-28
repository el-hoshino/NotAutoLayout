//
//  DidStoreMiddleCenterTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterTopLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.halved
		let y = top
		let height = (middleCenter.y - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterTopLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let height = (middleCenter.y - top).doubled
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, top: top, width: width)
		
	}
	
}

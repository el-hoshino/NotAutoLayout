//
//  TopCenterBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let bottom: LayoutElement.Line
	
}

extension TopCenterBottomDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		let x = topCenter.x - width.half
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopCenterBottomDidSetLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let height = bottom - topCenter.y
		let width = width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		return self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
		
	}
	
}
